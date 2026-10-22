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

#define CHIRON_ADRENO_STEP 1            /* the last step this file performs */

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
