/*
 * The touch screen of the Xiaomi Mi MIX 2 (chiron): a Synaptics "DSX" controller (RMI4, bound as
 * synaptics,dsx-i2c-force) on I2C bus 5 of the MSM8998, as a source of touches for
 * /dev/redwood-touch (sys/redwood_input.h).
 *
 * This is a driver of its own rather than redwood's Goodix one with different addresses: that
 * chip hangs off a QUP serial engine run as SPI, this one off a QUP run as an I2C *master*, which
 * is the piece of new code here. Only with boot-arg chiron_touch=1: every address below belongs
 * to this phone.
 *
 * There is no clock, pin, regulator or I2C framework in this kernel, so the driver does all of it
 * itself, in the order the vendor's own drivers do (/root/src/kernel_msm8998, the vendor kernel
 * this phone shipped):
 *   power    NOT DONE HERE. avdd, vdd, lab, ibb and disp are PM8998 and LAB/IBB regulators that
 *            this kernel has no way to ask for. The boot loader has already lit the panel (this
 *            kernel draws on it), so they are taken to be on; if the chip does not answer, that
 *            is the first thing to doubt, and the log says so where it happens.
 *   clocks   the BLSP1 AHB branch, and serial engine 5's I2C branch on the crystal, by writing the
 *            global clock controller's own registers (clock-gcc-8998.c)
 *   pins     GPIO87/88 to the BLSP I2C function, GPIO89 reset, GPIO125 attention
 *   I2C      the serial engine as an I2C master at 400 kHz, polled: QUP version-2 tags, the clock
 *            divider from the 19.2 MHz core clock, the reset -> run -> pause -> run state machine,
 *            and the two FIFOs (i2c-msm-v2.c)
 *   chip     reset per the device tree, identify it the way RMI4 says (the page description table,
 *            then F01's identifiers), then find F12's touch report
 *   touches  F12's report read when the attention line says there is one, and handed upward the
 *            way the Goodix driver hands its own up
 *
 * Register layouts and every constant: the phone's own device tree (decompiled from chiron.dtb,
 * /root/hk/Mu-Silicium/Resources/DTBs/chiron.dts) and the vendor kernel's i2c-msm-v2.c,
 * clock-gcc-8998.c with dt-bindings/clock/msm-clocks-hwio-8998.h, pinctrl-msm8998.c with
 * pinctrl-msm.c, and synaptics_dsx_force/. Where a number could not be taken from one of those it
 * is marked INFERRED where it is used, and reported rather than trusted.
 *
 * WHAT IS NOT IOKit HERE, AND WHY. This file is a BSD-layer driver with a kernel thread and its
 * own register access, which is what every driver in this tree is (bsd/dev/redwood_goodix.c,
 * chiron_adreno.c, redwood_lx.c): none of them subclasses IOService or makes an IOWorkLoop. An
 * IOService would live in C++ under iokit/, and buys nothing for a touch screen whose consumer is
 * a character device -- there is no IORegistry client for it, and no Apple multitouch family here
 * to hand it to. What an IOInterruptEventSource *would* be -- a hardware interrupt turned into a
 * thread-context callback -- is here the GIC handler below plus a wakeup, which is exactly how
 * redwood_lx.c does it for the Wi-Fi radio.
 *
 * ONE DEVIATION FROM THE BRIEF, AND WHY. The brief asks the chip to be identified "via the 0xE1
 * read on the application page". No such register exists in the driver this phone shipped:
 * grepping all of synaptics_dsx_force/ for 0xe1 finds nothing. RMI4 identifies itself with a page
 * description table at 0x00E9 downward plus F01's product and build identifiers, which is what is
 * implemented below. 0x00E1 is read once anyway and printed, so the claim can be settled against
 * the phone instead of argued about; nothing depends on the value.
 */
#include <kern/clock.h>
#include <kern/sched_prim.h>
#include <kern/thread.h>
#include <libkern/libkern.h>
#include <mach/mach_types.h>
#include <os/atomic_private.h>
#include <pexpert/pexpert.h>
#include <sys/redwood_input.h>
#include <sys/systm.h>

extern vm_offset_t ml_io_map(vm_offset_t phys_addr, vm_size_t size);
extern kern_return_t thread_terminate(thread_t thread);

static vm_offset_t tlmm, gcc, se;

static inline uint32_t
rd(vm_offset_t address)
{
	return *(volatile uint32_t *)address;
}

static inline void
wr(vm_offset_t address, uint32_t value)
{
	*(volatile uint32_t *)address = value;
}

static void
sleep_us(uint32_t us)
{
	delay_for_interval(us, NSEC_PER_USEC);
}

static void
sleep_ms(uint32_t ms)
{
	delay_for_interval(ms, NSEC_PER_MSEC);
}

/*
 * A line of this driver's log. Every risky step says what it is about to touch before it touches
 * it, so that a run which ends in a reset leaves the reason in the log of the one before it.
 */
static int
say(const char *format, ...) __printflike(1, 2);

static int
say(const char *format, ...)
{
	char line[320];
	va_list list;
	int length;

	va_start(list, format);
	length = vsnprintf(line, sizeof(line), format, list);
	va_end(list);
	if (length > 0) {
		printf("%s", line);
	}
	return length;
}

/* ---- pins (TLMM) ------------------------------------------------------------------------------- */

/*
 * The pin controller is pinctrl@03400000 (dt: reg = <0x3400000 0xc00000>), NOT the 0x0f100000 a
 * driver of redwood's would use -- that is the sm8350's. On msm8998 the registers are tiled into
 * four banks (NORTH 0x500000, WEST 0x100000, EAST 0x900000, and the base itself), with pin n's
 * four registers at bank + 0x1000 * n (pinctrl-msm8998.c's PINGROUP(): .ctl_reg = base + REG_SIZE
 * * id, .io_reg = base + 4 + ..., .intr_cfg_reg = base + 8 + ..., .intr_status_reg = base + 0xc).
 * All four pins this driver touches are in the EAST bank (see their PINGROUP() lines), which is
 * why one offset serves for all of them.
 */
#define TLMM_PHYS               0x03400000UL
#define TLMM_SIZE               0x0c00000UL
#define TLMM_EAST               0x900000UL
#define PIN_REG(n)              (tlmm + TLMM_EAST + 0x1000UL * (n))
#define GPIO_CFG(n)             (PIN_REG(n) + 0x0)     /* [1:0] pull, [3:2] function, [8:6] drive, [9] output */
#define GPIO_IO(n)              (PIN_REG(n) + 0x4)     /* bit 0 in, bit 1 out */
#define GPIO_INTR_CFG(n)        (PIN_REG(n) + 0x8)     /* [4] raw status, [3:2] detect, [1] polarity, [0] enable */
#define GPIO_INTR_STATUS(n)     (PIN_REG(n) + 0xc)     /* bit 0: this pin raised the summary line */

#define PULL_NONE               0
#define PULL_UP                 3

#define PIN_SDA                 87      /* dt: qcom,i2c-dat = <&tlmm 0x57 0> */
#define PIN_SCL                 88      /* dt: qcom,i2c-clk = <&tlmm 0x58 0> */
#define PIN_RESET               89      /* dt: synaptics,reset-gpio = <&tlmm 0x59 0> */
#define PIN_INT                 125     /* dt: synaptics,irq-gpio = <&tlmm 0x7d 0x2008> */

/*
 * The function number is the index in the pin's own function list (pinctrl-msm8998.c, where the
 * list starts with gpio at 0):
 *   PINGROUP(87, EAST, blsp_spi5, blsp_uart2_b, blsp_i2c5, ...)
 * so gpio=0, blsp_spi5=1, blsp_uart2_b=2, blsp_i2c5=3. Pin 88 carries the same list.
 */
#define PIN_FUNCTION_I2C        3

static void
gpio_configure(unsigned pin, unsigned function, unsigned pull, unsigned ma, bool output)
{
	wr(GPIO_CFG(pin), pull | function << 2 | (ma / 2 - 1) << 6 | (output ? 1u << 9 : 0));
}

static void
gpio_set(unsigned pin, bool high)
{
	wr(GPIO_IO(pin), high ? 2 : 0);
}

static bool
gpio_get(unsigned pin)
{
	return rd(GPIO_IO(pin)) & 1;
}

static void
gpio_output(unsigned pin, bool high, unsigned pull, unsigned ma)
{
	gpio_set(pin, high);            /* the level first, so that the pin never drives the wrong one */
	gpio_configure(pin, 0, pull, ma, true);
}

/* ---- clocks (GCC) -------------------------------------------------------------------------------- */

/*
 * qcom,gcc@100000 (dt: reg = <0x100000 0xb0000>). A branch clock is one register: bit 0 enables
 * it, and bit 31 reads 1 while it is held off (clock-local2.c's CBCR_BRANCH_ENABLE_BIT and
 * CBCR_BRANCH_OFF_BIT). An RCG is a command register whose bit 0 takes a new configuration, then
 * the configuration itself in the next word: [4:0] the divider (0 = bypass, n means /(2n) -- see
 * rcg_calc_div_src()) and [10:8] the source. The offsets are the vendor's own
 * (dt-bindings/clock/msm-clocks-hwio-8998.h).
 */
#define GCC_PHYS                0x00100000UL
#define GCC_SIZE                0x0b0000UL

#define GCC_BLSP1_AHB_CBCR      (gcc + 0x17004)
#define GCC_BLSP1_QUP5_I2C_CBCR (gcc + 0x21008)
#define GCC_BLSP1_QUP5_I2C_RCGR (gcc + 0x21020)         /* the command register; config at +4 */
#define CBCR_ENABLE             (1u << 0)
#define CBCR_OFF                (1u << 31)
#define RCGR_UPDATE             (1u << 0)
#define RCGR_ROOT_ENABLE        (1u << 1)

#define SCL_HZ                  400000          /* dt: qcom,clk-freq-out = <0x61a80> */

static bool
clocks_on(void)
{
	uint32_t command;

	wr(GCC_BLSP1_QUP5_I2C_CBCR, rd(GCC_BLSP1_QUP5_I2C_CBCR) | CBCR_ENABLE);
	wr(GCC_BLSP1_AHB_CBCR, rd(GCC_BLSP1_AHB_CBCR) | CBCR_ENABLE);

	/*
	 * The source: the crystal at 19.2 MHz, undivided. The vendor's frequency table for this
	 * clock is F(19200000, cxo_clk_src, 1, 0, 0) -- the crystal, divider 1 -- so source 0 with
	 * the bypass encoding 0, which is what rcg_calc_div_src() produces for a divider of one.
	 */
	command = rd(GCC_BLSP1_QUP5_I2C_RCGR);
	if (!(command & RCGR_ROOT_ENABLE)) {
		wr(GCC_BLSP1_QUP5_I2C_RCGR, command | RCGR_ROOT_ENABLE);
	}
	wr(GCC_BLSP1_QUP5_I2C_RCGR + 4, 0);
	wr(GCC_BLSP1_QUP5_I2C_RCGR, rd(GCC_BLSP1_QUP5_I2C_RCGR) | RCGR_UPDATE);
	for (int i = 0; i < 500 && (rd(GCC_BLSP1_QUP5_I2C_RCGR) & RCGR_UPDATE); i++) {
		sleep_us(1);
	}
	if (rd(GCC_BLSP1_QUP5_I2C_RCGR) & RCGR_UPDATE) {
		say("chiron-dsx: the engine's clock does not take its configuration (%#x)\n",
		    rd(GCC_BLSP1_QUP5_I2C_RCGR));
		return false;
	}

	for (int i = 0; i < 1000; i++) {
		if (!((rd(GCC_BLSP1_QUP5_I2C_CBCR) | rd(GCC_BLSP1_AHB_CBCR)) & CBCR_OFF)) {
			say("chiron-dsx: clocks on: AHB %#x, engine I2C %#x, source %#x\n",
			    rd(GCC_BLSP1_AHB_CBCR), rd(GCC_BLSP1_QUP5_I2C_CBCR), rd(GCC_BLSP1_QUP5_I2C_RCGR + 4));
			return true;
		}
		sleep_us(10);
	}
	say("chiron-dsx: clocks stay off: AHB %#x, engine I2C %#x\n", rd(GCC_BLSP1_AHB_CBCR),
	    rd(GCC_BLSP1_QUP5_I2C_CBCR));
	return false;
}

/* ---- the serial engine as an I2C master (QUP) ------------------------------------------------------ */

/*
 * i2c@c179000 (dt: reg = <0xc179000 0x600>, qcom,master-id = <0x56>). The device tree says
 * compatible = "qcom,i2c-msm-v2", i.e. a QUP with the version-2 tag set -- not the GENI block a
 * newer SoC would have, which is why the registers here are i2c-msm-v2.c's rather than
 * spi-geni-qcom.c's.
 */
#define SE_PHYS                 0x0c179000UL
#define SE_SIZE                 0x600UL

#define QUP_CONFIG              (se + 0x000)
#define QUP_STATE               (se + 0x004)
#define QUP_IO_MODES            (se + 0x008)
#define QUP_SW_RESET            (se + 0x00c)
#define QUP_OPERATIONAL         (se + 0x018)
#define QUP_ERROR_FLAGS         (se + 0x01c)
#define QUP_ERROR_FLAGS_EN      (se + 0x020)
#define QUP_OPERATIONAL_MASK    (se + 0x028)
#define QUP_HW_VERSION          (se + 0x030)
#define QUP_MX_OUTPUT_COUNT     (se + 0x100)
#define QUP_OUT_FIFO_BASE       (se + 0x110)
#define QUP_MX_WRITE_COUNT      (se + 0x150)
#define QUP_MX_INPUT_COUNT      (se + 0x200)
#define QUP_MX_READ_COUNT       (se + 0x208)
#define QUP_IN_FIFO_BASE        (se + 0x218)
#define QUP_I2C_CLK_CTL         (se + 0x400)
#define QUP_I2C_STATUS          (se + 0x404)
#define QUP_I2C_MASTER_CONFIG   (se + 0x408)

#define QUP_STATE_MASK          0x3u
#define QUP_STATE_RESET         0
#define QUP_STATE_RUN           1
#define QUP_STATE_PAUSE         3
#define QUP_STATE_VALID         (1u << 2)
#define QUP_I2C_MAST_GEN        (1u << 4)

#define QUP_MINI_CORE_I2C_VAL   (0x2u << 8)
#define QUP_N_VAL               0x7             /* the vendor's QUP_N_VAL: a five-bit N */
#define QUP_NO_INPUT            (1u << 7)
#define QUP_PACK_EN             (1u << 15)
#define QUP_UNPACK_EN           (1u << 14)

#define QUP_OUTPUT_SERVICE_FLAG (1u << 8)
#define QUP_INPUT_SERVICE_FLAG  (1u << 9)
#define QUP_MAX_OUTPUT_DONE     (1u << 10)
#define QUP_MAX_INPUT_DONE      (1u << 11)

#define QUP_PACKET_NACKED       (1u << 3)
#define QUP_BUS_ACTIVE          (1u << 8)
#define QUP_MSTR_STTS_ERR_MASK  0x380003cu
#define QUP_ERR_FLAGS_MASK      0x3cu

/* QUP version-2 tags: one byte each, saying start / data / data-and-stop, for either direction. */
#define QUP_TAG_START           0x81
#define QUP_TAG_DATA_WRITE_STOP 0x83
#define QUP_TAG_DATA_READ_STOP  0x87

#define DSX_I2C_ADDRESS         0x20            /* dt: reg = <0x20>, 7-bit */
#define DSX_UB_I2C_ADDRESS      0x2c            /* dt: synaptics,ub-i2c-addr, the firmware half */

/* The longest block this driver writes in one transfer: F12's report is 80 bytes. */
#define DSX_MAX_READ            64

/*
 * The clock divider for a 19.2 MHz core clock and a 400 kHz bus. The vendor's table for exactly
 * this pair is {KHz(400), 28, 14} in i2c-msm-v2.c's i2c_msm_clk_div_map; the arithmetic agrees --
 * 19200000 / 400000 = 48, and the fast-mode branch of the kernel's i2c-qup.c computes
 * fs_div = (48 - 6) * 2 / 3 = 28, hs_div = fs_div / 2 = 14. The register is [7:0] the fast
 * divider and [23:16] the high-time divider (i2c_msm_set_mstr_clk_ctl(): (ht_div << 16) | fs_div).
 * CERTAIN: this is the pair the phone ran.
 */
#define I2C_FS_DIV              28
#define I2C_HT_DIV              14

/*
 * A read is asked for in pieces, because the input FIFO is filled while the engine runs and this
 * driver reads it only at the end: 2 tag bytes plus 24 data bytes is four words of a FIFO far
 * larger than that on any QUP this part has. INFERRED: the FIFO depth is not read and checked
 * against this, only printed.
 */
#define I2C_READ_CHUNK          24

static uint32_t i2c_fifo_words = 8;

static bool
qup_state(uint32_t wanted)
{
	/*
	 * A state change takes three AHB clocks plus three master clocks; the vendor allows a
	 * little over ten milliseconds before calling it a timeout. A driver that spun here
	 * forever would hang the phone with the engine in an unknown state, so it gives up.
	 */
	for (int i = 0; i < 1500; i++) {
		uint32_t state = rd(QUP_STATE);

		if ((state & QUP_STATE_VALID) && (state & QUP_STATE_MASK) == wanted) {
			return true;
		}
		if (!(i % 100)) {
			sleep_us(1000);
		}
	}
	say("chiron-dsx: the engine will not go to state %u (it says %#x, master-gen %u)\n", wanted,
	    rd(QUP_STATE), !!(rd(QUP_STATE) & QUP_I2C_MAST_GEN));
	return false;
}

static bool
qup_valid(void)
{
	for (int i = 0; i < 1500; i++) {
		if (rd(QUP_STATE) & QUP_STATE_VALID) {
			return true;
		}
		if (!(i % 100)) {
			sleep_us(1000);
		}
	}
	say("chiron-dsx: the engine never reports a valid state: its clock is not running\n");
	return false;
}

static bool
qup_init(void)
{
	wr(QUP_SW_RESET, 1);
	if (!qup_valid() || !qup_state(QUP_STATE_RESET)) {
		return false;
	}

	/* the I2C mini core, N = 7, and the version-2 tags the transfers below are written in */
	wr(QUP_CONFIG, QUP_MINI_CORE_I2C_VAL | QUP_N_VAL);
	wr(QUP_ERROR_FLAGS_EN, 0x3c);           /* over- and under-run on both FIFOs */
	wr(QUP_OPERATIONAL_MASK, QUP_OUTPUT_SERVICE_FLAG | QUP_INPUT_SERVICE_FLAG);
	wr(QUP_I2C_MASTER_CONFIG, 1);           /* QUP_EN_VERSION_TWO_TAG */

	i2c_fifo_words = 2u << ((rd(QUP_IO_MODES) >> 2) & 7);

	if (!(rd(QUP_STATE) & QUP_I2C_MAST_GEN)) {
		say("chiron-dsx: the engine does not report an I2C master (%#x): it is not that kind of QUP\n",
		    rd(QUP_STATE));
		return false;
	}
	say("chiron-dsx: the engine at %#lx reports an I2C master, hardware %#x, IO modes %#x, %u words of FIFO\n",
	    (unsigned long)SE_PHYS, rd(QUP_HW_VERSION), rd(QUP_IO_MODES), i2c_fifo_words);
	return true;
}

/* 0 = done; otherwise the I2C status word, so that a NACK can be told from a bus error. */
static uint32_t
i2c_transfer(const uint8_t *tx, uint32_t tx_length, uint8_t *rx, uint32_t rx_length)
{
	uint32_t status = 0;
	int guard;

	if (!qup_state(QUP_STATE_RESET)) {
		return 0xffffffffu;
	}

	/*
	 * Counts. In FIFO mode QUP_MX_WRITE_COUNT is every byte that goes out -- the tag bytes and
	 * the data -- and QUP_MX_READ_COUNT every byte that comes in, the two echoed tag bytes
	 * included (i2c_msm_qup_xfer_init_reset_state(): mx_wr_cnt = tx_cnt + tx_ovrhd_cnt).
	 */
	wr(QUP_MX_INPUT_COUNT, 0);
	wr(QUP_MX_OUTPUT_COUNT, 0);
	wr(QUP_MX_WRITE_COUNT, tx_length);
	wr(QUP_MX_READ_COUNT, rx_length);
	wr(QUP_CONFIG, QUP_MINI_CORE_I2C_VAL | QUP_N_VAL | (rx_length ? 0 : QUP_NO_INPUT));
	wr(QUP_IO_MODES, QUP_PACK_EN | QUP_UNPACK_EN);
	wr(QUP_OPERATIONAL_MASK, 0);

	if (!qup_state(QUP_STATE_RUN)) {
		return 0xffffffffu;
	}
	/* the divider is programmed on every move from reset to run, as the vendor does */
	wr(QUP_I2C_CLK_CTL, (I2C_HT_DIV & 0xffu) << 16 | (I2C_FS_DIV & 0xffu));

	/* the FIFOs are filled in pause, so that the engine does not start on a half-written frame */
	if (!qup_state(QUP_STATE_PAUSE)) {
		return 0xffffffffu;
	}
	for (uint32_t i = 0; i < tx_length; i += 4) {
		uint32_t word = 0;

		for (int j = 0; j < 4 && i + (uint32_t)j < tx_length; j++) {
			word |= (uint32_t)tx[i + j] << (8 * j);
		}
		wr(QUP_OUT_FIFO_BASE, word);
	}
	if (!qup_state(QUP_STATE_RUN)) {
		return 0xffffffffu;
	}

	/* waited for by polling the operational flags -- the vendor's interrupt would say the same */
	for (guard = 0; guard < 20000; guard++) {
		uint32_t operational = rd(QUP_OPERATIONAL), errors;

		errors = rd(QUP_ERROR_FLAGS) & QUP_ERR_FLAGS_MASK;
		status = rd(QUP_I2C_STATUS) & QUP_MSTR_STTS_ERR_MASK;
		if (errors) {
			wr(QUP_ERROR_FLAGS, errors);
			say("chiron-dsx: the engine reports a FIFO error %#x (%u out, %u in)\n", errors, tx_length,
			    rx_length);
			(void)qup_state(QUP_STATE_RESET);
			return status ? status : 0xffffffffu;
		}
		if (status) {
			say("chiron-dsx: bus error %#x on %u out, %u in%s\n", status, tx_length, rx_length,
			    (status & QUP_PACKET_NACKED) ? ": the chip did not acknowledge" : "");
			(void)qup_state(QUP_STATE_RESET);
			return status;
		}
		if (rx_length) {
			if (operational & QUP_MAX_INPUT_DONE) {
				break;
			}
		} else if (operational & QUP_MAX_OUTPUT_DONE) {
			break;
		}
		sleep_us(20);
	}
	if (guard >= 20000) {
		say("chiron-dsx: the transfer did not finish: operational %#x, status %#x, %u out, %u in\n",
		    rd(QUP_OPERATIONAL), rd(QUP_I2C_STATUS), tx_length, rx_length);
		(void)qup_state(QUP_STATE_RESET);
		return 0xffffffffu;
	}

	if (rx_length) {
		/*
		 * The input FIFO holds the tag bytes the engine echoes back -- two, for a version-2
		 * read -- and then the data, four bytes to a word. Read whole words until the data is
		 * complete, dropping the tags (i2c-msm-v2.c walks the FIFO the same way).
		 */
		uint32_t words = (rx_length + 2 + 3) / 4, got = 0;

		for (uint32_t i = 0; i < words; i++) {
			uint32_t word = rd(QUP_IN_FIFO_BASE);

			for (int j = 0; j < 4; j++, got++) {
				if (got >= 2 && got - 2 < rx_length) {
					rx[got - 2] = (uint8_t)(word >> (8 * j));
				}
			}
		}
		/* an unread echo here means the layout is not what this driver believes */
		if (got < rx_length + 2) {
			say("chiron-dsx: only %u of %u bytes came back\n", got > 2 ? got - 2 : 0, rx_length);
			(void)qup_state(QUP_STATE_RESET);
			return 0xffffffffu;
		}
	}
	for (int i = 0; i < 100 && (rd(QUP_I2C_STATUS) & QUP_BUS_ACTIVE); i++) {
		sleep_us(10);
	}
	(void)qup_state(QUP_STATE_RESET);
	return 0;
}

static bool
i2c_write(uint8_t address, const uint8_t *buffer, uint32_t length)
{
	uint8_t frame[4 + DSX_MAX_READ];

	if (length > DSX_MAX_READ) {
		return false;
	}
	/* [start][address][write-then-stop][length], then the bytes themselves */
	frame[0] = QUP_TAG_START;
	frame[1] = (uint8_t)(address << 1);
	frame[2] = QUP_TAG_DATA_WRITE_STOP;
	frame[3] = (uint8_t)length;
	memcpy(frame + 4, buffer, length);
	return i2c_transfer(frame, length + 4, NULL, 0) == 0;
}

static bool
i2c_read(uint8_t address, uint8_t *buffer, uint32_t length)
{
	uint8_t frame[4];

	/* [start][address and read bit][read-then-stop][length]: all this direction sends */
	frame[0] = QUP_TAG_START;
	frame[1] = (uint8_t)(address << 1 | 1);
	frame[2] = QUP_TAG_DATA_READ_STOP;
	frame[3] = (uint8_t)length;
	return i2c_transfer(frame, sizeof(frame), buffer, length) == 0;
}

/*
 * Write some bytes, then read some, in that order on the bus.
 *
 * The two halves are separate transfers, so the bus sees a stop and a start between them rather
 * than a repeated start. RMI4 needs nothing more: the address a write leaves in the chip's own
 * pointer is what the read that follows uses, and the vendor driver's retry path re-issues the
 * address on its own. One transfer carrying both halves would need this engine's
 * reconfiguration-while-running tags, which is more of its state machine than there is reason to
 * trust here without the phone.
 */
static bool
i2c_write_read(uint8_t address, const uint8_t *write, uint32_t write_length, uint8_t *read,
    uint32_t read_length)
{
	return i2c_write(address, write, write_length) && i2c_read(address, read, read_length);
}

/* ---- the DSX chip (RMI4) --------------------------------------------------------------------------- */

/*
 * RMI4 addresses a register with sixteen bits: the high byte names a page, the low byte a register
 * inside it. Writing 0xFF on any page selects the next one
 * (synaptics_dsx_i2c.c's synaptics_rmi4_i2c_set_page()).
 */
#define RMI_PAGE_SELECT         0xff
#define RMI_PDT_START           0x00e9          /* the page description table, walked downward */
#define RMI_PDT_END             0x00d0
#define RMI_PDT_ENTRY           6

#define RMI_F01                 0x01            /* the part itself: identifiers, control, interrupts */
#define RMI_F12                 0x12            /* two-dimensional sensing: the touch report */

#define F01_QUERY_LENGTH        21
#define F01_PRODUCT_ID          11              /* ten bytes from query 11 */
#define F01_PRODUCT_ID_LENGTH   10
#define F01_BUILD_ID            18              /* three bytes from query 18 */
#define F01_BUILD_ID_LENGTH     3
#define F01_COMMAND_RESET       0x01

/*
 * F12's 2D objects, eight bytes each, as the vendor's synaptics_rmi4_f12_finger_data is built with
 * REPORT_2D_Z and REPORT_2D_W both defined:
 *   [0] object type in the high nibble, status in the low (1 = finger, 6 = gloved, 0 = nothing)
 *   [1..2] x, low byte first          [3..4] y
 *   [5] z, the pressure               [6..7] the touch's width and height
 * Reading eight per object is safe whether or not Z and W are present: if they are not, the bytes
 * after y belong to the next object, and this driver only ever looks at the first five of each
 * object it reports -- so the worst a wrong guess does is read a neighbour's bytes into z/w, which
 * nothing here uses.
 */
#define F12_OBJECT_SIZE         8
#define F12_MAX_OBJECTS         10
#define F12_STATUS_FINGER       0x01
#define F12_STATUS_GLOVED       0x06

static uint8_t current_page = 0xff;             /* 0xff: no page has been selected yet */
static uint8_t f01_command_base;

/* What the page description table says about one function. */
struct rmi_function {
	uint8_t number, interrupt_source_count;
	uint8_t query, control, data, command;
	uint8_t page;                           /* which page the table entry was found on */
	bool found;
};

/* F12's report, once the tables have been walked. */
static struct {
	uint16_t data_address;                  /* page and offset, as RMI4 wants them */
	uint8_t data_offset;
	uint32_t max_x, max_y;                  /* what the chip says its sensor is */
} f12;
static uint32_t panel_max_x = 1080, panel_max_y = 2160;

static bool
dsx_set_page(uint8_t page)
{
	uint8_t select[2] = { RMI_PAGE_SELECT, page };

	if (page == current_page) {
		return true;
	}
	if (!i2c_write(DSX_I2C_ADDRESS, select, sizeof(select))) {
		return false;
	}
	current_page = page;
	return true;
}

static bool
dsx_read(uint16_t address, uint8_t *data, uint32_t length)
{
	if (!dsx_set_page((uint8_t)(address >> 8))) {
		return false;
	}
	while (length) {
		uint8_t register_address = (uint8_t)address;
		uint32_t piece = length > I2C_READ_CHUNK ? I2C_READ_CHUNK : length;

		if (!i2c_write_read(DSX_I2C_ADDRESS, &register_address, 1, data, piece)) {
			return false;
		}
		data += piece;
		address = (uint16_t)(address + piece);
		length -= piece;
	}
	return true;
}

static bool
dsx_write(uint16_t address, const uint8_t *data, uint32_t length)
{
	uint8_t frame[1 + DSX_MAX_READ];

	if (length > DSX_MAX_READ || !dsx_set_page((uint8_t)(address >> 8))) {
		return false;
	}
	frame[0] = (uint8_t)address;
	memcpy(frame + 1, data, length);
	return i2c_write(DSX_I2C_ADDRESS, frame, length + 1);
}

/*
 * Find a function in the page description table. Each entry is six bytes -- number, interrupt
 * source count, then the page-relative addresses of the query, command, control and data blocks --
 * and the table ends at the first entry whose number is zero
 * (synaptics_dsx_core.c's page scan, which walks the first ten pages).
 */
static bool
rmi_find_function(uint8_t number, struct rmi_function *function)
{
	memset(function, 0, sizeof(*function));
	function->number = number;
	for (uint8_t page = 0; page < 10; page++) {
		for (uint16_t entry = RMI_PDT_START; entry > RMI_PDT_END; entry -= RMI_PDT_ENTRY) {
			uint8_t description[RMI_PDT_ENTRY];
			uint16_t address = (uint16_t)(entry | page << 8);

			if (!dsx_read(address, description, sizeof(description))) {
				return false;
			}
			if (description[0] == 0) {
				break;                  /* the end of this page's table */
			}
			if (description[0] == number) {
				function->interrupt_source_count = description[1];
				function->query = description[3];
				function->command = description[4];
				function->control = description[5];
				function->data = description[6];
				function->page = page;
				function->found = true;
				return true;
			}
		}
	}
	return true;                            /* (not finding it is an answer, not an error) */
}

/* A function's block address, as the sixteen bits RMI4 wants: its page and its offset in it. */
static uint16_t
rmi_address(const struct rmi_function *function, uint8_t offset)
{
	return (uint16_t)(function->page << 8 | offset);
}

/*
 * Identify the part, and find where its touch report is. Returns NULL on success, otherwise the
 * step that stopped it -- so that a failure in the log names the step rather than "not found".
 */
static const char *
dsx_identify(void)
{
	struct rmi_function f01, touch;
	uint8_t query[F01_QUERY_LENGTH];
	uint8_t product[F01_PRODUCT_ID_LENGTH], build[F01_BUILD_ID_LENGTH];
	uint8_t spare;
	char product_text[F01_PRODUCT_ID_LENGTH + 1];

	if (!rmi_find_function(RMI_F01, &f01)) {
		return "the page description table could not be read";
	}
	if (!f01.found) {
		return "no F01 in the page description table (something answers, but not a DSX)";
	}
	say("chiron-dsx: F01 on page %u: query %#x command %#x control %#x data %#x, %u interrupt sources\n",
	    f01.page, f01.query, f01.command, f01.control, f01.data, f01.interrupt_source_count);

	if (!dsx_read(rmi_address(&f01, f01.query), query, sizeof(query))) {
		return "F01's query block could not be read";
	}
	/* F01 query 0 is the manufacturer; 0x01 is Synaptics. Nothing, or all ones, is no answer. */
	if (query[0] == 0x00 || query[0] == 0xff) {
		return "F01 query 0 names no manufacturer, so nothing is answering properly";
	}
	memcpy(product, query + F01_PRODUCT_ID, sizeof(product));
	memcpy(build, query + F01_BUILD_ID, sizeof(build));
	for (int i = 0; i < F01_PRODUCT_ID_LENGTH; i++) {
		product_text[i] = (product[i] >= 0x20 && product[i] < 0x7f) ? (char)product[i] : '.';
	}
	product_text[F01_PRODUCT_ID_LENGTH] = '\0';
	f01_command_base = f01.command;

	/*
	 * The brief's 0xE1 read, done and printed, with nothing depending on it: see the note at
	 * the top of this file on why the vendor driver has no such register.
	 */
	if (dsx_read(0x00e1, &spare, 1)) {
		say("chiron-dsx: manufacturer %#x, product id \"%s\", build %02x.%02x.%02x; 0x00e1 reads %#x\n",
		    query[0], product_text, build[0], build[1], build[2], spare);
	} else {
		say("chiron-dsx: manufacturer %#x, product id \"%s\", build %02x.%02x.%02x; 0x00e1 could not be read\n",
		    query[0], product_text, build[0], build[1], build[2]);
	}

	if (!rmi_find_function(RMI_F12, &touch)) {
		return "the page description table could not be read a second time";
	}
	if (!touch.found) {
		return "no F12: this part reports touches through F11, which this driver does not implement";
	}

	/*
	 * F12 query 8 says which of its data registers exist, and bit 0 -- data register 0 -- is the
	 * only one needed: the 2D objects begin right after it
	 * (synaptics_dsx_core.c: extra_data->data1_offset = query_8->data0_is_present).
	 * INFERRED: only that bit is read, not the whole presence map, because the rest of it exists
	 * to give offsets to the Z, W and pressure registers, which this driver reads positionally
	 * instead (see F12_OBJECT_SIZE).
	 */
	f12.data_address = rmi_address(&touch, touch.data);
	f12.data_offset = 0;
	{
		uint8_t size_of_query8 = 0;

		if (dsx_read(rmi_address(&touch, touch.query + 7), &size_of_query8, 1) && size_of_query8 >= 1) {
			uint8_t presence = 0;

			if (dsx_read(rmi_address(&touch, touch.query + 8), &presence, 1)) {
				f12.data_offset = presence & 1;
			}
		} else {
			say("chiron-dsx: F12's query 8 could not be read; assuming no data register 0\n");
		}
	}
	say("chiron-dsx: F12 on page %u: query %#x control %#x data %#x, %u interrupt sources; objects %u bytes into it\n",
	    touch.page, touch.query, touch.control, touch.data, touch.interrupt_source_count, f12.data_offset);

	/*
	 * F12's control 8 holds the sensor's extent: max_x then max_y as 16-bit values, low byte
	 * first (synaptics_dsx_core.c reads ctrl_8->max_x_coord_lsb and -msb at ctrl_base +
	 * ctrl_8_offset). INFERRED: that control 8 is the first control register, which is what the
	 * vendor's query-5 presence walk computes when ctrl0..ctrl7 are absent. If the two numbers are
	 * not plausible as a panel, the device tree's size is kept instead, so a wrong guess here
	 * costs an odd log line rather than a touch screen that does not work.
	 */
	f12.max_x = 0;
	f12.max_y = 0;
	{
		uint8_t control[14];

		if (dsx_read(rmi_address(&touch, touch.control), control, sizeof(control))) {
			uint32_t x = control[0] | control[1] << 8;
			uint32_t y = control[2] | control[3] << 8;

			if (x >= 100 && y >= 100 && x <= 100000 && y <= 100000) {
				f12.max_x = x;
				f12.max_y = y;
				/*
				 * The brief's rule: believe the chip, but no further than the panel that is
				 * really there. A sensor reporting more than 1080 x 2160 is describing its grid.
				 */
				panel_max_x = x < 1080 ? x : 1080;
				panel_max_y = y < 2160 ? y : 2160;
			} else {
				say("chiron-dsx: F12 control 8 reads %u x %u, which is not a panel; keeping %u x %u\n",
				    x, y, panel_max_x, panel_max_y);
			}
		} else {
			say("chiron-dsx: F12's control block could not be read; keeping %u x %u\n", panel_max_x,
			    panel_max_y);
		}
	}
	return NULL;
}

/* ---- touches ---------------------------------------------------------------------------------------- */

/* Which fingers were down in the last report, and where. */
static struct {
	bool down, seen;
	uint32_t x, y;                  /* in the /dev/redwood-touch scale */
} contact[F12_MAX_OBJECTS];

static struct {
	uint32_t reports, fingers, bad, last_x, last_y;
} seen;

static void
dsx_report(const uint8_t *objects, uint32_t count)
{
	static unsigned shown;

	for (int i = 0; i < F12_MAX_OBJECTS; i++) {
		contact[i].seen = false;
	}
	for (uint32_t i = 0; i < count; i++) {
		const uint8_t *object = objects + F12_OBJECT_SIZE * i;
		uint32_t status = object[0] & 0x0f;
		uint32_t x, y, scaled_x, scaled_y;

		if (status != F12_STATUS_FINGER && status != F12_STATUS_GLOVED) {
			continue;               /* nothing there, or a stylus, a palm, a hand edge: not a finger */
		}
		x = object[1] | object[2] << 8;
		y = object[3] | object[4] << 8;
		if (x > f12.max_x + 64 || y > f12.max_y + 64) {
			/*
			 * Outside the panel the chip just described: either a report read while the chip
			 * was writing it, or this driver has the object layout wrong. Either way a finger
			 * must not jump to a corner, so the object is dropped and counted.
			 */
			seen.bad++;
			continue;
		}
		if (shown < 20) {
			shown++;
			printf("chiron-dsx: finger %u at %u, %u of %u x %u (bytes %02x %02x %02x %02x %02x %02x %02x %02x)\n",
			    i, x, y, f12.max_x, f12.max_y, object[0], object[1], object[2], object[3], object[4],
			    object[5], object[6], object[7]);
		}
		seen.fingers++;
		seen.last_x = x;
		seen.last_y = y;
		scaled_x = x >= panel_max_x ? 65535 : x * 65535 / panel_max_x;
		scaled_y = y >= panel_max_y ? 65535 : y * 65535 / panel_max_y;
		contact[i].seen = true;
		if (!contact[i].down) {
			redwood_touch_post(REDWOOD_TOUCH_DOWN, i, scaled_x, scaled_y);
		} else if (contact[i].x != scaled_x || contact[i].y != scaled_y) {
			redwood_touch_post(REDWOOD_TOUCH_MOVE, i, scaled_x, scaled_y);
		}
		contact[i].down = true;
		contact[i].x = scaled_x;
		contact[i].y = scaled_y;
	}
	/* a finger that is no longer in the report has lifted */
	for (uint32_t i = 0; i < F12_MAX_OBJECTS; i++) {
		if (contact[i].down && !contact[i].seen) {
			contact[i].down = false;
			redwood_touch_post(REDWOOD_TOUCH_UP, i, contact[i].x, contact[i].y);
		}
	}
}

/* Read the report if there is one. */
static void
dsx_poll(void)
{
	static uint8_t objects[F12_OBJECT_SIZE * F12_MAX_OBJECTS];

	if (f12.data_address == 0) {
		return;
	}
	if (!dsx_read((uint16_t)(f12.data_address + f12.data_offset), objects, sizeof(objects))) {
		seen.bad++;
		if (seen.bad < 8) {
			say("chiron-dsx: the touch report could not be read\n");
		}
		return;
	}
	seen.reports++;
	dsx_report(objects, F12_MAX_OBJECTS);
}

/* ---- the chip, from nothing --------------------------------------------------------------------------- */

/*
 * dt: reset-gpio = <&tlmm 0x59 0>, synaptics,reset-on-state = <0> (reset is asserted low),
 * synaptics,reset-active-ms = <5>, synaptics,reset-delay-ms = <0xc8> = 200.
 */
static void
touch_reset(void)
{
	gpio_output(PIN_RESET, false, PULL_UP, 8);
	sleep_ms(5);
	gpio_set(PIN_RESET, true);
	sleep_ms(200);
}

static void
use_i2c_pins(void)
{
	/* dt: the i2c_5_active state, drive-strength 2 mA, bias-disable */
	gpio_configure(PIN_SDA, PIN_FUNCTION_I2C, PULL_NONE, 2, false);
	gpio_configure(PIN_SCL, PIN_FUNCTION_I2C, PULL_NONE, 2, false);
}

/* ---- the interrupt line --------------------------------------------------------------------------------- */

/*
 * GPIO125 is the chip's attention line. The device tree gives it flags 0x2008: trigger 0x02, which
 * is IRQ_TYPE_EDGE_FALLING, plus 0x2000, IRQ_TYPE_ONESHOT, which is how the vendor arms it -- the
 * part holds the line down until its report has been read, so one falling edge is one report.
 *
 * The pin controller has a single interrupt for all its pins: SPI 0xd0 (dt: pinctrl@03400000,
 * interrupts = <0 0xd0 0>), whose GIC interrupt number is 208 + 32 = 240. A handler for it
 * therefore has to ask the pin controller which pin fired. One driver in this kernel already takes
 * a hardware interrupt other than the timer's -- bsd/dev/redwood_lx.c, for the Wi-Fi radio -- and
 * it attaches an SPI exactly this way.
 *
 * BECAUSE THAT CHAIN HAS NOTHING DRIVING IT ON THIS PHONE YET, the interrupt is opt-in: with
 * boot-arg chiron_touch_irq=1 the driver takes SPI 240, and otherwise it looks at the line on a
 * timer as the Goodix driver does. Either way the chip is read identically.
 */
#define TLMM_SUMMARY_SPI        208
#define TLMM_SUMMARY_INTID      (TLMM_SUMMARY_SPI + 32)

extern kern_return_t gic_v3_spi_attach(uint32_t intid, bool edge,
    void (*handler)(void *context, uint32_t intid), void *context);
extern void gic_v3_spi_mask(uint32_t intid);
extern void gic_v3_spi_unmask(uint32_t intid);

static uint32_t use_interrupt;          /* boot-arg chiron_touch_irq */
static uint32_t attention_pending;      /* set in the handler, taken by the thread */
static bool interrupt_attached;

static void
dsx_interrupt(__unused void *context, uint32_t intid)
{
	uint32_t status = rd(GPIO_INTR_STATUS(PIN_INT));

	/* This pin's status bit is write-one-to-clear; the summary line drops with it. */
	wr(GPIO_INTR_STATUS(PIN_INT), status | 1);
	if (status & 1) {
		os_atomic_or(&attention_pending, 1, relaxed);
		thread_wakeup((event_t)&attention_pending);
	}
	/* one edge at a time: the thread unmasks it again once it has read the report */
	gic_v3_spi_mask(intid);
	(void)interrupt_attached;
}

static bool
interrupt_arm(void)
{
	uint32_t config;

	/*
	 * Pin 125's own interrupt configuration (pinctrl-msm.c's msm_gpio_irq_set_type()): [4] raw
	 * status always on, [3:2] detection 2 = falling edge, [1] polarity 1, [0] enable, and the
	 * target in [6:5] -- 3 routes to the application processor.
	 */
	gpio_configure(PIN_INT, 0, PULL_UP, 8, false);
	config = rd(GPIO_INTR_CFG(PIN_INT));
	config &= ~((1u << 4) | (3u << 2) | (1u << 1) | (1u << 0) | (7u << 5));
	config |= (1u << 4) | (2u << 2) | (1u << 1) | (3u << 5);
	wr(GPIO_INTR_CFG(PIN_INT), config);
	wr(GPIO_INTR_STATUS(PIN_INT), 1);               /* whatever was latched is not a touch */

	if (gic_v3_spi_attach(TLMM_SUMMARY_INTID, true, dsx_interrupt, NULL) != KERN_SUCCESS) {
		say("chiron-dsx: the pin controller's interrupt (SPI %u) is not available; looking at the line"
		    " on a timer instead\n", TLMM_SUMMARY_SPI);
		return false;
	}
	gic_v3_spi_unmask(TLMM_SUMMARY_INTID);
	interrupt_attached = true;
	say("chiron-dsx: interrupt on GPIO%u, falling edge, through SPI %u; its configuration reads %#x\n",
	    PIN_INT, TLMM_SUMMARY_SPI, rd(GPIO_INTR_CFG(PIN_INT)));
	return true;
}

/* ---- all of it together --------------------------------------------------------------------------------- */

static bool
bring_up(void)
{
	const char *problem;

	tlmm = ml_io_map(TLMM_PHYS, TLMM_SIZE);
	gcc = ml_io_map(GCC_PHYS, GCC_SIZE);
	se = ml_io_map(SE_PHYS, SE_SIZE);
	if (tlmm == 0 || gcc == 0 || se == 0) {
		say("chiron-dsx: cannot map the registers: pins %#lx, clocks %#lx, engine %#lx\n",
		    (unsigned long)tlmm, (unsigned long)gcc, (unsigned long)se);
		return false;
	}

	say("chiron-dsx: as found: GPIO%u is %u and its configuration %#x; GPIO%u configuration %#x;"
	    " GPIO%u is %u and its configuration %#x\n", PIN_SDA, gpio_get(PIN_SDA), rd(GPIO_CFG(PIN_SDA)),
	    PIN_RESET, rd(GPIO_CFG(PIN_RESET)), PIN_INT, gpio_get(PIN_INT), rd(GPIO_CFG(PIN_INT)));

	/*
	 * The supplies are not switched here -- see the note at the top of this file. If the chip
	 * does not answer, whether the boot loader left avdd and the panel's rails on is the first
	 * thing to check, and the step that failed will be the one in the log above.
	 */
	say("chiron-dsx: note: avdd, vdd, lab, ibb and disp are left as the boot loader set them\n");

	if (!clocks_on()) {
		return false;
	}
	use_i2c_pins();
	if (!qup_init()) {
		return false;
	}

	/*
	 * The hardware reset from the device tree, then identify the part. F01 has to be found
	 * before the part's own soft reset can be asked for -- the command lives in F01 -- and the
	 * soft reset is worth doing because it is what makes the part come back with its page
	 * pointer and report enables in the state this driver expects. So: identify, soft reset,
	 * identify again. Both are reported, and a failure at either names itself.
	 */
	touch_reset();
	problem = dsx_identify();
	if (problem != NULL) {
		say("chiron-dsx: stopping: %s\n", problem);
		return false;
	}
	{
		uint8_t command = F01_COMMAND_RESET;

		if (!dsx_write(f01_command_base, &command, 1)) {
			say("chiron-dsx: stopping: the soft reset command could not be written\n");
			return false;
		}
	}
	sleep_ms(200);                          /* dt: reset-delay-ms = <0xc8> */
	current_page = 0xff;                    /* a reset part is back on page 0 */
	problem = dsx_identify();
	if (problem != NULL) {
		say("chiron-dsx: stopping after the soft reset: %s\n", problem);
		return false;
	}

	say("chiron-dsx: Synaptics DSX at 0x%02x on 0x%lx, panel %ux%u\n", DSX_I2C_ADDRESS,
	    (unsigned long)SE_PHYS, panel_max_x, panel_max_y);
	return true;
}

static void
dsx_thread(__unused void *parameter, __unused wait_result_t result)
{
	uint32_t poll_us = 8000;

	PE_parse_boot_argn("chiron_touch_poll_us", &poll_us, sizeof(poll_us));
	if (poll_us < 250 || poll_us > 100000) {
		poll_us = 8000;
	}

	if (!bring_up()) {
		say("chiron-dsx: no Synaptics touch screen\n");
		thread_terminate(current_thread());
		return;
	}
	if (use_interrupt && !interrupt_arm()) {
		use_interrupt = 0;
	}
	if (use_interrupt) {
		say("chiron-dsx: touch screen ready; waiting on the interrupt line\n");
	} else {
		say("chiron-dsx: touch screen ready; the interrupt line is looked at every %u us\n", poll_us);
	}

	for (unsigned tick = 1;; tick++) {
		if (use_interrupt) {
			assert_wait((event_t)&attention_pending, THREAD_INTERRUPTIBLE);
			if (os_atomic_xchg(&attention_pending, 0, acquire) != 0) {
				clear_wait(current_thread(), THREAD_AWAKENED);
			} else {
				thread_block(THREAD_CONTINUE_NULL);
			}
			dsx_poll();
			gic_v3_spi_unmask(TLMM_SUMMARY_INTID);
		} else {
			/* the line is low while a report waits; look now and then anyway in case one is missed */
			if (!gpio_get(PIN_INT) || !(tick % (80000 / poll_us))) {
				dsx_poll();
			}
			sleep_us(poll_us);
		}
		if (!(tick % 7500)) {
			say("chiron-dsx: so far %u reports, %u finger positions (%u bad), the last at %u, %u;"
			    " interrupt line %s\n", seen.reports, seen.fingers, seen.bad, seen.last_x, seen.last_y,
			    gpio_get(PIN_INT) ? "high" : "low");
		}
	}
}

/*
 * Started from a constructor rather than from redwood_input_init(), which this driver may not
 * edit. XNU runs the __mod_init_func constructors of the kernel image itself, from
 * OSRuntimeInitializeCPP(NULL) (libkern/c++/OSRuntime.cpp, "the kernel itself" branch), and
 * libsa/lastkernelconstructor.c is the file that exists to be the last of them -- so a constructor
 * is a supported way in, not a trick. `started` makes a second run a no-op, which matters because
 * that is exactly what would happen if the tree ever grew a call to chiron_dsx_init() as well.
 */
static bool started;

void
chiron_dsx_init(void)
{
	uint32_t asked = 0;
	thread_t thread;

	if (started) {
		return;
	}
	started = true;
	say("chiron-dsx: Synaptics DSX (RMI4) driver present, built %s %s\n", __DATE__, __TIME__);

	/* Nothing happens unless a boot-arg asks for it, as in chiron_adreno.c. */
	if (!PE_parse_boot_argn("chiron_touch", &asked, sizeof(asked)) || asked == 0) {
		say("chiron-dsx: nothing done (boot-arg chiron_touch=1 asks for it)\n");
		return;
	}
	asked = 0;
	PE_parse_boot_argn("chiron_touch_irq", &asked, sizeof(asked));
	use_interrupt = asked;

	if (kernel_thread_start(dsx_thread, NULL, &thread) == KERN_SUCCESS) {
		thread_deallocate(thread);
	} else {
		say("chiron-dsx: the driver's thread would not start\n");
	}
}

static void chiron_dsx_constructor(void) __attribute__((constructor));

static void
chiron_dsx_constructor(void)
{
	chiron_dsx_init();
}
