/*
 * chiron (Xiaomi Mi MIX 2, MSM8998). Paste into xnuloader/loader.c next to
 * platform_redwood and add &platform_chiron to platforms[].
 * Every value is explained in docs/PORTING.md ("The loader").
 *
 * From the phone's device tree (Android-chiron.dtb):
 *   arm,gic-v3 reg = <0x17a00000 0x10000 0x17b00000 0x100000>
 *   cpu@0..3 (reg 0..3, efficiency 0x400) and cpu@100..103 (reg 0x100.., 0x600)
 */
static const struct platform platform_chiron = {
	.name = "chiron",
	/* apq8096/msm8998 peripherals live in 0x00000000-0x1FFFFFFF; a non-zero base
	 * keeps XNU from thinking there is no clock hardware (docs/PORTING.md). */
	.io_base = 0x00400000, .io_size = 0x1FC00000,

	.gic_dist = 0x17a00000,
	.gic_redist = 0x17b00000,

	.cores = 8,
	/* Qualcomm numbers cores in MPIDR's second affinity field: 0x100, 0x101... */
	.core_shift = 8,
	/* the little cluster: cpu@0..3 (efficiency 0x400 vs 0x600) */
	.small_cores = 0x0F,

	/* phones call PSCI with SMC; QEMU uses HVC */
	.psci_hvc = 0,

	.fb_base = 0x9D400000,
};
