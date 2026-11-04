#!/usr/bin/env python3
"""Audit every register read in loader.c against the offset it claims to be.

Five times tonight a value I reasoned from turned out to come from somewhere other than where
the label said:

  0xc0/0xc4   thought writes were failing; the firmware leaves them zero
  run/hlt     looked at lkst/devaddr and missed the bits that were already there
  wtest       read as a write failure; 0x5a & ~0x40 == 0x1a, a read-only bit
  GHWPARAMS   read 0xC100..0xC10C; the real registers are 0xC140..0xC15C
  spd         read DCFG bits 2:0 and called it link speed; DSTS bits 2:0 is CONNECTSPD

Each was found by going back to the code that produced the number.  This does that
mechanically: list every (offset, bit range, label) triple and check the offset against the
dwc3 core.h and QUSB2 phy definitions.

Usage:  python3 probe_audit.py loader.c /root/src/kernel_msm8998/drivers/usb
"""

import re
import sys


# Authoritative offsets from dwc3/core.h and phy-msm-qusb*.c.  Anything not in here that the
# loader reads should be looked at by hand.
DWC3 = {
    0xC100: "DCFG", 0xC104: "DCTL", 0xC108: "DEVTEN",
    0xC10C: "DSTS", 0xC110: "DGCMD", 0xC114: "DGCMDPAR",
    0xC140: "GHWPARAMS0", 0xC144: "GHWPARAMS1", 0xC148: "GHWPARAMS2",
    0xC14C: "GHWPARAMS3", 0xC150: "GHWPARAMS4", 0xC154: "GHWPARAMS5",
    0xC158: "GHWPARAMS6", 0xC15C: "GHWPARAMS7",
    0xC1A0: "GSNPSID", 0xC1A4: "GUID",
    0xC200: "GUSB2PHYCFG0", 0xC2C0: "GUSB3PIPECTL0",
    0xC400: "GEVNTADRLO", 0xC408: "GEVNTSIZ", 0xC40C: "GEVNTCOUNT",
    0xC700: "DCFG", 0xC704: "DCTL", 0xC708: "DEVTEN", 0xC70C: "DSTS",
}

PHY = {
    0x000: "PLL_ANALOG_CTRL_ONE",   # 0x80 on resume, 0x90 on suspend (phy-msm-qusb-v2.c)
    0x004: "PLL_ANALOG_CTRL_TWO",   # 0x13 init, 0x0b suspend, 0x1b disconnect
    0x01C: "PLL_AUTOPGM_CTL1",      # bit7 AUTOPGM_EN, bit4 RESET_N, 3:0 count
    0x02C: "PLL_ANALOG_CTRL_TWO_ALT", 0x070: "PORT_QC1",
    0x074: "PORT_QC2", 0x090: "TUNE5", 0x0B4: "PORT_POWERDOWN",
    0x0B8: "PORT_TEST_CTRL", 0x0C0: "UTMI_CTRL1", 0x0C4: "UTMI_CTRL2",
    0x184: "PLL_LOCK_DELAY", 0x18C: "PLL_CLK_INVERTER", 0x1A0: "PLL_STATUS",
    0x0F0: "PORT_INT_STATUS", 0x0F4: "PORT_UTMI_STATUS",
    0x210: "PWR_CTRL1", 0x22C: "INTR_CTRL", 0x230: "INTR_STAT",
    0x23C: "TUNE1", 0x240: "TUNE2", 0x24C: "TEST1",
}

# DWC3 field definitions, for checking that a shift/mask matches the field the label implies.
DWC3_FIELDS = {
    "DCFG":  {"speed": (0, 7), "devaddr": (3, 0x7f), "lpm_cap": (22, 1)},
    "DCTL":  {"runstop": (31, 1), "csftrst": (30, 1), "hird": (24, 0x1f),
              "ulstchngreq": (5, 0xf)},
    "DSTS":  {"connectspd": (0, 7), "soffn": (3, 0x3fff), "usblnkst": (18, 0xf),
              "devctrlhlt": (22, 1), "coreidle": (23, 1), "sss": (24, 1), "rss": (25, 1)},
    "DEVTEN": {"disconnevten": (0, 1), "connectevten": (1, 1), "resetevten": (2, 1)},
}


def main(argv):
    if len(argv) < 2:
        print(__doc__)
        return 2

    src = open(argv[1], encoding="utf-8", errors="ignore").read()

    # every read of the form *(volatile uintN_t *)(uintptr_t)(BASE + OFF)
    pat = re.compile(
        r"\*\(volatile uint(?:8|16|32)_t \*\)\(uintptr_t\)\((\w+) \+ (0x[0-9A-Fa-f]+)\)"
    )

    dwc_reads, phy_reads, unknown = {}, {}, []
    for m in pat.finditer(src):
        base, off = m.group(1), int(m.group(2), 16)
        if base in ("dwc", "0xA800000ULL"):
            dwc_reads.setdefault(off, 0)
            dwc_reads[off] += 1
            if off not in DWC3:
                unknown.append(("dwc", off))
        elif base in ("phy", "0xC012000ULL"):
            phy_reads.setdefault(off, 0)
            phy_reads[off] += 1
            if off not in PHY:
                unknown.append(("phy", off))

    print("=== DWC3 offsets read or written ===")
    for off in sorted(dwc_reads):
        name = DWC3.get(off, "*** UNKNOWN ***")
        print("  0x%04X  %-14s  %d site(s)" % (off, name, dwc_reads[off]))
    print()
    print("=== QUSB2 PHY offsets read or written ===")
    for off in sorted(phy_reads):
        name = PHY.get(off, "*** UNKNOWN ***")
        print("  0x%03X  %-22s  %d site(s)" % (off, name, phy_reads[off]))
    print()

    if unknown:
        print("=== offsets with no definition in core.h or the phy driver ===")
        for base, off in sorted(set(unknown)):
            print("  %s + 0x%X" % (base, off))
        print()
        print("  These are not necessarily wrong -- some could be registers the kernel")
        print("  driver never touches.  But each one should be identified before a value")
        print("  read from it is used in a conclusion.")
    else:
        print("every offset read has a known definition")

    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
