#!/usr/bin/env python3
"""Diff the working-hardware register map against what loader.c actually programs.

map2.bin was captured at loader entry, while fastboot still had the port working.  Every
byte in it is therefore part of a configuration that enumerated.  Any register the loader
writes differently -- or never writes at all -- is a candidate for what is missing.

Finding 0xB8 by hand last round took a while and only happened because the value looked
conspicuous.  This does it for all of them.

Usage:  python3 reg_diff.py map2.bin /root/hk/kernel/xnuloader/loader.c
"""

import re
import sys

PHY_BASE = 0xC012000


def parse_map(path):
    """Return {offset: value} from the 'map XX:' / 'hi XXX:' lines of a loader log."""
    regs = {}
    # The logfs dumps are UTF-16LE: one ASCII character followed by a zero byte.  Decoding
    # as latin-1 gives a string where every letter is separated by NULs and no regex on
    # plain text matches, which is why this returned nothing the first two times.
    raw = open(path, "rb").read()
    if raw.count(b"\x00") > len(raw) // 4:
        text = raw.decode("utf-16-le", errors="ignore")
    else:
        text = raw.decode("latin-1", errors="ignore")

    for line in text.splitlines():
        line = line.strip()
        m = re.match(r"(?:map|hi)\s+([0-9a-f]{1,3}):\s*(.*)$", line)
        if not m:
            continue
        base = int(m.group(1), 16)
        vals = m.group(2).split()
        for i, v in enumerate(vals):
            try:
                word = int(v, 16)
            except ValueError:
                continue
            # each entry is a 32-bit read.  A byte-wide register returns its byte in all
            # four lanes, so collapse that; anything else is a genuine 32-bit value.
            byte = word & 0xFF
            if word == (byte * 0x01010101):
                regs[base + i * 4] = byte
            else:
                regs[base + i * 4] = word
    return regs


def parse_writes(path):
    """Return {offset: set(value)} for PHY offsets loader.c writes."""
    src = open(path, encoding="utf-8", errors="ignore").read()
    writes = {}

    # *(volatile uintN_t *)(uintptr_t)(phy + 0xNN) = VALUE;
    for m in re.finditer(
        r"\*\(volatile uint(?:8|16|32)_t \*\)\(uintptr_t\)\(phy \+ (0x[0-9a-fA-F]+)\)\s*=\s*([^;]+);",
        src,
    ):
        off = int(m.group(1), 16)
        writes.setdefault(off, set()).add(m.group(2).strip())

    # the init sequence table: { value, offset }
    for m in re.finditer(r"\{\s*(0x[0-9a-fA-F]+),\s*(0x[0-9a-fA-F]+)\s*\}", src):
        off = int(m.group(2), 16)
        writes.setdefault(off, set()).add(m.group(1).strip())

    return writes


def main(argv):
    if len(argv) < 3:
        print(__doc__)
        return 2

    regs = parse_map(argv[1])
    writes = parse_writes(argv[2])

    print("captured %d registers from %s" % (len(regs), argv[1]))
    print("found %d distinct PHY offsets written by loader.c" % len(writes))
    print()

    # Registers that hold a non-trivial value on the working port but are never written.
    print("=== set on working hardware, NEVER written by the loader ===")
    never = []
    for off in sorted(regs):
        val = regs[off]
        if val in (0x00, 0xFF):
            continue
        if off in writes:
            continue
        never.append((off, val))
    for off, val in never:
        print("    0x%03x = 0x%02x" % (off, val))
    if not never:
        print("    (none)")
    print()

    # Registers written by the loader with a literal that differs from the working value.
    print("=== written with a value that differs from the working hardware ===")
    diff = []
    for off in sorted(writes):
        if off not in regs:
            continue
        try:
            vals = {int(v, 0) & 0xFF for v in writes[off] if re.match(r"^0x[0-9a-fA-F]+$", v)}
        except ValueError:
            continue
        if not vals:
            continue
        if regs[off] not in vals:
            diff.append((off, regs[off], vals))
    for off, hw, vals in diff:
        print("    0x%03x  hardware 0x%02x  loader writes %s" %
              (off, hw, ", ".join("0x%02x" % v for v in sorted(vals))))
    if not diff:
        print("    (none)")
    print()

    # Registers the loader writes but the capture never showed.
    print("=== written by the loader, absent from the capture ===")
    absent = [off for off in sorted(writes) if off not in regs]
    for off in absent:
        print("    0x%03x  loader writes %s" % (off, ", ".join(sorted(writes[off]))))
    if not absent:
        print("    (none)")

    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
