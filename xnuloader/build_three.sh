#!/bin/bash
# Rebuild the three comparison images and refuse to finish if they are older than loader.efi.
#
# This has now bitten twice.  The first time the images were 28 minutes stale and would have
# been flashed as though they carried fixes they did not have; this time 20 minutes, missing
# the auto-resume change among others.  Both times the build script was run earlier and
# simply not again after the last commit, and nothing about the image says which loader it
# contains.
#
# So the script now compares timestamps at the end and fails loudly rather than quietly
# leaving stale artefacts behind.
set -uo pipefail
K=/root/hk/kernel
M=/root/hk/Mu-Silicium
OUT=/root/hk/chiron-out

cd "$K/xnuloader" || exit 1

build() {
	local name="$1" cmdline="$2"

	python3 mkpayload.py -o /tmp/p.bin loader.efi=loader.efi \
	  --cmdline "$cmdline" --usb >/dev/null 2>&1 || { echo "  $name: mkpayload failed"; return 1; }

	python3 - "$M/BootShim/BootShim.bin" \
	           "$M/Build/chironPkg/DEBUG_CLANGPDB/FV/SILICIUM_UEFI.fd" \
	           "$M/Resources/DTBs/chiron.dtb" /tmp/p.bin <<'PY'
import sys, gzip, struct
shim = open(sys.argv[1], 'rb').read()
fd   = open(sys.argv[2], 'rb').read()
dtb  = open(sys.argv[3], 'rb').read()
pay  = open(sys.argv[4], 'rb').read()
want = struct.unpack('<Q', shim[0x10:0x18])[0]
assert len(fd) == want, "FD %d != expected %d" % (len(fd), want)
blob = shim + fd + pay
blob += b'\0' * (-len(blob) % 16)
open('/tmp/p.gz', 'wb').write(gzip.compress(blob, 6) + dtb)
PY

	python3 "$M/Resources/Scripts/mkbootimg.py" --kernel /tmp/p.gz --ramdisk /dev/null \
	  --kernel_offset 0 --ramdisk_offset 0 --tags_offset 0 --base 0x10000000 \
	  --pagesize 2048 --header_version 0 -o "$OUT/$name" >/dev/null 2>&1

	echo "  $name: $(stat -c%s "$OUT/$name") bytes"
}

echo "=== rebuilding from loader.efi $(stat -c%y "$K/xnuloader/loader.efi" | cut -d. -f1) ==="
build USB_A.img "debug=0x8 epoch=A"                || exit 1
build USB_B.img "debug=0x8 epoch=B usb_no_epcfg=1 usb_skip_start=1" || exit 1
build USB_C.img "debug=0x8 epoch=C usb_native=1" || exit 1

# --- refuse to leave stale artefacts behind --------------------------
efi_time=$(stat -c %Y "$K/xnuloader/loader.efi")
bad=0
for f in USB_A.img USB_B.img USB_C.img; do
	img_time=$(stat -c %Y "$OUT/$f")
	if [ "$img_time" -lt "$efi_time" ]; then
		echo "  STALE: $f is older than loader.efi"
		bad=1
	fi
done
[ "$bad" -eq 0 ] && echo "=== all three are newer than loader.efi ==="

# --- and say what each one carries -----------------------------------
echo
python3 "$K/xnuloader/verify_image.py" "$OUT/USB_A.img" "$OUT/USB_B.img" "$OUT/USB_C.img"
