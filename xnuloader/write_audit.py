#!/usr/bin/env python3
"""Extract every QUSB2 PHY write in loader.c and list the values written, grouped by offset.

The read audit found the PLL auto-programming conflict, where chiron_port_powerdown() wrote 0x00
to offset 0x1C while the vendor driver writes 0x05.  That was a conflict between two writes, not
a bad read, so this lists the write side the same way: offset, every literal written to it, and
where.

Judging whether a value is right needs the driver source beside it, which is why the offsets are
named.  This does not decide; it puts the question where it can be answered.

Usage:  python3 write_audit.py loader.c
"""

import re
import sys


# What the vendor driver writes at each offset, from phy-msm-qusb.c and phy-msm-qusb-v2.c.
# A "?" means the driver does not write it at all, so the loader is on its own there.
DRIVER = {
    0x000: ("PLL_ANALOG_CTRL_ONE", "0x80 resume / 0x90 suspend"),
    0x004: ("PLL_ANALOG_CTRL_TWO", "0x13 init / 0x0b suspend / 0x1b disconnect"),
    0x01C: ("PLL_AUTOPGM_CTL1",    "0x05 (reset count 5)"),
    0x02C: ("PLL_ANALOG_CTRL_ONE?", "0x80"),
    0x070: ("PORT_QC1",            "0x80 at power-up"),
    0x074: ("PORT_QC2",            "?"),
    0x090: ("TUNE5",               "?"),
    0x0B4: ("PORT_POWERDOWN",      "CLAMP_N_EN|FREEZIO_N = 0x22 power-up, 0x19 from DTS"),
    0x0B8: ("PORT_TEST_CTRL",      "0x0c then 0x04 (auto-resume)"),
    0x0C0: ("UTMI_CTRL1",          "0x00"),
    0x0C4: ("UTMI_CTRL2",          "UTMI_ULPI_SEL|UTMI_TEST_MUX_SEL"),
    0x184: ("PLL_LOCK_DELAY",      "from DTS"),
    0x18C: ("PLL_CLK_INVERTER",    "from DTS"),
    0x210: ("PWR_CTRL1",           "0x22 power-up"),
    0x22C: ("INTR_CTRL",           "0x00 then computed mask"),
    0x230: ("INTR_STAT",           "read only"),
    0x23C: ("TUNE1",               "from DTS, efuse-trimmed"),
    0x240: ("TUNE2",               "from DTS"),
    0x24C: ("TEST1",               "0x91 then 0x90"),
}


def main(argv):
    if len(argv) < 2:
        print(__doc__)
        return 2

    src = open(argv[1], encoding="utf-8", errors="ignore").read()

    # *(volatile uintN_t *)(uintptr_t)(phy + 0xNN) = VALUE;
    pat = re.compile(
        r"\*\(volatile uint(?:8|16|32)_t \*\)\(uintptr_t\)\((\w+) \+ (0x[0-9A-Fa-f]+)\)\s*=\s*([^;]+);"
    )

    writes = {}
    for m in pat.finditer(src):
        base, off, val = m.group(1), int(m.group(2), 16), m.group(3).strip()
        if base not in ("phy", "0xC012000ULL"):
            continue
        writes.setdefault(off, []).append(val)

    # the init sequence table: { value, offset }
    seq = re.compile(r"\{\s*(0x[0-9a-fA-F]+),\s*(0x[0-9a-fA-F]+)\s*\}\s*,\s*/\*")
    in_seq = False
    for line in src.splitlines():
        if "qusb_phy_init_seq" in line or "CHIRON_MEASURED" in line:
            in_seq = True
        if in_seq:
            for m in re.finditer(r"\{\s*(0x[0-9a-fA-F]+),\s*(0x[0-9a-fA-F]+)\s*\}", line):
                writes.setdefault(int(m.group(2), 16), []).append(
                    m.group(1) + " (init-seq)")

    print("%-8s %-22s %-42s %s" % ("OFFSET", "REGISTER", "LOADER WRITES", "DRIVER"))
    print("-" * 110)
    for off in sorted(writes):
        vals = writes[off]
        # collapse duplicates, keep order
        seen, uniq = set(), []
        for v in vals:
            if v not in seen:
                seen.add(v)
                uniq.append(v)
        name, drv = DRIVER.get(off, ("*** UNKNOWN ***", "?"))
        joined = ", ".join(uniq)
        if len(joined) > 40:
            joined = joined[:37] + "..."
        print("%-8s %-22s %-42s %s" % ("0x%03X" % off, name, joined, drv))

    print()
    multi = [o for o in sorted(writes)
             if len({v for v in writes[o]}) > 1 and not any("init-seq" in v for v in writes[o])]
    if multi:
        print("offsets this loader writes more than one distinct value to:")
        for off in multi:
            name = DRIVER.get(off, ("?",))[0]
            print("  0x%03X %-20s %s" % (off, name, ", ".join(str(v) for v in writes[off])))
        print()
        print("  Each of these is a place where two helpers disagree, or where a helper")
        print("  restores what another changed.  The PLL auto-programming conflict found")
        print("  earlier was one of these, and it was only visible by listing both writes.")

    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
