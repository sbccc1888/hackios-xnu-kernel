#!/usr/bin/env python3
"""Check every register constant in bsd/dev/chiron_adreno.c against the vendor's a5xx_reg.h.

WHY THIS EXISTS. Two of the three defects in that driver during its writing were address
mistakes that compiled cleanly and would have produced plausible output:

  - every GPU-block offset treated as bytes instead of dword indices (the vendor's accessor is
    `reg_virt + (offsetwords << 2)`), which moves every access four registers to the left --
    still inside the 0x40000-byte block, so nothing faults, and the driver reports "the GPU did
    not start" with every number in the log looking reasonable;
  - the PM4 parity bit computed over seven bits instead of the word.

Neither is caught by a compiler. This script catches the first mechanically: for every
`#define NAME 0xNNN` in the driver, it requires the same number to appear as `A5XX_NAME` in
a5xx_reg.h, then prints the byte address the driver will actually touch and requires it to fall
inside the GPU's register block.

usage: tools/verify_regs.py [--vnsrc PATH]
       --vnsrc  a kernel tree with drivers/gpu/msm/a5xx_reg.h
                (default: $VNSRC, else ../../src/kernel_msm8998 — where this port keeps the
                LineageOS tree it reads the vendor driver from)

Exit status is non-zero if any constant disagrees, any byte address falls outside the block, or
a name is defined in the driver and nowhere in the vendor header without being listed in
NOT_FROM_REG_H below.
"""
import argparse
import os
import re
import sys

DRIVER = os.path.join(os.path.dirname(os.path.abspath(__file__)),
                      "..", "xnu", "files", "bsd", "dev", "chiron_adreno.c")
KGSL_BASE, KGSL_SIZE = 0x05000000, 0x40000

# Registers the driver defines that do not come from a5xx_reg.h. Each is either a PM4 opcode
# (an operand of a type-7 packet, not a register), a value computed from source rather than
# copied, or an offset from the clock controller's or the device tree's byte convention --
# which is checked separately and must NOT be shifted.
NOT_FROM_REG_H = {
    # PM4 opcodes and packet type tags (adreno_pm4types.h)
    "CP_ME_INIT", "CP_INTERRUPT", "CP_TYPE7_PKT", "CP_TYPE4_PKT",
    # computed from the vendor's own expressions, with the arithmetic written out beside them
    "CP_RB_CNTL_DEFAULT", "RING_SIZE", "A540_GMEM_SIZE", "A540_HIGHEST_BANK_BIT",
    "UCODE_HEADER_DWORDS",
    # from adreno.h / adreno_a5xx.h / adreno-gpulist.h
    "UCHE_GMEM_BASE", "GPMU_FIRMWARE_ID", "GPMU_INST_RAM_SIZE", "GPMU_FW_INIT_RETRY",
    "GPMU_INT_FIRMWARE", "GPMU_ASKED_MAJOR", "GPMU_ASKED_MINOR", "GDSC_TIMEOUT_US",
    # byte offsets: the clock controller (msm-clocks-hwio-8998.h, used unshifted by
    # clock-local2.c) and the driver's own bookkeeping
    "GPUCC_CX_GDSCR", "GPUCC_CX_HW_CTRL", "GPUCC_CX_HW_CTRL_UNUSED",
    "GPUCC_GX_GDSCR", "GPUCC_GX_SW_RESET", "GPUCC_GX_DOMAIN_MISC",
    "GPUCC_GPU_PLL0_PLL_MODE", "GPUCC_GPU_PLL0_USER_CTL", "GPUCC_GPU_DD_WRAP_CTRL",
    "GPUCC_GFX3D_CMD_RCGR", "GPUCC_GFX3D_CFG_RCGR", "GPUCC_GFX3D_CBCR",
    "GPUCC_CXO_CBCR", "GPUCC_RBBMTIMER_CBCR", "GPUCC_GFX3D_ISENSE_CBCR", "GPUCC_RBCPR_CBCR",
    "GCC_GPU_CFG_AHB_CBCR", "CHIRON_ADRENO_STEP",
    # the SMMU's own registers, byte offsets from drivers/iommu/arm-smmu.c:94-176, verified
    # separately against that file (they are not part of the GPU's block at all)
    "SMMU_sCR0", "SMMU_sCR2", "SMMU_ID0", "SMMU_ID1", "SMMU_ID7",
    "SMMU_sGFSR", "SMMU_sGFSYNR0", "SMMU_sGFSYNR1",
    "SMMU_sCR0_CLIENTPD", "SMMU_sCR0_GFRE",
    "SMMU_S2CR_CBNDX_SHIFT", "SMMU_S2CR_CBNDX_MASK", "SMMU_S2CR_TYPE_SHIFT",
    "SMMU_S2CR_TYPE_MASK", "SMMU_S2CR_TYPE_TRANS", "SMMU_S2CR_TYPE_BYPASS",
    "SMMU_S2CR_TYPE_FAULT", "PLL_MODE_LOCK", "PLL_MODE_ACTIVE",
    # clock-controller bit fields (clock-local2.c conventions)
    "CBCR_ENABLE", "CBCR_OFF", "GDSC_SW_COLLAPSE", "GDSC_POWER_ON", "GDSC_HW_CONTROL",
    "GDSC_SW_OVERRIDE", "GMEM_CLAMP_IO_MASK", "GMEM_RESET_MASK", "BCR_BLK_ARES_BIT",
    "CMD_RCGR_ROOT_ENABLE", "CMD_RCGR_UPDATE", "CFG_RCGR_DIV_SRC_MASK",
    # SCM/PAS call numbers (qcom_scm-smc.c convention)
    "SCM_FAST", "SCM_64", "SCM_SIP", "SCM_PAS_INIT_IMAGE", "SCM_PAS_MEM_SETUP",
    "SCM_PAS_AUTH_AND_RESET", "SCM_PAS_SHUTDOWN", "SCM_IS_CALL_AVAILABLE",
    "SCM_ONE_VALUE", "SCM_THREE_VALUES", "SCM_VALUE_AND_BUFFER", "SCM_INTERRUPTED",
    "PAS_GPU", "ZAP_MEMORY_SIZE", "SMMU_all_zero",
}


def parse_defines(path):
    out = {}
    with open(path, errors="surrogateescape") as f:
        for line in f:
            m = re.match(r"#define\s+(\w+)\s+(?:0x([0-9a-fA-F]+)|(\d+))\b", line)
            if m:
                out[m.group(1)] = int(m.group(2), 16) if m.group(2) else int(m.group(3))
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--vnsrc", default=os.environ.get(
        "VNSRC", os.path.join(os.path.dirname(os.path.abspath(__file__)),
                              os.pardir, os.pardir, "src", "kernel_msm8998")))
    args = ap.parse_args()

    vendor_path = os.path.join(args.vnsrc, "drivers", "gpu", "msm", "a5xx_reg.h")
    if not os.path.exists(vendor_path):
        sys.exit(f"verify_regs: no a5xx_reg.h under {args.vnsrc} (use --vnsrc)")

    vendor = parse_defines(vendor_path)
    driver = parse_defines(DRIVER)

    rows, mismatch, outside, unknown = [], [], [], []
    for name, val in sorted(driver.items()):
        vname = "A5XX_" + name
        if vname in vendor:
            byte = val << 2
            addr = KGSL_BASE + byte
            rows.append((name, val, vendor[vname], byte, addr, KGSL_BASE <= addr < KGSL_BASE + KGSL_SIZE))
            if vendor[vname] != val:
                mismatch.append((name, val, vendor[vname]))
            if not (KGSL_BASE <= addr < KGSL_BASE + KGSL_SIZE):
                outside.append((name, addr))
        elif name not in NOT_FROM_REG_H:
            unknown.append((name, val))

    print(f"compared with a5xx_reg.h: {len(rows)} registers")
    print(f"  {'name':28s} {'driver':>9s} {'a5xx_reg.h':>11s} {'byte':>9s} {'address':>11s}  in block")
    for name, val, vval, byte, addr, inside in rows:
        print(f"  {name:28s} 0x{val:07x} 0x{vval:11x} 0x{byte:08x} 0x{addr:08x}  "
              f"{'yes' if inside else 'NO'}{'' if val == vval else '   <-- MISMATCH'}")

    print()
    if unknown:
        print(f"defined in the driver, absent from a5xx_reg.h, not listed as known ({len(unknown)}):")
        for n, v in unknown:
            print(f"    {n} = 0x{v:x}")
    print(f"mismatches against the header: {len(mismatch)}")
    for n, a, b in mismatch:
        print(f"    {n}: driver 0x{a:x}, header 0x{b:x}")
    print(f"byte addresses outside {KGSL_BASE:#x}..{KGSL_BASE + KGSL_SIZE - 1:#x}: {len(outside)}")
    for n, a in outside:
        print(f"    {n} -> 0x{a:08x}")

    if mismatch or outside or unknown:
        return 1
    print(f"OK: every a5xx_reg.h-derived offset agrees, and every byte address is in the GPU's block")
    return 0


if __name__ == "__main__":
    sys.exit(main())
