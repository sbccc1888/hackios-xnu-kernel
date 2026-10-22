/*
 * The GPU of the Xiaomi Mi MIX 2 (chiron), an Adreno 540 -- architecture a5xx, where the
 * POCO X5 Pro (redwood) whose driver this port began from is a6xx. The two are far enough
 * apart that this is a driver of its own (bsd/dev/chiron_adreno.c) rather than a set of
 * addresses changed in redwood's, and it is built one verifiable step at a time.
 *
 * Every step announces what it is about to touch before it touches it, reads what is there
 * before writing anything, and stops the sequence rather than going on blind: an access the
 * hypervisor does not like ends the run, at once or a quarter of a minute later, and often
 * without a word (bsd/dev/redwood_adreno.c, the note at the top of it).
 *
 * What has been proved so far, and how:
 *   step 0  that this file is compiled into the kernel and its words reach the log. Not
 *           ceremony: this port already lost a whole patch to a "[warning] Skipping patch"
 *           and shipped a green build with none of it in the product. Proven three ways --
 *           "CC chiron_adreno.o" in the build log, _chiron_adreno_init in __TEXT_EXEC,
 *           and the bl that reaches it from redwood_input_init.
 *   step 1  that the GPU's registers can be reached at all, and what they hold before this
 *           driver writes anything. Reads only, except for the one bus clock without which
 *           the GPU's clock controller does not answer.
 *   step 2  the two power switches of the GPU block on (CX first, then GX with its block
 *           reset and its memory unclamped), the 3D clock source's root enabled and set to
 *           the lowest rate the phone is rated for, and the block's always-on counter seen
 *           to move -- with an explicit note about what that counter does and does not prove.
 *   step 3  RBBM set as a540 wants it (a5xx_start's own ~40 registers, the a540 branch of
 *           each choice), the CP's microcode loaded from the small image and put in place, and
 *           the micro engine let out of halt.
 *   step 4  a ring buffer, CP_ME_INIT, and the proof step 3 cannot give: the CP's read pointer
 *           moving to the write pointer, which means it fetched and executed what it was given.
 *   step 5  the GPMU: its .fw2 firmware written into its instruction RAM through the CP, then
 *           the handshake -- GENERAL_0 reading 0xBABEFACE and GENERAL_1 reading 0.
 *   step 6  the SMMU read and reported, because steps 3-5 rely on physical addresses arriving
 *           untranslated and that reliance has to be visible, not assumed.
 *
 * WHAT HAS BEEN PROVEN AND WHAT HAS NOT. Every step above is verified by compilation and by
 * comparison against the vendor's own code, not by running on the phone: the UEFI port chiron
 * needs is not done, so no address here has been touched on real hardware. In particular step 1
 * is where "does the hypervisor allow this kernel to reach the GPU's registers?" gets answered,
 * and it is NOT answered yet -- the driver asks the question properly and will report the raw
 * values, which is all that can be done until there is a kernel on the phone to run it.
 *
 * TWO CONVENTIONS OF ADDRESSING, and both are load-bearing:
 *   a5xx_reg.h offsets are DWORD indices (the vendor's accessor shifts them left 2); see GPU_REG.
 *   the clock controller's, the device tree's and the SMMU's are BYTE offsets; used as they are.
 * Two defects of exactly this shape were found and fixed during development -- a PM4 parity bit
 * computed over seven bits instead of the whole word, and every GPU-block offset read as bytes.
 * Both were silent-wrong rather than loud-wrong: they would have produced a driver that wrote
 * plausible values to the wrong places and reported "the GPU did not start", with every number
 * in the log looking reasonable. That is the failure mode this file is written to avoid, which
 * is why every constant carries its source and why the address conventions are asserted in the
 * log on the first line.
 *
 * Where the numbers come from. Each is cited where it is used, and where two independent
 * sources exist both are given, because a wrong address on this part is a silent reset
 * rather than a compile error:
 *   the phone's own device tree, /root/chiron.dts, decompiled from the Android-chiron.dtb
 *     that edk2-msm8998 carries: qcom,gcc@100000, qcom,gpucc@5065000, qcom,gdsc@5066004
 *     and @5066094, qcom,kgsl-3d0@5000000, arm,smmu-kgsl@5040000, qcom,kgsl-hyp
 *   the vendor kernel's GPU driver, /root/src/kernel_msm8998/drivers/gpu/msm/:
 *     adreno_a5xx.c, a5xx_reg.h, adreno-gpulist.h
 *   its clock driver, drivers/clk/msm/clock-gpu-8998.c, plus the register offsets in
 *     include/dt-bindings/clock/msm-clocks-hwio-8998.h
 *   the upstream one, drivers/gpu/drm/msm/adreno/a5xx_gpu.c and a5xx_power.c
 *
 * The steps this grew through (read out of adreno_a5xx.c's a5xx_start, backwards):
 *   1  the clock of the GPU's register buses, then the GPU's clock controller read as the
 *      boot loader left it
 *   2  CX and GX powered, the 3D clock source at its lowest rate, and the always-on counter
 *      of the GPU block seen to count
 *   3  RBBM initialised as a540 wants it, the CP's microcode in place, the micro engine out
 *      of halt -- the first step that proves the 3D core itself runs
 *   4  a ringbuffer, CP_ME_INIT, and out of secure mode
 *   5  the GPMU: a540_gpmu.fw2 through PM4 into its instruction RAM, then 0xBABEFACE
 */
#include <kern/clock.h>
#include <libkern/libkern.h>
#include <mach/mach_types.h>
#include <mach/vm_param.h>
#include <pexpert/pexpert.h>
#include <sys/systm.h>

extern vm_offset_t ml_io_map(vm_offset_t phys_addr, vm_size_t size);

/*
 * The kernel's log reaches the loader when a run is over, and a run that ends in a reset
 * without a word leaves none. The loader also reads a log of the kernel's from another core
 * while it runs, so every line said here goes there as well, before anything else happens
 * (osfmk/arm64/loader_return.c:88).
 */
extern void loader_log_putc(char c);

#define CHIRON_ADRENO_STEP 7            /* the last step this file performs */

static uint32_t step;                   /* the one being performed */
static bool core_started;               /* step 3 got the micro engine going: step 4 needs it */

static int say(const char *format, ...) __printflike(1, 2);

static int
say(const char *format, ...)
{
	char line[400];
	va_list list;
	int length;

	va_start(list, format);
	length = vsnprintf(line, sizeof(line), format, list);
	va_end(list);
	if (length < 0) {
		return length;
	}
	printf("%s", line);
	for (const char *c = line; *c != '\0'; c++) {
		loader_log_putc(*c);
	}
	return length;
}

static void
sleep_us(uint32_t us)
{
	delay_for_interval(us, NSEC_PER_USEC);
}

/* ---- register access ------------------------------------------------------------------------------- */

/*
 * One access is one plain load or store of a general register. Some of what is touched here
 * is not the hardware but the hypervisor's imitation of it: the access traps and is carried
 * out on our behalf, which works for the simplest instruction forms only, and the vendor's
 * SMMU driver warns that this imitation "goes horribly wrong" for a store of the zero
 * register. So the compiler does not get to choose the instruction (redwood_adreno.c:159-185).
 */
static uint32_t __attribute__((noinline))
rd(vm_offset_t address)
{
	uint32_t value;

	__asm__ volatile ("ldr %w0, [%1]" : "=r" (value) : "r" (address) : "memory");
	return value;
}

static void __attribute__((noinline))
wr(vm_offset_t address, uint32_t value)
{
	__asm__ volatile ("str %w0, [%1]" : : "r" (value), "r" (address) : "memory");
}

/* A stretch of registers; mapped when a step first needs it. */
struct block {
	const char *name;
	uint32_t phys, size;
	vm_offset_t base;
};

/*
 * TWO ADDRESS CONVENTIONS LIVE IN THIS FILE, AND THEY ARE NOT THE SAME. Getting this wrong is
 * invisible until the hardware silently does nothing, so it is spelled out here once.
 *
 * 1. The GPU's own register block (0x5000000): offsets taken from drivers/gpu/msm/a5xx_reg.h
 *    are DWORD indices, not byte offsets. The vendor's accessor says so in three places:
 *
 *      adreno.c:2424-2436
 *        static void adreno_regwrite(struct kgsl_device *device,
 *                                    unsigned int offsetwords, ...)
 *        {
 *                BUG_ON(offsetwords*sizeof(uint32_t) >= device->reg_len);
 *                reg = (device->reg_virt + (offsetwords << 2));
 *                __raw_writel(value, reg);
 *        }
 *
 *    -- the parameter is named offsetwords, the bound check multiplies by sizeof(uint32_t),
 *    and the address is (offsetwords << 2). The upstream driver agrees independently: its
 *    register table entries are (a5xx.xml.h value + 1) (adreno_gpu.h:34 REG_ADRENO_DEFINE),
 *    and gpu_write() writes at msm_writel(mmio + (reg << 2)) (msm_gpu.h:204-207). So
 *    A5XX_RBBM_STATUS 0x4F5 is byte 0x13D4, not byte 0x4F5.
 *
 *    A first version of this file treated them as byte offsets. Every register of steps 1, 3,
 *    4 and 5 would then have been read and written four registers to the left of where it
 *    belongs -- mostly still inside the block, so nothing would have faulted; the driver would
 *    simply have reported nonsense and "failed to start the GPU". Hence GPU_REG():
 *
 * 2. The clock controller (0x5065000) and the descriptor the device tree states in bytes:
 *    offsets from msm-clocks-hwio-8998.h are BYTE offsets. clock-local2.c addresses them
 *    directly -- `#define CMD_RCGR_REG(x) (*(x)->base + (x)->cmd_rcgr_reg)` then
 *    `readl_relaxed(CMD_RCGR_REG(rcg))` (:51, :117) -- with no shift. And the device tree's
 *    own absolute addresses confirm it: gpu_cx_gdsc at 0x5066004 is 0x1004 past 0x5065000,
 *    which is exactly GPU_CX_GDSCR_OFFSET 0x1004. So those are used as they are.
 *
 *    The device tree also carries both forms of one register, which is the cleanest proof that
 *    the two conventions coexist: qcom,micro-mmu-control = <0x6000> is a byte offset, and
 *    adreno_iommu.c:86 puts `micro_mmu_ctrl >> 2` (0x1800) into a CP packet, because a PM4
 *    packet's register address is a dword index.
 *
 * CP type-4 packet addresses (the GPMU's instruction RAM) need no conversion for the same
 * reason: a PM4 packet carries a dword index already, so GPMU_INST_RAM_BASE 0x8800 goes into
 * the packet as 0x8800 and means byte 0x22000.
 */
#define GPU_REG(dword_offset)   ((uint32_t)(dword_offset) << 2)

static void
need(struct block *b)
{
	if (b->base == 0) {
		b->base = ml_io_map(b->phys, b->size);
	}
}

/* What a step is about to do, in a line. */
static void
announce(const char *what)
{
	say("chiron-adreno: step %u: %s\n", step, what);
}

/*
 * Read one register and say its address and value: the value is the evidence, not a verdict.
 * `offset` is in the block's own convention: a dword index for the GPU block (converted here),
 * bytes for the clock controller.
 */
static uint32_t
get_at(struct block *b, const char *name, uint32_t offset, bool words)
{
	uint32_t value;
	uint32_t byte = words ? GPU_REG(offset) : offset;

	need(b);
	value = rd(b->base + byte);
	say("chiron-adreno: %u: %-14s %-22s [%#x] = %#010x\n", step, b->name, name, b->phys + byte, value);
	return value;
}

static void
put_at(struct block *b, const char *name, uint32_t offset, uint32_t value, bool words)
{
	uint32_t byte = words ? GPU_REG(offset) : offset;

	need(b);
	say("chiron-adreno: %u: write %-14s %-22s [%#x] = %#010x\n", step, b->name, name, b->phys + byte, value);
	wr(b->base + byte, value);
}

/* ====================================================================================================
 * step 1: can the GPU's registers be reached, and what do they hold before we write anything
 * ==================================================================================================== */

/*
 * dt: qcom,gcc@100000, 0xb0000 long (chiron.dts:2767 `reg = <0x100000 0xb0000>`).
 */
static struct block gcc = { .name = "gcc", .phys = 0x00100000, .size = 0xb0000 };

/*
 * The GPU's clock controller's registers answer only while the bus clock in front of them
 * runs. Linux turns it on for good when it starts (clock-gpu-8998.c has its own probe only
 * after the GCC clocks exist); nothing else here can be read before it is on.
 *
 * gcc_gpu_cfg_ahb_clk, at 0x71004, from the register offsets of the SoC:
 *   include/dt-bindings/clock/msm-clocks-hwio-8998.h:169
 *     #define GCC_GPU_CFG_AHB_CBCR    0x71004
 * A branch clock's control register (drivers/clk/msm/clock-local2.c:68-69):
 *   CBCR_BRANCH_ENABLE_BIT  BIT(0)     on
 *   CBCR_BRANCH_OFF_BIT     BIT(31)    reads 1 while it is in fact off
 */
#define GCC_GPU_CFG_AHB_CBCR    0x71004
#define CBCR_ENABLE             (1u << 0)
#define CBCR_OFF                (1u << 31)

/*
 * dt: qcom,gpucc@5065000, 0x9000 long (chiron.dts:2793 `reg = <0x5065000 0x9000>`).
 */
static struct block gpucc = { .name = "gpucc", .phys = 0x05065000, .size = 0x9000 };

/*
 * The registers read in this step, each with both of its sources. The offsets are relative to
 * GPUCC and are the same numbers in the SoC's own register list and in the two clock positions
 * the device tree states in absolute form -- which is the cross-check worth having, because
 * those two are independent of the header:
 *
 *   CX gdsc       0x1004   hwio-8998.h: (not listed; the GDSC is a node of its own)
 *                          chiron.dts:789  reg = <0x5066004 ...>   -> 0x1004
 *                          clock-gpu-8998.c:44  GPU_CX_GDSCR_OFFSET 0x1004
 *   CX hw_ctrl    0x1008   chiron.dts:789  reg = <... 0x5066008 0x04>
 *   GX gdsc       0x1094   clock-gpu-8998.c:45  GPU_GX_GDSCR_OFFSET 0x1094
 *                          chiron.dts:801  reg = <0x5066094 ...>   -> 0x1094
 *   GX domain     0x0130   hwio-8998.h:242  GPUCC_GX_DOMAIN_MISC 0x00130
 *                          chiron.dts:801  domain_addr = 0x5065130 -> 0x0130
 *   GX sw_reset   0x1090   chiron.dts:801  sw_reset = 0x5066090     -> 0x1090
 *   PLL0 mode     0x0000   hwio-8998.h:230  GPUCC_GPU_PLL0_PLL_MODE 0x00000
 *   PLL0 user     0x000C   hwio-8998.h:231  GPUCC_GPU_PLL0_USER_CTL_MODE 0x0000C
 *   gfx3d cmd     0x1070   hwio-8998.h:232  GPUCC_GFX3D_CMD_RCGR 0x01070
 *   gfx3d cfg     0x1074   CFG_RCGR is the command register + 4 (clock-local2.c:52)
 *   gfx3d cbcr    0x1098   hwio-8998.h:236  GPUCC_GFX3D_CBCR 0x01098
 *   cxo cbcr      0x1020   hwio-8998.h:239  GPUCC_CXO_CBCR 0x01020
 *   rbbmtimer     0x10D0   hwio-8998.h:237  GPUCC_RBBMTIMER_CBCR 0x010D0
 *   isense cbcr   0x1124   hwio-8998.h:238  GPUCC_GFX3D_ISENSE_CBCR 0x01124
 *   rbcpr cbcr    0x1054   hwio-8998.h:240  GPUCC_RBCPR_CBCR 0x01054
 *   dd wrap       0x0430   hwio-8998.h:243  GPUCC_GPU_DD_WRAP_CTRL 0x00430
 *
 * `0x5065130 - 0x5065000 = 0x130` and `0x5066094 - 0x5065000 = 0x1094` are what makes the
 * device tree and the header two sources rather than one repeated: the tree states absolute
 * addresses, the header states offsets, and they were written by different people.
 */
#define GPUCC_GPU_PLL0_PLL_MODE     0x00000
#define GPUCC_GPU_PLL0_USER_CTL     0x0000c
#define GPUCC_GX_DOMAIN_MISC        0x00130
#define GPUCC_GPU_DD_WRAP_CTRL      0x00430
#define GPUCC_CXO_CBCR              0x01020
#define GPUCC_RBCPR_CBCR            0x01054
#define GPUCC_GFX3D_CMD_RCGR        0x01070
#define GPUCC_GFX3D_CFG_RCGR        0x01074
#define GPUCC_GX_SW_RESET           0x01090
#define GPUCC_GX_GDSCR              0x01094
#define GPUCC_GFX3D_CBCR            0x01098
#define GPUCC_RBBMTIMER_CBCR        0x010d0
#define GPUCC_GFX3D_ISENSE_CBCR     0x01124
#define GPUCC_CX_GDSCR              0x01004
#define GPUCC_CX_HW_CTRL            0x01008

/*
 * gpu_pll0's PLL_MODE bits, from the vendor's own masks (clock-gpu-8998.c:72-78):
 * lock BIT(31), active BIT(30), update BIT(22), output 0xf.
 */
#define PLL_MODE_LOCK               (1u << 31)
#define PLL_MODE_ACTIVE             (1u << 30)

/*
 * A power switch's control register (drivers/clk/qcom/gdsc.c:26,32):
 *   PWR_ON_MASK       BIT(31)   status: the domain is powered
 *   SW_COLLAPSE_MASK  BIT(0)    the software request to collapse it (1 = off)
 * The same three bits redwood_adreno.c:482-484 names, arrived at independently.
 */
#define GDSC_SW_COLLAPSE        (1u << 0)
#define GDSC_POWER_ON           (1u << 31)

/* The GPU itself. dt: qcom,kgsl-3d0@5000000, 0x40000 long (chiron.dts:10122). */
static struct block kgsl = { .name = "kgsl", .phys = 0x05000000, .size = 0x40000 };

/* The GPU's register block: every offset from a5xx_reg.h is a dword index (see GPU_REG). */
static uint32_t
get(struct block *b, const char *name, uint32_t offset)
{
	return get_at(b, name, offset, b == &kgsl);
}

static void
put(struct block *b, const char *name, uint32_t offset, uint32_t value)
{
	put_at(b, name, offset, value, b == &kgsl);
}

/* Read a GPU-block register by its a5xx_reg.h dword index, without saying anything. */
static uint32_t
reg(uint32_t offset)
{
	need(&kgsl);
	return rd(kgsl.base + GPU_REG(offset));
}

/* Where that register is in bytes, for the log. */
static uint32_t
gpureg_phys(uint32_t offset)
{
	return (uint32_t)(kgsl.phys + GPU_REG(offset));
}

/*
 * The always-on counter of the GPU block: it counts at the crystal's 19.2 MHz as long as that
 * reaches the block, so it tells whether the block answers and whether that clock is there.
 * It does not tell whether the 3D core's own clock runs -- upstream says what it is, in so many
 * words: "Inline PM4 code to get the current value of the 19.2 Mhz always on counter"
 * (drivers/gpu/drm/msm/adreno/a5xx_gpu.c:104). Proving the 3D clock is step 3's business.
 *
 *   a5xx_reg.h:493  A5XX_RBBM_ALWAYSON_COUNTER_LO 0x4D2
 *   a5xx_reg.h:494  A5XX_RBBM_ALWAYSON_COUNTER_HI 0x4D3
 *   a5xx.xml.h:1259 REG_A5XX_RBBM_ALWAYSON_COUNTER_LO 0x000004d2   (agrees)
 */
#define RBBM_ALWAYSON_COUNTER_LO    0x4d2
#define RBBM_ALWAYSON_COUNTER_HI    0x4d3

/*
 * A register that reads all ones is the usual sign of an access that was refused rather than
 * answered: a bus that is not there, or a hypervisor that declined. It is not proof -- a
 * register may legitimately hold all ones -- so it is reported as what it is, and the step
 * goes on either way, because telling the two apart is what the rest of the step is for.
 */
static unsigned
looks_refused(const char *name, uint32_t value)
{
	if (value != 0xffffffffu) {
		return 0;
	}
	say("chiron-adreno: %u: NOTE: %s reads all ones -- a refused access looks like this too\n", step, name);
	return 1;
}

static bool
step_buses(void)
{
	uint32_t before, after;

	announce("the bus clock in front of the GPU's clock controller (gcc_gpu_cfg_ahb_clk)");

	before = get(&gcc, "gpu_cfg_ahb", GCC_GPU_CFG_AHB_CBCR);
	looks_refused("gcc_gpu_cfg_ahb_clk", before);

	/*
	 * Off means bit 31 is set. Turn on bit 0 and leave every other bit as the boot loader
	 * left it -- this register also holds a divider and the "hardware controls this clock"
	 * bit, neither of which is ours to decide.
	 */
	if (before & CBCR_OFF) {
		put(&gcc, "gpu_cfg_ahb", GCC_GPU_CFG_AHB_CBCR, (before & ~CBCR_OFF) | CBCR_ENABLE);
		/* A branch clock takes a few of the bus's cycles to report; the poll is bounded. */
		for (uint32_t i = 0; i < 1000; i++) {
			if (!(rd(gcc.base + GCC_GPU_CFG_AHB_CBCR) & CBCR_OFF)) {
				break;
			}
			sleep_us(10);
		}
	}

	after = get(&gcc, "gpu_cfg_ahb", GCC_GPU_CFG_AHB_CBCR);
	if (after & CBCR_OFF) {
		say("chiron-adreno: %u: gcc_gpu_cfg_ahb_clk is still off (%#010x): the GPU's clock\n"
		    "chiron-adreno: %u:   controller would not answer, so the rest is not attempted\n",
		    step, after, step);
		return false;
	}
	return true;
}

/*
 * Read the GPU's clock controller as the boot loader left it. Nothing is written here: what
 * these registers hold decides what step 2 has to do, and a value that reads back as the same
 * on a second pass is the cheapest proof that the bus really carries reads and not noise.
 */
static bool
step_gpucc(void)
{
	struct {
		const char *name;
		uint32_t   offset;
	} reads[] = {
		{ "cx_gdscr",       GPUCC_CX_GDSCR },
		{ "cx_hw_ctrl",     GPUCC_CX_HW_CTRL },
		{ "gx_gdscr",       GPUCC_GX_GDSCR },
		{ "gx_sw_reset",    GPUCC_GX_SW_RESET },
		{ "gx_domain_misc", GPUCC_GX_DOMAIN_MISC },
		{ "pll0_mode",      GPUCC_GPU_PLL0_PLL_MODE },
		{ "pll0_user",      GPUCC_GPU_PLL0_USER_CTL },
		{ "gfx3d_cmd",      GPUCC_GFX3D_CMD_RCGR },
		{ "gfx3d_cfg",      GPUCC_GFX3D_CFG_RCGR },
		{ "gfx3d_cbcr",     GPUCC_GFX3D_CBCR },
		{ "cxo_cbcr",       GPUCC_CXO_CBCR },
		{ "rbbmtimer_cbcr", GPUCC_RBBMTIMER_CBCR },
		{ "isense_cbcr",    GPUCC_GFX3D_ISENSE_CBCR },
		{ "rbcpr_cbcr",     GPUCC_RBCPR_CBCR },
		{ "dd_wrap",        GPUCC_GPU_DD_WRAP_CTRL },
	};
	uint32_t first[sizeof(reads) / sizeof(reads[0])];
	unsigned refused = 0, unstable = 0;

	announce("the GPU's clock controller (gpucc@5065000) as the boot loader left it: reads only");

	need(&gpucc);
	for (unsigned i = 0; i < sizeof(reads) / sizeof(reads[0]); i++) {
		first[i] = get(&gpucc, reads[i].name, reads[i].offset);
		refused += looks_refused(reads[i].name, first[i]);
	}

	/* Read them again: a register bus that is not really there does not repeat itself. */
	announce("the same registers a second time, to see that the bus repeats what it said");
	for (unsigned i = 0; i < sizeof(reads) / sizeof(reads[0]); i++) {
		uint32_t again = rd(gpucc.base + reads[i].offset);

		if (again != first[i]) {
			say("chiron-adreno: %u: %-14s changed between two reads: %#010x then %#010x\n",
			    step, reads[i].name, first[i], again);
			unstable++;
		}
	}
	say("chiron-adreno: %u: %u registers read, %u read all ones, %u did not repeat\n",
	    step, (unsigned)(sizeof(reads) / sizeof(reads[0])), refused, unstable);

	/*
	 * A third, independent test, and the strongest one available before step 2 writes anything.
	 *
	 * "All ones" and "repeats itself" can both be produced by a bus that answers with garbage
	 * consistently -- a missing register that reads 0 nearly always reads 0 twice. What cannot
	 * be faked is a status bit that the hardware sets on its own because of something real:
	 * gpu_pll0 is running, and its PLL_MODE register says so in bit 31 (LOCK) and bit 30
	 * (ACTIVE) -- the vendor's own masks, clock-gpu-8998.c:72-78:
	 *
	 *     static struct alpha_pll_masks pll_masks_p = {
	 *             .lock_mask   = BIT(31),
	 *             .active_mask = BIT(30),
	 *             .update_mask = BIT(22),
	 *             .output_mask = 0xf,
	 *             .post_div_mask = BM(15, 8),
	 *     };
	 *
	 * The boot loader leaves that PLL locked (the GPU's clock source comes out of it, and the
	 * clock driver's table hangs off gpu_pll0_pll_out_even). So: a LOCK bit that is set is
	 * evidence that this kernel is reading the real clock controller and not a hole in the
	 * address space. A LOCK bit that is clear is NOT evidence of the opposite -- the PLL may
	 * simply have been left idle -- and the message says which of the two it is.
	 */
	{
		uint32_t pll_mode = first[5];           /* "pll0_mode" in the table above */
		bool locked = (pll_mode & PLL_MODE_LOCK) != 0;
		bool active = (pll_mode & PLL_MODE_ACTIVE) != 0;

		say("chiron-adreno: %u: gpu_pll0 mode %#010x: %s, %s%s\n", step, pll_mode,
		    locked ? "LOCKED" : "not locked", active ? "ACTIVE" : "not active",
		    locked ? " -- the clock controller is answering real status, so this kernel can reach it" :
		    " -- not evidence either way (an idle PLL reads like this)");
	}

	if (refused == sizeof(reads) / sizeof(reads[0])) {
		say("chiron-adreno: %u: every one of them reads all ones: the GPU's clock controller\n"
		    "chiron-adreno: %u:   does not answer this kernel. Stopping here rather than writing\n"
		    "chiron-adreno: %u:   to registers that may not be there.\n", step, step, step);
		return false;
	}
	return true;
}

/*
 * The GPU block's own always-on counter, read twice: it should have moved.
 *
 * The value is also the block's own health: a counter that does not move means either that the
 * crystal does not reach the block (it is not powered yet -- step 2 powers it) or that the
 * block is not answering. Either way it is reported as the two numbers it is, and this step
 * does not fail on it: at this point the block is expected to be off, since nothing has
 * powered it.
 */
static void
step_counter(void)
{
	uint32_t lo1, hi1, lo2, hi2;
	uint64_t c1, c2;

	announce("the GPU block's always-on counter (19.2 MHz) twice, to see where the block stands");

	lo1 = get(&kgsl, "alwayson_lo", RBBM_ALWAYSON_COUNTER_LO);
	hi1 = get(&kgsl, "alwayson_hi", RBBM_ALWAYSON_COUNTER_HI);
	sleep_us(2000);
	lo2 = get(&kgsl, "alwayson_lo", RBBM_ALWAYSON_COUNTER_LO);
	hi2 = get(&kgsl, "alwayson_hi", RBBM_ALWAYSON_COUNTER_HI);

	c1 = ((uint64_t)hi1 << 32) | lo1;
	c2 = ((uint64_t)hi2 << 32) | lo2;

	say("chiron-adreno: %u: counter %#llx then %#llx after 2 ms: %s\n", step,
	    (unsigned long long)c1, (unsigned long long)c2,
	    c2 != c1 ? "it moved" : "it did not move");
	if (c2 == c1) {
		say("chiron-adreno: %u: NOTE: this is expected here. Nothing has powered the block yet;\n"
		    "chiron-adreno: %u:   step 2 powers it and reads this counter again. A counter that\n"
		    "chiron-adreno: %u:   still does not move after that is the real finding.\n", step, step, step);
	}
}

/* ====================================================================================================
 * step 2: power the two halves of the GPU block, give the 3D core a clock, and see the counter move
 * ==================================================================================================== */

/*
 * The GPU block has two power switches. From the device tree (chiron.dts:789, :801) and the
 * clock driver (clock-gpu-8998.c:44-45) they are named
 *
 *   gdsc_gpu_cx  at GPUCC + 0x1004 ("CX": the GMU, the bus interface, the GPU's own SMMU)
 *   gdsc_gpu_gx  at GPUCC + 0x1094 ("GX": the 3D core) -- and it has, beside its control
 *                register, a domain address register and a block reset:
 *                  domain_addr = 0x5065130 -> GPUCC + 0x130   (hwio-8998.h:242)
 *                  sw_reset    = 0x5066090 -> GPUCC + 0x1090  (chiron.dts:801)
 *
 * How Linux turns one on is drivers/clk/qcom/gdsc.c's gdsc_enable(), and the vendor's own
 * copy of that sequence for this block is clock-gpu-8998.c's enable_gfx_crc(), which does it
 * by hand because it wants the graphics clock exercised. Both are the same order, and this
 * follows them exactly:
 *
 *   1. if the switch has a block reset, assert it, wait 1 us, deassert it
 *        gdsc.c:179-195   BCR_BLK_ARES_BIT = BIT(0), "should be kept asserted for 1us"
 *   2. if it has a domain address, and this one resets its AON logic, pulse GMEM_RESET
 *        gdsc.c:197-215   GMEM_RESET_MASK = BIT(4)
 *   3. clear GMEM_CLAMP_IO in the domain address register, so the block's memory is not clamped
 *        gdsc.c:217-224   GMEM_CLAMP_IO_MASK = BIT(0)
 *   4. clear SW_COLLAPSE in the control register, and poll for PWR_ON
 *        gdsc.c:226-247   SW_COLLAPSE_MASK = BIT(0), PWR_ON_MASK = BIT(31)
 *   5. wait 1 us before polling: "Wait for 8 XO cycles before polling the status bit"
 *
 * The device tree says which of those apply to each switch:
 *   gdsc_gpu_cx   (chiron.dts:789): reg-names "base", "hw_ctrl"; no domain, no reset
 *   gdsc_gpu_gx   (chiron.dts:801): reg-names "base", "domain_addr", "sw_reset"; with
 *                 qcom,retain-periph, qcom,reset-aon-logic, qcom,force-enable-root-clk
 * So CX gets steps 4-5 only, and GX gets all of them -- which is what gdsc_enable() reads
 * out of those same properties (sc->sw_reset, sc->domain_addr, sc->reset_aon).
 *
 * There is one thing Linux does that this cannot: between CX and GX it turns on the graphics
 * voltage rail through its regulator framework ("Turn on the Graphics rail",
 * clock-gpu-8998.c:414-416, via vdd_gpucc). On this phone that rail is a PM8998 regulator
 * whose level the boot loader has already set for the GPU's power level -- and raising it
 * needs RPMh, which this kernel has no client for. That is why the sequence below is CX, GX
 * and nothing between, and why the counter read afterwards is the test of whether it worked:
 * if the rail were too low the GDSCs would report on and the block would still not answer.
 */
#define GDSC_HW_CONTROL         (1u << 1)       /* gdsc.c:29: hardware, not software, operates it */
#define GDSC_SW_OVERRIDE        (1u << 2)       /* gdsc.c:28 */
#define GMEM_CLAMP_IO_MASK      (1u << 0)       /* gdsc-regulator.c:41 */
#define GMEM_RESET_MASK         (1u << 4)       /* gdsc-regulator.c:42 */
#define BCR_BLK_ARES_BIT        (1u << 0)       /* gdsc-regulator.c:45 */
#define GDSC_TIMEOUT_US         100             /* gdsc-regulator.c:51 TIMEOUT_US; chiron.dts:790 gds-timeout=0x1f4=500 */

/* Poll a power switch's status bit. Returns the last value read, whatever the outcome. */
static uint32_t
gdsc_wait(struct block *b, const char *name, uint32_t offset, bool on, uint32_t last)
{
	for (uint32_t i = 0; i < GDSC_TIMEOUT_US; i++) {
		uint32_t now = rd(b->base + offset);

		last = now;
		if (on ? (now & GDSC_POWER_ON) : !(now & GDSC_POWER_ON)) {
			return last;
		}
		sleep_us(1);
	}
	return last;
}

/*
 * Turn one power switch on. Everything is read before it is written, and the register is
 * written back with only the bits this sequence owns cleared -- the control register also
 * holds the clock-disable delay and the retention bits, which are not ours to decide.
 *
 * Returns the last value read from the control register, which the caller prints: a switch
 * that does not come on is the finding, and its raw value is what says why (still collapsed,
 * or collapsed and reporting on, which would mean the hardware is not obeying).
 */
static uint32_t
gdsc_on(struct block *b, const char *name, uint32_t gdsc, uint32_t sw_reset, uint32_t domain,
    bool reset_aon)
{
	uint32_t value = get(b, name, gdsc);

	if (value & GDSC_HW_CONTROL) {
		say("chiron-adreno: %u: %s is under hardware control (%#010x): a software request\n"
		    "chiron-adreno: %u:   is refused by the hardware, so it is left alone\n",
		    step, name, value, step);
		return value;
	}

	if (sw_reset != 0) {
		uint32_t r = rd(b->base + sw_reset);

		put(b, "gx_sw_reset", sw_reset, r | BCR_BLK_ARES_BIT);
		sleep_us(1);                    /* "kept asserted for 1us" (gdsc.c:187) */
		put(b, "gx_sw_reset", sw_reset, r & ~BCR_BLK_ARES_BIT);
	}

	if (domain != 0) {
		uint32_t d = rd(b->base + domain);

		if (reset_aon) {
			put(b, "gx_domain_misc", domain, d | GMEM_RESET_MASK);
			sleep_us(1);
			d = rd(b->base + domain);
			put(b, "gx_domain_misc", domain, d & ~GMEM_RESET_MASK);
		}
		d = rd(b->base + domain);
		put(b, "gx_domain_misc", domain, d & ~GMEM_CLAMP_IO_MASK);
	}

	put(b, name, gdsc, value & ~GDSC_SW_COLLAPSE);
	sleep_us(1);                            /* "Wait for 8 XO cycles before polling" (gdsc.c:232) */
	value = gdsc_wait(b, name, gdsc, true, value);
	say("chiron-adreno: %u: %-14s %-22s [%#x] = %#010x %s\n", step, b->name, name, b->phys + gdsc,
	    value, (value & GDSC_POWER_ON) ? "POWER ON" : "STILL OFF");
	return value;
}

static bool
step_power(void)
{
	uint32_t cx, gx;

	announce("the CX half of the GPU block: its power switch on (gpu_cx_gdsc)");
	cx = gdsc_on(&gpucc, "cx_gdscr", GPUCC_CX_GDSCR, 0, 0, false);
	if (!(cx & GDSC_POWER_ON)) {
		say("chiron-adreno: %u: the CX half does not come on; nothing after this is attempted\n"
		    "chiron-adreno: %u:   (its control register reads %#010x, its hardware status %#010x)\n",
		    step, step, cx, get(&gpucc, "cx_hw_ctrl", GPUCC_CX_HW_CTRL));
		return false;
	}
	/* The second register is where the vendor's driver expects to see CX arrive too. */
	get(&gpucc, "cx_hw_ctrl", GPUCC_CX_HW_CTRL);

	announce("the GX half -- the 3D core: block reset, its memory unclamped, its power switch on");
	gx = gdsc_on(&gpucc, "gx_gdscr", GPUCC_GX_GDSCR, GPUCC_GX_SW_RESET, GPUCC_GX_DOMAIN_MISC, true);
	if (!(gx & GDSC_POWER_ON)) {
		say("chiron-adreno: %u: the GX half does not come on; its control register reads %#010x\n",
		    step, gx);
		return false;
	}
	return true;
}

/*
 * Give the 3D core a clock: the lowest rate the phone is rated for.
 *
 * A root clock generator ("RCG") is two registers: the command register, and the configuration
 * register four bytes on (clock-local2.c:51-52). Setting a rate is
 *
 *   a. write the divider and the source select into CFG_RCGR
 *   b. set UPDATE in CMD_RCGR and wait for the hardware to clear it
 *        clock-local2.c:150-160 __set_rate_hid() writes CFG, then rcg_update_config()
 *        clock-local2.c:118-128  sets CMD_RCGR_CONFIG_UPDATE_BIT and polls it away
 *
 * and the root must already be enabled, which is CMD_RCGR's bit 1:
 *   clock-local2.c:67  CMD_RCGR_ROOT_ENABLE_BIT BIT(1)
 *   clock-local2.c:208 the enable path sets it
 *
 * The bits inside CFG_RCGR (clock-local2.c:74-75):
 *   CFG_RCGR_DIV_MASK       BM(4,0)    the half-integer divider, encoded as 2*div - 1
 *   CFG_RCGR_SRC_SEL_MASK   BM(10,8)   which source
 * and the encoding of the divider is in clock-gpu-8998.c's F() macro, line 56:
 *   .div_src_val = BVAL(4, 0, (int)(2*(div) - 1)) | BVAL(10, 8, s##_source_val)
 * For gfx3d_clk_src every entry in the table has div = 1 and source
 * gpu_pll0_pll_out_even, whose value is 1 (clock-gpu-8998.c:40):
 *   div_src_val = BVAL(4,0, 2*1-1) | BVAL(10,8, 1) = 0x1 | 0x100 = 0x101
 *
 * The rate itself comes from the PLL, which this does not touch: the boot loader leaves
 * gpu_pll0 running (the vendor's driver reads it and expects it locked -- see step 1's
 * pll0_mode), and the lowest entry of the v2 table is 180 MHz out of a 360 MHz PLL output
 * divided by two (clock-gpu-8998.c:168-178, gfxcc-8998-v2 is what chiron.dts:2806 declares).
 */

/* BVAL(hi, lo, v): the field of bits hi..lo set to v (clock-local2.h's own macro, expanded). */
#define RCGR_FIELD(hi, lo, v)   (((uint32_t)(v) << (lo)) & (((1u << ((hi) - (lo) + 1)) - 1) << (lo)))
#define CFG_RCGR_DIV(v)         RCGR_FIELD(4, 0, v)
#define CFG_RCGR_SRC(v)         RCGR_FIELD(10, 8, v)
#define CFG_RCGR_DIV_SRC_MASK   (RCGR_FIELD(4, 0, 0x1f) | RCGR_FIELD(10, 8, 0x7))
#define CMD_RCGR_ROOT_ENABLE    (1u << 1)
#define CMD_RCGR_UPDATE         (1u << 0)

static bool
step_gfx3d_clock(void)
{
	uint32_t cmd, cfg, want;

	announce("the 3D core's clock source: its root enabled, then set to the lowest rate it has");

	cmd = get(&gpucc, "gfx3d_cmd", GPUCC_GFX3D_CMD_RCGR);
	if (!(cmd & CMD_RCGR_ROOT_ENABLE)) {
		put(&gpucc, "gfx3d_cmd", GPUCC_GFX3D_CMD_RCGR, cmd | CMD_RCGR_ROOT_ENABLE);
	}

	/*
	 * div = 1, source = gpu_pll0_pll_out_even (1): the same field values every rate in
	 * ftbl_gfx3d_clk_src_v2 carries, so this changes the divider to the smallest one and
	 * leaves the rate to whatever the PLL is already producing. That is deliberate: the
	 * PLL belongs to the boot loader until step 3 can watch the counter react.
	 */
	want = CFG_RCGR_DIV(2 * 1 - 1) | CFG_RCGR_SRC(1);

	cfg = get(&gpucc, "gfx3d_cfg", GPUCC_GFX3D_CFG_RCGR);
	put(&gpucc, "gfx3d_cfg", GPUCC_GFX3D_CFG_RCGR, (cfg & ~CFG_RCGR_DIV_SRC_MASK) | want);

	cmd = rd(gpucc.base + GPUCC_GFX3D_CMD_RCGR);
	put(&gpucc, "gfx3d_cmd", GPUCC_GFX3D_CMD_RCGR, cmd | CMD_RCGR_UPDATE);
	for (uint32_t i = 0; i < 500; i++) {
		if (!(rd(gpucc.base + GPUCC_GFX3D_CMD_RCGR) & CMD_RCGR_UPDATE)) {
			break;
		}
		sleep_us(1);
	}
	cmd = get(&gpucc, "gfx3d_cmd", GPUCC_GFX3D_CMD_RCGR);
	if (cmd & CMD_RCGR_UPDATE) {
		say("chiron-adreno: %u: the clock source did not take the configuration (%#010x)\n", step, cmd);
		return false;
	}

	announce("the 3D core's clock output enabled (gpu_cc_gfx3d_clk)");
	cfg = get(&gpucc, "gfx3d_cbcr", GPUCC_GFX3D_CBCR);
	if (cfg & CBCR_OFF) {
		put(&gpucc, "gfx3d_cbcr", GPUCC_GFX3D_CBCR, (cfg & ~CBCR_OFF) | CBCR_ENABLE);
		for (uint32_t i = 0; i < 1000; i++) {
			if (!(rd(gpucc.base + GPUCC_GFX3D_CBCR) & CBCR_OFF)) {
				break;
			}
			sleep_us(10);
		}
	}
	cfg = get(&gpucc, "gfx3d_cbcr", GPUCC_GFX3D_CBCR);
	if (cfg & CBCR_OFF) {
		say("chiron-adreno: %u: gpu_cc_gfx3d_clk stays off (%#010x)\n", step, cfg);
		return false;
	}
	return true;
}

/*
 * The test of whether any of the above reached the hardware: the GPU block's always-on counter,
 * read before and after, twice over, with the elapsed time measured so the rate can be
 * compared with what the counter is supposed to count at.
 *
 * What this proves and what it does not, in the words of the source that names the counter:
 * upstream calls it "the 19.2 Mhz always on counter" (a5xx_gpu.c:104). So a counter that moves
 * shows that the block is powered and that the crystal's 19.2 MHz reaches it -- which is
 * exactly what step 2 set out to do. It does NOT show that gfx3d_clk runs at the rate step 2
 * programmed: the counter is not on that clock. Proving the 3D core's own clock is step 3's
 * business, where the command processor is started and its busy bits can be watched.
 */
static void
step_counter_after_power(void)
{
	uint32_t lo1, hi1, lo2, hi2;
	uint64_t c1, c2;
	uint32_t elapsed_us = 2000;

	announce("the always-on counter again, now that the block is powered");

	lo1 = reg(RBBM_ALWAYSON_COUNTER_LO);
	hi1 = reg(RBBM_ALWAYSON_COUNTER_HI);
	sleep_us(elapsed_us);
	lo2 = reg(RBBM_ALWAYSON_COUNTER_LO);
	hi2 = reg(RBBM_ALWAYSON_COUNTER_HI);

	c1 = ((uint64_t)hi1 << 32) | lo1;
	c2 = ((uint64_t)hi2 << 32) | lo2;

	say("chiron-adreno: %u: alwayson_lo [%#x] = %#010x then %#010x\n", step,
	    gpureg_phys(RBBM_ALWAYSON_COUNTER_LO), lo1, lo2);
	say("chiron-adreno: %u: alwayson_hi [%#x] = %#010x then %#010x\n", step,
	    gpureg_phys(RBBM_ALWAYSON_COUNTER_HI), hi1, hi2);

	if (c2 > c1) {
		uint64_t ticks = c2 - c1;
		/* 19.2 MHz over elapsed_us: expected ticks = 19.2e6 * us / 1e6 = 19.2 * us */
		uint64_t expected = (19200ull * elapsed_us) / 1000ull;
		uint64_t ratio_milli = expected ? (ticks * 1000ull / expected) : 0;

		say("chiron-adreno: %u: counter moved by %llu ticks in %u us\n",
		    step, (unsigned long long)ticks, elapsed_us);
		say("chiron-adreno: %u:   at 19.2 MHz that interval would be %llu ticks, so the ratio is %llu/1000\n",
		    step, (unsigned long long)expected, (unsigned long long)ratio_milli);
		say("chiron-adreno: %u:   (the loop's own overhead makes the elapsed time longer than %u us,\n"
		    "chiron-adreno: %u:    never shorter, so a ratio at or above 1000 is the expected result)\n",
		    step, elapsed_us, step);
		say("chiron-adreno: %u: the GPU block is powered and answering: the crystal reaches it\n", step);
	} else {
		say("chiron-adreno: %u: the counter did NOT move (%#llx both times). The block is powered\n"
		    "chiron-adreno: %u:   as far as its switches report, but does not answer. That is the\n"
		    "chiron-adreno: %u:   finding: a switch that reports on while the block stays silent\n"
		    "chiron-adreno: %u:   usually means the rail it needs is not up.\n",
		    step, (unsigned long long)c1, step, step, step);
	}
}

/* ====================================================================================================
 * step 3: RBBM as a540 wants it, the CP's microcode in place, the micro engine out of halt
 * ==================================================================================================== */

/*
 * The register block of the 3D core, and the offsets this step uses, all out of
 * drivers/gpu/msm/a5xx_reg.h (the vendor's own list for this part).
 *
 * EVERY ONE OF THESE IS A DWORD INDEX, NOT A BYTE OFFSET. See GPU_REG near the top of this
 * file for the vendor's own lines that establish it: 0x4F5 means byte 0x13D4. They are written
 * here exactly as a5xx_reg.h writes them, so they can be compared with it by eye, and `reg()`
 * is what does the shift. Reading them as bytes would put every access four registers to the
 * left of where it belongs -- still inside the block, so nothing faults, and the driver just
 * reports nonsense.
 *
 *   0x4F5  RBBM_STATUS                 :495   its bits, a5xx.xml.h:1263+:
 *                                                CP_ME_BUSY   BIT(1)   CP_PFP_BUSY   BIT(2)
 *                                                CP_BUSY      BIT(6)   GPMU_MASTER_BUSY BIT(5)
 *                                                CP_CRASH_BUSY BIT(4)  GPU_BUSY_IGN_AHB BIT(31)
 *   0xB1A  CP_HW_FAULT                 :108   the command processor's own fault word
 *   0x800  CP_RB_BASE                  :60
 *   0x802  CP_RB_CNTL                  :62
 *   0x832  CP_ME_CNTL                  :91    clearing ME_HALT starts the micro engine
 *   0x835  CP_PFP_INSTR_BASE_LO        :93
 *   0x838  CP_PM4_INSTR_BASE_LO        :95
 *   0x46F  RBBM_PERFCTR_GPU_BUSY_MASKED :512
 *   0x464  RBBM_PERFCTR_CNTL           :501
 *   0x38   RBBM_INT_0_MASK             :176
 *   0x93   RBBM_AHB_CNTL0              :254
 *   0x94   RBBM_AHB_CNTL1              :255
 *   0x95   RBBM_AHB_CNTL2              :256
 *   0xE96  UCHE_CACHE_WAYS             :656
 *   0xE81  UCHE_MODE_CNTL              :645
 *   0xE87  UCHE_WRITE_THRU_BASE_LO     :646
 *   0xE89  UCHE_TRAP_BASE_LO           :648
 *   0xE8B  UCHE_GMEM_RANGE_MIN_LO      :650
 *   0xE8D  UCHE_GMEM_RANGE_MAX_LO      :652
 *   0xE8F  UCHE_DBG_ECO_CNTL_2         :654
 *   0x81F  CP_ROQ_THRESHOLDS_1         :75
 *   0x820  CP_ROQ_THRESHOLDS_2         :76
 *   0x825  CP_MEQ_THRESHOLDS           :81
 *   0x826  CP_MERCIU_SIZE              :82
 *   0x833  CP_CHICKEN_DBG              :92
 *   0xD00  PC_DBG_ECO_CNTL             :599
 *   0xCC6  RB_MODE_CNTL                :566
 *   0xE60  VPC_DBG_ECO_CNTL            :636
 *   0xF02  TPL1_MODE_CNTL              :696
 *   0x43   RBBM_SW_RESET_CMD           :179
 *   0x4D2  RBBM_ALWAYSON_COUNTER_LO    :493
 */
#define RBBM_STATUS                 0x4f5
#define CP_HW_FAULT                 0xb1a
#define CP_RB_BASE                  0x800
#define CP_RB_CNTL                  0x802
#define CP_ME_CNTL                  0x832
#define CP_PFP_INSTR_BASE_LO        0x835
#define CP_PFP_INSTR_BASE_HI        0x836
#define CP_PM4_INSTR_BASE_LO        0x838
#define CP_PM4_INSTR_BASE_HI        0x839
#define RBBM_PERFCTR_GPU_BUSY_MASKED 0x46f
#define RBBM_PERFCTR_CNTL           0x464
#define RBBM_INT_0_MASK             0x38
#define RBBM_AHB_CNTL0              0x93
#define RBBM_AHB_CNTL1              0x94
#define RBBM_AHB_CNTL2              0x95
#define UCHE_CACHE_WAYS             0xe96
#define UCHE_MODE_CNTL              0xe81
#define UCHE_WRITE_THRU_BASE_LO     0xe87
#define UCHE_WRITE_THRU_BASE_HI     0xe88
#define UCHE_TRAP_BASE_LO           0xe89
#define UCHE_TRAP_BASE_HI           0xe8a
#define UCHE_GMEM_RANGE_MIN_LO      0xe8b
#define UCHE_GMEM_RANGE_MIN_HI      0xe8c
#define UCHE_GMEM_RANGE_MAX_LO      0xe8d
#define UCHE_GMEM_RANGE_MAX_HI      0xe8e
#define UCHE_DBG_ECO_CNTL_2         0xe8f
#define CP_ROQ_THRESHOLDS_1         0x81f
#define CP_ROQ_THRESHOLDS_2         0x820
#define CP_MEQ_THRESHOLDS           0x825
#define CP_MERCIU_SIZE              0x826
#define CP_CHICKEN_DBG              0x833
#define PC_DBG_ECO_CNTL             0xd00
#define RB_MODE_CNTL                0xcc6
#define VPC_DBG_ECO_CNTL            0xe60
#define TPL1_MODE_CNTL              0xf02
#define RBBM_SW_RESET_CMD           0x43

/* RBBM_STATUS bits (a5xx.xml.h:1263-1295). */
#define RBBM_STATUS_CP_ME_BUSY          (1u << 1)
#define RBBM_STATUS_CP_PFP_BUSY         (1u << 2)
#define RBBM_STATUS_CP_CRASH_BUSY       (1u << 4)
#define RBBM_STATUS_CP_BUSY             (1u << 6)
#define RBBM_STATUS_GPU_BUSY_IGN_AHB    (1u << 31)

/* ADRENO_UCHE_GMEM_BASE, the UCHE's view of GMEM (adreno.h:154). */
#define UCHE_GMEM_BASE              0x100000
/* GMEM size for a540: SZ_1M (adreno-gpulist.h, the a540 entry's .gmem_size). */
#define A540_GMEM_SIZE              0x100000
/*
 * qcom,highest-bank-bit = <0x0f> (chiron.dts:10134). adreno_a5xx.c:2054-2073 turns it into
 * a two-bit field: "if (bit >= 13 && bit <= 16) { bit = (bit - 13) & 0x03; }" -- 15 - 13 = 2.
 */
#define A540_HIGHEST_BANK_BIT       2
/*
 * CP_RB_CNTL_DEFAULT (adreno_a5xx.h:115-116):
 *   (((ilog2(4) << 8) & 0x1F00) | (ilog2(KGSL_RB_DWORDS >> 1) & 0x3F))
 * with KGSL_RB_SIZE 32 KiB (adreno_ringbuffer.h:29) so KGSL_RB_DWORDS = 8192
 * (adreno_ringbuffer.h:35), and ilog2(4096) = 12, ilog2(4) = 2:
 *   ((2 << 8) & 0x1F00) | (12 & 0x3F) = 0x200 | 0x0C = 0x20C
 */
#define CP_RB_CNTL_DEFAULT          0x20c
/* The ring buffer's size this driver would use; step 4 needs it, step 3 only sets the fields. */
#define RING_SIZE                   0x8000
#define RING_DWORDS                 (RING_SIZE / 4)

/*
 * The command processor's microcode, from the phone's own /vendor/firmware. a540 uses a530's
 * ("a530_pm4.fw", "a530_pfp.fw" -- adreno-gpulist.h:251-252, the a540 entry), which is the
 * kind of detail that is easy to get wrong: there is no "a540_pm4.fw".
 *
 * Each file is the microcode with one dword of version in front of it:
 *   adreno_a5xx.c:2547  memcpy(ucode->hostptr, &fw->data[4], fw->size - 4);
 *   adreno_a5xx.c:2549  *ucode_version = *(unsigned int *)&fw->data[4];
 * The bytes after that dword are copied unchanged into memory the GPU reads.
 */
#define UCODE_HEADER_DWORDS         1

/*
 * The ring buffer and the microcode have to be memory the GPU can read, so the kernel must
 * hand over physical pages the GPU's own address space maps. This driver has no SMMU context
 * yet (that is step 4's business), so for now it uses the physical addresses directly, which
 * works only because on this port the kernel's memory is identity-mapped at the addresses the
 * GPU's micro-MMU passes through by default while no context is programmed. If that assumption
 * is wrong the micro engine will fault and CP_HW_FAULT will say so -- which is why that
 * register is read before and after, and printed raw either way.
 */
extern vm_offset_t ml_io_map(vm_offset_t phys_addr, vm_size_t size);
extern uint64_t kvtophys(vm_offset_t va);

/* The kernel's own view of a page it just wrote, before the GPU is told to read it. */
static void
to_memory(vm_offset_t start, vm_size_t size)
{
	/* The GPU reads memory, not this processor's cache (redwood_adreno.c:1217). */
	for (vm_offset_t at = start; at < start + size; at += 64) {
		__asm__ volatile ("dc civac, %0" : : "r" (at) : "memory");
	}
	__asm__ volatile ("dsb sy" : : : "memory");
}

/*
 * A file of the small image that travels with the kernel, the way redwood's driver finds its
 * firmware: userland/build.sh puts what is in fw-gpu/ into the image's directory fw/, and
 * redwood_image.c hands back a pointer to it (bsd/dev/redwood_image.c:26).
 */
extern const uint8_t *redwood_image_file(const char *dir, const char *name, uint64_t *size, int *disk_out);

static const uint8_t *
firmware_file(const char *name, uint64_t *size)
{
	int disk = -1;
	const uint8_t *data = redwood_image_file("fw", name, size, &disk);

	if (data != NULL) {
		say("chiron-adreno: %u: fw/%s: %llu bytes from the image of /dev/md%d\n",
		    step, name, (unsigned long long)*size, disk);
		return data;
	}
	say("chiron-adreno: %u: no fw/%s in the small image (put the phone's /vendor/firmware/%s into\n"
	    "chiron-adreno: %u:   fw-gpu/ and run userland/build.sh)\n", step, name, name, step);
	return NULL;
}

/*
 * Put one microcode file where the GPU can read it, and return its physical address.
 *
 * The file is the microcode with one dword of version in front of it:
 *   adreno_a5xx.c:2547  memcpy(ucode->hostptr, &fw->data[4], fw->size - 4);
 *   adreno_a5xx.c:2549  *ucode_version = *(unsigned int *)&fw->data[4];
 * The version is printed -- for this phone's a530_pm4.fw it should be 0x005ff063 -- because a
 * file that is not what we think it is should say so before it is handed to a micro engine.
 */
static uint64_t
microcode_in_memory(const char *name, uint32_t *version)
{
	const uint8_t *data;
	uint64_t size = 0;
	vm_offset_t memory = 0;
	uint32_t dwords;

	data = firmware_file(name, &size);
	if (data == NULL) {
		return 0;
	}
	if (size <= UCODE_HEADER_DWORDS * 4) {
		say("chiron-adreno: %u: fw/%s is %llu bytes: too short to hold a version and any code\n",
		    step, name, (unsigned long long)size);
		return 0;
	}

	*version = *(const uint32_t *)data;
	dwords = (uint32_t)((size - UCODE_HEADER_DWORDS * 4) / 4);
	say("chiron-adreno: %u: fw/%s: version %#010x, %u dwords of code after it\n",
	    step, name, *version, dwords);

	if (kmem_alloc(kernel_map, &memory, round_page(size),
	    KMA_KOBJECT | KMA_ZERO | KMA_DATA, VM_KERN_MEMORY_IOKIT) != KERN_SUCCESS || memory == 0) {
		say("chiron-adreno: %u: cannot allocate %llu bytes for fw/%s\n", step,
		    (unsigned long long)size, name);
		return 0;
	}
	memcpy((void *)memory, data + UCODE_HEADER_DWORDS * 4, size - UCODE_HEADER_DWORDS * 4);
	to_memory(memory, size);

	say("chiron-adreno: %u: fw/%s: %u dwords at %#llx (physical), kernel address %#lx\n",
	    step, name, dwords, (unsigned long long)kvtophys(memory), (unsigned long)memory);
	return kvtophys(memory);
}

/*
 * The microcode itself, from the phone's own /vendor/firmware, found in the small image that
 * travels with the kernel. a540 uses a530's command processor firmware -- there is no
 * "a540_pm4.fw", which is the kind of thing that costs a day if it is assumed:
 *   adreno-gpulist.h:251  .pm4fw_name = "a530_pm4.fw"
 *   adreno-gpulist.h:252  .pfpfw_name = "a530_pfp.fw"
 * (the a540 entry of that table).
 */
#define A540_PM4_FW             "a530_pm4.fw"
#define A540_PFP_FW             "a530_pfp.fw"

static uint64_t microcode_pm4, microcode_pfp;

static bool
step_microcode(void)
{
	uint32_t pm4_version = 0, pfp_version = 0;

	announce("the command processor's microcode: a530_pm4.fw and a530_pfp.fw for this a540");

	microcode_pm4 = microcode_in_memory(A540_PM4_FW, &pm4_version);
	microcode_pfp = microcode_in_memory(A540_PFP_FW, &pfp_version);

	if (microcode_pm4 == 0 || microcode_pfp == 0) {
		say("chiron-adreno: %u: the microcode is not there: the micro engine is NOT started.\n"
		    "chiron-adreno: %u:   Everything else in this step still runs -- RBBM is set and read back,\n"
		    "chiron-adreno: %u:   which is most of what can be verified without an engine -- and the\n"
		    "chiron-adreno: %u:   report below says plainly that the engine was not started.\n", step, step, step, step);
		return false;
	}
	return true;
}

/*
 * Everything a5xx_start() does to RBBM and the CP before the micro engine runs, in its order
 * (adreno_a5xx.c:1871-2098), with the a540 branch of each choice. Every value here is the
 * vendor's, and the branch it comes from is named beside it.
 */
static void
step_rbbm(void)
{
	announce("RBBM: the 3D core's register block, set as a540 wants it (adreno_a5xx.c:1871-2098)");

	/* "Make all blocks contribute to the GPU BUSY perf counter" (adreno_a5xx.c:1875) */
	put(&kgsl, "perfctr_busy_mask", RBBM_PERFCTR_GPU_BUSY_MASKED, 0xffffffff);
	/* "Enable the RBBM error reporting bits ... useful information on failure" (:1881) */
	put(&kgsl, "ahb_cntl0", RBBM_AHB_CNTL0, 0x00000001);
	/* "Turn on performance counters" (:1926) */
	put(&kgsl, "perfctr_cntl", RBBM_PERFCTR_CNTL, 0x01);
	/* "restricting VFD's cache access, so that LRZ and other data get evicted less" (:1932) */
	put(&kgsl, "uche_cache_ways", UCHE_CACHE_WAYS, 0x02);
	/* "Set UCHE_WRITE_THRU_BASE to the UCHE_TRAP_BASE effectively disabling L2 bypass" (:1938-1941) */
	put(&kgsl, "uche_trap_lo", UCHE_TRAP_BASE_LO, 0xffff0000);
	put(&kgsl, "uche_trap_hi", UCHE_TRAP_BASE_HI, 0x0001ffff);
	put(&kgsl, "uche_wt_lo", UCHE_WRITE_THRU_BASE_LO, 0xffff0000);
	put(&kgsl, "uche_wt_hi", UCHE_WRITE_THRU_BASE_HI, 0x0001ffff);
	/* "Program the GMEM VA range for the UCHE path" (:1944-1950) */
	put(&kgsl, "uche_gmem_min_lo", UCHE_GMEM_RANGE_MIN_LO, UCHE_GMEM_BASE);
	put(&kgsl, "uche_gmem_min_hi", UCHE_GMEM_RANGE_MIN_HI, 0x0);
	put(&kgsl, "uche_gmem_max_lo", UCHE_GMEM_RANGE_MAX_LO, UCHE_GMEM_BASE + A540_GMEM_SIZE - 1);
	put(&kgsl, "uche_gmem_max_hi", UCHE_GMEM_RANGE_MAX_HI, 0x0);

	/* a540 branch of the CP thresholds (adreno_a5xx.c:1968-1971) */
	put(&kgsl, "cp_meq_thresholds", CP_MEQ_THRESHOLDS, 0x40);
	put(&kgsl, "cp_merciu_size", CP_MERCIU_SIZE, 0x400);
	put(&kgsl, "cp_roq_thresholds_2", CP_ROQ_THRESHOLDS_2, 0x80000060);
	put(&kgsl, "cp_roq_thresholds_1", CP_ROQ_THRESHOLDS_1, 0x40201b16);

	/* the "else" branch a540 falls into (:1991): 0x400 << 11 | 0x300 << 22 */
	put(&kgsl, "pc_dbg_eco_cntl", PC_DBG_ECO_CNTL, (0x400u << 11) | (0x300u << 22));
	/* "Disable UCHE global filter as SP can invalidate/flush independently" (:2027) */
	put(&kgsl, "uche_mode_cntl", UCHE_MODE_CNTL, 1u << 29);
	/* "Set the USE_RETENTION_FLOPS chicken bit" (:2029) */
	put(&kgsl, "cp_chicken_dbg", CP_CHICKEN_DBG, 0x02000000);
	/* not in ISDB mode: "enable ME/PFP split notification" (:2059) */
	put(&kgsl, "ahb_cntl1", RBBM_AHB_CNTL1, 0xa6ffffff);
	put(&kgsl, "ahb_cntl2", RBBM_AHB_CNTL2, 0x0000003f);

	/* highest-bank-bit, from the device tree (:2054-2082), a540 only for the UCHE register */
	put(&kgsl, "tpl1_mode_cntl", TPL1_MODE_CNTL, A540_HIGHEST_BANK_BIT << 7);
	put(&kgsl, "rb_mode_cntl", RB_MODE_CNTL, A540_HIGHEST_BANK_BIT << 1);
	put(&kgsl, "uche_dbg_eco_cntl_2", UCHE_DBG_ECO_CNTL_2, A540_HIGHEST_BANK_BIT);

	/* "Disable All flat shading optimization" (:2089) */
	put(&kgsl, "vpc_dbg_eco_cntl", VPC_DBG_ECO_CNTL, reg(VPC_DBG_ECO_CNTL) | (1u << 10));

	announce("RBBM read back: the values above, as the hardware holds them");
	get(&kgsl, "ahb_cntl1", RBBM_AHB_CNTL1);
	get(&kgsl, "ahb_cntl2", RBBM_AHB_CNTL2);
	get(&kgsl, "cp_meq_thresholds", CP_MEQ_THRESHOLDS);
	get(&kgsl, "pc_dbg_eco_cntl", PC_DBG_ECO_CNTL);
	get(&kgsl, "uche_gmem_min_lo", UCHE_GMEM_RANGE_MIN_LO);
	get(&kgsl, "uche_gmem_max_lo", UCHE_GMEM_RANGE_MAX_LO);
	get(&kgsl, "tpl1_mode_cntl", TPL1_MODE_CNTL);
}

/*
 * Start the micro engine, and then look at it. This is the first place where the answer can be
 * "the 3D core is running", so the evidence is laid out rather than summarised:
 *
 *   CP_HW_FAULT      must be 0. Anything else is the command processor saying what it did not
 *                    like, and it is printed in full.
 *   RBBM_STATUS      its CP bits are what a running micro engine looks like -- but "busy" bits
 *                    that never change are as suspicious as ones that never set, so the register
 *                    is read several times and every value is printed, not just the last.
 *
 * What this does NOT prove: that the microcode is the right one, or that the core can render.
 * It proves the command processor was let out of halt and did not fault.
 */
static bool
step_core_start(void)
{
	uint32_t fault_before, fault_after, status;
	unsigned busy_seen = 0, idle_seen = 0;

	announce("the micro engine: its microcode's address in the CP, then ME_HALT cleared");

	fault_before = get(&kgsl, "cp_hw_fault", CP_HW_FAULT);

	put(&kgsl, "cp_pm4_base_lo", CP_PM4_INSTR_BASE_LO, (uint32_t)(microcode_pm4 & 0xffffffffu));
	put(&kgsl, "cp_pm4_base_hi", CP_PM4_INSTR_BASE_HI, (uint32_t)(microcode_pm4 >> 32));
	put(&kgsl, "cp_pfp_base_lo", CP_PFP_INSTR_BASE_LO, (uint32_t)(microcode_pfp & 0xffffffffu));
	put(&kgsl, "cp_pfp_base_hi", CP_PFP_INSTR_BASE_HI, (uint32_t)(microcode_pfp >> 32));

	/* The ring buffer's control register, so the CP has somewhere to fetch commands from. */
	put(&kgsl, "cp_rb_cntl", CP_RB_CNTL, CP_RB_CNTL_DEFAULT);

	/* "clear ME_HALT to start micro engine" (adreno_a5xx.c:2514) */
	put(&kgsl, "cp_me_cntl", CP_ME_CNTL, 0);

	/* Let it run, then look. Ten reads a millisecond apart: a value that never changes and a
	 * value that changes every time mean different things, and both are worth seeing. */
	announce("RBBM_STATUS ten times, a millisecond apart, to see whether the CP moves");
	for (unsigned i = 0; i < 10; i++) {
		status = reg(RBBM_STATUS);
		say("chiron-adreno: %u: rbbm_status [%#x] = %#010x%s%s%s\n", step,
		    gpureg_phys(RBBM_STATUS), status,
		    (status & RBBM_STATUS_CP_BUSY) ? " CP_BUSY" : "",
		    (status & RBBM_STATUS_CP_ME_BUSY) ? " ME_BUSY" : "",
		    (status & RBBM_STATUS_CP_PFP_BUSY) ? " PFP_BUSY" : "");
		if (status & (RBBM_STATUS_CP_BUSY | RBBM_STATUS_CP_ME_BUSY | RBBM_STATUS_CP_PFP_BUSY)) {
			busy_seen++;
		} else {
			idle_seen++;
		}
		sleep_us(1000);
	}

	fault_after = get(&kgsl, "cp_hw_fault", CP_HW_FAULT);
	status = get(&kgsl, "rbbm_status_final", RBBM_STATUS);

	say("chiron-adreno: %u: cp_hw_fault was %#010x and is %#010x\n", step, fault_before, fault_after);
	say("chiron-adreno: %u: of ten reads, %u had a CP busy bit set and %u had none\n", step, busy_seen, idle_seen);

	if (fault_after != 0) {
		say("chiron-adreno: %u: THE COMMAND PROCESSOR FAULTED: cp_hw_fault = %#010x\n"
		    "chiron-adreno: %u:   (rbbm_status %#010x, crash bit %s). A fault here means the micro\n"
		    "chiron-adreno: %u:   engine started and refused something -- most often an instruction\n"
		    "chiron-adreno: %u:   base address it cannot read. Raw values above.\n",
		    step, fault_after, step, status, (status & RBBM_STATUS_CP_CRASH_BUSY) ? "set" : "clear", step, step);
		return false;
	}

	/*
	 * A micro engine with an empty ring and no work parks itself: CP_ME_BUSY will be clear most
	 * of the time. What must not happen is the crash bit setting, or a fault. So the verdict is
	 * drawn from those, and the busy counts are reported beside it as what they are -- a hint,
	 * not the proof.
	 */
	if (status & RBBM_STATUS_CP_CRASH_BUSY) {
		say("chiron-adreno: %u: the CP's crash bit is set (rbbm_status %#010x)\n", step, status);
		return false;
	}
	say("chiron-adreno: %u: the micro engine was started, cp_hw_fault stayed 0, and the crash bit is clear\n", step);
	if (busy_seen == 0) {
		say("chiron-adreno: %u: NOTE: no busy bit was ever seen. With an empty ring that is not proof of\n"
		    "chiron-adreno: %u:   failure, but it is not proof the engine runs either. Step 4 sends it a\n"
		    "chiron-adreno: %u:   command and waits for the ring's read pointer to move, which is.\n", step, step, step);
	}
	return true;
}

/* ====================================================================================================
 * step 4: a ring buffer, CP_ME_INIT, and the proof step 3 could not give -- the CP reads what it
 * is given
 * ==================================================================================================== */

/*
 * Step 3 could say that the micro engine was let out of halt and did not fault. That is not the
 * same as "it runs", and the difference matters: a stalled engine with an empty ring also does
 * not fault. What settles it is giving the engine a command and watching the ring buffer's read
 * pointer move -- the pointer is advanced by the command processor as it consumes, so if it
 * moves the engine really is fetching and executing.
 *
 * The registers this needs, all from a5xx_reg.h:
 *
 *   0x800  CP_RB_BASE              :60     the ring's base address (its low bits: the size)
 *   0x801  CP_RB_BASE_HI           :61
 *   0x802  CP_RB_CNTL              :62     also holds the size in its low six bits
 *   0x804  CP_RB_RPTR_ADDR_LO      :63     where the CP writes the read pointer into memory
 *   0x805  CP_RB_RPTR_ADDR_HI      :64
 *   0x806  CP_RB_RPTR              :65     the read pointer, as the CP has left it
 *   0x807  CP_RB_WPTR              :66     the write pointer: what the host has published
 *
 * The order is a5xx_rb_start()'s (adreno_a5xx.c:2483-2529): RPTR_ADDR, RB_CNTL, RB_BASE,
 * microcode (already done in step 3), then ME_HALT cleared, then CP_ME_INIT.
 *
 * CP_ME_INIT is a type-7 packet whose payload is the "ordinals" the microcode expects. The
 * vendor's _set_ordinals() (adreno_a5xx.c:2356-2400) sends, with CP_INIT_MASK = BIT(0..5)
 * (:2349-2353):
 *
 *   [0] CP_INIT_MASK itself                         = 0x3F
 *   [1] CP_INIT_MAX_CONTEXT: 0x00000003 for a540    (:2363-2374; only a530v1 differs)
 *   [2] CP_INIT_ERROR_DETECTION_CONTROL             = 0x20000000  (:2376-2377)
 *   [3] CP_INIT_HEADER_DUMP address                 = 0         (:2379-2384)
 *   [4] CP_INIT_HEADER_DUMP enable and size         = 0
 *   [5] CP_INIT_DRAWCALL_FILTER_RANGE start         = 0         (:2386-2390)
 *   [6] CP_INIT_DRAWCALL_FILTER_RANGE end           = 0
 *   [7] CP_INIT_UCODE_WORKAROUND_MASK               = 0 for anything but a530 (:2393)
 *
 * so CP_ME_INIT(8) with the eight dwords below -- which is exactly what the upstream driver
 * sends too (a5xx_gpu.c:402-437, where the non-a530 branch leaves the workarounds at 0).
 *
 * How a type-7 packet word is built (adreno_pm4types.h:188-194):
 *   type 7 | count<<0 | odd_parity(count)<<15 | (opcode & 0x7f)<<16 | odd_parity(opcode)<<23
 * and the parity is a real constraint: the CP drops a packet whose parity is wrong, so it is
 * computed here rather than tabulated.
 */
#define CP_RB_RPTR_ADDR_LO          0x804
#define CP_RB_RPTR_ADDR_HI          0x805
#define CP_RB_RPTR                  0x806
#define CP_RB_WPTR                  0x807

#define CP_TYPE7_PKT                0x70000000u     /* adreno_pm4types.h:21  CP_TYPE7_PKT = 7 << 28 */
#define CP_TYPE4_PKT                0x40000000u     /* adreno_pm4types.h:20  CP_TYPE4_PKT = 4 << 28 */
#define CP_ME_INIT                  0x48
#define CP_INTERRUPT                0x40

/*
 * adreno_pm4types.h: pm4_calc_odd_parity_bit() -- the bit is set when the value's population
 * count is even, so that the whole field including it has an odd count.
 *
 * This is the vendor's own function, transcribed rather than re-derived:
 *
 *   return (0x9669 >> (0xf & (val ^ (val>>4) ^ (val>>8) ^ (val>>12) ^
 *                              (val>>16) ^ (val>>20) ^ (val>>24) ^ (val>>28)))) & 1;
 *
 * The folding is not an optimisation to be simplified away: 0x9669 is a table indexed by the
 * XOR of all eight nibbles, and folding preserves the total parity because popcount(a^b) has the
 * same parity as popcount(a)+popcount(b). An earlier version of this function counted only the
 * low seven bits, which agrees for small values and differs for a register address such as
 * 0x8000 (one bit set: odd, parity 0 -- but its low seven bits are zero, which the short form
 * called even). A wrong parity bit makes the CP drop the whole packet, and a dropped CP_ME_INIT
 * looks exactly like an engine that does not run, so this had to be their function, not an
 * equivalent-looking one.
 */
static uint32_t
odd_parity(uint32_t value)
{
	uint32_t folded = value ^ (value >> 4) ^ (value >> 8) ^ (value >> 12) ^
	    (value >> 16) ^ (value >> 20) ^ (value >> 24) ^ (value >> 28);

	return (0x9669u >> (folded & 0xfu)) & 1u;
}

static uint32_t
cp_type7(uint32_t opcode, uint32_t count)
{
	return CP_TYPE7_PKT | (count & 0x3fffu) | (odd_parity(count) << 15) |
	    ((opcode & 0x7fu) << 16) | (odd_parity(opcode) << 23);
}

/* The ring, and where the CP writes the read pointer it keeps. */
static vm_offset_t ring_memory, ring_rptr_memory;
static uint64_t ring_phys, ring_rptr_phys;
static uint32_t ring_words;

static bool
ring_allocate(void)
{
	if (kmem_alloc(kernel_map, &ring_memory, round_page(RING_SIZE),
	    KMA_KOBJECT | KMA_ZERO | KMA_DATA, VM_KERN_MEMORY_IOKIT) != KERN_SUCCESS || ring_memory == 0) {
		say("chiron-adreno: %u: cannot allocate the ring (%u bytes)\n", step, (unsigned)RING_SIZE);
		return false;
	}
	if (kmem_alloc(kernel_map, &ring_rptr_memory, PAGE_SIZE,
	    KMA_KOBJECT | KMA_ZERO | KMA_DATA, VM_KERN_MEMORY_IOKIT) != KERN_SUCCESS || ring_rptr_memory == 0) {
		say("chiron-adreno: %u: cannot allocate the ring's read-pointer word\n", step);
		return false;
	}
	ring_phys = kvtophys(ring_memory);
	ring_rptr_phys = kvtophys(ring_rptr_memory);
	if (ring_phys == 0 || ring_rptr_phys == 0) {
		say("chiron-adreno: %u: the ring has no physical address\n", step);
		return false;
	}
	say("chiron-adreno: %u: ring: %u dwords at %#llx (physical); read pointer word at %#llx\n",
	    step, (unsigned)RING_DWORDS, (unsigned long long)ring_phys, (unsigned long long)ring_rptr_phys);
	return true;
}

/* Put words into the ring and publish them: this is the host's side of the contract. */
static bool
ring_send(const char *what, const uint32_t *words, uint32_t count)
{
	uint32_t *ring = (uint32_t *)ring_memory;

	if (count > RING_DWORDS - ring_words) {
		say("chiron-adreno: %u: %s needs %u words, %u left\n", step, what, count,
		    (unsigned)(RING_DWORDS - ring_words));
		return false;
	}
	for (uint32_t i = 0; i < count; i++) {
		ring[ring_words + i] = words[i];
	}
	ring_words += count;
	to_memory(ring_memory, RING_SIZE);

	/* "Make sure everything is posted before making a decision" (a5xx_gpu.c:39-40) */
	__asm__ volatile ("dsb sy" : : : "memory");
	put(&kgsl, "cp_rb_wptr", CP_RB_WPTR, ring_words);
	say("chiron-adreno: %u: %s: %u words given, wptr now %u\n", step, what, count, ring_words);
	return true;
}

/* How many commands the CP says it has consumed. */
static uint32_t
ring_rptr(bool refresh)
{
	uint32_t rptr;

	if (refresh) {
		/* The CP writes the pointer into memory; read it from the memory it wrote. */
		__asm__ volatile ("dc ivac, %0" : : "r" (ring_rptr_memory) : "memory");
		__asm__ volatile ("dsb sy" : : : "memory");
	}
	rptr = reg(CP_RB_RPTR);
	return rptr;
}

static bool
step_ring(void)
{
	uint32_t me_init[9];
	uint32_t rptr_before, rptr_after = 0;
	unsigned moved = 0;

	announce("a ring buffer for the command processor, and CP_ME_INIT in it");

	if (!ring_allocate()) {
		return false;
	}

	/* a5xx_rb_start()'s order (adreno_a5xx.c:2493-2506): RPTR_ADDR, then CNTL, then BASE. */
	put(&kgsl, "cp_rb_rptr_addr_lo", CP_RB_RPTR_ADDR_LO, (uint32_t)(ring_rptr_phys & 0xffffffffu));
	put(&kgsl, "cp_rb_rptr_addr_hi", CP_RB_RPTR_ADDR_HI, (uint32_t)(ring_rptr_phys >> 32));
	put(&kgsl, "cp_rb_cntl", CP_RB_CNTL, CP_RB_CNTL_DEFAULT);
	put(&kgsl, "cp_rb_base", CP_RB_BASE, (uint32_t)(ring_phys & 0xffffffffu));
	put(&kgsl, "cp_rb_base_hi", CP_RB_BASE + 1, (uint32_t)(ring_phys >> 32));

	rptr_before = ring_rptr(true);
	say("chiron-adreno: %u: cp_rb_rptr before anything is sent: %u\n", step, rptr_before);

	/*
	 * CP_ME_INIT and, behind it, an interrupt packet: the interrupt makes the CP touch an
	 * address it would otherwise skip when idle, and it is a second, differently-shaped packet
	 * -- so a pointer that moves past both is a pointer the engine really walked.
	 */
	me_init[0] = cp_type7(CP_ME_INIT, 8);
	me_init[1] = 0x3f;              /* CP_INIT_MASK: every ordinal below is present */
	me_init[2] = 0x00000003;        /* CP_INIT_MAX_CONTEXT: 3D and 2D, as a540 gets (:2370) */
	me_init[3] = 0x20000000;        /* CP_INIT_ERROR_DETECTION_CONTROL (:2376) */
	me_init[4] = 0x0;               /* CP_INIT_HEADER_DUMP address */
	me_init[5] = 0x0;               /* CP_INIT_HEADER_DUMP enable and size */
	me_init[6] = 0x0;               /* CP_INIT_DRAWCALL_FILTER_RANGE start */
	me_init[7] = 0x0;               /* CP_INIT_DRAWCALL_FILTER_RANGE end */
	me_init[8] = 0x0;               /* CP_INIT_UCODE_WORKAROUND_MASK: 0 for anything but a530 */

	say("chiron-adreno: %u: CP_ME_INIT as a type-7 word: %#010x (opcode %#x, count 8, parity "
	    "%u/%u)\n", step, me_init[0], CP_ME_INIT, odd_parity(CP_ME_INIT), odd_parity(8));

	if (!ring_send("CP_ME_INIT", me_init, 9)) {
		return false;
	}

	/* Then one more packet, so the pointer has two boundaries to cross. */
	{
		uint32_t interrupt = cp_type7(CP_INTERRUPT, 1);
		uint32_t words[2];

		words[0] = interrupt;
		words[1] = 0;           /* the interrupt's own word */
		if (!ring_send("CP_INTERRUPT", words, 2)) {
			return false;
		}
	}

	announce("the read pointer, polled: if it moves, the engine is fetching and executing");
	for (unsigned i = 0; i < 200; i++) {
		uint32_t now = ring_rptr(i == 0);

		if (now != rptr_after) {
			say("chiron-adreno: %u: cp_rb_rptr = %u (wptr %u) at %u ms\n", step, now, ring_words, i);
			rptr_after = now;
		}
		if (now == ring_words) {
			moved = 1;
			break;
		}
		sleep_us(1000);
	}

	say("chiron-adreno: %u: cp_rb_rptr began at %u, is %u, and wptr is %u\n",
	    step, rptr_before, ring_rptr(true), ring_words);
	if (moved) {
		say("chiron-adreno: %u: THE COMMAND PROCESSOR READ EVERYTHING IT WAS GIVEN. It is running\n"
		    "chiron-adreno: %u:   and executing: this is the proof step 3 could not give.\n", step, step);
		return true;
	}

	/* It did not get all the way. Say how far and what the CP's own fault word says. */
	say("chiron-adreno: %u: the read pointer did not reach the write pointer in 200 ms\n", step);
	say("chiron-adreno: %u:   cp_hw_fault = %#010x, rbbm_status = %#010x\n", step,
	    reg(CP_HW_FAULT), reg(RBBM_STATUS));
	if (rptr_after != rptr_before) {
		say("chiron-adreno: %u:   it did move (%u -> %u), so the engine is fetching; it stopped part\n"
		    "chiron-adreno: %u:   way, which points at the packet it stopped on rather than the ring\n",
		    step, rptr_before, rptr_after, step);
	} else {
		say("chiron-adreno: %u:   it never moved at all. The engine is not fetching: either it is not\n"
		    "chiron-adreno: %u:   running, or the ring's address is not one it can read\n", step, step);
	}
	return false;
}

/* ====================================================================================================
 * step 5: the GPMU -- its firmware into its own instruction RAM, then the handshake
 * ==================================================================================================== */

/*
 * a5xx's power management processor. It is not a6xx's GMU: different firmware format (.fw2),
 * different registers, no message queues -- but the idea is the same, and it is what the vendor
 * driver calls GPMU. This step loads its firmware and waits for it to say it started.
 *
 * The firmware goes into the GPMU's instruction RAM through the command processor, as type-4
 * packets, not by writing the registers directly -- the only place GPMU_INST_RAM_BASE appears in
 * the vendor's driver is inside cp_type4_packet() (adreno_a5xx.c:658-659), and there is no
 * kgsl_regwrite to it anywhere. So this step needs step 4's ring working, which is why it comes
 * last.
 *
 * Registers (a5xx_reg.h):
 *   0x8800  GPMU_INST_RAM_BASE     :768   where the firmware goes
 *   0xA8D8  GPMU_CM3_SYSRESET      :782   written 0 to let the processor out of reset
 *   0xA8E0  GPMU_GENERAL_0         :783   becomes 0xBABEFACE when the firmware has started
 *   0xA8E1  GPMU_GENERAL_1         :784   0 on success, an error code otherwise
 *   0xA8D6  GPMU_RBBM_INTR_INFO    :781   pending interrupts, cleared after the handshake
 *   0x37    RBBM_INT_CLEAR_CMD     :175   to clear them
 *
 * The firmware file is a ".fw2": a sequence of blocks, each with its own length and version
 * header, then the code. The vendor's _load_gpmu_firmware() (adreno_a5xx.c:683-742) reads it as
 *
 *   data[0]  the file's length in dwords
 *   data[1]  GPMU_FIRMWARE_ID, which must be 2                       (:714, adreno_a5xx.h:216)
 *   data[2]  the first block header's length in dwords
 *   code     at data + data[2] + 3                                   (:728)
 *   length   data[0] - data[2] - 2                                   (:729)
 *   and that length must be <= GPMU_INST_RAM_SIZE, 0xFFF             (:731, adreno_a5xx.h:218)
 *
 * The version in that header must not be older than what the device tree asks for, which for
 * this phone is 3.0 (chiron.dts:10144 `qcom,gpmu-version = <0x03 0x00>`; adreno-gpulist.h has
 * .gpmu_major = 3, .gpmu_minor = 0 for a540). The vendor logs a mismatch and carries on, and so
 * does this: the hardware is the authority, and the log says what it saw.
 */
#define GPMU_INST_RAM_BASE          0x8800
#define GPMU_DATA_RAM_BASE          0x9800
#define GPMU_WFI_CONFIG             0xa8c1
#define GPMU_RBBM_INTR_INFO         0xa8d6
#define GPMU_CM3_SYSRESET           0xa8d8
#define GPMU_GENERAL_0              0xa8e0
#define GPMU_GENERAL_1              0xa8e1
#define RBBM_INT_CLEAR_CMD          0x37

#define GPMU_FIRMWARE_ID            2       /* adreno_a5xx.h:216 */
#define GPMU_INST_RAM_SIZE          0xfff   /* adreno_a5xx.h:218 */
#define GPMU_STARTED                0xbabefaceu
#define GPMU_FW_INIT_RETRY          5000    /* adreno_a5xx.c:85 GPMU_FW_INIT_RETRY */
#define GPMU_INT_FIRMWARE           29      /* a5xx_reg.h:47 A5XX_INT_GPMU_FIRMWARE */
/*
 * What this phone's device tree asks the firmware's version to be at least:
 *   chiron.dts:10144  qcom,gpmu-version = <0x03 0x00>
 *   adreno-gpulist.h  (the a540 entry) .gpmu_major = 3, .gpmu_minor = 0
 * Two sources, the same numbers.
 *
 * Worth knowing before the first run: the a530v3_gpmu.fw2 that ships in a Linux distribution's
 * firmware package is version 2.4, which is OLDER than this and is refused below by the same
 * rule the vendor's reader applies. That is not a bug in this driver -- it is the wrong file
 * for this phone, and the log will say so with both numbers. a540_gpmu.fw2 from the phone's own
 * /vendor/firmware is the one that will be there.
 */
#define GPMU_ASKED_MAJOR            3
#define GPMU_ASKED_MINOR            0

/* "The maximum payload of a type4 packet is the max size minus one for the opcode"
 * (adreno_a5xx.c:617-619, with PM4_TYPE4_PKT_SIZE_MAX = 128 from adreno_pm4types.h:23). */
#define TYPE4_MAX_PAYLOAD           (128 - 1)

/* A type-4 packet: type 4 | count | odd_parity(count)<<7 | (reg & 0x3ffff)<<8 | parity<<27
 * (adreno_pm4types.h:196-202, with CP_TYPE4_PKT = 4 << 28 at :20). It carries register
 * writes, which is how the GPMU's RAM is written through the CP. */
static uint32_t
cp_type4(uint32_t reg, uint32_t count)
{
	return CP_TYPE4_PKT | (count & 0xfffu) | (odd_parity(count) << 7) |
	    ((reg & 0x3ffffu) << 8) | (odd_parity(reg) << 27);
}

/* The fw2 firmware, split into the pieces the vendor's reader takes. */
static bool
gpmu_firmware(const char *name, uint32_t **code, uint32_t *count)
{
	const uint8_t *data;
	uint64_t size = 0;
	const uint32_t *words;
	uint32_t total, block_header, code_count, major = 0, minor = 0;

	data = firmware_file(name, &size);
	if (data == NULL) {
		return false;
	}
	if (size < 12 || (size % 4) != 0) {
		say("chiron-adreno: %u: fw/%s is %llu bytes: not a dword-aligned fw2\n", step, name,
		    (unsigned long long)size);
		return false;
	}
	words = (const uint32_t *)data;

	/*
	 * "The first dword is the size of the remaining data in dwords" (a5xx_power.c, the
	 * upstream reader says it plainly), so it is one less than the file's own word count --
	 * which is how the vendor checks it: data[0] < fw->size / 4 (:712).
	 */
	total = words[0];
	if (total < 2 || total >= (uint32_t)(size / 4)) {
		say("chiron-adreno: %u: fw/%s: its first dword says %u words, the file holds %u\n",
		    step, name, total, (unsigned)(size / 4));
		return false;
	}
	if (words[1] != GPMU_FIRMWARE_ID) {
		say("chiron-adreno: %u: fw/%s: second dword is %#x, not GPMU_FIRMWARE_ID (%u)\n",
		    step, name, words[1], GPMU_FIRMWARE_ID);
		return false;
	}
	block_header = words[2];
	if (block_header == 0 || block_header > (total - 2)) {
		say("chiron-adreno: %u: fw/%s: block header length %u does not fit in %u words\n",
		    step, name, block_header, total - 2);
		return false;
	}
	code_count = total - block_header - 2;
	if (code_count > GPMU_INST_RAM_SIZE) {
		say("chiron-adreno: %u: fw/%s: %u words of code, more than the %u its RAM holds\n",
		    step, name, code_count, GPMU_INST_RAM_SIZE);
		return false;
	}

	/*
	 * The block header is pairs of (tag, value), read from data[3] on -- the vendor passes
	 * &data[2] and starts its loop at index 1, which is the same word (adreno_a5xx.c:1244-1290,
	 * tags at adreno_a5xx.h:220-224: MAJOR 1, MINOR 2, DATE 3, TIME 4, SEQUENCE 5). The
	 * sequence check there is skipped for this block, because that block's id is
	 * GPMU_FIRMWARE_ID (2) and the sequence id is 3 -- so index 1 is the first tag.
	 */
	for (uint32_t i = 0; i + 1 < block_header; i += 2) {
		uint32_t tag = words[3 + i];

		if (tag == 0x1) {                       /* HEADER_MAJOR */
			major = words[3 + i + 1];
		} else if (tag == 0x2) {                /* HEADER_MINOR */
			minor = words[3 + i + 1];
		}
	}
	say("chiron-adreno: %u: fw/%s: %u words total, block header %u, %u words of code\n",
	    step, name, total, block_header, code_count);
	say("chiron-adreno: %u: fw/%s: version %u.%u; this phone's device tree asks for 3.0\n"
	    "chiron-adreno: %u:   (chiron.dts:10144 qcom,gpmu-version, adreno-gpulist.h .gpmu_major 3)\n",
	    step, name, major, minor, step);

	/*
	 * The vendor refuses firmware older than the tree asks for, and only for the major:
	 *   approx. adreno_a5xx.c:1265-1273
	 *     if ((major > header[i + 1]) && header[i + 1]) return -EINVAL;
	 * A minor that is older is logged and accepted. Refusing matters more here than it looks:
	 * a wrong-major image is for a different microarchitecture, and loading it into a processor
	 * nobody can reset again from here would wedge it. So the same rule, with the same words.
	 */
	if (major != 0 && GPMU_ASKED_MAJOR > major) {
		say("chiron-adreno: %u: fw/%s is major %u, older than the %u this phone asks for: NOT loaded\n"
		    "chiron-adreno: %u:   (the vendor's reader refuses this too; a mismatched image would be\n"
		    "chiron-adreno: %u:   for another microarchitecture and could leave the GPMU wedged)\n",
		    step, name, major, GPMU_ASKED_MAJOR, step, step);
		return false;
	}
	if (major != 0 && minor != 0 && GPMU_ASKED_MINOR > minor) {
		say("chiron-adreno: %u: fw/%s is minor %u, older than %u: loaded anyway, as the vendor does,\n"
		    "chiron-adreno: %u:   but the handshake below is what decides\n", step, name, minor,
		    GPMU_ASKED_MINOR, step);
	}

	*code = (uint32_t *)(data + (block_header + 3) * 4);
	*count = code_count;
	return true;
}

static bool
step_gpmu(void)
{
	uint32_t *code = NULL, *ring = NULL;
	uint32_t count = 0, offset = 0, words = 0, general = 0;
	uint32_t general1 = 0, intr = 0;

	announce("the GPMU: its firmware (a540_gpmu.fw2) into its instruction RAM through the CP");

	if (!gpmu_firmware("a540_gpmu.fw2", &code, &count)) {
		say("chiron-adreno: %u: without its firmware the GPMU is not started. It is not needed for\n"
		    "chiron-adreno: %u:   the 3D core to run -- it does power management, not the GPU's\n"
		    "chiron-adreno: %u:   gate -- so the steps before this one stand on their own.\n", step, step, step);
		return false;
	}

	/*
	 * Build the packet stream that writes the code into the GPMU's instruction RAM: as many
	 * type-4 packets as it takes, each carrying at most TYPE4_MAX_PAYLOAD words, each aimed at
	 * the next stretch of RAM (adreno_a5xx.c:653-661 does exactly this).
	 */
	{
		uint32_t packets = (count + TYPE4_MAX_PAYLOAD - 1) / TYPE4_MAX_PAYLOAD;
		uint32_t total = count + packets;
		uint32_t at = 0;

		if (kmem_alloc(kernel_map, (vm_offset_t *)&ring, round_page(total * 4),
		    KMA_KOBJECT | KMA_ZERO | KMA_DATA, VM_KERN_MEMORY_IOKIT) != KERN_SUCCESS || ring == NULL) {
			say("chiron-adreno: %u: cannot allocate %u words for the GPMU's load\n", step, total);
			return false;
		}
		while (offset < count) {
			uint32_t take = count - offset;

			if (take > TYPE4_MAX_PAYLOAD) {
				take = TYPE4_MAX_PAYLOAD;
			}
			ring[words++] = cp_type4(GPMU_INST_RAM_BASE + offset, take);
			for (uint32_t i = 0; i < take; i++) {
				ring[words++] = code[offset + i];
			}
			offset += take;
			at++;
		}
		say("chiron-adreno: %u: %u words of firmware as %u type-4 packets, %u words in all\n",
		    step, count, at, words);
	}

	if (!ring_send("GPMU firmware", ring, words)) {
		return false;
	}

	/*
	 * Wait for the CP to have consumed all of it -- the same test as step 4, and the reason this
	 * step is only worth doing once that one works.
	 */
	announce("wait for the CP to have written all of it into the GPMU's RAM");
	{
		unsigned consumed = 0;

		for (unsigned i = 0; i < 2000; i++) {
			if (ring_rptr(i == 0) == ring_words) {
				consumed = 1;
				break;
			}
			sleep_us(1000);
		}
		say("chiron-adreno: %u: cp_rb_rptr %u, wptr %u: %s\n", step, ring_rptr(true), ring_words,
		    consumed ? "all consumed" : "NOT all consumed");
		if (!consumed) {
			say("chiron-adreno: %u: the CP has not finished the load, so resetting the GPMU now\n"
			    "chiron-adreno: %u:   would start it on half its firmware. Not done.\n", step, step);
			return false;
		}
	}

	/*
	 * Let it out of reset and wait for the word it writes when its firmware has started.
	 * "The hardware team's estimation of GPMU firmware initialization latency is about 3000
	 * cycles, that's about 5 to 24 usec" (adreno_a5xx.c:801-804) -- the poll is far longer than
	 * that, because the price of being wrong once is a falsely failed step.
	 */
	announce("GPMU_CM3_SYSRESET cleared, then GPMU_GENERAL_0 polled for 0xBABEFACE");
	put(&kgsl, "gpmu_cm3_sysreset", GPMU_CM3_SYSRESET, 0);

	for (uint32_t i = 0; i < GPMU_FW_INIT_RETRY; i++) {
		general = reg(GPMU_GENERAL_0);
		if (general == GPMU_STARTED) {
			break;
		}
		sleep_us(1);
	}
	say("chiron-adreno: %u: gpmu_general_0 [%#x] = %#010x (want %#010x)\n",
	    step, gpureg_phys(GPMU_GENERAL_0), general, GPMU_STARTED);

	if (general != GPMU_STARTED) {
		say("chiron-adreno: %u: the GPMU did not report itself started. Its own words:\n", step);
		say("chiron-adreno: %u:   gpmu_general_1 [%#x] = %#010x\n", step,
		    gpureg_phys(GPMU_GENERAL_1), reg(GPMU_GENERAL_1));
		say("chiron-adreno: %u:   gpmu_rbbm_intr_info [%#x] = %#010x\n", step,
		    gpureg_phys(GPMU_RBBM_INTR_INFO), reg(GPMU_RBBM_INTR_INFO));
		say("chiron-adreno: %u:   cp_hw_fault = %#010x, rbbm_status = %#010x\n", step,
		    reg(CP_HW_FAULT), reg(RBBM_STATUS));
		return false;
	}

	/* "0 on success, an error code otherwise" -- read and reported, never assumed. */
	general1 = get(&kgsl, "gpmu_general_1", GPMU_GENERAL_1);
	if (general1 != 0) {
		say("chiron-adreno: %u: the GPMU says it started but reports error %#010x\n", step, general1);
		return false;
	}

	/* Pending interrupts, cleared so they do not sit there looking like a fault later. */
	intr = get(&kgsl, "gpmu_rbbm_intr_info", GPMU_RBBM_INTR_INFO);
	if (intr != 0) {
		put(&kgsl, "rbbm_int_clear_cmd", RBBM_INT_CLEAR_CMD, 1u << GPMU_INT_FIRMWARE);
	}

	say("chiron-adreno: %u: THE GPMU IS RUNNING: general_0 read 0xBABEFACE and general_1 read 0\n", step);
	say("chiron-adreno: %u:   (a5xx.c:805-820 waits for exactly this; it is the GPMU's own word,\n"
	    "chiron-adreno: %u:    not a conclusion drawn from a register this driver wrote)\n", step, step);
	return true;
}

/* ====================================================================================================
 * step 6: the SMMU in front of the GPU -- read it, and say what this driver is relying on
 * ==================================================================================================== */

/*
 * THE ASSUMPTION THIS STEP EXISTS TO MAKE VISIBLE.
 *
 * Steps 3, 4 and 5 hand the GPU physical addresses: the microcode's and the ring's, from
 * kvtophys(). That only works if nothing translates them in between. There is an SMMU in front
 * of the GPU -- dt: arm,smmu-kgsl@5040000, 0x10000 long (chiron.dts:6135) -- so whether those
 * addresses arrive intact depends on how the boot loader left that SMMU, and on whether this
 * kernel has programmed a translation context for it (it has not).
 *
 * Two device-tree properties bear on it directly:
 *   qcom,skip-init   (chiron.dts:6139)  -- Linux does not reset or reinitialise this SMMU at
 *                                          probe; it uses it in whatever state it finds. Which
 *                                          means the state the boot loader left is the state
 *                                          this kernel inherits.
 *   qcom,dynamic     (:6137)           -- its attachment is set up on demand.
 * and the two contexts it declares are gfx3d_user (:10287, iommus = <0x1a7 0x00>) and
 * gfx3d_secure (:10294, stream 2).
 *
 * So this step reads the SMMU's identity and configuration and prints it, and then says in one
 * line which of two worlds this kernel is in. It does not program the SMMU: that needs a page
 * table and the secure-side cooperation, and doing it half way would be worse than not doing it.
 *
 * The registers, all byte offsets in the SMMU's own block (drivers/iommu/arm-smmu.c:100-120,
 * where they are written with no shift because the IOMMU driver uses readl/writel on bytes):
 *
 *   0x0000  ARM_SMMU_GR0_sCR0     the global configuration: CLIENTPD (bit 0, "client port
 *                                 disabled": translation off), GFRE, etc. (arm-smmu.c:95-108)
 *   0x0004  ARM_SMMU_GR0_sCR2     VMID / stream-global controls
 *   0x0020  ARM_SMMU_GR0_ID0      architecture and the count of stream mapping registers
 *   0x0024  ARM_SMMU_GR0_ID1      the number of context banks
 *   0x003c  ARM_SMMU_GR0_ID7      the ARM IHI number this SMMU implements
 *   0x0048  ARM_SMMU_GR0_sGFSR    the global fault status, and the reason for the last fault
 *   0x0050  ARM_SMMU_GR0_sGFSYNR0
 *   0x0054  ARM_SMMU_GR0_sGFSYNR1
 *
 * and the stream-to-context mapping for the GPU's own stream id, which the device tree gives as
 * 0 (iommus = <0x1a7 0x00>, chiron.dts:10289):
 *
 *   0x0800 + 4*n  ARM_SMMU_GR0_SMR(n)    stream mapping register n  (arm-smmu.c:162)
 *   0x0c00 + 4*n  ARM_SMMU_GR0_S2CR(n)   stream-to-context register n (:169)
 *
 * S2CR's TYPE field says what a stream gets, and its values are stated once, at the constants
 * below, where the source is quoted -- they are not what the names suggest.
 *
 * (Note that five SMMUs in this phone's device tree carry qcom,skip-init -- arm,smmu-anoc1
 * @1680000 (:6060), arm,smmu-anoc2@16c0000 (:6079), arm,smmu-lpass_q6@5100000 (:6099),
 * arm,smmu-mmss@cd00000 (:6118) and arm,smmu-kgsl@5040000 (:6143) -- so a search for that
 * property finds one of the first four first. The GPU's is the last, and it is the only one
 * this driver touches.)
 */
static struct block smmu = { .name = "smmu", .phys = 0x05040000, .size = 0x10000 };

#define SMMU_sCR0       0x0000
#define SMMU_sCR2       0x0004
#define SMMU_ID0        0x0020
#define SMMU_ID1        0x0024
#define SMMU_ID7        0x003c
#define SMMU_sGFSR      0x0048
#define SMMU_sGFSYNR0   0x0050
#define SMMU_sGFSYNR1   0x0054
#define SMMU_SMR(n)     (0x0800 + ((n) << 2))
#define SMMU_S2CR(n)    (0x0c00 + ((n) << 2))

/* s2cr TYPE field. THE VALUES ARE NOT WHAT THE NAMES SUGGEST -- read them from the source:
 *   arm-smmu.c:172-176
 *     #define S2CR_TYPE_SHIFT   16
 *     #define S2CR_TYPE_MASK    0x3
 *     #define S2CR_TYPE_TRANS   (0 << S2CR_TYPE_SHIFT)     <- 0, not 2
 *     #define S2CR_TYPE_BYPASS  (1 << S2CR_TYPE_SHIFT)     <- 1
 *     #define S2CR_TYPE_FAULT   (2 << S2CR_TYPE_SHIFT)     <- 2, not 0
 * and the driver uses them the same way when it programs one: a translating stream is
 * `S2CR_TYPE_TRANS | (cbndx << S2CR_CBNDX_SHIFT)` (:2152-2153), while an unattached group is
 * given S2CR_TYPE_BYPASS (:2180, :3559). A first version of this file assumed FAULT = 0,
 * which would have called an unattached stream a fault when it is in fact the one thing this
 * driver's physical addresses need. */
#define SMMU_S2CR_CBNDX_SHIFT   0
#define SMMU_S2CR_CBNDX_MASK    0xffu
#define SMMU_S2CR_TYPE_SHIFT    16
#define SMMU_S2CR_TYPE_MASK     (3u << SMMU_S2CR_TYPE_SHIFT)
#define SMMU_S2CR_TYPE_TRANS    (0u << SMMU_S2CR_TYPE_SHIFT)
#define SMMU_S2CR_TYPE_BYPASS   (1u << SMMU_S2CR_TYPE_SHIFT)
#define SMMU_S2CR_TYPE_FAULT    (2u << SMMU_S2CR_TYPE_SHIFT)

/* sCR0's bits, with the names arm-smmu.c:95-101 gives them (no ARM_SMMU_ prefix there). */
#define SMMU_sCR0_CLIENTPD      (1u << 0)       /* 1: the client port is disabled, no translation */
#define SMMU_sCR0_GFRE          (1u << 1)

/* What a stream's S2CR says, in words, so the log does not need the shift. */
static const char *
s2cr_type(const uint32_t value)
{
	switch (value & SMMU_S2CR_TYPE_MASK) {
	case SMMU_S2CR_TYPE_TRANS:
		return "TRANSLATE (addresses go through the context bank below)";
	case SMMU_S2CR_TYPE_BYPASS:
		return "BYPASS (addresses pass through untranslated)";
	case SMMU_S2CR_TYPE_FAULT:
		return "FAULT (unmapped: any access through this stream faults)";
	default:
		return "reserved";
	}
}

static bool
step_smmu_state(void)
{
	uint32_t scr0, id0, id1, gfsr;
	uint32_t smr0, s2cr0;
	bool bypass;

	announce("the SMMU in front of the GPU (arm,smmu-kgsl@5040000): what it is, and what it does to the GPU's stream");

	scr0 = get(&smmu, "sCR0", SMMU_sCR0);
	get(&smmu, "sCR2", SMMU_sCR2);
	id0 = get(&smmu, "ID0", SMMU_ID0);
	id1 = get(&smmu, "ID1", SMMU_ID1);
	get(&smmu, "ID7", SMMU_ID7);
	gfsr = get(&smmu, "sGFSR", SMMU_sGFSR);
	get(&smmu, "sGFSYNR0", SMMU_sGFSYNR0);
	get(&smmu, "sGFSYNR1", SMMU_sGFSYNR1);

	/*
	 * ID0's low byte is how many stream mapping registers there are (arm-smmu.c:131-132), and
	 * ID1's top three bits how many 4 KiB pages of context banks minus one (:135-136). Printed
	 * because they are the two numbers that say whether a stream *can* be mapped at all.
	 */
	say("chiron-adreno: %u: SMMU: %u stream mapping registers, %u context-bank pages, sCR0 %#010x%s\n",
	    step, id0 & 0xffu, ((id1 >> 28) & 0x7u) + 1, scr0,
	    (scr0 & SMMU_sCR0_CLIENTPD) ? " (client port DISABLED)" : "");

	/* The GPU's stream id is 0 (chiron.dts:10289 iommus = <0x1a7 0x00>). */
	smr0 = get(&smmu, "SMR(0)", SMMU_SMR(0));
	s2cr0 = get(&smmu, "S2CR(0)", SMMU_S2CR(0));
	say("chiron-adreno: %u: stream 0: SMR %#010x%s, S2CR %#010x -> %s\n", step, smr0,
	    (smr0 & 1u) ? " (valid)" : " (not valid)", s2cr0, s2cr_type(s2cr0));

	bypass = (s2cr0 & SMMU_S2CR_TYPE_MASK) == SMMU_S2CR_TYPE_BYPASS;
	if (gfsr != 0) {
		say("chiron-adreno: %u: NOTE: the SMMU's global fault status is not zero (%#010x):\n"
		    "chiron-adreno: %u:   something faulted through it already, before this kernel.\n", step, gfsr, step);
	}

	/*
	 * Say which world this is, in one line, because everything in steps 3-5 rests on it.
	 */
	if (bypass) {
		say("chiron-adreno: %u: GPU STREAM 0 IS BYPASSED: physical addresses reach the GPU unchanged.\n"
		    "chiron-adreno: %u:   Steps 3-5 hand the GPU kvtophys() addresses, so this is the state\n"
		    "chiron-adreno: %u:   they need -- but nothing in this driver put it there: qcom,skip-init\n"
		    "chiron-adreno: %u:   (chiron.dts:6139) means Linux does not touch it either, so it is the\n"
		    "chiron-adreno: %u:   boot loader's doing and could be something else on another boot.\n",
		    step, step, step, step, step);
	} else {
		say("chiron-adreno: %u: GPU STREAM 0 IS NOT BYPASSED (S2CR %#010x: %s).\n"
		    "chiron-adreno: %u:   THE ADDRESSES STEPS 3-5 USE WILL NOT MEAN WHAT THIS DRIVER THINKS.\n"
		    "chiron-adreno: %u:   Those steps hand the GPU physical addresses and rely on them arriving\n"
		    "chiron-adreno: %u:   unchanged. With a translating stream they are interpreted as addresses\n"
		    "chiron-adreno: %u:   in whatever page table context bank %u holds -- or fault. If steps 3-5\n"
		    "chiron-adreno: %u:   reported failure while this line says NOT BYPASSED, the failure is here,\n"
		    "chiron-adreno: %u:   not in the microcode or the ring. A context has to be built first.\n",
		    step, s2cr0, s2cr_type(s2cr0), step, step, step, step, s2cr0 & SMMU_S2CR_CBNDX_MASK, step, step);
	}

	if (scr0 & SMMU_sCR0_CLIENTPD) {
		say("chiron-adreno: %u: NOTE: CLIENTPD is set, so the SMMU's client port is disabled and nothing\n"
		    "chiron-adreno: %u:   is translated no matter what the S2CR says -- which also means the\n"
		    "chiron-adreno: %u:   stream state above is what the next kernel to enable it will inherit.\n",
		    step, step, step);
	}
	return true;
}

/* ====================================================================================================
 * step 7: the zap shader -- TrustZone authenticates it, and it is what lets the 3D core leave
 * secure mode
 * ==================================================================================================== */

/*
 * A GPU comes up in secure mode. Whether a kernel may take it out of secure mode is decided by
 * TrustZone, and what TrustZone wants first is a signed "zap shader" for this GPU started
 * through it: dt: qcom,kgsl-hyp (chiron.dts:10097-10100),
 *
 *   qcom,pas-id = <0x0d>;                -- 13, the same number redwood's driver uses for the GPU
 *   qcom,firmware-name = "a540_zap";
 *
 * Note the name: a540_zap, not a530_zap. The CP microcode may be a530's, but the zap shader is
 * not -- it is the image that unlocks this particular 3D core.
 *
 * This is the PIL "auth and reset" sequence, and redwood's driver already does the whole of it
 * through a bare SMC (bsd/dev/redwood_adreno.c:1503-1550 for the call, :2639-2697 for the
 * sequence). Nothing of that is a6xx-specific -- it is TrustZone's interface -- so the same
 * calls apply here with a different image, which is the cheapest kind of reuse: the mechanism
 * carries over, only the file name changes.
 *
 *   1. PAS_SHUTDOWN          give up any zap shader a previous kernel left behind
 *   2. PAS_INIT_IMAGE        hand TrustZone the image's header (the ELF header and the block of
 *                            hashes and certificates); it checks the signature
 *   3. PAS_MEM_SETUP         tell it where the image will be in memory
 *   4. (write the image there)
 *   5. PAS_AUTH_AND_RESET    authenticate it and start it
 *
 * The values of the call numbers are Qualcomm's (qcom_scm-smc.c is the convention):
 *   SCM_SIP (2 << 24) is "a call of the SoC maker's, not one of Arm's standard ones"
 *   service 2, command 1 = PAS_INIT_IMAGE; 2 = MEM_SETUP; 5 = AUTH_AND_RESET; 6 = SHUTDOWN
 *   the argument descriptor: 1 = one plain number, 3 = three, (2 | 2 << 6) = a number and a
 *   buffer address
 * These are redwood_adreno.c:1503-1514 and :2625-2626, unchanged.
 */
#define SCM_FAST                (1ull << 31)
#define SCM_64                  (1ull << 30)
#define SCM_SIP                 (2ull << 24)
#define SCM_CALL(service, command) ((uint64_t)(service) << 8 | (command))
#define SCM_PAS_INIT_IMAGE      SCM_CALL(2, 1)
#define SCM_PAS_MEM_SETUP       SCM_CALL(2, 2)
#define SCM_PAS_AUTH_AND_RESET  SCM_CALL(2, 5)
#define SCM_PAS_SHUTDOWN        SCM_CALL(2, 6)
#define SCM_IS_CALL_AVAILABLE   SCM_CALL(6, 1)
#define SCM_ONE_VALUE           1
#define SCM_THREE_VALUES        3
#define SCM_VALUE_AND_BUFFER    (2 | 2 << 6)
#define SCM_INTERRUPTED         1
#define PAS_GPU                 13      /* chiron.dts:10099, and redwood_adreno.c:1515 */

/*
 * The image goes into memory TrustZone is pointed at. redwood's driver reserves
 * 0x8b71a000 (redwood_adreno.c:2623) -- that is a redwood address and means nothing here.
 * chiron needs one of its own, and this driver does not know the phone's memory map well enough
 * to invent one, so it takes it from the loader: boot-arg chiron_zap_mem=<physical address>.
 * Without it the step says so and stops, which is the honest outcome -- writing a signed image
 * to an address chosen by guesswork is how a machine gets wedged.
 */
static uint64_t zap_memory;             /* physical, from chiron_zap_mem= */
#define ZAP_MEMORY_SIZE         0x2000u /* what redwood reserves; the segment must fit */

/*
 * The zap shader's header: a 32-bit ELF, of which TrustZone checks the signature. Redwood reads
 * fw/a660_zap.mdt for it (redwood_adreno.c:1644-1680) and describes the layout it validates:
 * the segment count at offset 44, the table at 52, 32 bytes each. Same reader shape here, with
 * this phone's file: fw/a540_zap.mdt.
 */
extern vm_offset_t ml_io_map_wcomb(vm_offset_t phys_addr, vm_size_t size);

/* One secure-monitor call. What TrustZone returns: 0 or an error of its own, and a word of answer. */
static int32_t
scm(const char *what, uint64_t function, uint64_t arguments, uint64_t first, uint64_t second,
    uint64_t third, uint64_t *answer)
{
	uint64_t session = 0;

	say("chiron-adreno: %u: about to ask TrustZone %s: smc %#llx, arguments %#llx, %#llx, %#llx\n",
	    step, what, (unsigned long long)function, (unsigned long long)first,
	    (unsigned long long)second, (unsigned long long)third);
	for (int i = 0; i < 100; i++) {
		register uint64_t x0 __asm__("x0") = i == 0 ? function : SCM_INTERRUPTED;
		register uint64_t x1 __asm__("x1") = arguments;
		register uint64_t x2 __asm__("x2") = first;
		register uint64_t x3 __asm__("x3") = second;
		register uint64_t x4 __asm__("x4") = third;
		register uint64_t x5 __asm__("x5") = 0;
		register uint64_t x6 __asm__("x6") = session;
		register uint64_t x7 __asm__("x7") = 0;

		__asm__ volatile ("smc #0" : "+r" (x0), "+r" (x1), "+r" (x2), "+r" (x3), "+r" (x4),
		    "+r" (x5), "+r" (x6), "+r" (x7)
		    : : "x8", "x9", "x10", "x11", "x12", "x13", "x14", "x15", "x16", "x17", "memory");
		session = x6;
		if (x0 != SCM_INTERRUPTED) {
			say("chiron-adreno: %u: TrustZone returns %d, (unsigned long long)answer %#llx\n", step, (int32_t)x0,
		    (unsigned long long)x1);
			*answer = x1;
			return (int32_t)x0;
		}
	}
	say("chiron-adreno: %u: TrustZone keeps saying the call was interrupted\n", step);
	return -1;
}

/*
 * Read the first lines of the zap image and say what they look like, before anything is handed
 * to TrustZone. The image that is here should be a 32-bit ELF; if it is not, saying so costs one
 * line and saves wondering why the signature call failed.
 */
static bool
zap_image(const uint8_t **image, uint64_t *size)
{
	const uint8_t *data = firmware_file("a540_zap.mdt", size);
	uint32_t segments;

	if (data == NULL) {
		return false;
	}
	if (*size < 52) {
		say("chiron-adreno: %u: fw/a540_zap.mdt is %llu bytes: too short to hold an ELF header\n",
		    step, (unsigned long long)*size);
		return false;
	}
	segments = *size >= 52 + 2 * 32 ? (uint32_t)(data[44] | data[45] << 8) : 0;
	say("chiron-adreno: %u: fw/a540_zap.mdt: %llu bytes, %02x %02x %02x %02x, %u segments\n", step,
	    (unsigned long long)*size, data[0], data[1], data[2], data[3], segments);
	if (data[0] != 0x7f || data[1] != 'E' || data[2] != 'L' || data[3] != 'F') {
		say("chiron-adreno: %u: that does not begin with \\177ELF, so it is not the image expected here\n", step);
		return false;
	}
	if (segments < 2) {
		say("chiron-adreno: %u: it says %u segments, fewer than the two this image has\n", step, segments);
		return false;
	}
	*image = data;
	return true;
}

static bool
step_zap(void)
{
	const uint8_t *image = NULL;
	uint64_t size = 0, answer = ~0ull;

	announce("the zap shader (a540_zap): asked of TrustZone through the same calls redwood uses");

	if (zap_memory == 0) {
		say("chiron-adreno: %u: no memory to put the image in: boot-arg chiron_zap_mem=<physical\n"
		    "chiron-adreno: %u:   address> was not given. This driver does not know chiron's memory map\n"
		    "chiron-adreno: %u:   well enough to pick an address, and writing a signed image to a guess is\n"
		    "chiron-adreno: %u:   how a machine gets wedged. Not attempted.\n", step, step, step, step);
		return false;
	}
	if (!zap_image(&image, &size)) {
		return false;
	}
	if (size > ZAP_MEMORY_SIZE) {
		say("chiron-adreno: %u: the image is %llu bytes, larger than the %u reserved for it\n",
		    step, (unsigned long long)size, ZAP_MEMORY_SIZE);
		return false;
	}

	/* 0. Whether TrustZone takes calls from this kernel at all -- the cheapest question first. */
	if (scm("whether it takes secure-monitor calls from this kernel",
	    SCM_FAST | SCM_64 | SCM_SIP | SCM_IS_CALL_AVAILABLE, SCM_ONE_VALUE,
	    SCM_SIP | SCM_IS_CALL_AVAILABLE, 0, 0, &answer) != 0 || answer != 1) {
		say("chiron-adreno: %u: TrustZone does not answer \"is this call available\" the way it answers\n"
		    "chiron-adreno: %u:   Linux, so nothing further is asked of it here\n", step, step);
		return false;
	}

	/* 1. Give up any zap shader a kernel before this one left. None is a success too. */
	answer = ~0ull;
	if (scm("to give up a zap shader a kernel before this one may have left",
	    SCM_64 | SCM_SIP | SCM_PAS_SHUTDOWN, SCM_ONE_VALUE, PAS_GPU, 0, 0, &answer) != 0 || answer != 0) {
		say("chiron-adreno: %u: TrustZone does not give it up (%#llx); the next answers say whether it\n"
		    "chiron-adreno: %u:   keeps one\n", step, (unsigned long long)answer, step);
	}

	/*
	 * 2. The signature. The header is handed over from the image itself, as redwood does: in
	 * this image the ELF header and its hash/certificate block are the first page, and that is
	 * what the call takes. It is passed by physical address, in one piece.
	 *
	 * If TrustZone refuses the signature or the place, redwood's driver reads that as "it already
	 * has a zap shader from before and keeps it" and carries on (redwood_adreno.c:2683-2694) --
	 * and says so rather than failing, because whether that is true is answered later, by
	 * whether the 3D core leaves secure mode.
	 */
	{
		vm_offset_t header_memory = 0;
		uint64_t header_phys;

		if (kmem_alloc(kernel_map, &header_memory, PAGE_SIZE,
		    KMA_KOBJECT | KMA_ZERO | KMA_DATA, VM_KERN_MEMORY_IOKIT) != KERN_SUCCESS || header_memory == 0) {
			say("chiron-adreno: %u: cannot allocate a page for the header\n", step);
			return false;
		}
		memcpy((void *)header_memory, image, size < PAGE_SIZE ? size : PAGE_SIZE);
		to_memory(header_memory, PAGE_SIZE);
		header_phys = kvtophys(header_memory);
		say("chiron-adreno: %u: the header: %llu bytes at %#llx (physical)\n", step,
		    (unsigned long long)(size < PAGE_SIZE ? size : PAGE_SIZE), (unsigned long long)header_phys);

		answer = ~0ull;
		if (scm("to take the zap shader's signature", SCM_64 | SCM_SIP | SCM_PAS_INIT_IMAGE,
		    SCM_VALUE_AND_BUFFER, PAS_GPU, header_phys, 0, &answer) != 0 || answer != 0) {
			say("chiron-adreno: %u: TrustZone does not take the signature (%#llx). Taken to mean it\n"
			    "chiron-adreno: %u:   keeps a zap shader from before, which is used as it is -- the 3D\n"
			    "chiron-adreno: %u:   core's own start is what will show whether that is so.\n", step, (unsigned long long)answer, step, step);
			return true;
		}

		/* 3. Where the image will be. */
		answer = ~0ull;
		if (scm("where the image will be", SCM_64 | SCM_SIP | SCM_PAS_MEM_SETUP, SCM_THREE_VALUES,
		    PAS_GPU, zap_memory, 0x1000, &answer) != 0 || answer != 0) {
			say("chiron-adreno: %u: TrustZone does not take the place (%#llx), same reading as above\n",
			    step, (unsigned long long)answer);
			return true;
		}

		/* 4. Put the image there. Only now: TrustZone has just said the memory is not its own. */
		{
			volatile uint8_t *memory =
			    (volatile uint8_t *)ml_io_map_wcomb(zap_memory, ZAP_MEMORY_SIZE);

			say("chiron-adreno: %u: reserved memory at %#llx begins %02x %02x %02x %02x\n", step,
			    (unsigned long long)zap_memory, memory[0], memory[1], memory[2], memory[3]);
			say("chiron-adreno: %u: about to write %llu bytes there\n", step, (unsigned long long)size);
			for (uint64_t i = 0; i < ZAP_MEMORY_SIZE; i++) {
				memory[i] = i < size ? image[i] : 0;
			}
			__asm__ volatile ("dsb sy" : : : "memory");
		}
	}

	/* 5. Authenticate and run it. */
	answer = ~0ull;
	if (scm("to authenticate the zap shader and run it", SCM_64 | SCM_SIP | SCM_PAS_AUTH_AND_RESET,
	    SCM_ONE_VALUE, PAS_GPU, 0, 0, &answer) != 0 || answer != 0) {
		say("chiron-adreno: %u: TrustZone does not authenticate the zap shader (%#llx). Without it the\n"
		    "chiron-adreno: %u:   3D core stays in secure mode: a start is still worth trying, because\n"
		    "chiron-adreno: %u:   whether a kernel may leave secure mode is TrustZone's to decide, not this\n"
		    "chiron-adreno: %u:   driver's -- but expect it to be refused.\n", step, (unsigned long long)answer, step, step, step);
		return false;
	}
	say("chiron-adreno: %u: TRUSTZONE HAS AUTHENTICATED AND STARTED THE ZAP SHADER\n", step);
	return true;
}

/*
 * Say that this driver is here, and which build of it: a string only this file has, made at
 * compile time, so a kernel that prints it has this code in it and not a stale copy.
 */
void
chiron_adreno_init(void)
{
	uint32_t asked = 0;

	say("chiron-adreno: Adreno 540 (a5xx) driver present, built %s %s, steps up to %u\n",
	    __DATE__, __TIME__, CHIRON_ADRENO_STEP);
	/*
	 * Two numbers that make the address conventions checkable from the log alone, because a
	 * mistake there is silent rather than loud: a5xx_reg.h's RBBM_STATUS 0x4F5 is byte 0x13D4
	 * in the GPU block (dword index), while the device tree's gpu_cx_gdsc 0x5066004 is 0x1004
	 * past gpucc@5065000 (byte offset). Both are asserted here rather than trusted.
	 */
	say("chiron-adreno: addressing: kgsl 0x%x + RBBM_STATUS(%#x)*4 = 0x%x; gpucc 0x%x + 0x%x = 0x%x\n",
	    kgsl.phys, RBBM_STATUS, gpureg_phys(RBBM_STATUS),
	    gpucc.phys, GPUCC_CX_GDSCR, (uint32_t)(gpucc.phys + GPUCC_CX_GDSCR));

	/* Nothing happens unless a boot-arg asks for it, as in redwood_adreno.c. */
	if (!PE_parse_boot_argn("chiron_gpu", &asked, sizeof(asked)) || asked == 0) {
		say("chiron-adreno: nothing done (boot-arg chiron_gpu=1 asks for it)\n");
		return;
	}
	/*
	 * Where the zap shader's image goes. This driver does not know chiron's memory map well
	 * enough to reserve an address itself, so it comes from the loader; step 7 refuses without
	 * it rather than writing a signed image to a guess.
	 */
	PE_parse_boot_argn("chiron_zap_mem", &asked, sizeof(asked));
	zap_memory = asked;

	for (step = 1; step <= CHIRON_ADRENO_STEP; step++) {
		bool ok;

		switch (step) {
		case 1:
			ok = step_buses() && step_gpucc();
			if (ok) {
				step_counter();
			}
			break;
		case 2:
			ok = step_power() && step_gfx3d_clock();
			if (ok) {
				step_counter_after_power();
			}
			break;
		case 3:
			/*
			 * RBBM is set either way; only the micro engine needs microcode. A step that
			 * cannot start the engine still reports what RBBM holds, because that is most of
			 * what can be verified without one -- so "no microcode" is not a failure of the
			 * step, it is a smaller step.
			 */
			ok = step_microcode();
			step_rbbm();
			if (ok) {
				ok = step_core_start();
			} else {
				say("chiron-adreno: %u: RBBM was set and read back; the micro engine was not started\n", step);
			}
			/*
			 * Remembered for step 4: what it needs is not "step 3 passed" but "the engine is
			 * running", which is a narrower thing and the one it should act on.
			 */
			core_started = ok;
			break;
		case 4:
			/* A ring with no running engine would only write into memory nothing reads. */
			if (!core_started) {
				say("chiron-adreno: %u: the micro engine is not running, so a ring would not be read:\n"
				    "chiron-adreno: %u:   this step is not attempted. That is the finding, not a skip.\n",
				    step, step);
				ok = false;
				break;
			}
			ok = step_ring();
			break;
		case 5:
			/* The GPMU's firmware goes in through the CP, so a working ring is required. */
			if (!core_started) {
				say("chiron-adreno: %u: the command processor is not running, so the GPMU's\n"
				    "chiron-adreno: %u:   firmware cannot be written into it. Not attempted.\n", step, step);
				ok = false;
				break;
			}
			ok = step_gpmu();
			break;
		case 6:
			/* Read-only, and useful even when everything before it failed: it says why. */
			ok = step_smmu_state();
			break;
		case 7:
			/*
			 * The zap shader. Written from redwood's sequence, and NOT VERIFIED: the image
			 * (a540_zap.mdt) and the memory it goes into both have to come from the phone, and
			 * neither is available here. The step refuses rather than guessing when either is
			 * missing, which is the only honest thing an unverified step can do.
			 */
			ok = step_zap();
			break;
		default:
			ok = false;
			break;
		}
		if (!ok) {
			say("chiron-adreno: step %u: FAILED; the steps after it are not attempted\n", step);
			return;
		}
		say("chiron-adreno: step %u: done\n", step);
	}
}
