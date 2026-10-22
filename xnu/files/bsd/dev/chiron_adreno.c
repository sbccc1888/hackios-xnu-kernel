/*
 * The GPU of the Xiaomi Mi MIX 2 (chiron), an Adreno 540 -- architecture a5xx, where the
 * POCO X5 Pro (redwood) whose driver this port began from is a6xx. The two are far enough
 * apart that this is a driver of its own (bsd/dev/chiron_adreno.c) rather than a set of
 * addresses changed in redwood's, and it is built one verifiable step at a time.
 *
 * Step 0 (this file, so far) touches no hardware at all. It exists to prove, before any
 * address of the phone is written, that this file really is compiled into the kernel and
 * that what it says reaches the log: the port this one follows lost a whole patch to a
 * "[warning] Skipping patch" and built green without a line of it. A version string that
 * only a successful compile can produce, printed once at start, answers that in one run.
 *
 * Where the numbers come from, when there are numbers (nothing here yet):
 *   the phone's own device tree, /root/chiron.dts (decompiled Android-chiron.dtb):
 *     qcom,kgsl-3d0@5000000 (0x5000000), qcom,gpucc@5065000, qcom,gdsc@5066004 and
 *     @5066094, arm,smmu-kgsl@5040000, qcom,kgsl-hyp (pas-id 13, "a540_zap")
 *   the vendor kernel's GPU driver, /root/src/kernel_msm8998/drivers/gpu/msm/:
 *     adreno_a5xx.c, a5xx_reg.h, adreno-gpulist.h
 *   its clock driver, drivers/clk/msm/clock-gpu-8998.c, and the register offsets of
 *     include/dt-bindings/clock/msm-clocks-hwio-8998.h
 *   the upstream one, drivers/gpu/drm/msm/adreno/a5xx_gpu.c, a5xx_power.c
 * Every one of those is cited by file and line where it is used.
 *
 * The steps this will grow into (adreno_a5xx.c, the vendor's, read backwards):
 *   1  the clocks outside the GPU: gcc_gpu_cfg_ahb (gcc + 0x71004)
 *   2  the GPU's clock controller read as the boot loader left it (gpucc + 0x9000)
 *   3  CX and GX powered (gpucc + 0x1004, + 0x1094), the 3D clock source at its lowest
 *      rate, and the always-on counter of the GPU block seen to count
 *   4  RBBM initialised as a540 wants it, the CP's microcode in place, the micro engine
 *      out of halt -- the first step that proves the 3D core itself is running
 *   5  a ringbuffer, CP_ME_INIT, and out of secure mode
 *   6  the GPMU: a540_gpmu.fw2 through PM4 into its instruction RAM, then 0xBABEFACE
 *
 * Each step announces what it is about to touch before it touches it, and stops the
 * sequence rather than going on blind -- an access the hypervisor does not like ends the
 * run, at once or a quarter of a minute later, and often without a word
 * (bsd/dev/redwood_adreno.c, the note at the top of it).
 */
#include <libkern/libkern.h>
#include <mach/mach_types.h>
#include <pexpert/pexpert.h>
#include <sys/systm.h>

/*
 * The kernel's log reaches the loader when a run is over, and a run that ends in a reset
 * without a word leaves none. The loader also reads a log of the kernel's from another core
 * while it runs, so every line said here goes there as well, before anything else happens
 * (osfmk/arm64/loader_return.c:88).
 */
extern void loader_log_putc(char c);

#define CHIRON_ADRENO_STEP 0            /* the last step this file performs */

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

/*
 * Say that this driver is here, and which build of it: a string only this file has, made at
 * compile time, so a kernel that prints it has this code in it and not a stale copy.
 *
 * Nothing is read and nothing is written: not one address of the phone is touched. The next
 * step does that, and it will say so first.
 */
void
chiron_adreno_init(void)
{
	say("chiron-adreno: Adreno 540 (a5xx) driver present, built %s %s, steps up to %u\n",
	    __DATE__, __TIME__, CHIRON_ADRENO_STEP);
	say("chiron-adreno: no step is performed yet: this line only proves the file is in the kernel\n");
}
