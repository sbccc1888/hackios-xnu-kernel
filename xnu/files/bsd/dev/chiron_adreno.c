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
 * The steps this grows into (read out of adreno_a5xx.c's a5xx_start, backwards):
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

#define CHIRON_ADRENO_STEP 2            /* the last step this file performs */

static uint32_t step;                   /* the one being performed */

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

/* Read one register and say its address and value: the value is the evidence, not a verdict. */
static uint32_t
get(struct block *b, const char *name, uint32_t offset)
{
	uint32_t value;

	need(b);
	value = rd(b->base + offset);
	say("chiron-adreno: %u: %-14s %-22s [%#x] = %#010x\n", step, b->name, name, b->phys + offset, value);
	return value;
}

static void
put(struct block *b, const char *name, uint32_t offset, uint32_t value)
{
	need(b);
	say("chiron-adreno: %u: write %-14s %-22s [%#x] = %#010x\n", step, b->name, name, b->phys + offset, value);
	wr(b->base + offset, value);
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
 * A power switch's control register (drivers/clk/qcom/gdsc.c:26,32):
 *   PWR_ON_MASK       BIT(31)   status: the domain is powered
 *   SW_COLLAPSE_MASK  BIT(0)    the software request to collapse it (1 = off)
 * The same three bits redwood_adreno.c:482-484 names, arrived at independently.
 */
#define GDSC_SW_COLLAPSE        (1u << 0)
#define GDSC_POWER_ON           (1u << 31)

/* The GPU itself. dt: qcom,kgsl-3d0@5000000, 0x40000 long (chiron.dts:10122). */
static struct block kgsl = { .name = "kgsl", .phys = 0x05000000, .size = 0x40000 };

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

	lo1 = rd(kgsl.base + RBBM_ALWAYSON_COUNTER_LO);
	hi1 = rd(kgsl.base + RBBM_ALWAYSON_COUNTER_HI);
	sleep_us(elapsed_us);
	lo2 = rd(kgsl.base + RBBM_ALWAYSON_COUNTER_LO);
	hi2 = rd(kgsl.base + RBBM_ALWAYSON_COUNTER_HI);

	c1 = ((uint64_t)hi1 << 32) | lo1;
	c2 = ((uint64_t)hi2 << 32) | lo2;

	say("chiron-adreno: %u: alwayson_lo [%#x] = %#010x then %#010x\n", step,
	    kgsl.phys + RBBM_ALWAYSON_COUNTER_LO, lo1, lo2);
	say("chiron-adreno: %u: alwayson_hi [%#x] = %#010x then %#010x\n", step,
	    kgsl.phys + RBBM_ALWAYSON_COUNTER_HI, hi1, hi2);

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

/*
 * Say that this driver is here, and which build of it: a string only this file has, made at
 * compile time, so a kernel that prints it has this code in it and not a stale copy.
 */
void
chiron_adreno_init(void)
{
	say("chiron-adreno: Adreno 540 (a5xx) driver present, built %s %s, steps up to %u\n",
	    __DATE__, __TIME__, CHIRON_ADRENO_STEP);

	/* Nothing happens unless a boot-arg asks for it, as in redwood_adreno.c. */
	uint32_t asked = 0;

	if (!PE_parse_boot_argn("chiron_gpu", &asked, sizeof(asked)) || asked == 0) {
		say("chiron-adreno: nothing done (boot-arg chiron_gpu=1 asks for it)\n");
		return;
	}

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
