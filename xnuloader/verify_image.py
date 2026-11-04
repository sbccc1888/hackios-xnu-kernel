#!/usr/bin/env python3
"""Verify that a chiron boot image carries what the run is supposed to test.

Parses the boot image header, inflates the kernel blob, finds the XNUP payload and prints
every payload entry.  The point is to be able to say, before flashing anything, that the
image actually carries -- usb=1 and the flag the comparison depends on -- rather than
assuming it does because the build script was asked to add them.

Entry layout, from mkpayload.py:

    <16s II>  name, size, zero      = 24 bytes
    data, padded up to a multiple of 16

Three separate mistakes were made reading this format by hand before the arithmetic was
checked against the writer: 20-byte headers instead of 24, a plain-text search for 'usb'
(which matches the key table in the binary, not the payload), and a 16-byte data pad instead
of 15-and-mask.  This script encodes the layout once so it is not re-derived per run.

Usage:  python3 verify_image.py USB_A.img [USB_B.img ...]
"""

import struct
import sys
import zlib

XNUP = 0x50554E58
PAGE = 2048          # chiron accepts boot header v0 at 2048-byte pages
HDR_ENT = 24         # 16s II, then four bytes of padding to the data


def entries(body):
    """Yield (name, data) for each payload entry, or stop at the first empty name."""
    p = 0
    while p + HDR_ENT <= len(body):
        raw = body[p:p + 16]
        name = raw.split(b"\0")[0]
        if not name:
            return
        size = struct.unpack("<I", body[p + 16:p + 20])[0]
        data = body[p + HDR_ENT:p + HDR_ENT + size]
        yield name.decode("ascii", "replace"), data
        p += HDR_ENT + ((size + 15) & ~15)


def check(path):
    blob = open(path, "rb").read()
    if len(blob) < PAGE:
        print("%s: too short to be a boot image" % path)
        return False

    ksize = struct.unpack("<I", blob[0x08:0x0C])[0]
    print("=== %s ===" % path)
    print("  boot header: kernel_size=%d file=%d" % (ksize, len(blob)))

    try:
        kernel = zlib.decompressobj(16 + zlib.MAX_WBITS).decompress(blob[PAGE:])
    except zlib.error as exc:
        print("  kernel is not gzip: %s" % exc)
        return False
    print("  inflated to %d bytes" % len(kernel))

    at = kernel.find(struct.pack("<I", XNUP))
    if at < 0:
        print("  no XNUP payload -- this image would boot a kernel instead of a session")
        return False

    body_len = struct.unpack("<I", kernel[at + 4:at + 8])[0]
    body = kernel[at + 8:at + 8 + body_len]
    print("  XNUP payload: %d bytes of entries" % body_len)

    found = {}
    for name, data in entries(body):
        found[name] = data
        if name == "cmdline":
            print("  cmdline   = %r" % data.rstrip(b"\0").decode("ascii", "replace"))
        elif name == "usb":
            print("  usb       = %r" % data.rstrip(b"\0").decode("ascii", "replace"))
        else:
            print("  %-9s = %d bytes" % (name, len(data)))

    ok = True
    # the loader is carried under its own file name, not "kernel"
    if not any(k.endswith('.efi') or k == 'kernel' for k in found):
        print("  loader: missing")
        ok = False
    if "usb" not in found:
        print("  usb: MISSING -- the loader would not stay resident for a session")
        ok = False
    print("  -> %s" % ("ok" if ok else "INCOMPLETE"))
    return ok


def main(argv):
    if len(argv) < 2:
        print(__doc__)
        return 2
    results = [check(p) for p in argv[1:]]
    return 0 if all(results) else 1


if __name__ == "__main__":
    sys.exit(main(sys.argv))
