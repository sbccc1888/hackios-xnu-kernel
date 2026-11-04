/*
 * XNU loader: a UEFI application that plays the role of iBoot for an
 * open-source arm64 XNU kernel on non-Apple hardware.
 *
 *   - finds the "XNUP" payload in RAM (placed there by the boot shim on the
 *     phone, by `-device loader` under QEMU) and the Mach-O kernel inside it
 *   - picks a block of free RAM to be XNU's [physBase, physBase + memSize)
 *   - copies the Mach-O segments there, builds an Apple-format device tree
 *     and a boot_args structure behind the kernel
 *   - exits boot services, turns the MMU off and jumps to the kernel entry
 */
#include "efi.h"
#include "identity.h"         /* who iOS shall think we are: from the iPhone's own device tree (mkidentity.py) */

/* ------------------------------------------------------------------------ */
/* Fixed conventions shared with the boot shim, the packer and the kernel   */

#define PAYLOAD_BASE        0xF0000000ULL
#define PAYLOAD_MAGIC       0x50554E58u /* "XNUP" */

struct payload_header { uint32_t magic; uint32_t size; };
struct payload_entry { char name[16]; uint32_t size; uint32_t reserved; };

#define KERNEL_VIRT_BASE    0xFFFFFFF004000000ULL /* boot_args.virtBase */
#define KERNEL_LINK_OFFSET  0x03000000ULL         /* kernel text sits 48 MB above the base */
#define BASE_ALIGN          0x02000000ULL         /* 32 MB: L2 block size with 16K pages */
#define MAX_MEM_SIZE        0x180000000ULL        /* 6 GB; the kernel's bootstrap page tables cover 8 */
/*
 * A root image too big for the payload area is placed here, at a fixed
 * offset inside the kernel's memory window, once; it then survives any
 * number of kernel runs (nothing writes to it: the root is read-only).
 */
#define RESIDENT_RD_OFFSET  0x08000000ULL
#define RESIDENT_RD_RESERVE 0x30000000ULL         /* RAM that must remain for the kernel itself */
#define PAGE_SIZE_MAX       0x4000ULL

/* chiron (Mi MIX 2, MSM8998) calls its log partition "logfs" (8 MiB, /dev/block/sda10);
 * redwood calls it "logdump". Read from the phone in TWRP: there is no logdump here. */
#define LOG_PARTITION       u"logfs"
#define CHECKPOINT_SELFTEST 999
#define PANIC_LOG_SIZE      0x80000u
#define NVRAM_BANK_SIZE     0x2000u
#define PANIC_LOG_BASE      (PAYLOAD_BASE + PAYLOAD_MAX_SIZE - 0x100000ULL)
#define PAYLOAD_MAX_SIZE    0x04000000ULL         /* RAM reserved for the payload in the UEFI memory map */

/* ------------------------------------------------------------------------ */
/* XNU structures (pexpert/pexpert/arm64/boot.h, mach-o/loader.h)           */

struct boot_video {
	uint64_t v_baseAddr, v_display, v_rowBytes, v_width, v_height, v_depth;
};

#define BOOT_LINE_LENGTH 608

struct boot_args {
	uint16_t revision;
	uint16_t version;
	uint64_t virtBase;
	uint64_t physBase;
	uint64_t memSize;
	uint64_t topOfKernelData;
	struct boot_video video;
	uint32_t machineType;
	uint64_t deviceTreeP;
	uint32_t deviceTreeLength;
	char commandLine[BOOT_LINE_LENGTH];
	uint64_t bootFlags;
	uint64_t memSizeActual;
};

#define MH_MAGIC_64      0xFEEDFACFu
#define LC_SEGMENT_64    0x19
#define LC_UNIXTHREAD    0x5

struct mach_header_64 { uint32_t magic, cputype, cpusubtype, filetype, ncmds, sizeofcmds, flags, reserved; };
struct load_command { uint32_t cmd, cmdsize; };
struct segment_command_64 {
	uint32_t cmd, cmdsize; char segname[16];
	uint64_t vmaddr, vmsize, fileoff, filesize;
	uint32_t maxprot, initprot, nsects, flags;
};

/* ------------------------------------------------------------------------ */
/* Globals and small helpers                                                */

static efi_system_table *ST;
static efi_boot_services *BS;
static efi_handle IMAGE;

static char log_buf[32768];
static uint64_t log_part_lba;   /* first LBA of the log partition, 0 if none */
static uint32_t log_len;

void *
memset(void *dst, int c, size_t n)
{
	uint8_t *d = dst;
	while (n--) {
		*d++ = (uint8_t)c;
	}
	return dst;
}

int
memcmp(const void *a, const void *b, size_t n)
{
	const uint8_t *x = a, *y = b;

	for (; n > 0; n--, x++, y++) {
		if (*x != *y) {
			return *x < *y ? -1 : 1;
		}
	}
	return 0;
}

void *
memcpy(void *dst, const void *src, size_t n)
{
	uint8_t *d = dst;
	const uint8_t *s = src;

	/*
	 * Word at a time when possible: USB transfer buffers are uncached, where
	 * a byte loop costs one bus access per byte (6 MB/s instead of 30+).
	 */
	if ((((uintptr_t)d | (uintptr_t)s) & 7) == 0) {
		uint64_t *dw = (uint64_t *)d;
		const uint64_t *sw = (const uint64_t *)s;

		for (; n >= 32; n -= 32, dw += 4, sw += 4) {
			uint64_t a = sw[0], b = sw[1], c = sw[2], e = sw[3];
			dw[0] = a;
			dw[1] = b;
			dw[2] = c;
			dw[3] = e;
		}
		for (; n >= 8; n -= 8) {
			*dw++ = *sw++;
		}
		d = (uint8_t *)dw;
		s = (const uint8_t *)sw;
	}
	while (n--) {
		*d++ = *s++;
	}
	return dst;
}

static size_t
str_len(const char *s)
{
	size_t n = 0;
	while (s[n]) {
		n++;
	}
	return n;
}

static int
str_eq(const char *a, const char *b)
{
	while (*a && *a == *b) {
		a++, b++;
	}
	return *a == *b;
}

/*
 * Set once the loader takes commands over USB: its log travels that way, and
 * the screen is left to the kernel (and to "oem screenshot").
 */
static int screen_quiet;

/*
 * CHIRON_CONOUT_MUTE
 *
 * UsbConfigDxe reports a failed Type-C query on every poll -- one line per millisecond --
 * and drivers write to the console themselves, so loader's own screen_quiet cannot stop
 * them; the kernel's log gets pushed off the panel.
 *
 * Two pointers keep this useful:
 *   real_con_out  what loader itself prints through (the firmware's original)
 *   ST->con_out   a sink that discards everything, which is what the drivers reach
 * The loader's text still reaches the panel, the drivers' does not.
 */
static efi_text_output *real_con_out;

static efi_status EFIAPI
mute_output_string(efi_text_output *self, const char16 *str)
{
	(void)self;
	(void)str;
	return 0;
}

static efi_text_output mute_con_out = { NULL, mute_output_string };

/* Install once, as early as possible: drivers start talking during BDS. */
static void
mute_driver_console(void)
{
	if (ST == NULL || ST->con_out == NULL) {
		return;
	}
	if (ST->con_out != &mute_con_out) {
		real_con_out = ST->con_out;
		ST->con_out = &mute_con_out;
	}
}

static void
put_char(char c)
{
	char16 w[3] = { 0, 0, 0 };

	if (log_len < sizeof(log_buf) - 1) {
		log_buf[log_len++] = c;
	}
	if (!screen_quiet) {
		efi_text_output *out = real_con_out != NULL ? real_con_out : ST->con_out;

		if (out != NULL) {
			if (c == '\n') {
				w[0] = '\r', w[1] = '\n';
			} else {
				w[0] = (char16)c;
			}
			out->output_string(out, w);
		}
	}
}

/* printf subset: %s %x %d (64-bit values), %% */
static void
print(const char *fmt, ...)
{
	__builtin_va_list ap;
	__builtin_va_start(ap, fmt);
	for (; *fmt; fmt++) {
		if (*fmt != '%') {
			put_char(*fmt);
			continue;
		}
		fmt++;
		if (*fmt == 's') {
			const char *s = __builtin_va_arg(ap, const char *);
			while (*s) {
				put_char(*s++);
			}
		} else if (*fmt == 'x' || *fmt == 'd') {
			uint64_t v = __builtin_va_arg(ap, uint64_t);
			unsigned base = (*fmt == 'x') ? 16 : 10;
			char tmp[24];
			int i = 0;
			do {
				tmp[i++] = "0123456789abcdef"[v % base];
				v /= base;
			} while (v);
			while (i) {
				put_char(tmp[--i]);
			}
		} else {
			put_char(*fmt);
		}
	}
	__builtin_va_end(ap);
}

#define READ_SYSREG(name) ({ uint64_t _v; __asm__ volatile ("mrs %0, " #name : "=r" (_v)); _v; })

/*
 * Write back and drop cached copies of a range. Required for memory the
 * kernel will touch with the MMU (and so the data cache) off: its early code
 * builds page tables that way, and a stale cached copy of those pages would
 * be what the table walker sees once caches are turned on again.
 */
static void
flush_dcache(uint64_t start, uint64_t end)
{
	uint64_t line = 4ULL << ((READ_SYSREG(CTR_EL0) >> 16) & 0xF);
	for (uint64_t p = start & ~(line - 1); p < end; p += line) {
		__asm__ volatile ("dc civac, %0" : : "r" (p));
	}
	__asm__ volatile ("dsb sy");
}

static void
clean_dcache(uint64_t start, uint64_t end)
{
	uint64_t line = 4ULL << ((READ_SYSREG(CTR_EL0) >> 16) & 0xF);
	for (uint64_t p = start & ~(line - 1); p < end; p += line) {
		__asm__ volatile ("dc cvac, %0" : : "r" (p));
	}
	__asm__ volatile ("dsb sy");
}

/* ------------------------------------------------------------------------ */
/* Log persistence: raw write to a GPT partition (phone only)               */

static efi_block_io *find_partition_named(const char16 *want);


/*
 * CHIRON_GPT_SCAN
 *
 * This UEFI has no EFI_PARTITION_INFO_PROTOCOL, so locate_handle_buffer() on it fails
 * and every search by partition name came up empty -- including the one for the log
 * partition, which is why the log was never written and went to the console instead.
 *
 * The partition table is read here instead, from the unit's own blocks: BLOCK_IO does
 * exist, the header at LBA 1 says where the entries are, and each entry carries its
 * name in UTF-16. What comes back is the unit's BlockIo and the first LBA of the
 * wanted partition, or NULL.
 */
static efi_block_io *
gpt_find(const char16 *want, uint64_t *first_lba)
{
	static const efi_guid blk_guid = EFI_BLOCK_IO_GUID;
	static uint8_t table[64 * 1024] __attribute__((aligned(8)));
	static uint8_t hdr[4096] __attribute__((aligned(8)));
	efi_handle *handles;
	uint64_t count;

	if (EFI_ERROR(BS->locate_handle_buffer(ByProtocol, &blk_guid, NULL, &count, &handles))) {
		return NULL;
	}
	for (uint64_t h = 0; h < count; h++) {
		efi_block_io *bio;
		uint64_t bs, entries_lba, nc, esz, bytes, read;
		uint32_t n;

		if (EFI_ERROR(BS->handle_protocol(handles[h], &blk_guid, (void **)&bio)) || bio == NULL ||
		    bio->media == NULL || bio->media->logical) {
			continue;
		}
		bs = bio->media->block_size;
		if (bs < 512 || bs > 4096) {
			continue;
		}
		if (EFI_ERROR(bio->read_blocks(bio, bio->media->media_id, 1, bs, hdr))) {
			continue;
		}
		if (hdr[0] != 'E' || hdr[1] != 'F' || hdr[2] != 'I' ||
		    hdr[3] != ' ') {
			continue;
		}
		entries_lba = *(uint64_t *)(hdr + 72);
		n = *(uint32_t *)(hdr + 80);
		esz = *(uint32_t *)(hdr + 84);
		bytes = (uint64_t)n * esz;
		if (esz < 128 || bytes == 0 || bytes > sizeof(table)) {
			continue;
		}
		read = (bytes + bs - 1) / bs * bs;
		if (EFI_ERROR(bio->read_blocks(bio, bio->media->media_id, entries_lba, read, table))) {
			continue;
		}
		for (uint64_t e = 0; e < n; e++) {
			const uint8_t *ent = table + e * esz;
			const char16 *name = (const char16 *)(ent + 56);
			unsigned k = 0;

			for (; k < 36 && want[k] != 0; k++) {
				if (name[k] != want[k]) {
					break;
				}
			}
			if (want[k] == 0 && k > 0) {
				*first_lba = *(uint64_t *)(ent + 32);
				print("gpt: found '%s' at lba %d on block size %d\n", "logfs",
				    *first_lba, bs);
				return bio;
			}
		}
	}
	print("gpt: no partition named in any unit\n");
	return NULL;
}

static efi_block_io *
find_log_partition(void)
{
	/*
	 * CHIRON_LOG_PART_FIX
	 *
	 * This used to walk sizeof(want) / sizeof(want[0]) characters, which counts the
	 * terminating null of the literal: it asked the firmware for "logfs\0" and required
	 * the byte after the name to be zero. It is not, so the partition was never found,
	 * the log went to the console instead -- a whole kernel log printed a character at a
	 * time, thousands of lines, each scrolling the panel -- and the picture was stripes.
	 *
	 * find_partition_named() stops at the end of the wanted name; that is the comparison
	 * a GPT name needs, so both searches are now the same one.
	 */
	static uint64_t first;
	static int tried;
	static efi_block_io *unit;

	if (!tried) {
		tried = 1;
		unit = gpt_find(LOG_PARTITION, &first);
		log_part_lba = first;
	}
	return unit;
}

/* CHIRON_PARTLIST: say what the firmware actually calls its partitions. */
static void
list_partitions(void)
{
	static const efi_guid part_guid = EFI_PARTITION_INFO_GUID;
	efi_handle *handles;
	uint64_t count;

	if (EFI_ERROR(BS->locate_handle_buffer(ByProtocol, &part_guid, NULL, &count, &handles))) {
		print("parts: cannot list partitions\n");
		return;
	}
	print("parts: %d partition handles\n", count);
	for (uint64_t i = 0; i < count && i < 40; i++) {
		efi_partition_info *info;
		char16 *n;

		if (EFI_ERROR(BS->handle_protocol(handles[i], &part_guid, (void **)&info))) {
			continue;
		}
		n = info->name;
		print("  [%d] type %d name '", i, (uint64_t)info->type);
		for (unsigned k = 0; k < 36 && n[k] != 0; k++) {
			put_char(n[k] < 0x80 ? (char)n[k] : '?');
		}
		print("'\n");
	}
	BS->free_pool(handles);
}

/*
 * The "staged" buffer holds the loader log followed by the kernel log of the
 * last run. It is what gets written to the log partition and what the host
 * fetches over USB (fastboot get_staged).
 */
static char out_buf[2 * 1024 * 1024];
/* the storage's reads for the kernel land here (block_poll); also where the log is read back */
#define BLOCK_BUFFER_SIZE  (4u << 20)
static uint8_t block_buffer[BLOCK_BUFFER_SIZE] __attribute__((aligned(0x2000)));
static const char *staged_data = out_buf;   /* what "upload" sends: normally the log in out_buf */
static uint64_t staged_len;

static void
compose_logs(const char *klog, uint64_t klog_len)
{
	static const char sep[] = "\n== KERNEL LOG ==\n", end[] = "\n== END OF LOG ==\n";
	uint64_t n = log_len;

	staged_data = out_buf;
	memset(out_buf, 0, sizeof(out_buf));
	memcpy(out_buf, log_buf, log_len);
	if (klog != NULL) {
		if (klog_len > sizeof(out_buf) - n - 8192) {
			klog_len = sizeof(out_buf) - n - 8192;
		}
		memcpy(out_buf + n, sep, sizeof(sep) - 1);
		n += sizeof(sep) - 1;
		memcpy(out_buf + n, klog, klog_len);
		n += klog_len;
		memcpy(out_buf + n, end, sizeof(end) - 1);
		n += sizeof(end) - 1;
	}
	staged_len = n;
}

static int hc_list_is_uefis(void);
static int hc_log_skips;                /* logs not written this run (said twice at most) */
static void hc_print_state(const char *when);
static void hc_take_back(const char *when);

static void
write_logs(const char *klog, uint64_t klog_len)
{
	efi_block_io *bio = find_log_partition();

	/*
	 * CHIRON_LP_STATUS: one line that says which of the two reasons it was -- ONCE.
	 * write_logs() runs from the watchdog loop every couple of seconds, and a line per
	 * pass is a hundred lines over a run, each scrolling the panel: that is the stripes.
	 */
	{
		static int said;
		if (!said) {
			said = 1;
			print("LP bio=%x uefi=%d klen=%x\n", (uint64_t)(uintptr_t)bio,
			    (uint64_t)hc_list_is_uefis(), klog_len);
		}
	}

	/* CHIRON_OOPS_FALLBACK: chiron has no "logdump"; its log partition is "logfs", a FAT12
	 * volume that Mi's own UEFI owns (writing raw at LBA 0 would wreck it). When neither is
	 * usable, put the log in "oops" -- the raw 16 MiB panic-log area Android keeps for
	 * exactly this kind of dump and never reads during normal boot. TWRP can then pull it
	 * with: dd if=/dev/block/sda11 bs=4096 | strings
	 */
	static int fell_back;
	if (bio == NULL && !fell_back) {
		fell_back = 1;
		bio = find_partition_named(u"oops");
	}
	compose_logs(klog, klog_len);
	if (bio == NULL) {
		/*
		 * No log partition: put it on the console instead -- but only the tail.
		 *
		 * CHIRON_LOG_TAIL: the whole log was printed here, one character at a time.
		 * Every newline makes the firmware's graphics console scroll the panel, which it
		 * does with a blit of the framebuffer onto itself; a log of any size is thousands
		 * of those, and the picture ends up as stripes. The tail is what a failing boot
		 * needs anyway: the last thing that happened.
		 */
		/*
		 * CHIRON_SILENT_PANEL
		 *
		 * Nothing of the kernel's log goes to the panel any more, not even the tail.
		 * put_char() is one ConOut->OutputString per character and every newline makes
		 * GraphicsConsoleDxe scroll the whole framebuffer with a GOP->Blt; the panel ends
		 * up as stripes long before the log is through.  The log is in "logfs" and the
		 * host reads it over adb, so the screen does not have to carry it.
		 */
		(void)klog;
		(void)klog_len;
		return;
	}
	uint64_t bs = bio->media->block_size;
	uint64_t len = (staged_len + 1 + bs - 1) / bs * bs;
	efi_status ws, rs = 0;
	int same = 0;

	/* only through UEFI's own transfer list (see hc_take_back) */
	if (!hc_list_is_uefis()) {
		/* CHIRON_SILENT_PANEL: said once, and the state goes into the log itself, not on the panel. */
		if (hc_log_skips++ == 0) {
			print("log: not written; UEFI's transfer list is not the one in the controller\n");
		}
		compose_logs(klog, klog_len);
		return;
	}
	/* CHIRON_LOG_OFFSET: the GPT says where the partition starts. */
	ws = bio->write_blocks(bio, bio->media->media_id, log_part_lba, len, out_buf);

	if (!EFI_ERROR(ws)) {
		bio->flush_blocks(bio);
		/*
		 * And read back: that the log is in the partition is what a run of the kernel's own UFS
		 * driver must leave possible (the controller is shared with this one). The line goes into
		 * the copy the host fetches over USB, not into the partition, which already has the rest.
		 */
		if (len <= sizeof(block_buffer)) {
			rs = bio->read_blocks(bio, bio->media->media_id, log_part_lba, len, block_buffer);
			same = !EFI_ERROR(rs) && memcmp(block_buffer, out_buf, len) == 0;
		}
	}
	/*
	 * CHIRON_LOG_QUIET: write_logs() runs from the watchdog loop every few seconds, and
	 * this line per pass is a hundred lines over a run. Each newline scrolls the panel
	 * through the firmware's graphics console, one framebuffer blit each; that is the
	 * stripes. Say it once, and only when it went wrong.
	 */
	{
		static int said;
		if (!said) {
			said = 1;
			print("log: %d bytes written to logdump (%x), read back %s (%x)\n", len, ws,
			    EFI_ERROR(ws) ? "not tried" : same ? "the same" : "DIFFERENT", rs);
		}
	}
	/*
	 * CHIRON_NO_PANEL_DUMP
	 *
	 * The kernel's log is not put on the panel any more.  compose_logs() emitted it one
	 * character at a time, and every newline made the firmware's graphics console scroll
	 * the whole framebuffer -- a blit per character run.  A real kernel log is 26 KB, so
	 * that is thousands of blits and the panel ends up as stripes.  The log is in
	 * "logfs" where the host reads it over adb, which is also what makes a run
	 * repeatable without a camera.
	 */
	(void)klog;
	(void)klog_len;
}

static void
flush_log(void)
{
	write_logs(NULL, 0);
}

/* ------------------------------------------------------------------------ */
/* Apple device tree writer                                                 */
/*                                                                          */
/* node := u32 nProperties, u32 nChildren, props[], children[]              */
/* prop := char name[32], u32 length, value padded to 4 bytes               */

struct dt_writer {
	uint8_t *base, *cur;
	uint32_t *counts[16]; /* [depth] -> {nProperties, nChildren} of the open node */
	int depth;
};

static void
dt_prop(struct dt_writer *w, const char *name, const void *data, uint32_t len)
{
	memset(w->cur, 0, 32);
	memcpy(w->cur, name, str_len(name));
	*(uint32_t *)(w->cur + 32) = len;
	memset(w->cur + 36, 0, (len + 3) & ~3u);
	memcpy(w->cur + 36, data, len);
	w->cur += 36 + ((len + 3) & ~3u);
	w->counts[w->depth - 1][0]++;
}

static void
dt_prop_str(struct dt_writer *w, const char *name, const char *value)
{
	dt_prop(w, name, value, (uint32_t)str_len(value) + 1);
}

static void
dt_prop_u32(struct dt_writer *w, const char *name, uint32_t value)
{
	dt_prop(w, name, &value, sizeof(value));
}

static void
dt_prop_u64(struct dt_writer *w, const char *name, uint64_t value)
{
	dt_prop(w, name, &value, sizeof(value));
}

/* Seconds since 1970 by the firmware's real-time clock, or 0 when it has none or it is not set. */
static uint64_t
firmware_epoch(void)
{
	static const uint16_t before_month[12] = { 0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334 };
	struct efi_time t;
	uint64_t days;

	if (ST->rt == NULL || ST->rt->get_time == NULL || EFI_ERROR(ST->rt->get_time(&t, NULL)) ||
	    t.year < 2024 || t.year > 2099 || t.month < 1 || t.month > 12) {
		return 0;
	}
	days = (uint64_t)(t.year - 1970) * 365 + (t.year - 1969) / 4 + before_month[t.month - 1] + (t.day - 1);
	if (t.month > 2 && t.year % 4 == 0) {
		days++;
	}
	uint64_t secs = days * 86400 + (uint64_t)t.hour * 3600 + (uint64_t)t.minute * 60 + t.second;
	if (t.timezone != 0x7FF) {
		secs += (int64_t)t.timezone * 60;       /* local time = UTC - timezone */
	}
	return secs;
}

/* A string in a field of fixed size, the rest zeros. */
static void
dt_prop_padded(struct dt_writer *w, const char *name, const char *value, uint32_t size)
{
	uint8_t field[64];

	memset(field, 0, sizeof(field));
	memcpy(field, value, str_len(value));
	dt_prop(w, name, field, size);
}

/*
 * Properties copied from the iPhone's device tree (identity.h), but one: the iPhone X's display is a
 * wide-gamut one ("artwork-display-gamut" P3), and with it iOS takes the screen for one that shows
 * extended colour (MobileGestalt's HasExtendedColorDisplay): WebKit then draws a page's tiles into
 * surfaces of ten bits a colour ('w30r', 'b3a8'), which neither the kernel's surfaces nor the window
 * server's renderer here do (eight bits, BGRA), and every page comes out black. Here the screen is
 * what the framebuffer is: sRGB.
 */
static int gamut_p3;    /* boot-arg gamut=p3 (a test): the iPhone's own "P3" left in place */

static void
dt_identity(struct dt_writer *w, const struct identity_prop *props, uint32_t count, const unsigned char *data)
{
	for (uint32_t i = 0; i < count; i++) {
		if (str_eq(props[i].name, "artwork-display-gamut") && !gamut_p3) {
			dt_prop(w, props[i].name, "sRGB", 5);
			continue;
		}
		dt_prop(w, props[i].name, data + props[i].offset, props[i].length);
	}
}

/* One property of those copied from the iPhone's device tree, by name. */
static void
dt_identity_one(struct dt_writer *w, const struct identity_prop *props, uint32_t count, const unsigned char *data, const char *name)
{
	for (uint32_t i = 0; i < count; i++) {
		if (str_eq(props[i].name, name)) {
			dt_prop(w, props[i].name, data + props[i].offset, props[i].length);
		}
	}
}

static void
dt_begin(struct dt_writer *w, const char *name)
{
	if (w->depth > 0) {
		w->counts[w->depth - 1][1]++;
	}
	w->counts[w->depth++] = (uint32_t *)w->cur;
	memset(w->cur, 0, 8);
	w->cur += 8;
	dt_prop_str(w, "name", name);
}

static void
dt_end(struct dt_writer *w)
{
	w->depth--;
}

/* ------------------------------------------------------------------------ */
/* Platform description                                                     */

struct platform {
	const char *name;
	uint64_t io_base, io_size;       /* one window covering the SoC peripherals */
	uint64_t gic_dist, gic_redist;   /* GICv3 */
	uint64_t uart;                   /* PL011, 0 if none */
	int psci_hvc;                    /* the firmware's power interface is called with HVC, not SMC */
	int log_other_cpu;               /* keep notes in the log partition while a kernel starts on another core */
	int cores;                       /* at most this many processor cores, numbered from 0 ... */
	uint32_t virtual_timer_intid;   /* EL1 virtual timer PPI: MSM8998 uses 19, QEMU/Apple 27 */
	int core_shift;                  /* ... in this bit of MPIDR: the phone numbers them in the second affinity field */
	int core_per_cluster;            /* ... and this many cores share one affinity-1 value: mpidr = (core/per)<<shift | (core%per) */
	uint32_t timeout_scale;          /* a kernel on several cores gets this much longer to wait for a lock, 0: as it is */
	uint32_t small_cores;            /* a bit for each of the slower cores, by number: "small-core" in the device tree */
	uint64_t fb_base;                /* the framebuffer the firmware reports (GOP): it tells this device apart */
};

/* Linear core number -> MPIDR, and back. With core_per_cluster == 0 this is the old
 * one-shift scheme; on chiron and redwood aff0 only spans 0..3, so the number has to be
 * split into a cluster and an index inside it. */
static uint64_t
core_to_mpidr(const struct platform *p, int core)
{
	if (p->core_per_cluster > 0) {
		return ((uint64_t)(core / p->core_per_cluster) << p->core_shift) |
		    (uint64_t)(core % p->core_per_cluster);
	}
	return (uint64_t)core << p->core_shift;
}

static int
mpidr_to_core(const struct platform *p, uint64_t mpidr)
{
	if (p->core_per_cluster > 0) {
		return (int)(((mpidr >> p->core_shift) & 0xff) * p->core_per_cluster +
		    (mpidr & 0xff));
	}
	return (int)(mpidr >> p->core_shift);
}

static const struct platform platform_qemu_virt = {
	.name = "qemu-virt", .io_base = 0x08000000, .io_size = 0x08000000,
	.gic_dist = 0x08000000, .gic_redist = 0x080A0000, .uart = 0x09000000, .psci_hvc = 1,
	.cores = 8, .core_shift = 0,
	/*
	 * QEMU's emulated cores stop each other all the time (every flush of a page from all the
	 * TLBs is a rendezvous of all its CPU threads), and the kernel's patience with a spin lock
	 * is that of real hardware: an eighth of a second by a 24 MHz clock, a twentieth here.
	 */
	.timeout_scale = 20,
};

static const struct platform platform_redwood = {
	/* io_base must be non-zero: XNU treats a zero SoC base as "no SoC" and skips clock setup. */
	.name = "redwood", .io_base = 0x00400000, .io_size = 0x3FC00000,
	.gic_dist = 0x17A00000, .gic_redist = 0x17A60000, .uart = 0, .log_other_cpu = 1,
	.cores = 8, .core_shift = 8,
	/*
	 * Cores 0-3 are Cortex-A55s (1.8 GHz at most), 4-7 Cortex-A78s (2.4 GHz): a big one is about
	 * 2.5 times as fast. The kernel uses the small ones only when the big ones are all busy
	 * (XNU's machine_routines.c, ml_choose_slow_core_partners()).
	 */
	.small_cores = 0x0f,
	.fb_base = 0xE1000000,
};

/*
 * The devices the loader knows, told apart by the framebuffer base their UEFI reports. A port to another
 * device adds its description here (common/new-device.sh writes a starting point, docs/PORTING.md says
 * where each value comes from); a display that matches none is QEMU's ramfb.
 */
/*
 * chiron (Xiaomi Mi MIX 2, MSM8998). From the phone's own device tree
 * (Android-chiron.dtb):
 *   arm,gic-v3 reg = <0x17a00000 0x10000 0x17b00000 0x100000>
 *   cpu@0..3   reg 0x0..0x3,   efficiency 0x400   (the little cluster)
 *   cpu@100..  reg 0x100..,    efficiency 0x600   (MPIDR aff1 -> core_shift 8)
 */
static const struct platform platform_chiron = {
	.name = "chiron",
	/* msm8998's peripherals sit in 0x00000000-0x1FFFFFFF; a non-zero base keeps
	 * XNU from concluding there is no clock hardware. */
	.io_base = 0x00400000, .io_size = 0x1FC00000,
	.gic_dist = 0x17a00000,
	.gic_redist = 0x17b00000,
	.uart = 0,
	.psci_hvc = 0,                  /* phones call PSCI with SMC */
	.log_other_cpu = 1,
	.virtual_timer_intid = 19,      /* MSM8998: the virtual timer is PPI 19 */
	.cores = 8,
	.core_shift = 8,
	.core_per_cluster = 4,
	.timeout_scale = 0,
	.small_cores = 0,               /* CHIRON_NOPAIR: no slow/fast pairing.
	 * cpu@0..3 report phys id 0x0..0x3 while cpu@100.. report 0x100.., and the
	 * pairing in ml_pair_slow_processors() died right after processor_set_primary()
	 * on the phone. Turned off while that identity handling is fixed. */
	.fb_base = 0x9D400000,          /* 1080 x 2160 continuous splash */
};

static const struct platform *const platforms[] = {
	&platform_redwood,
	&platform_chiron,
};

/* ------------------------------------------------------------------------ */


/*
 * CHIRON_BOOT_RECOVERY
 *
 * A halted loader leaves its log on the panel, which has to be photographed. Instead, ask the
 * firmware to boot the recovery image next: the Android bootloader reads a command out of the
 * "misc" partition and honours it. Writing "boot-recovery" there and resetting lands the phone
 * in TWRP, where adb can pull the log out of the "logfs" partition -- no photograph needed.
 *
 * The bootloader message is the first 2 KB of misc:
 *   char command[32]; char status[32]; char recovery[32]; ...
 * A CRC32 of the first 1064 bytes follows at offset 1080; some bootloaders check it, so it is
 * written too. Everything else is left alone.
 */
#define MISC_PARTITION   u"misc"
#define BOOT_MSG_MAGIC   u"MISC"

static uint32_t
crc32_le(uint32_t crc, const uint8_t *p, uint64_t n)
{
	crc = ~crc;
	while (n-- > 0) {
		crc ^= *p++;
		for (int k = 0; k < 8; k++) {
			crc = (crc >> 1) ^ (0xEDB88320u & (uint32_t)(-(int32_t)(crc & 1)));
		}
	}
	return ~crc;
}

/* A partition by name, for the small raw writes this loader makes (misc). */
static efi_block_io *
find_partition_named(const char16 *want)
{
	static const efi_guid part_guid = EFI_PARTITION_INFO_GUID;
	static const efi_guid blk_guid = EFI_BLOCK_IO_GUID;
	efi_handle *handles;
	uint64_t count;

	static int dumped;
	if (EFI_ERROR(BS->locate_handle_buffer(ByProtocol, &part_guid, NULL, &count, &handles))) {
		print("CHIRON_PARTDUMP locate_handle_buffer FAILED\n");
		return NULL;
	}
	/* CHIRON_PARTDUMP: what the firmware calls its partitions, once. */
	if (!dumped) {
		dumped = 1;
		print("CHIRON_PARTDUMP %d handles\n", count);
		for (uint64_t d = 0; d < count && d < 24; d++) {
			efi_partition_info *di;
			if (EFI_ERROR(BS->handle_protocol(handles[d], &part_guid, (void **)&di))) {
				print("  [%d] no protocol\n", d);
				continue;
			}
			print("  [%d] type=%d sys=%d name='", d, (uint64_t)di->type, (uint64_t)di->system);
			for (unsigned k = 0; k < 36 && di->name[k] != 0; k++) {
				put_char(di->name[k] < 0x80 ? (char)di->name[k] : '?');
			}
			print("'\n");
		}
	}
	for (uint64_t i = 0; i < count; i++) {
		efi_partition_info *info;
		efi_block_io *bio;
		int match = 1;

		if (EFI_ERROR(BS->handle_protocol(handles[i], &part_guid, (void **)&info)) || info->type != 2) {
			continue;
		}
		for (unsigned k = 0; k < 36; k++) {
			if (info->name[k] != want[k]) {
				match = 0;
				break;
			}
			if (want[k] == 0) {
				break;
			}
		}
		if (match && !EFI_ERROR(BS->handle_protocol(handles[i], &blk_guid, (void **)&bio))) {
			return bio;
		}
	}
	return NULL;
}

/* Write "boot-recovery" into misc so the next boot is the recovery. Returns 0 on success. */
static int
request_recovery_boot(void)
{
	efi_block_io *bio = find_partition_named(MISC_PARTITION);
	static uint8_t msg[2048] __attribute__((aligned(8)));
	const char *cmd = "boot-recovery";
	efi_status s;
	uint64_t bs;

	if (bio == NULL) {
		print("recovery: no misc partition\n");
		return -1;
	}
	if (bio->media == NULL || bio->media->block_size == 0) {
		print("recovery: misc has no media\n");
		return -1;
	}
	bs = bio->media->block_size;
	memset(msg, 0, sizeof(msg));
	memcpy(msg, cmd, str_len(cmd));
	/* the CRC that comes with the struct (AOSP writes it over the first 1064 bytes) */
	{
		uint32_t c = crc32_le(0, msg, 1064);
		msg[1080] = (uint8_t)(c & 0xff);
		msg[1081] = (uint8_t)((c >> 8) & 0xff);
		msg[1082] = (uint8_t)((c >> 16) & 0xff);
		msg[1083] = (uint8_t)((c >> 24) & 0xff);
	}
	s = bio->write_blocks(bio, bio->media->media_id, 0, bs, msg);
	if (EFI_ERROR(s)) {
		print("recovery: write to misc failed: %x\n", s);
		return -1;
	}
	bio->flush_blocks(bio);
	print("recovery: 'boot-recovery' written to misc, resetting\n");
	return 0;
}

/* Reset, so the bootloader acts on whatever misc says. */
static void
reset_now(void)
{
	if (ST->rt != NULL && ST->rt->reset_system != NULL) {
		ST->rt->reset_system(0 /* EfiResetCold */, 0, 0, NULL);
	}
	for (;;) {
	}
}


/*
 * CHIRON_DUMP_PARTS
 *
 * Diagnostics without a photograph: build the partition list (and the state of the pieces
 * find_log_partition() depends on) into a buffer and write it into the "oops" partition,
 * which Android uses for panic logs and which nothing needs during bring-up. TWRP can then
 * read it with dd.
 */
static char dump_buf[32768];

static void
dump_puts(const char *s)
{
	static uint64_t n;
	while (*s != 0 && n + 1 < sizeof(dump_buf)) {
		dump_buf[n++] = *s;
	}
}

static void
dump_put_hex(uint64_t v)
{
	char tmp[19];
	int i = 0;
	dump_puts("0x");
	if (v == 0) {
		dump_puts("0");
		return;
	}
	while (v != 0 && i < 16) {
		tmp[i++] = "0123456789abcdef"[v & 0xf];
		v >>= 4;
	}
	while (i-- > 0) {
		char c[2] = { tmp[i], 0 };
		dump_puts(c);
	}
}

static int
dump_partitions(void)
{
	static const efi_guid part_guid = EFI_PARTITION_INFO_GUID;
	efi_handle *handles;
	uint64_t count, n = 0;

	memset(dump_buf, 0, sizeof(dump_buf));
	dump_puts("CHIRONDUMP partition list\n");

	if (EFI_ERROR(BS->locate_handle_buffer(ByProtocol, &part_guid, NULL, &count, &handles))) {
		dump_puts("locate_handle_buffer(partition info) FAILED\n");
		count = 0;
	} else {
		dump_puts("partition handles: ");
		dump_put_hex(count);
		dump_puts("\n");
		for (uint64_t i = 0; i < count && i < 200; i++) {
			efi_partition_info *info;
			efi_block_io *bio;
			static const efi_guid blk_guid = EFI_BLOCK_IO_GUID;

			if (EFI_ERROR(BS->handle_protocol(handles[i], &part_guid, (void **)&info))) {
				continue;
			}
			dump_puts("[");
			dump_put_hex(i);
			dump_puts("] type=");
			dump_put_hex(info->type);
			dump_puts(" name='");
			for (unsigned k = 0; k < 36 && info->name[k] != 0; k++) {
				char c[2] = { (char)(info->name[k] & 0x7f), 0 };
				dump_puts(c);
			}
			dump_puts("'");
			if (!EFI_ERROR(BS->handle_protocol(handles[i], &blk_guid, (void **)&bio)) &&
			    bio != NULL && bio->media != NULL) {
				dump_puts(" bs=");
				dump_put_hex(bio->media->block_size);
				dump_puts(" last=");
				dump_put_hex(bio->media->last_block);
				n++;
			} else {
				dump_puts(" (no block io)");
			}
			dump_puts("\n");
		}
		dump_puts("with block io: ");
		dump_put_hex(n);
		dump_puts("\n");
	}

	/* what find_log_partition() looks for */
	dump_puts("LOG_PARTITION wanted: logfs\n");
	{
		efi_block_io *bio = find_partition_named(u"logfs");
		dump_puts("find_partition_named(logfs): ");
		dump_puts(bio != NULL ? "FOUND\n" : "NULL\n");
	}

	/* write it into oops */
	{
		efi_block_io *bio = find_partition_named(u"oops");
		uint64_t bs, len;
		efi_status s;

		if (bio == NULL || bio->media == NULL) {
			return -1;
		}
		bs = bio->media->block_size;
		len = (sizeof(dump_buf) + bs - 1) / bs * bs;
		s = bio->write_blocks(bio, bio->media->media_id, 0, len, dump_buf);
		if (EFI_ERROR(s)) {
			return -2;
		}
		bio->flush_blocks(bio);
		return 0;
	}
}

/* CHIRON_AUTO_REBOOT: boot-arg reboot=1 hands the phone back to Android when a run ends. */
static int auto_reboot;
/* CHIRON_USB_IDLE_RESET: seconds a USB session may sit with no command (usb_idle=N) */
static int usb_idle_seconds;

static void
reboot(void)
{
	hc_take_back("before the reset");
	flush_log();
	/*
	 * CHIRON_HALT_NO_REBOOT: a reset hands the phone back to the bootloader, which then
	 * starts Android and wipes the screen -- the run's last lines are lost. Stop here
	 * instead: the panel keeps them, and flush_log() has already tried to put the same
	 * text in a partition.
	 *
	 * CHIRON_AUTO_REBOOT: unless the run asked for the other behaviour with reboot=1.
	 * Then the log is already in the partition, Android starts, and the host can read it
	 * without anyone touching the phone -- which is what makes a run repeatable.
	 */
	if (auto_reboot) {
		print("\n== REBOOTING to Android (reboot=1); the log is in the partition ==\n");
		BS->stall(500000);
		ST->rt->reset_system(0 /* EfiResetCold */, 0, 0, NULL);
	}
	print("\n== HALTED (no reboot) ==\n");
	for (;;) {
	}
}

/*
 * Return-from-kernel support.
 *
 * Boot services are never exited: UEFI stays resident outside XNU's memory
 * window. loader_save_ctx() records the UEFI execution environment and
 * returns 0. When the kernel is done it jumps to loader_return_stub (mapped
 * 1:1 or with the MMU off) with x0 = PA of its log, x1 = length, x2 = reason
 * (0 = orderly, 1 = early exception, then x3..x7 = ESR, ELR, FAR, LR, SP).
 * The stub switches the MMU off, reinstates the saved environment and makes
 * loader_save_ctx() return a second time, with 1.
 *
 * The EL1 physical timer (CNTP_*) is deliberately left alone: the Qualcomm
 * hypervisor traps it. The CTX_CNTP_* slots are unused.
 */
enum {
	CTX_TTBR0, CTX_TCR, CTX_MAIR, CTX_SCTLR, CTX_VBAR, CTX_CPACR, CTX_SP, CTX_SPSEL, CTX_DAIF,
	CTX_CNTV_CTL, CTX_CNTV_CVAL, CTX_CNTP_CTL, CTX_CNTP_CVAL, CTX_CNTKCTL,
	CTX_X18, CTX_X19, /* ... x30 */
	CTX_LOG_PA = CTX_X19 + 12, CTX_LOG_LEN, CTX_REASON, CTX_ESR, CTX_ELR, CTX_FAR, CTX_LR, CTX_KSP,
	CTX_TPIDR_EL1, CTX_TPIDR_EL0, CTX_TPIDRRO_EL0, CTX_SP_EL0, CTX_CONTEXTIDR, CTX_MDSCR, CTX_FPCR, CTX_FPSR,
	CTX_ICC_PMR, CTX_ICC_IGRPEN1, CTX_ICC_BPR1, CTX_COUNT
};
uint64_t loader_ctx[CTX_COUNT];
int loader_save_ctx(void);
void loader_return_stub(void);

__asm__ (
        ".text\n"
        ".balign 64\n"
        ".globl loader_save_ctx\n"
        "loader_save_ctx:\n"
        "  adrp x10, loader_ctx\n"
        "  add  x10, x10, :lo12:loader_ctx\n"
        "  mrs x9, ttbr0_el1\n   str x9, [x10, #0]\n"
        "  mrs x9, tcr_el1\n     str x9, [x10, #8]\n"
        "  mrs x9, mair_el1\n    str x9, [x10, #16]\n"
        "  mrs x9, sctlr_el1\n   str x9, [x10, #24]\n"
        "  mrs x9, vbar_el1\n    str x9, [x10, #32]\n"
        "  mrs x9, cpacr_el1\n   str x9, [x10, #40]\n"
        "  mov x9, sp\n          str x9, [x10, #48]\n"
        "  mrs x9, spsel\n       str x9, [x10, #56]\n"
        "  mrs x9, daif\n        str x9, [x10, #64]\n"
        "  mrs x9, cntv_ctl_el0\n  str x9, [x10, #72]\n"
        "  mrs x9, cntv_cval_el0\n str x9, [x10, #80]\n"
        "  mrs x9, cntkctl_el1\n   str x9, [x10, #104]\n"
        /* Qualcomm's UEFI has its own thread scheduler and keeps its current-thread
         * pointer in TPIDR_EL1; the kernel overwrites it, so it must come back intact. */
        "  mrs x9, tpidr_el1\n     str x9, [x10, #280]\n"
        "  mrs x9, tpidr_el0\n     str x9, [x10, #288]\n"
        "  mrs x9, tpidrro_el0\n   str x9, [x10, #296]\n"
        "  mrs x9, contextidr_el1\n str x9, [x10, #312]\n"
        "  mrs x9, mdscr_el1\n     str x9, [x10, #320]\n"
        "  mrs x9, s3_3_c4_c4_0\n          str x9, [x10, #328]\n"
        "  mrs x9, s3_3_c4_c4_1\n          str x9, [x10, #336]\n"
        /* GICv3 CPU interface: the kernel reprograms it for its own interrupts */
        "  mrs x9, icc_pmr_el1\n     str x9, [x10, #344]\n"
        "  mrs x9, icc_igrpen1_el1\n str x9, [x10, #352]\n"
        "  mrs x9, icc_bpr1_el1\n    str x9, [x10, #360]\n"
        "  mrs x9, spsel\n"
        "  cbz x9, 1f\n"                  /* SP_EL0 is only accessible while running on SP_EL1 */
        "  mrs x9, sp_el0\n        str x9, [x10, #304]\n"
        "1:\n"
        "  str x18, [x10, #112]\n"
        "  stp x19, x20, [x10, #120]\n"
        "  stp x21, x22, [x10, #136]\n"
        "  stp x23, x24, [x10, #152]\n"
        "  stp x25, x26, [x10, #168]\n"
        "  stp x27, x28, [x10, #184]\n"
        "  stp x29, x30, [x10, #200]\n"
        "  mov x0, #0\n"
        "  ret\n"
        ".balign 64\n"
        ".globl loader_return_stub\n"
        "loader_return_stub:\n"
        "  msr daifset, #0xf\n"
        /* CHIRON_NO_PAN: msr PAN / msr UAO are ARMv8.1.  MSM8998's Kryo 280 is ARMv8.0, so
         * both are undefined instructions there and take the run down before the jump;
         * they are nops now, as the port's own apply_chiron does.
         * PSTATE bits the kernel may have left set. PAN in particular is fatal:
         * UEFI maps its memory as EL0-accessible, so with PAN every data access
         * (including the exception handler's own stack push) faults. */
        "  .inst 0xd503201f\n"          /* msr PAN, #0 */
        "  .inst 0xd503201f\n"          /* msr UAO, #0 */
        "  mrs x9, sctlr_el1\n"
        "  bic x9, x9, #0x1\n"
        "  bic x9, x9, #0x4\n"
        "  bic x9, x9, #0x1000\n"
        "  msr sctlr_el1, x9\n"
        "  isb\n"
        "  adrp x10, loader_ctx\n"
        "  add  x10, x10, :lo12:loader_ctx\n"
        "  ldr x9, [x10, #0]\n   msr ttbr0_el1, x9\n"
        "  ldr x9, [x10, #8]\n   msr tcr_el1, x9\n"
        "  ldr x9, [x10, #16]\n  msr mair_el1, x9\n"
        "  ldr x9, [x10, #32]\n  msr vbar_el1, x9\n"
        "  ldr x9, [x10, #40]\n  msr cpacr_el1, x9\n"
        "  isb\n"
        "  tlbi vmalle1\n"
        "  dsb sy\n"
        "  ic iallu\n"
        "  isb\n"
        "  ldr x9, [x10, #24]\n  msr sctlr_el1, x9\n"
        "  isb\n"
        "  ldr x9, [x10, #56]\n"
        "  cbz x9, 1f\n"
        "  msr spsel, #1\n"
        "  ldr x9, [x10, #304]\n msr sp_el0, x9\n"
        "  b 2f\n"
        "1:\n"
        "  msr spsel, #0\n"
        "2:\n"
        "  ldr x9, [x10, #48]\n  mov sp, x9\n"
        "  ldr x9, [x10, #280]\n msr tpidr_el1, x9\n"
        "  ldr x9, [x10, #288]\n msr tpidr_el0, x9\n"
        "  ldr x9, [x10, #296]\n msr tpidrro_el0, x9\n"
        "  ldr x9, [x10, #312]\n msr contextidr_el1, x9\n"
        "  ldr x9, [x10, #320]\n msr mdscr_el1, x9\n"
        "  ldr x9, [x10, #344]\n msr icc_pmr_el1, x9\n"
        "  ldr x9, [x10, #360]\n msr icc_bpr1_el1, x9\n"
        "  ldr x9, [x10, #352]\n msr icc_igrpen1_el1, x9\n"
        "  ldr x9, [x10, #328]\n msr s3_3_c4_c4_0, x9\n"
        "  ldr x9, [x10, #336]\n msr s3_3_c4_c4_1, x9\n"
        "  ldr x9, [x10, #104]\n msr cntkctl_el1, x9\n"
        "  ldr x9, [x10, #80]\n  msr cntv_cval_el0, x9\n"
        "  ldr x9, [x10, #72]\n  msr cntv_ctl_el0, x9\n"
        "  ldr x18, [x10, #112]\n"
        "  ldp x19, x20, [x10, #120]\n"
        "  ldp x21, x22, [x10, #136]\n"
        "  ldp x23, x24, [x10, #152]\n"
        "  ldp x25, x26, [x10, #168]\n"
        "  ldp x27, x28, [x10, #184]\n"
        "  ldp x29, x30, [x10, #200]\n"
        "  stp x0, x1, [x10, #216]\n"   /* kernel log PA and length, stored with caches on */
        "  stp x2, x3, [x10, #232]\n"   /* reason, ESR */
        "  stp x4, x5, [x10, #248]\n"   /* ELR, FAR */
        "  stp x6, x7, [x10, #264]\n"   /* LR, SP */
        "  ldr x9, [x10, #64]\n  msr daif, x9\n"
        "  mov x0, #1\n"
        "  ret\n"
        );

__attribute__((noreturn)) static void
jump_to_kernel(uint64_t entry, uint64_t boot_args_pa)
{
	__asm__ volatile (
                "msr daifset, #0xf\n"
                /* Last thing before the MMU goes off: write this stack back to RAM
                 * (dirty cache lines do not survive, and we come back to this frame). */
                "mov x2, sp\n"
                "sub x2, x2, #0x400\n"
                "bic x2, x2, #63\n"
                "add x3, x2, #0x4000\n"
                "1: dc cvac, x2\n"
                "add x2, x2, #64\n"
                "cmp x2, x3\n"
                "b.lo 1b\n"
                "dsb sy\n"
                "mrs x2, sctlr_el1\n"
                "bic x2, x2, #0x1\n"    /* M: MMU off */
                "bic x2, x2, #0x4\n"    /* C: data cache off */
                "bic x2, x2, #0x1000\n" /* I: instruction cache off */
                "msr sctlr_el1, x2\n"
                "isb\n"
                "ic iallu\n"
                "dsb sy\n"
                "isb\n"
                "mov x0, %1\n"
                "br %0\n"
                : : "r" (entry), "r" (boot_args_pa) : "x0", "x2", "x3");
	__builtin_unreachable();
}

/* ------------------------------------------------------------------------ */
/* The kernel on another core.                                               */
/*                                                                          */
/* The firmware runs on core 0, one of the four small ones (Cortex-A55); the */
/* kernel uses a single core, and it had better be a big one (the A78s are   */
/* about 2.5 times as fast). With "bootcpu=N" among the kernel's arguments   */
/* the loader does not jump into the kernel itself: it has the firmware      */
/* (PSCI) start core N at other_cpu_entry, which enters the kernel exactly   */
/* as core 0 would have, and waits. UEFI stays resident and lives on core 0, */
/* so the kernel's way back is different too: other_cpu_return_stub, on core */
/* N, leaves what the kernel returned where core 0 looks for it, wakes core  */
/* 0 and switches its own core off.                                         */

#define PSCI_CPU_OFF       0x84000002u
#define PSCI_CPU_ON        0xC4000003u
#define PSCI_AFFINITY_INFO 0xC4000004u      /* (MPIDR, 0): 0 = that core is on, 1 = off, 2 = being started */
#define PSCI_NOT_SUPPORTED (-1)

/* each alone in a cache line: one core reads them with its caches off */
static struct {
	uint64_t entry, boot_args;
} other_cpu_start __attribute__((aligned(64)));
volatile uint64_t other_cpu_stage __attribute__((aligned(64)));  /* 1: that core has reached other_cpu_entry */
volatile uint64_t other_cpu_done __attribute__((aligned(64)));   /* 1: the kernel is back (other_cpu_return_stub) */
uint64_t psci_by_hvc __attribute__((aligned(64)));
void other_cpu_entry(void);
void other_cpu_return_stub(void);

__asm__ (
        ".text\n"
        ".balign 64\n"
        ".globl other_cpu_entry\n"
        "other_cpu_entry:\n"                    /* x0 = &other_cpu_start; MMU and caches are off */
        "  msr daifset, #0xf\n"
        /* until the kernel has vectors of its own, an exception must not go nowhere */
        "  adrp x9, other_cpu_vectors\n"
        "  add  x9, x9, :lo12:other_cpu_vectors\n"
        "  msr vbar_el1, x9\n"
        /* what the firmware had set up on the core the kernel used to start on, the kernel may take
         * for granted: floating point allowed (CPACR), the fixed bits of SCTLR */
        "  adrp x10, loader_ctx\n"
        "  add  x10, x10, :lo12:loader_ctx\n"
        "  ldr x9, [x10, #40]\n"
        "  msr cpacr_el1, x9\n"
        "  ldr x9, [x10, #24]\n"
        "  bic x9, x9, #0x1\n"
        "  bic x9, x9, #0x4\n"
        "  bic x9, x9, #0x1000\n"
        "  msr sctlr_el1, x9\n"
        "  isb\n"
        "  adrp x9, other_cpu_stage\n"
        "  add  x9, x9, :lo12:other_cpu_stage\n"
        "  mov x10, #1\n"
        "  str x10, [x9]\n"
        "  ldp x9, x10, [x0]\n"
        "  mov x0, x10\n"
        "  br x9\n"
        "other_cpu_fault:\n"                    /* as an early exception in the kernel: reason 1 */
        "  mrs x3, esr_el1\n"
        "  mrs x4, elr_el1\n"
        "  mrs x5, far_el1\n"
        "  mov x6, x30\n"
        "  mov x7, sp\n"
        "  mov x0, #0\n"
        "  mov x1, #0\n"
        "  mov x2, #1\n"
        "  b other_cpu_return_stub\n"
        ".balign 0x800\n"
        "other_cpu_vectors:\n"
        "  b other_cpu_fault\n  .balign 0x80\n  b other_cpu_fault\n  .balign 0x80\n"
        "  b other_cpu_fault\n  .balign 0x80\n  b other_cpu_fault\n  .balign 0x80\n"
        "  b other_cpu_fault\n  .balign 0x80\n  b other_cpu_fault\n  .balign 0x80\n"
        "  b other_cpu_fault\n  .balign 0x80\n  b other_cpu_fault\n  .balign 0x80\n"
        "  b other_cpu_fault\n  .balign 0x80\n  b other_cpu_fault\n  .balign 0x80\n"
        "  b other_cpu_fault\n  .balign 0x80\n  b other_cpu_fault\n  .balign 0x80\n"
        "  b other_cpu_fault\n  .balign 0x80\n  b other_cpu_fault\n  .balign 0x80\n"
        "  b other_cpu_fault\n  .balign 0x80\n  b other_cpu_fault\n  .balign 0x80\n"
        ".balign 64\n"
        ".globl other_cpu_return_stub\n"
        "other_cpu_return_stub:\n"              /* x0..x7 as for loader_return_stub */
        "  msr daifset, #0xf\n"
        "  .inst 0xd503201f\n"                  /* msr PAN, #0 */
        "  .inst 0xd503201f\n"                  /* msr UAO, #0 */
        "  mrs x9, sctlr_el1\n"
        "  bic x9, x9, #0x1\n"
        "  bic x9, x9, #0x4\n"
        "  bic x9, x9, #0x1000\n"
        "  msr sctlr_el1, x9\n"
        "  isb\n"
        "  adrp x10, loader_ctx\n"
        "  add  x10, x10, :lo12:loader_ctx\n"
        "  stp x0, x1, [x10, #216]\n"           /* kernel log PA and length */
        "  stp x2, x3, [x10, #232]\n"           /* reason, ESR */
        "  stp x4, x5, [x10, #248]\n"           /* ELR, FAR */
        "  stp x6, x7, [x10, #264]\n"           /* LR, SP */
        "  adrp x10, other_cpu_done\n"
        "  add  x10, x10, :lo12:other_cpu_done\n"
        "  mov x9, #1\n"
        "  str x9, [x10]\n"
        "  dsb sy\n"
        "  sev\n"
        "  adrp x10, psci_by_hvc\n"
        "  add  x10, x10, :lo12:psci_by_hvc\n"
        "  ldr x9, [x10]\n"
        "  mov x0, #0x0002\n"                   /* PSCI CPU_OFF: does not return */
        "  movk x0, #0x8400, lsl #16\n"
        "  cbnz x9, 2f\n"
        "  smc #0\n"
        "1: wfi\n"
        "  b 1b\n"
        "2: hvc #0\n"
        "  b 1b\n"
        );

static uint64_t smc_call(uint64_t id, uint64_t a1, uint64_t a2, uint64_t *r1, uint64_t *r2);
static uint64_t smc_x3;
static const struct platform *PLAT;
static void clean_dcache(uint64_t start, uint64_t end);
static void flush_dcache(uint64_t start, uint64_t end);

/* What the kernel shows a watching loader (struct loader_live in XNU's loader_return.c). */
struct kernel_live {
	uint64_t magic;                 /* "XNULIVE!" */
	uint64_t heartbeat;             /* goes up every 10 seconds while the kernel is alive */
	uint64_t log, log_len, log_ring_at, log_wrapped;        /* the kernel's virtual addresses: add the slide */
	uint64_t log_head, log_ring;    /* the log: this much from the start of the boot, then a ring this big */
	uint64_t recording;             /* (a virtual address too) { physical address, bytes } of a screen recording */
	uint64_t stop;                  /* ours to write: the host wants the run to end ("oem stop") */
	uint64_t magic2;                /* "XNULIVE2": the kernel is new enough to have what follows */
	uint64_t sound;                 /* (a virtual address too) the same for a recording of the sound */
};

/*
 * Battery state shared with XNU.  Qualcomm's charger firmware remains a UEFI
 * boot-service client on core 0 while XNU runs on another core.  The loader is
 * therefore the one safe place to call it; XNU only reads this cache.
 */
#define LOADER_BATTERY_MAGIC            0x2154544142574452ULL /* "RDWBATT!" */
#define LOADER_BATTERY_VERSION          1
#define LOADER_BATTERY_VALID            (1u << 0)
#define LOADER_BATTERY_PRESENT          (1u << 1)
#define LOADER_BATTERY_CHARGER_PRESENT  (1u << 2)
#define LOADER_BATTERY_VOLTAGE_VALID    (1u << 3)
#define LOADER_BATTERY_CHARGING         (1u << 4)
#define LOADER_BATTERY_SOC_ESTIMATED    (1u << 5)

struct loader_battery {
	uint64_t magic;
	uint32_t version, size;
	volatile uint32_t sequence;
	uint32_t flags;
	int32_t soc_percent;
	int32_t voltage_mv;
	int32_t current_ma;
	int32_t temperature_c;
	uint32_t charger_action;
	uint32_t polls;
	uint32_t failures;
	uint32_t reserved;
};

/*
 * Layout returned by QcomChargerDxeLA's GetChargingAction, word offsets confirmed by dumping the
 * raw buffer on this phone: [2] state of charge, [3] charge current (signed mA), [4] battery
 * voltage (mV), [5] temperature (C). `rest` is oversized on purpose so a firmware that writes
 * more than the fields we name cannot smash the stack.
 */
struct qcom_battery_status {
	uint32_t status0, status1;
	int32_t state_of_charge;
	int32_t charge_current_ma;
	int32_t battery_voltage_mv;
	int32_t battery_temperature_c;
	uint32_t rest[26];
};

static struct loader_battery charger_shared __attribute__((aligned(0x2000))) = {
	.magic = LOADER_BATTERY_MAGIC,
	.version = LOADER_BATTERY_VERSION,
	.size = sizeof(struct loader_battery),
	.soc_percent = -1,
	.voltage_mv = -1,
	.current_ma = 0,
	.temperature_c = -273,
	.charger_action = 0xffffffffu,
};
static efi_charger_ex *CHARGER_EX;
static efi_qcom_charger *QCOM_CHARGER;
static int charger_enabled;

/* The screen recording the last kernel left in memory, if it made one ("oem recording" stages it). */
static const char *recording_data;
static uint64_t recording_len;
/* ... and the recording of the sound ("oem sound"). */
static const char *sound_data;
static uint64_t sound_len;
#define KERNEL_LIVE_MAGIC2      0x324556494c554e58ULL
#define KERNEL_LIVE_MAGIC       0x214556494c554e58ULL
#define OTHER_CPU_NOT_STARTED   1000    /* run_on_other_cpu(): the firmware said yes but the core never arrived */
#define OTHER_CPU_HUNG          1001    /* ... the kernel stopped giving signs of life */
#define START_SECONDS           5
#define SILENCE_SECONDS         50
#define NOTE_SECONDS            24      /* how long the kernel's progress is written down as it happens */

static void wdt_pet(void);
static int wdt_armed;

/*
 * While a kernel runs on another core and this one watches it: where it shows its signs of life,
 * for the commands that the host sends meanwhile (usb_poll_command).
 */
static const struct kernel_live *running_live;
static uint64_t running_slide;
static void usb_poll_command(void);

static uint64_t
seconds_since(uint64_t then)
{
	return (READ_SYSREG(CNTVCT_EL0) - then) / READ_SYSREG(CNTFRQ_EL0);
}

/* Reverse a stretch of memory in place. */
static void
reverse(char *p, uint64_t n)
{
	for (uint64_t i = 0; i < n / 2; i++) {
		char c = p[i];

		p[i] = p[n - 1 - i];
		p[n - 1 - i] = c;
	}
}

/*
 * The log of a kernel that did not come back to hand it over: put its two parts in order
 * (the ring's oldest character first) and say where it is and how long.
 */
/*
 * CHIRON_LIVE_GUARD
 *
 * live->log, live->log_len and the rest are the KERNEL's virtual addresses; adding slide
 * to one of them gives the physical address it sits at.  That is not always RAM: when the
 * kernel dies before it has set its own bases up, the sum lands far outside the claimed
 * window (FAR was 0x10F0000000, 72 GiB) and reading it is a data abort in the loader --
 * which is what took the run down after the watchdog fired.
 *
 * RAM on this phone is 0x40000000..0x1BD8C0000.  Anything else is not memory.
 */
static int
live_pa_ok(uint64_t pa, uint64_t len)
{
	if (pa < 0x40000000ULL) {
		return 0;
	}
	return len == 0 ? pa < 0x200000000ULL : (pa < 0x200000000ULL && len < 0x200000000ULL - pa);
}

static void
log_of_hung_kernel(const struct kernel_live *live, uint64_t slide)
{
	char *log = (char *)(live->log + slide);
	uint32_t len, ring_at;
	uint64_t len_pa = live->log_len + slide, ring_pa = live->log_ring_at + slide;
	uint64_t wrap_pa = live->log_wrapped + slide;

	loader_ctx[CTX_LOG_PA] = loader_ctx[CTX_LOG_LEN] = 0;
	if (!live_pa_ok((uint64_t)(uintptr_t)log, live->log_head + live->log_ring) ||
	    !live_pa_ok(len_pa, 4) || !live_pa_ok(ring_pa, 4) || !live_pa_ok(wrap_pa, 1)) {
		print("log_of_hung_kernel: the kernel's log is not in RAM (log pa %x), nothing to read\n",
		    (uint64_t)(uintptr_t)log);
		return;
	}
	len = *(volatile uint32_t *)(uintptr_t)len_pa;
	ring_at = *(volatile uint32_t *)(uintptr_t)ring_pa;
	if (*(volatile uint8_t *)(uintptr_t)wrap_pa && ring_at < live->log_ring) {
		/* rotate the ring left by ring_at: three reversals */
		reverse(log + live->log_head, ring_at);
		reverse(log + live->log_head + ring_at, live->log_ring - ring_at);
		reverse(log + live->log_head, live->log_ring);
		len = (uint32_t)(live->log_head + live->log_ring);
	}
	if (len <= live->log_head + live->log_ring) {
		loader_ctx[CTX_LOG_PA] = (uint64_t)(uintptr_t)log;
		loader_ctx[CTX_LOG_LEN] = len;
	}
}

/*
 * The log of a kernel that is alive and is merely being asked how it is doing ("oem log" during
 * a run): a copy in the right order after the loader's own log, with nothing moved under the
 * kernel's feet.
 */
static void
compose_live_log(const struct kernel_live *live, uint64_t slide)
{
	static const char sep[] = "\n== KERNEL LOG (the kernel is still running) ==\n";
	const char *log = (const char *)(live->log + slide);
	uint32_t len = *(volatile uint32_t *)(live->log_len + slide);
	uint32_t ring_at = *(volatile uint32_t *)(live->log_ring_at + slide);
	int wrapped = *(volatile uint8_t *)(live->log_wrapped + slide);
	uint64_t n, room = sizeof(out_buf) - 8192;

	compose_logs(NULL, 0);
	n = staged_len;
#define PUT(from, size) do { \
	uint64_t take = (size); \
	if (n + take > room) { \
	        take = room - n; \
	} \
	memcpy(out_buf + n, (from), take); \
	n += take; \
} while (0)
	PUT(sep, sizeof(sep) - 1);
	if (!wrapped || ring_at >= live->log_ring) {
		PUT(log, len <= live->log_head + live->log_ring ? len : live->log_head + live->log_ring);
	} else {
		PUT(log, live->log_head);
		PUT(log + live->log_head + ring_at, live->log_ring - ring_at);
		PUT(log + live->log_head, ring_at);
	}
#undef PUT
	staged_len = n;
}

static void print(const char *fmt, ...);
static void flush_log(void);
static void put_char(char c);

/* A voltage-only fallback is deliberately conservative; the real QG SOC wins whenever available. */
static int
soc_from_voltage(uint32_t mv)
{
	if (mv <= 3300) return 0;
	if (mv < 3700) return (int)((mv - 3300) * 10 / 400);
	if (mv < 3900) return 10 + (int)((mv - 3700) * 40 / 200);
	if (mv < 4200) return 50 + (int)((mv - 3900) * 40 / 300);
	if (mv < 4400) return 90 + (int)((mv - 4200) * 10 / 200);
	return 100;
}

/* Read-only status query.  No TakeAction call and no charger-limit writes are made here. */
static void
charger_poll(void)
{
	struct qcom_battery_status status;
	uint32_t action = 0xffffffffu, flags = 0, voltage = 0;
	uint8_t present = 0, plugged = 0;
	efi_status s;
	int have_soc = 0, have_voltage = 0;

	if (!charger_enabled) {
		return;
	}
	memset(&status, 0, sizeof(status));

	charger_shared.sequence++;
	__asm__ volatile ("dmb ish" ::: "memory");
	if (CHARGER_EX != NULL) {
		s = CHARGER_EX->get_battery_presence(&present);
		if (!EFI_ERROR(s) && present) flags |= LOADER_BATTERY_PRESENT;
		s = CHARGER_EX->get_charger_presence(&plugged);
		/* CHIRON_CHARGER_VERBOSE: what the firmware actually answers */
		print("charger: presence st=%x plugged=%d\n", (uint64_t)s, (uint64_t)plugged);
		if (!EFI_ERROR(s) && plugged) flags |= LOADER_BATTERY_CHARGER_PRESENT;
		s = CHARGER_EX->get_battery_presence(&present);
		print("charger: battery st=%x present=%d\n", (uint64_t)s, (uint64_t)present);
		s = CHARGER_EX->get_battery_voltage(&voltage);
		print("charger: voltage st=%x mv=%d\n", (uint64_t)s, (uint64_t)voltage);
		if (!EFI_ERROR(s) && voltage >= 2500 && voltage <= 5000) {
			have_voltage = 1;
			flags |= LOADER_BATTERY_VOLTAGE_VALID;
			charger_shared.voltage_mv = (int32_t)voltage;
		}
	}
	if (QCOM_CHARGER != NULL) {
		s = QCOM_CHARGER->get_charging_action(&action, &status, 0);
		if (!EFI_ERROR(s)) {
			charger_shared.charger_action = action;
			if (status.battery_voltage_mv >= 2500 && status.battery_voltage_mv <= 5000) {
				charger_shared.voltage_mv = status.battery_voltage_mv;
				have_voltage = 1;
				flags |= LOADER_BATTERY_VOLTAGE_VALID;
			}
			/*
			 * GetChargingAction returns the firmware's state of charge in word [2] of its
			 * output (confirmed by dumping the raw buffer on this device). We use it as-is
			 * EXCEPT when the fuel gauge is clearly not ready yet: right after initialize()
			 * it can report a near-empty SOC while the cell voltage says otherwise, which is
			 * where the old "shows 1% on a half-full battery" came from. A Li-ion cell above
			 * ~3.6 V is never under 5%, so in that case we distrust the gauge and fall back to
			 * the voltage estimate below until it settles.
			 */
			if (status.state_of_charge >= 0 && status.state_of_charge <= 100) {
				int vmv = have_voltage ? charger_shared.voltage_mv : 0;
				if (status.state_of_charge < 5 && vmv > 3600) {
					/* fuel gauge not settled; leave it to the voltage fallback */
				} else {
					charger_shared.soc_percent = status.state_of_charge;
					have_soc = 1;
					flags |= LOADER_BATTERY_VALID;
				}
			}
			charger_shared.current_ma = status.charge_current_ma;
			charger_shared.temperature_c = status.battery_temperature_c;
		}
	}
	if (!have_soc && have_voltage) {
		charger_shared.soc_percent = soc_from_voltage((uint32_t)charger_shared.voltage_mv);
		flags |= LOADER_BATTERY_VALID | LOADER_BATTERY_SOC_ESTIMATED;
	}
	if (plugged && charger_shared.soc_percent < 100) {
		flags |= LOADER_BATTERY_CHARGING;
	}
	charger_shared.flags = flags;
	charger_shared.polls++;
	if (!(flags & LOADER_BATTERY_VALID)) charger_shared.failures++;
	__asm__ volatile ("dmb ish" ::: "memory");
	charger_shared.sequence++;
	clean_dcache((uint64_t)(uintptr_t)&charger_shared,
	    (uint64_t)(uintptr_t)&charger_shared + sizeof(charger_shared));
}

/* ------------------------------------------------------------------------ */
/* UFS survey (ufs=1): what the phone's storage holds, read only            */

/*
 * The phone's storage as Qualcomm's own UFS driver in this UEFI sees it (UFSDxe): every raw
 * logical unit, every GPT partition with its name, place and size, and for the partitions there
 * are reference images of -- firmware-update/ in the ROM's fw.zip -- an FNV-1a hash of exactly
 * as many bytes as the image has, which tools/ufs-survey.py computes from the images on the host.
 * Where the two agree, reading through this driver gives the bytes that are on the flash, and that
 * is the ground a block device for the kernel is to stand on.
 *
 * Only read_blocks is ever called here: nothing is written, flushed or reset. It runs before the
 * kernel is started, with UEFI's boot services whole and interrupts on.
 */
static const struct {
	const char *name;
	uint64_t bytes;
} ufs_references[] = {
	{ "bluetooth", 503808 }, { "abl", 208896 }, { "aop", 208896 }, { "xbl", 3706880 },
	{ "tz", 3710976 }, { "hyp", 3653632 }, { "dsp", 67108864 }, { "modem", 214265856 },
};

static uint8_t ufs_buffer[1024 * 1024] __attribute__((aligned(4096)));

static uint64_t
ufs_fnv(uint64_t h, const uint8_t *p, uint64_t n)
{
	for (uint64_t i = 0; i < n; i++) {
		h = (h ^ p[i]) * 0x100000001b3ULL;
	}
	return h;
}

/* the partition's name in ASCII (GPT names are UTF-16; these are all plain letters) */
static void
ufs_name(const efi_partition_info *info, char *out, unsigned size)
{
	unsigned i = 0;

	for (; i + 1 < size && i < 36 && info->name[i] != 0; i++) {
		out[i] = info->name[i] < 0x80 ? (char)info->name[i] : '?';
	}
	out[i] = 0;
}

/* "bluetooth_a" and "bluetooth_b" are both "bluetooth": the image is the same for either slot */
static int
ufs_reference_of(const char *name)
{
	for (unsigned r = 0; r < sizeof(ufs_references) / sizeof(ufs_references[0]); r++) {
		const char *a = ufs_references[r].name, *b = name;

		while (*a && *a == *b) {
			a++;
			b++;
		}
		if (*a == 0 && (*b == 0 || ((b[0] == '_') && (b[1] == 'a' || b[1] == 'b') && b[2] == 0))) {
			return (int)r;
		}
	}
	return -1;
}

static void
ufs_hash_partition(efi_block_io *bio, const char *name, uint64_t bytes)
{
	uint64_t bs = bio->media->block_size, h = 0xcbf29ce484222325ULL, done = 0, started = READ_SYSREG(CNTVCT_EL0);
	uint64_t chunk = sizeof(ufs_buffer) / bs * bs, lba = 0;

	if (bs == 0 || bs > sizeof(ufs_buffer) || (bio->media->last_block + 1) * bs < bytes) {
		print("ufs: %s: %d bytes asked for, the partition is smaller\n", name, bytes);
		return;
	}
	while (done < bytes) {
		uint64_t want = bytes - done < chunk ? (bytes - done + bs - 1) / bs * bs : chunk;
		efi_status s = bio->read_blocks(bio, bio->media->media_id, lba, want, ufs_buffer);

		if (EFI_ERROR(s)) {
			print("ufs: %s: reading at block %d: error %x\n", name, lba, (uint64_t)s);
			return;
		}
		if (done == 0) {
			print("ufs: %s: begins", name);
			for (int k = 0; k < 16; k++) {
				print(" %x", (uint64_t)ufs_buffer[k]);
			}
			print("\n");
		}
		h = ufs_fnv(h, ufs_buffer, bytes - done < want ? bytes - done : want);
		done += bytes - done < want ? bytes - done : want;
		lba += want / bs;
		if (wdt_armed) {
			wdt_pet();
		}
	}
	print("ufs: %s: fnv %x over %d bytes, %d ms\n", name, h, bytes,
	    (READ_SYSREG(CNTVCT_EL0) - started) * 1000 / READ_SYSREG(CNTFRQ_EL0));
}

/* CRC-32 as GPT uses it (IEEE 802.3, reflected, 0xedb88320) */
static uint32_t
ufs_crc32(const uint8_t *p, uint64_t n)
{
	uint32_t c = 0xffffffffu;

	for (uint64_t i = 0; i < n; i++) {
		c ^= p[i];
		for (int k = 0; k < 8; k++) {
			c = (c >> 1) ^ (0xedb88320u & (0u - (c & 1)));
		}
	}
	return ~c;
}

/*
 * A unit's GPT checks itself: its header carries a CRC-32 of the header and one of the table of
 * partitions. Whatever firmware is on the phone, the bytes read are the bytes on the flash only if
 * both come out right -- the one check here that does not depend on having the same images.
 */
static void
ufs_check_gpt(efi_block_io *bio, uint64_t unit)
{
	uint64_t bs = bio->media->block_size, entries_lba, count, size, bytes, read;
	uint32_t header_size, header_crc, entries_crc, got_header, got_entries;
	uint8_t header[512];

	if (bs < 512 || bs > sizeof(ufs_buffer) ||
	    EFI_ERROR(bio->read_blocks(bio, bio->media->media_id, 1, bs, ufs_buffer))) {
		print("ufs: unit %d: the GPT header could not be read\n", unit);
		return;
	}
	if (ufs_buffer[0] != 'E' || ufs_buffer[1] != 'F' || ufs_buffer[2] != 'I' || ufs_buffer[3] != ' ' ||
	    ufs_buffer[4] != 'P' || ufs_buffer[5] != 'A' || ufs_buffer[6] != 'R' || ufs_buffer[7] != 'T') {
		print("ufs: unit %d: no GPT header in block 1\n", unit);
		return;
	}
	memcpy(header, ufs_buffer, sizeof(header));
	header_size = *(uint32_t *)(header + 12);
	header_crc = *(uint32_t *)(header + 16);
	entries_lba = *(uint64_t *)(header + 72);
	count = *(uint32_t *)(header + 80);
	size = *(uint32_t *)(header + 84);
	entries_crc = *(uint32_t *)(header + 88);
	if (header_size < 92 || header_size > sizeof(header)) {
		print("ufs: unit %d: GPT header size %d\n", unit, (uint64_t)header_size);
		return;
	}
	*(uint32_t *)(header + 16) = 0;
	got_header = ufs_crc32(header, header_size);
	bytes = count * size;
	if (bytes == 0 || bytes > sizeof(ufs_buffer)) {
		print("ufs: unit %d: GPT header crc %s, a table of %d bytes not checked\n", unit,
		    got_header == header_crc ? "right" : "WRONG", bytes);
		return;
	}
	read = (bytes + bs - 1) / bs * bs;
	if (EFI_ERROR(bio->read_blocks(bio, bio->media->media_id, entries_lba, read, ufs_buffer))) {
		print("ufs: unit %d: the GPT table could not be read\n", unit);
		return;
	}
	got_entries = ufs_crc32(ufs_buffer, bytes);
	print("ufs: unit %d: GPT header crc %s (%x), table of %d entries crc %s (%x)\n", unit,
	    got_header == header_crc ? "right" : "WRONG", (uint64_t)got_header, count,
	    got_entries == entries_crc ? "right" : "WRONG", (uint64_t)got_entries);
}

/* one line per 32 bytes: "ufs: PART WHAT +OFFSET: hex" */
static void
ufs_dump_of(const char *part, const char *what, const uint8_t *p, uint64_t n)
{
	for (uint64_t at = 0; at < n; at += 32) {
		char line[72];
		unsigned k = 0;

		for (uint64_t i = at; i < n && i < at + 32; i++) {
			line[k++] = "0123456789abcdef"[p[i] >> 4];
			line[k++] = "0123456789abcdef"[p[i] & 15];
		}
		line[k] = 0;
		print("ufs: %s %s +%x: %s\n", part, what, at, line);
	}
}

static void
ufs_dump(const char *what, const uint8_t *p, uint64_t n)
{
	ufs_dump_of("super", what, p, n);
}

/*
 * The start of userdata: where an f2fs (or ext4) of Android's would have its superblock, at 1024
 * and, for f2fs, its copy at 4096 + 1024. Plain text there says the filesystem itself lies on the
 * flash as it is; anything else says it lies under an encryption of the whole partition
 * (Android's metadata encryption, dm-default-key), and only Android can see into it.
 */
static void
ufs_dump_userdata(efi_block_io *bio)
{
	uint64_t bs = bio->media->block_size, want = 8192;

	if (bs == 0 || want % bs || EFI_ERROR(bio->read_blocks(bio, bio->media->media_id, 0, want, ufs_buffer))) {
		print("ufs: userdata: its start could not be read\n");
		return;
	}
	ufs_dump_of("userdata", "sb", ufs_buffer + 1024, 1024);
	ufs_dump_of("userdata", "sb2", ufs_buffer + 4096 + 1024, 64);
}

/*
 * Android's own system (system, vendor, product, ...) is not in GPT partitions but in logical ones
 * inside "super", which liblp's metadata at its start describes: a geometry at 4096 (and its copy
 * at 8192), then its metadata slots from 12288 on -- each a header and its tables of partitions,
 * extents, groups and block devices. Printed raw for tools/ufs-super.py, which checks their SHA-256 sums and
 * says where in super nothing lies: a place a volume of this port's own could have without
 * anything of Android's being moved.
 */
static void
ufs_dump_super(efi_block_io *bio)
{
	uint64_t bs = bio->media->block_size, want = 256 * 1024;
	const uint8_t *geometry = ufs_buffer + 4096;
	uint32_t max_size, slots;

	if (bs == 0 || want % bs || (bio->media->last_block + 1) * bs < want ||
	    EFI_ERROR(bio->read_blocks(bio, bio->media->media_id, 0, want, ufs_buffer))) {
		print("ufs: super: its start could not be read\n");
		return;
	}
	if (*(const uint32_t *)geometry != 0x616c4467) {
		print("ufs: super: no liblp geometry (magic %x)\n", (uint64_t)*(const uint32_t *)geometry);
		return;
	}
	ufs_dump("geometry", geometry, 52);
	max_size = *(const uint32_t *)(geometry + 40);
	slots = *(const uint32_t *)(geometry + 44);
	/* a slot per A/B slot: the first describes super as slot _a sees it, the second as _b does */
	for (uint32_t slot = 0; slot < slots && slot < 2; slot++) {
		const uint8_t *header = ufs_buffer + 3 * 4096 + (uint64_t)slot * max_size;
		uint32_t header_size, tables_size;
		char what[8] = "header0", tables[8] = "tables0";

		if (3 * 4096 + (uint64_t)(slot + 1) * max_size > want || *(const uint32_t *)header != 0x414c5030) {
			print("ufs: super: slot %d: no metadata header within the first %d KB\n", (uint64_t)slot, want >> 10);
			continue;
		}
		header_size = *(const uint32_t *)(header + 8);
		tables_size = *(const uint32_t *)(header + 44);
		if (header_size < 128 || header_size > 256 || tables_size > max_size - header_size || tables_size > 16384) {
			print("ufs: super: slot %d: header of %d bytes, tables of %d: not dumped\n", (uint64_t)slot,
			    (uint64_t)header_size, (uint64_t)tables_size);
			continue;
		}
		what[6] = tables[6] = (char)('0' + slot);
		ufs_dump(what, header, header_size);
		ufs_dump(tables, header + header_size, tables_size);
	}
}

static void
ufs_survey(void)
{
	static const efi_guid part_guid = EFI_PARTITION_INFO_GUID;
	static const efi_guid blk_guid = EFI_BLOCK_IO_GUID;
	efi_handle *handles;
	uint64_t count, units = 0, partitions = 0;

	/* the raw logical units: the block devices that are not partitions of another */
	if (!EFI_ERROR(BS->locate_handle_buffer(ByProtocol, &blk_guid, NULL, &count, &handles))) {
		for (uint64_t i = 0; i < count; i++) {
			efi_block_io *bio;

			if (EFI_ERROR(BS->handle_protocol(handles[i], &blk_guid, (void **)&bio)) || bio->media->logical) {
				continue;
			}
			print("ufs: unit %d: media %d, %d blocks of %d (%d MB), %s, align %d\n", units++,
			    (uint64_t)bio->media->media_id, bio->media->last_block + 1, (uint64_t)bio->media->block_size,
			    (bio->media->last_block + 1) * bio->media->block_size >> 20,
			    bio->media->read_only ? "read only" : "writable", (uint64_t)bio->media->io_align);
			ufs_check_gpt(bio, units - 1);
		}
	}
	/* the GPT partitions, with the hash of those there are images of */
	if (EFI_ERROR(BS->locate_handle_buffer(ByProtocol, &part_guid, NULL, &count, &handles))) {
		print("ufs: no partition information in this UEFI\n");
		return;
	}
	for (uint64_t i = 0; i < count; i++) {
		efi_partition_info *info;
		efi_block_io *bio;
		char name[40];
		int r;

		if (EFI_ERROR(BS->handle_protocol(handles[i], &part_guid, (void **)&info)) || info->type != 2 ||
		    EFI_ERROR(BS->handle_protocol(handles[i], &blk_guid, (void **)&bio))) {
			continue;
		}
		ufs_name(info, name, sizeof(name));
		partitions++;
		print("ufs: part %s: lba %d..%d, %d KB\n", name, info->start_lba, info->end_lba,
		    (bio->media->last_block + 1) * bio->media->block_size >> 10);
		if ((r = ufs_reference_of(name)) >= 0) {
			ufs_hash_partition(bio, name, ufs_references[r].bytes);
		}
		if (name[0] == 's' && name[1] == 'u' && name[2] == 'p' && name[3] == 'e' && name[4] == 'r' && name[5] == 0) {
			ufs_dump_super(bio);
		}
		if (name[0] == 'u' && name[1] == 's' && name[2] == 'e' && name[3] == 'r' && name[4] == 'd' &&
		    name[5] == 'a' && name[6] == 't' && name[7] == 'a' && name[8] == 0) {
			ufs_dump_userdata(bio);
		}
	}
	print("ufs: %d raw units, %d partitions\n", units, partitions);
}

/* ------------------------------------------------------------------------ */
/* UFS block service (ufs=2): the kernel reads the phone's storage through  */
/* this loader, and this loader through Qualcomm's own UFS driver           */

/*
 * The kernel has no driver for the phone's storage, and does not need one: UEFI never exits here,
 * Qualcomm's UFS driver (UFSDxe) has the controller, its PHY, clocks and power up and stays
 * resident, and this loader already serves the kernel from core 0 while the kernel runs on another
 * (the battery). So the kernel asks for blocks through a page both can see, and core 0 reads them
 * with that driver's ReadBlocks into a buffer both can see. The kernel's side is
 * bsd/dev/redwood_ufs.c; it gets the page's address as ufs_shared_pa= on its command line.
 *
 * Reads, and -- with ufs_write=1 on the command line -- writes into one partition and nowhere
 * else: the port's own darwin, proved by its GPT entry (name, both GUIDs, first and last LBA, its
 * logical unit), and in it only past everything the build writes from the computer, so that no
 * answer to the kernel can reach Android's partitions, the iOS volume or the cryptexes. The
 * refusals are here, in the kernel (bsd/dev/redwood_ufs.c) and in UEFI's own driver, which gives
 * out a partition's BlockIo and bounds it: a request has to pass all three.
 *
 * Each side writes its own cache lines only: the kernel the request, core 0 the answer (and the
 * table, once, before the kernel starts). A line one side cleans out of its cache therefore never
 * carries a stale copy of what the other side wrote into it. Into the data buffer core 0 writes
 * only what it has read back after a write of its own, so after the controller's DMA there is
 * nothing of its own in its cache to write back over the data; the kernel, which fills the buffer
 * for a write, cleans its own lines of it before it asks.
 */
#define BLOCK_MAGIC        0x4b434f4c42574452ULL       /* "RDWBLOCK" */
#define BLOCK_VERSION      3
#define BLOCK_MAX_PARTS    160
#define BLOCK_MAX_UNITS    16
#define BLOCK_PART_UNIT    1u                          /* the entry is a whole logical unit, not a partition */
#define BLOCK_OP_READ      0u
#define BLOCK_OP_WRITE     1u

/*
 * The one partition a write may reach, and from which of its blocks. darwin is the port's own
 * 20 GiB at the end of logical unit 0 (README, "The port's partition"); what the build puts there
 * from the computer (tools/darwin-write.py) is the iOS volume at its start and the two cryptexes
 * behind it, and nothing of this port reads or writes the rest -- so the data of iOS lives there
 * and a write is refused before that block. The identity is the whole of darwin-write.py's: the
 * same partition, named the same, of the same size, in the same place, on logical unit 0.
 */
#define BLOCK_WRITE_FIRST  2042368ULL                  /* darwin's blocks of 4096: past both cryptexes */
#define BLOCK_DARWIN_FIRST 25374720ULL                 /* its first and last LBA of unit 0, as the GPT has them */
#define BLOCK_DARWIN_LAST  30617594ULL
#define BLOCK_DARWIN_TYPE  { 0x7c3457ef, 0x0000, 0x11aa, { 0xaa, 0x11, 0x00, 0x30, 0x65, 0x43, 0xec, 0xac } }
#define BLOCK_DARWIN_UNIQ  { 0xfd6854ad, 0x24aa, 0x4fc3, { 0x94, 0xfe, 0x29, 0x01, 0x16, 0x85, 0x8d, 0x68 } }

/*
 * The partitions first, then the logical units they are on (BLOCK_PART_UNIT, named unit0, unit1,
 * ... in the order UEFI lists them). Each partition says which of those it is on and where it
 * begins there, so that a reader of the units themselves -- the kernel's own UFS driver -- finds
 * it; a unit says its logical unit number if its device path does.
 */
struct loader_block_part {
	char name[36];
	uint32_t block_size;
	uint64_t blocks;
	uint64_t start_lba;            /* where it begins on its unit, in the unit's blocks (0 for a unit) */
	uint16_t unit;                 /* the unit it is on, its number among the units; 0xffff: not known */
	uint8_t lun;                   /* a unit's logical unit number as its device path says; 0xff: it does not */
	uint8_t flags;                 /* BLOCK_PART_UNIT */
	uint32_t reserved;
};

struct loader_block {
	/* written by the loader, once, before the kernel starts */
	uint64_t magic;
	uint32_t version, size;
	uint32_t parts, buffer_size;
	uint64_t buffer_pa;
	/*
	 * Which partition takes writes this run, as its index among part[] plus one (0: none), and
	 * from which of its blocks. They are here, in what was padding before ask, so that the page
	 * stays the size and the version it was: one phone is shared between working copies, and a
	 * kernel built before writes existed must go on reading through a loader built after them,
	 * and the other way about -- a kernel that does not know these fields leaves ask.op zero,
	 * which is a read, and a loader that does not know them leaves these zero, which is no write.
	 */
	uint32_t write_part_plus_one;
	uint32_t write_reserved;
	uint64_t write_first;
	/* written by the kernel: what it wants, then request is advanced */
	struct {
		volatile uint32_t request;
		uint32_t part;
		uint64_t lba, count;           /* in the partition's own blocks */
		uint32_t op;                   /* BLOCK_OP_READ, BLOCK_OP_WRITE */
		uint32_t reserved;
	} ask __attribute__((aligned(128)));
	/* written by the loader: answered becomes request when the data is in the buffer */
	struct {
		volatile uint32_t answered;
		uint32_t reserved;
		int64_t status;                /* the EFI status of the read, 0 when it went well */
		uint64_t served, failed, bytes, ticks;
	} answer __attribute__((aligned(128)));
	struct loader_block_part part[BLOCK_MAX_PARTS] __attribute__((aligned(128)));
	/*
	 * Written by the loader before the kernel starts, with ufs_native= on the command line: where
	 * the kernel may put a transfer request list of its own into the UFS host controller for the
	 * run (hc_area, below), and UEFI's, which the loader puts back. hc_pa 0: it may not.
	 */
	struct {
		uint64_t hc_pa;                /* the controller's registers */
		uint64_t area_pa;              /* the list (1 KB, at the start) and command descriptors */
		uint32_t area_size, ucd_offset, ucd_size, slots;
		uint32_t uefi_utrlba, uefi_utrlbau;
	} native __attribute__((aligned(128)));
	/* written by the loader during a run: it takes the controller back (a hung kernel); send nothing more */
	struct {
		volatile uint32_t take_back;
	} loader_native __attribute__((aligned(128)));
	/* written by the kernel: its list is in the controller (for the loader's log) */
	struct {
		volatile uint32_t list_in;
		uint32_t switched_in, switched_out;
		volatile uint32_t cnr_at_switch;       /* UTRLCNR when the kernel's list went in */
	} kernel_native __attribute__((aligned(128)));
};

_Static_assert(__builtin_offsetof(struct loader_block, ask) == 128,
    "the page must stay the size it was: the fields before ask have to fit in what was padding");

/* (8 KB is as far as this target aligns; the kernel maps whole 16 KB pages around both) */
static struct loader_block block_shared __attribute__((aligned(0x2000)));
static void block_io2_probe(efi_handle h, efi_block_io *bio);
static int block_probe_requested;       /* ufs_probe=1: block_io2_probe() at block_start() */
static efi_block_io *block_bios[BLOCK_MAX_PARTS];
static int block_enabled;
static int block_write_requested;       /* ufs_write=1 on the command line */
static int block_write_part = -1;       /* the only partition a write may reach; -1: none, writes refused */
static uint64_t block_writes, block_writes_refused, block_write_bytes;

/* the bytes of a device path before its end node */
static uint64_t
device_path_bytes(const efi_device_path *dp)
{
	const uint8_t *p = (const uint8_t *)dp;
	uint64_t n = 0;

	for (int nodes = 0; nodes < 64; nodes++) {
		uint64_t len = p[n + 2] | (uint64_t)p[n + 3] << 8;

		if (p[n] == 0x7f || len < 4) {
			break;
		}
		n += len;
	}
	return n;
}

/*
 * A unit's device path, a node at a time ("ufs: unit N: path TYPE.SUBTYPE[data] ..."), and its
 * logical unit number if a UFS node (messaging, subtype 0x19: target, then LUN) says it.
 */
static uint8_t
device_path_print(uint64_t unit, const efi_device_path *dp)
{
	const uint8_t *p = (const uint8_t *)dp;
	uint64_t n = 0, total = device_path_bytes(dp);
	uint8_t lun = 0xff;

	print("ufs: unit %d: path", unit);
	while (n < total) {
		uint64_t len = p[n + 2] | (uint64_t)p[n + 3] << 8;

		print(" %x.%x[", (uint64_t)p[n], (uint64_t)p[n + 1]);
		for (uint64_t i = 4; i < len && i < 4 + 24; i++) {
			print("%s%x", (uint64_t)p[n + i] < 16 ? "0" : "", (uint64_t)p[n + i]);
		}
		print("%s]", len > 4 + 24 ? "..." : "");
		if (p[n] == 3 && p[n + 1] == 0x19 && len >= 6) {
			lun = p[n + 5];
		}
		n += len;
	}
	print(lun == 0xff ? "\n" : " (LUN %d)\n", (uint64_t)lun);
	return lun;
}

/*
 * The UFS host controller, for the kernel's own driver (ufs_native= on the command line; without it
 * this loader never touches the controller's registers). The kernel may, for the length of a run,
 * stop the controller's transfer request list, point it at a list of its own in hc_area (memory of
 * this loader, so that putting UEFI's back never depends on the kernel's memory), and start it
 * again; UEFI's list is one slot and its command descriptor, with no room for another request.
 * This loader keeps UEFI's list address (UTRLBA/UTRLBAU) from before the first run and checks it,
 * and puts it back if need be, on every way back from a run (hc_take_back) before anything here
 * touches the storage; it reads for the kernel (block_poll) and writes the log (write_logs) only
 * while UEFI's list is the one in the controller.
 */
#define HC_PA              0x1d84000ULL        /* ufshc@1d84000, "ufs_mem", in this phone's Android device tree */
#define HC_CAP             0x00
#define HC_VER             0x08
#define HC_IS              0x20
#define HC_IE              0x24
#define HC_HCS             0x30
#define HC_HCE             0x34
#define HC_UTRLBA          0x50
#define HC_UTRLBAU         0x54
#define HC_UTRLDBR         0x58
#define HC_UTRLCLR         0x5c
#define HC_UTRLRSR         0x60
#define HC_UTRLCNR         0x64
#define HC_UTMRLDBR        0x78
#define HC_SLOTS           32
#define HC_UCD_OFFSET      0x1000
#define HC_UCD_SIZE        0x800
#define HC_AREA_SIZE       (HC_UCD_OFFSET + HC_SLOTS * HC_UCD_SIZE)

static uint8_t hc_area[HC_AREA_SIZE] __attribute__((aligned(0x2000)));
static int hc_requested;                /* ufs_native= on the command line */
static int hc_known;                    /* UEFI's list address is kept here: check it, put it back */
static uint32_t hc_uefi_lo, hc_uefi_hi;
static int hc_refused_reads;

static inline uint32_t
hc_rd(uint32_t off)
{
	return *(volatile uint32_t *)(uintptr_t)(HC_PA + off);
}

static inline void
hc_wr(uint32_t off, uint32_t v)
{
	__asm__ volatile ("dsb sy" ::: "memory");
	*(volatile uint32_t *)(uintptr_t)(HC_PA + off) = v;
	__asm__ volatile ("dsb sy" ::: "memory");
}

static uint64_t
hc_ms_since(uint64_t then)
{
	return (READ_SYSREG(CNTVCT_EL0) - then) * 1000 / READ_SYSREG(CNTFRQ_EL0);
}

/* UEFI's list in, and running: what UEFI's driver needs to read or write */
static int
hc_list_is_uefis(void)
{
	return !hc_known || (hc_rd(HC_UTRLBA) == hc_uefi_lo && hc_rd(HC_UTRLBAU) == hc_uefi_hi &&
	       (hc_rd(HC_UTRLRSR) & 1) != 0);
}

static void
hc_print_state(const char *when)
{
	print("ufs: %s: list %x:%x (UEFI's %x:%x), run %x, doorbell %x, HCS %x, IS %x, IE %x, completion %x, "
	    "task doorbell %x\n", when, (uint64_t)hc_rd(HC_UTRLBAU), (uint64_t)hc_rd(HC_UTRLBA), (uint64_t)hc_uefi_hi,
	    (uint64_t)hc_uefi_lo, (uint64_t)hc_rd(HC_UTRLRSR), (uint64_t)hc_rd(HC_UTRLDBR), (uint64_t)hc_rd(HC_HCS),
	    (uint64_t)hc_rd(HC_IS), (uint64_t)hc_rd(HC_IE), (uint64_t)hc_rd(HC_UTRLCNR), (uint64_t)hc_rd(HC_UTMRLDBR));
}

/*
 * Whatever the kernel left: UEFI's list back in the controller. The kernel is told to send nothing
 * more (it looks before every doorbell, with interrupts off), given 50 ms, then what is in flight
 * is waited for (1 s), cleared if it does not finish (UTRLCLR: every slot of that list is the
 * kernel's), the list stopped, UEFI's address written back, the list started, all read back.
 */
static void
hc_take_back(const char *when)
{
	uint32_t lo, hi, rsr, db;
	uint64_t t;

	if (!hc_known) {
		return;
	}
	lo = hc_rd(HC_UTRLBA);
	hi = hc_rd(HC_UTRLBAU);
	rsr = hc_rd(HC_UTRLRSR);
	db = hc_rd(HC_UTRLDBR);
	if (lo == hc_uefi_lo && hi == hc_uefi_hi && (rsr & 1)) {
		print("ufs: %s: UEFI's transfer list is in the controller (%x), running, doorbell %x\n", when, (uint64_t)lo,
		    (uint64_t)db);
		return;
	}
	print("ufs: %s: the controller has list %x:%x (run %x, doorbell %x), not UEFI's %x:%x: taking it back\n", when,
	    (uint64_t)hi, (uint64_t)lo, (uint64_t)rsr, (uint64_t)db, (uint64_t)hc_uefi_hi, (uint64_t)hc_uefi_lo);
	block_shared.loader_native.take_back = 1;
	clean_dcache((uint64_t)(uintptr_t)&block_shared.loader_native,
	    (uint64_t)(uintptr_t)&block_shared.loader_native + sizeof(block_shared.loader_native));
	for (t = READ_SYSREG(CNTVCT_EL0); hc_ms_since(t) < 50;) {
	}
	for (t = READ_SYSREG(CNTVCT_EL0); (db = hc_rd(HC_UTRLDBR)) != 0 && hc_ms_since(t) < 1000;) {
	}
	if (db != 0) {
		print("ufs: %s: doorbell %x still set after 1 s\n", when, (uint64_t)db);
		if (hc_rd(HC_UTRLBA) != hc_uefi_lo || hc_rd(HC_UTRLBAU) != hc_uefi_hi) {
			print("ufs: %s: clearing the kernel's slots (UTRLCLR)\n", when);
			hc_wr(HC_UTRLCLR, 0);
			for (t = READ_SYSREG(CNTVCT_EL0); (db = hc_rd(HC_UTRLDBR)) != 0 && hc_ms_since(t) < 1000;) {
			}
			print("ufs: %s: doorbell %x after the clear\n", when, (uint64_t)db);
		}
	}
	/* the completion notifications the kernel's requests left (it says what there was when its list went in) */
	flush_dcache((uint64_t)(uintptr_t)&block_shared.kernel_native,
	    (uint64_t)(uintptr_t)&block_shared.kernel_native + sizeof(block_shared.kernel_native));
	if (block_shared.kernel_native.switched_in != 0) {
		uint32_t cnr = hc_rd(HC_UTRLCNR), ours = cnr & ~block_shared.kernel_native.cnr_at_switch;

		if (ours != 0) {
			hc_wr(HC_UTRLCNR, ours);
		}
		print("ufs: %s: completion %x, at the kernel's switch %x: cleared %x, now %x\n", when, (uint64_t)cnr,
		    (uint64_t)block_shared.kernel_native.cnr_at_switch, (uint64_t)ours, (uint64_t)hc_rd(HC_UTRLCNR));
	}
	hc_wr(HC_UTRLRSR, 0);
	for (t = READ_SYSREG(CNTVCT_EL0); (hc_rd(HC_UTRLRSR) & 1) && hc_ms_since(t) < 100;) {
	}
	hc_wr(HC_UTRLBA, hc_uefi_lo);
	hc_wr(HC_UTRLBAU, hc_uefi_hi);
	hc_wr(HC_UTRLRSR, 1);
	for (t = READ_SYSREG(CNTVCT_EL0); hc_ms_since(t) < 50;) {
	}
	hc_print_state(when);
	print("ufs: %s: UEFI's list %s\n", when, hc_list_is_uefis() ? "put back" : "NOT PUT BACK: the storage is not used");
}

/*
 * Before a run (ufs_native=): what the controller looks like, and UEFI's list address kept -- the
 * first time; later it must be the same (or this loader's own area, which is then taken back).
 */
static int
hc_init(void)
{
	uint32_t lo, hi, area = (uint32_t)(uintptr_t)hc_area;

	if (!hc_requested) {
		return 0;
	}
	lo = hc_rd(HC_UTRLBA);
	hi = hc_rd(HC_UTRLBAU);
	print("ufs: controller at %x: CAP %x, VER %x, HCE %x, HCS %x, IS %x, IE %x, list %x:%x, run %x, doorbell %x\n",
	    HC_PA, (uint64_t)hc_rd(HC_CAP), (uint64_t)hc_rd(HC_VER), (uint64_t)hc_rd(HC_HCE), (uint64_t)hc_rd(HC_HCS),
	    (uint64_t)hc_rd(HC_IS), (uint64_t)hc_rd(HC_IE), (uint64_t)hi, (uint64_t)lo, (uint64_t)hc_rd(HC_UTRLRSR),
	    (uint64_t)hc_rd(HC_UTRLDBR));
	if (!hc_known) {
		if (hi == 0 && lo == area) {
			print("ufs: the controller has this loader's own area for its list before any run: left alone\n");
			return 0;
		}
		hc_uefi_lo = lo;
		hc_uefi_hi = hi;
		hc_known = 1;
		print("ufs: UEFI's transfer list is at %x:%x; it is put back after every run\n", (uint64_t)hi, (uint64_t)lo);
	} else if (lo != hc_uefi_lo || hi != hc_uefi_hi) {
		if (hi == 0 && lo == area) {
			hc_take_back("before the run");
		} else {
			print("ufs: UEFI's list moved from %x:%x to %x:%x: that is UEFI's now\n", (uint64_t)hc_uefi_hi,
			    (uint64_t)hc_uefi_lo, (uint64_t)hi, (uint64_t)lo);
			hc_uefi_lo = lo;
			hc_uefi_hi = hi;
		}
	}
	return hc_list_is_uefis();
}

/*
 * The firmware's configuration tables, by GUID (an ACPI or device tree table among them would say
 * where the storage controller is).
 */
static void
block_tables(void)
{
	for (uint64_t i = 0; ST->tables != NULL && i < ST->nr_tables && i < 32; i++) {
		const efi_guid *g = &ST->tables[i].guid;

		print("ufs: firmware table %d: %x-%x-%x-%x%x-%x%x%x%x%x%x at %x\n", i, (uint64_t)g->a, (uint64_t)g->b,
		    (uint64_t)g->c, (uint64_t)g->d[0], (uint64_t)g->d[1], (uint64_t)g->d[2], (uint64_t)g->d[3],
		    (uint64_t)g->d[4], (uint64_t)g->d[5], (uint64_t)g->d[6], (uint64_t)g->d[7],
		    (uint64_t)(uintptr_t)ST->tables[i].table);
	}
}

/*
 * Is this partition the one a write may reach? Everything about it has to be what it was when the
 * port was set up; one field out of place and nothing is written this run. The name UEFI reports
 * is already in bp->name (ufs_name), in ASCII.
 */
static int
block_is_darwin(const efi_partition_info *info, const efi_block_io *bio, const struct loader_block_part *bp)
{
	static const efi_guid type = BLOCK_DARWIN_TYPE, uniq = BLOCK_DARWIN_UNIQ;
	static const char name[] = "darwin";
	const char *why = NULL;

	for (unsigned i = 0; i < sizeof(name); i++) {
		if (bp->name[i] != name[i]) {
			return 0;               /* another partition: nothing to say about it */
		}
	}
	if (memcmp(&info->type_guid, &type, sizeof(type)) != 0) {
		why = "its type GUID is not the one it had";
	} else if (memcmp(&info->unique_guid, &uniq, sizeof(uniq)) != 0) {
		why = "its unique GUID is not the one it had";
	} else if (info->start_lba != BLOCK_DARWIN_FIRST || info->end_lba != BLOCK_DARWIN_LAST) {
		why = "it does not begin and end where it did";
	} else if (bp->unit != 0) {
		/* the first unit UEFI lists: this firmware's device paths say no logical unit number
		 * (device_path_print finds no 3.19 node), so bp->lun is 0xff for every unit */
		why = "it is not on the first logical unit";
	} else if (bp->block_size != 4096 || bp->blocks != BLOCK_DARWIN_LAST - BLOCK_DARWIN_FIRST + 1) {
		why = "its blocks are not what they were";
	} else if (bio->media->read_only) {
		why = "UEFI gives it out read only";
	}
	if (why != NULL) {
		print("ufs: darwin: no write will be served: %s\n", why);
		return 0;
	}
	print("ufs: darwin (LBA %d..%d of unit 0): its blocks from %d on may be written this run\n",
	    info->start_lba, info->end_lba, BLOCK_WRITE_FIRST);
	return 1;
}

static void
block_start(void)
{
	static const efi_guid part_guid = EFI_PARTITION_INFO_GUID;
	static const efi_guid blk_guid = EFI_BLOCK_IO_GUID;
	efi_handle *handles;
	uint64_t count;

	static const efi_guid dp_guid = EFI_DEVICE_PATH_GUID;
	static struct {
		efi_block_io *bio;
		const efi_device_path *path;
		uint64_t path_bytes;
		uint8_t lun;
	} units[BLOCK_MAX_UNITS];
	uint64_t nunits = 0;

	memset(&block_shared, 0, sizeof(block_shared));
	block_tables();
	/* the logical units: the block devices that are not partitions of another */
	if (!EFI_ERROR(BS->locate_handle_buffer(ByProtocol, &blk_guid, NULL, &count, &handles))) {
		for (uint64_t i = 0; i < count && nunits < BLOCK_MAX_UNITS; i++) {
			efi_block_io *bio;
			efi_device_path *dp;

			if (EFI_ERROR(BS->handle_protocol(handles[i], &blk_guid, (void **)&bio)) || bio->media->logical ||
			    bio->media->block_size == 0 || bio->media->block_size > BLOCK_BUFFER_SIZE ||
			    EFI_ERROR(BS->handle_protocol(handles[i], &dp_guid, (void **)&dp))) {
				continue;
			}
			units[nunits].bio = bio;
			units[nunits].path = dp;
			units[nunits].path_bytes = device_path_bytes(dp);
			units[nunits].lun = device_path_print(nunits, dp);
			nunits++;
		}
	}
	if (EFI_ERROR(BS->locate_handle_buffer(ByProtocol, &part_guid, NULL, &count, &handles))) {
		print("ufs: no partition information: the block service is off\n");
		return;
	}
	for (uint64_t i = 0; i < count && block_shared.parts + nunits < BLOCK_MAX_PARTS; i++) {
		struct loader_block_part *bp = &block_shared.part[block_shared.parts];
		efi_partition_info *info;
		efi_block_io *bio;
		efi_device_path *dp;

		if (EFI_ERROR(BS->handle_protocol(handles[i], &part_guid, (void **)&info)) || info->type != 2 ||
		    EFI_ERROR(BS->handle_protocol(handles[i], &blk_guid, (void **)&bio)) ||
		    bio->media->block_size == 0 || bio->media->block_size > BLOCK_BUFFER_SIZE) {
			continue;
		}
		ufs_name(info, bp->name, sizeof(bp->name));
		bp->block_size = bio->media->block_size;
		bp->blocks = bio->media->last_block + 1;
		bp->start_lba = info->start_lba;
		bp->unit = 0xffff;
		bp->lun = 0xff;
		/* its unit: the one whose device path its own begins with */
		if (!EFI_ERROR(BS->handle_protocol(handles[i], &dp_guid, (void **)&dp))) {
			uint64_t bytes = device_path_bytes(dp);

			for (uint64_t u = 0; u < nunits; u++) {
				if (units[u].path_bytes < bytes &&
				    memcmp(units[u].path, dp, units[u].path_bytes) == 0) {
					bp->unit = (uint16_t)u;
					bp->lun = units[u].lun;
				}
			}
		}
		if (block_write_requested && block_is_darwin(info, bio, bp)) {
			block_write_part = (int)block_shared.parts;
		}
		block_bios[block_shared.parts++] = bio;
		if (block_probe_requested && bp->name[0] == 'd' && bp->name[1] == 'a' && bp->name[2] == 'r' &&
		    bp->name[3] == 'w' && bp->name[4] == 'i' && bp->name[5] == 'n' && bp->name[6] == 0) {
			block_io2_probe(handles[i], bio);
		}
	}
	for (uint64_t u = 0; u < nunits; u++) {
		struct loader_block_part *bp = &block_shared.part[block_shared.parts];
		char *n = bp->name;

		n[0] = 'u', n[1] = 'n', n[2] = 'i', n[3] = 't';
		n[4] = (char)('0' + u / 10 % 10), n[5] = (char)('0' + u % 10), n[6] = 0;
		if (u < 10) {
			n[4] = n[5], n[5] = 0;
		}
		bp->block_size = units[u].bio->media->block_size;
		bp->blocks = units[u].bio->media->last_block + 1;
		bp->unit = (uint16_t)u;
		bp->lun = units[u].lun;
		bp->flags = BLOCK_PART_UNIT;
		block_bios[block_shared.parts++] = units[u].bio;
	}
	/* the kernel's own transfer list: this loader's area, if the controller is as UEFI keeps it */
	if (hc_known && hc_list_is_uefis() && hc_rd(HC_UTRLDBR) == 0 && (hc_rd(HC_HCE) & 1)) {
		memset(hc_area, 0, sizeof(hc_area));
		flush_dcache((uint64_t)(uintptr_t)hc_area, (uint64_t)(uintptr_t)hc_area + sizeof(hc_area));
		block_shared.native.hc_pa = HC_PA;
		block_shared.native.area_pa = (uint64_t)(uintptr_t)hc_area;
		block_shared.native.area_size = sizeof(hc_area);
		block_shared.native.ucd_offset = HC_UCD_OFFSET;
		block_shared.native.ucd_size = HC_UCD_SIZE;
		block_shared.native.slots = HC_SLOTS;
		block_shared.native.uefi_utrlba = hc_uefi_lo;
		block_shared.native.uefi_utrlbau = hc_uefi_hi;
		print("ufs: the kernel may put its own transfer list in, at %x (this loader's), for the run\n",
		    (uint64_t)(uintptr_t)hc_area);
	} else if (hc_requested) {
		print("ufs: the kernel's own transfer list is not offered: the controller is not as UEFI keeps it\n");
	}
	hc_refused_reads = 0;
	hc_log_skips = 0;
	/* per run, like the two above: this loader stays resident across runs, and a tally carried
	 * over from the run before is read as this one's */
	block_writes = block_writes_refused = block_write_bytes = 0;
	if (block_write_part >= 0) {
		block_shared.write_part_plus_one = (uint32_t)block_write_part + 1;
		block_shared.write_first = BLOCK_WRITE_FIRST;
	}
	block_shared.magic = BLOCK_MAGIC;
	block_shared.version = BLOCK_VERSION;
	block_shared.size = sizeof(block_shared);
	block_shared.buffer_size = BLOCK_BUFFER_SIZE;
	block_shared.buffer_pa = (uint64_t)(uintptr_t)block_buffer;
	clean_dcache((uint64_t)(uintptr_t)&block_shared, (uint64_t)(uintptr_t)&block_shared + sizeof(block_shared));
	block_enabled = 1;
	print("ufs: block service: %d partitions and %d units, page %x, buffer %x of %d KB\n",
	    (uint64_t)block_shared.parts - nunits, nunits, (uint64_t)(uintptr_t)&block_shared, block_shared.buffer_pa,
	    (uint64_t)(BLOCK_BUFFER_SIZE >> 10));
}

/*
 * Whether the storage could have more than one request in flight (ufs_probe=1): Block I/O 2
 * on the partitions, and whether its reads come back before they are done.  Eight 4 KB
 * reads at places 64 MB apart in "darwin", one after another through Block I/O and then all
 * eight at once through Block I/O 2, each into its own part of the buffer.  Before the kernel
 * runs (the UEFI timer still ticks), and only to say what there is.
 *
 * What it says on this phone: Block I/O 2 is there and the calls come back at once (eight in
 * 160 us, none done), but the eight are done only after 61.5 ms, against 1.0 ms one at a time
 * through Block I/O -- Qualcomm's driver finishes them from the UEFI timer, which besides does
 * not tick on core 0 while the kernel runs.  So one request at a time, synchronously.
 */
static void
block_io2_probe(efi_handle h, efi_block_io *bio)
{
	static const efi_guid blk2_guid = EFI_BLOCK_IO2_GUID;
	efi_status (EFIAPI *create_event)(uint32_t, uint64_t, void *, void *, void **) =
	    (efi_status (EFIAPI *)(uint32_t, uint64_t, void *, void *, void **))BS->create_event;
	efi_status (EFIAPI *check_event)(void *) = (efi_status (EFIAPI *)(void *))BS->check_event;
	static efi_block_io2_token tokens[8];
	efi_block_io2 *bio2 = NULL;
	uint64_t bs = bio->media->block_size, t0, t_sync, t_issue = 0, t_all, freq = READ_SYSREG(CNTFRQ_EL0);
	uint64_t returned_done = 0, pending, polls = 0;
	efi_status s;

	if (EFI_ERROR(BS->handle_protocol(h, &blk2_guid, (void **)&bio2)) || bio2 == NULL) {
		print("ufs: darwin: no Block I/O 2: one request at a time it is\n");
		return;
	}
	t0 = READ_SYSREG(CNTVCT_EL0);
	for (int i = 0; i < 8; i++) {
		s = bio->read_blocks(bio, bio->media->media_id, (uint64_t)i * (64ULL << 20) / bs + 7, bs,
		    block_buffer + i * 65536);
		if (EFI_ERROR(s)) {
			print("ufs: probe: Block I/O read failed %x\n", s);
			return;
		}
	}
	t_sync = READ_SYSREG(CNTVCT_EL0) - t0;
	for (int i = 0; i < 8; i++) {
		tokens[i].transaction_status = 0;
		if (EFI_ERROR(create_event(0, 8 /* TPL_CALLBACK */, NULL, NULL, &tokens[i].event))) {
			print("ufs: probe: no event\n");
			return;
		}
	}
	t0 = READ_SYSREG(CNTVCT_EL0);
	for (int i = 0; i < 8; i++) {
		/* other places than the synchronous reads, so that nothing the storage kept is read again */
		s = bio2->read_blocks_ex(bio2, bio2->media->media_id, (uint64_t)i * (64ULL << 20) / bs + 1031,
		    &tokens[i], bs, block_buffer + 1048576 + i * 65536);
		if (EFI_ERROR(s)) {
			print("ufs: probe: ReadBlocksEx %d failed %x\n", (uint64_t)i, s);
			return;
		}
		if (check_event(tokens[i].event) == 0) {
			returned_done++;        /* already signalled when the call came back */
		}
	}
	t_issue = READ_SYSREG(CNTVCT_EL0) - t0;
	pending = 8 - returned_done;
	while (pending > 0 && polls < 50000000) {
		pending = 0;
		for (int i = 0; i < 8; i++) {
			if (tokens[i].event != NULL && check_event(tokens[i].event) != 0) {
				pending++;
			} else if (tokens[i].event != NULL) {
				BS->close_event(tokens[i].event);
				tokens[i].event = NULL;
			}
		}
		polls++;
	}
	t_all = READ_SYSREG(CNTVCT_EL0) - t0;
	print("ufs: darwin: Block I/O 2 there. 8 random 4 KB reads: one at a time %d us; at once: the calls came back "
	    "after %d us (%d of them done by then), all done after %d us, %d still pending\n",
	    t_sync * 1000000 / freq, t_issue * 1000000 / freq, returned_done, t_all * 1000000 / freq, pending);
}

/* one request, if there is one: called from core 0's watch loop while the kernel runs */
static void
block_poll(void)
{
	uint64_t ask = (uint64_t)(uintptr_t)&block_shared.ask;
	uint32_t request, part, op;
	uint64_t lba, count, bytes, started;
	efi_status s = 0x8000000000000002ULL;     /* EFI_INVALID_PARAMETER: a request out of bounds */

	/* the kernel writes the request into memory past this core's cache: look at memory */
	flush_dcache(ask, ask + sizeof(block_shared.ask));
	request = block_shared.ask.request;
	if (request == block_shared.answer.answered) {
		return;
	}
	part = block_shared.ask.part;
	lba = block_shared.ask.lba;
	count = block_shared.ask.count;
	op = block_shared.ask.op;
	started = READ_SYSREG(CNTVCT_EL0);
	bytes = 0;
	if (part < block_shared.parts && count != 0 && count <= BLOCK_BUFFER_SIZE / block_shared.part[part].block_size &&
	    lba < block_shared.part[part].blocks && count <= block_shared.part[part].blocks - lba) {
		efi_block_io *bio = block_bios[part];

		bytes = count * block_shared.part[part].block_size;
		if (!hc_list_is_uefis()) {
			/* the kernel's own list is in: UEFI's driver must not ring now (the kernel should not ask) */
			if (hc_refused_reads++ < 4) {
				print("ufs: a read asked for while the kernel's own transfer list is in the controller: refused\n");
			}
			s = 0x800000000000000FULL;      /* EFI_ACCESS_DENIED */
			bytes = 0;
		} else if (op == BLOCK_OP_WRITE) {
			if (block_write_part < 0 || part != (uint32_t)block_write_part || lba < BLOCK_WRITE_FIRST) {
				/* not darwin, or not past what the build writes from the computer: never */
				if (block_writes_refused++ < 8) {
					print("ufs: a write of %d blocks from %d of %s: REFUSED\n", count, lba,
					    block_shared.part[part].name);
				}
				s = 0x800000000000000FULL;      /* EFI_ACCESS_DENIED */
				bytes = 0;
			} else {
				/*
				 * The kernel filled the buffer and cleaned its lines of it; drop whatever this
				 * core holds, write, and read back -- the answer says the blocks hold what the
				 * kernel gave, or the write is no good. The read back overwrites the buffer,
				 * which the kernel does not need: it has the data.
				 */
				uint32_t want;

				flush_dcache((uint64_t)(uintptr_t)block_buffer,
				    (uint64_t)(uintptr_t)block_buffer + bytes);
				want = ufs_crc32(block_buffer, bytes);
				s = bio->write_blocks(bio, bio->media->media_id, lba, bytes, block_buffer);
				if (!EFI_ERROR(s)) {
					bio->flush_blocks(bio);
					s = bio->read_blocks(bio, bio->media->media_id, lba, bytes, block_buffer);
					flush_dcache((uint64_t)(uintptr_t)block_buffer,
					    (uint64_t)(uintptr_t)block_buffer + bytes);
					if (!EFI_ERROR(s) && ufs_crc32(block_buffer, bytes) != want) {
						print("ufs: %d blocks from %d of darwin read back DIFFERENT\n",
						    count, lba);
						s = 0x800000000000000AULL;      /* EFI_VOLUME_CORRUPTED */
					}
				}
				if (!EFI_ERROR(s)) {
					block_writes++;
					block_write_bytes += bytes;
				}
			}
		} else if (op == BLOCK_OP_READ) {
			s = bio->read_blocks(bio, bio->media->media_id, lba, bytes, block_buffer);
			/* what the controller wrote is in memory; drop whatever this core held of the buffer */
			flush_dcache((uint64_t)(uintptr_t)block_buffer, (uint64_t)(uintptr_t)block_buffer + bytes);
		} else {
			bytes = 0;              /* an operation this loader does not know: nothing is touched */
		}
	}
	block_shared.answer.status = (int64_t)s;
	block_shared.answer.ticks += READ_SYSREG(CNTVCT_EL0) - started;
	if (EFI_ERROR(s)) {
		block_shared.answer.failed++;
	} else {
		block_shared.answer.served++;
		block_shared.answer.bytes += bytes;
	}
	__asm__ volatile ("dmb sy");
	block_shared.answer.answered = request;
	clean_dcache((uint64_t)(uintptr_t)&block_shared.answer,
	    (uint64_t)(uintptr_t)&block_shared.answer + sizeof(block_shared.answer));
}

static void
charger_start(void)
{
	static const efi_guid charger_ex_guid = QCOM_CHARGER_EX_GUID;
	static const efi_guid qcom_charger_guid = QCOM_CHARGER_GUID;
	efi_status ex_status, qcom_status, init_status = 0;

	/*
	 * CHIRON_CHARGER_FOR_USB
	 *
	 * This used to return for every platform but redwood.  UsbConfigDxe needs the
	 * PMIC USB protocol and the charger port status -- without them it never
	 * announces a connection, so the controller stays disconnected however well it
	 * started -- and those come from here.  chiron ships the same protocols
	 * (ChargerExDxe, QcomChargerDxeLA, PmicDxe are all in its DXE.inc), so open
	 * them here as well.
	 */
	if (charger_enabled) {
		return;
	}
	ex_status = BS->locate_protocol(&charger_ex_guid, NULL, (void **)&CHARGER_EX);
	qcom_status = BS->locate_protocol(&qcom_charger_guid, NULL, (void **)&QCOM_CHARGER);
	if (!EFI_ERROR(qcom_status) && QCOM_CHARGER != NULL) {
		/* Re-open the driver's status path after QcomChargerApp handed off to the OS. */
		init_status = QCOM_CHARGER->initialize(1);
	}
	charger_enabled = (!EFI_ERROR(ex_status) && CHARGER_EX != NULL) ||
	    (!EFI_ERROR(qcom_status) && QCOM_CHARGER != NULL);
	print("battery: ChargerEx=%x QcomCharger=%x init=%x shared=%x\n", ex_status, qcom_status, init_status,
	    (uint64_t)(uintptr_t)&charger_shared);
	charger_poll();
	print("battery: flags=%x SOC=%d%% V=%d mV I=%d mA T=%d C action=%d\n", (uint64_t)charger_shared.flags,
	    (uint64_t)(int64_t)charger_shared.soc_percent, (uint64_t)(int64_t)charger_shared.voltage_mv,
	    (uint64_t)(int64_t)charger_shared.current_ma, (uint64_t)(int64_t)charger_shared.temperature_c,
	    (uint64_t)charger_shared.charger_action);
}

/* For the record: how much the kernel on the other core has logged so far, and the end of it. */
static void
note_kernel_progress(const struct kernel_live *live, uint64_t slide, uint64_t seconds)
{
	/* CHIRON_QUIET: the per-second "note:" lines fill the panel and push the kernel's own
	 * log out of sight. The final dump (log_of_hung_kernel) still prints everything. */
	if (1) {
		(void)live;
		(void)slide;
		(void)seconds;
		return;
	}
	{
	const char *log;
	uint32_t len, from;

	if (live == NULL) {
		print("%d s\n", seconds);
		return;
	}
	log = (const char *)(live->log + slide);
	/* CHIRON_NOTE_GUARD: live->log_len and live->log are the KERNEL's virtual addresses;
	 * adding slide to them can land outside RAM (FAR was 0x10F0000000, 72.7 GiB). Show
	 * what they actually hold and never dc-clean outside the claimed window. */
	{
		uint64_t raw_log = live->log, raw_len_p = live->log_len;
		uint64_t len_pa = raw_len_p + slide;

		print("note: live->log=%x live->log_len=%x slide=%x -> pa %x\n",
		    raw_log, raw_len_p, slide, len_pa);
		/* RAM on this phone ends at 0x1BD8C0000; anything above 0x200000000 is not memory
		 * and dc civac there faults (that is how 0x10F0000000 killed the run). */
		if (len_pa < 0x40000000ULL || len_pa > 0x200000000ULL) {
			print("note: not a RAM address, skipping the read\n");
			print("%d s\n", seconds);
			return;
		}
		flush_dcache(len_pa, len_pa + 4);
		len = *(volatile uint32_t *)(uintptr_t)len_pa;
		if (len > live->log_head + live->log_ring) {
			len = 0;
		}
	}
	{
		uint64_t log_pa = (uint64_t)(uintptr_t)log;
		if (log_pa < 0x40000000ULL || log_pa + len > 0x200000000ULL) {
			print("note: log pa %x not in RAM, skipping\n", log_pa);
			print("%d s: logged %d bytes, heartbeat %d\n", seconds, (uint64_t)len, live->heartbeat);
			return;
		}
	}
	/* its first words are written with the caches off: look at memory */
	/* its first words are written with the caches off: look at memory */
	if (len > live->log_head + live->log_ring) {
		len = 0;
	}
	from = len > 240 ? len - 240 : 0;
	flush_dcache((uint64_t)(uintptr_t)log + from, (uint64_t)(uintptr_t)log + len);
	print("%d s: the kernel has logged %d bytes, heartbeat %d; the last of it:\n", seconds, (uint64_t)len, live->heartbeat);
	for (uint32_t i = from; i < len; i++) {
		put_char(log[i] >= 0x20 && log[i] < 0x7f ? log[i] : log[i] == '\n' ? '\n' : '.');
	}
	print("\n");
	}
}

/* A call of the firmware's power interface, the way this platform makes them. */
static int64_t
psci_call(uint64_t function, uint64_t a1, uint64_t a2, uint64_t a3)
{
	int64_t status;

	if (PLAT->psci_hvc) {
		register uint64_t x0 __asm__("x0") = function;
		register uint64_t x1 __asm__("x1") = a1;
		register uint64_t x2 __asm__("x2") = a2;
		register uint64_t x3 __asm__("x3") = a3;

		__asm__ volatile ("hvc #0" : "+r" (x0), "+r" (x1), "+r" (x2), "+r" (x3)
                        : : "x4", "x5", "x6", "x7", "x8", "x9", "x10", "x11", "x12", "x13", "x14", "x15", "x16", "x17");
		status = (int64_t)x0;
	} else {
		smc_x3 = a3;
		status = (int64_t)smc_call(function, a1, a2, NULL, NULL);
		smc_x3 = 0;
	}
	return status;
}

/*
 * Run the kernel on the core with that MPIDR and wait until it is back. Returns 0 when it has
 * been and gone (the caller goes on as after loader_return_stub), a negative number if the
 * firmware refused to start the core, OTHER_CPU_NOT_STARTED, or OTHER_CPU_HUNG: then the kernel
 * is still sitting on that core, but what it logged is there to be read (loader_ctx, as after a
 * return). `live` is where the kernel shows its signs of life, if it has such a place;
 * `budget` is how many seconds it has said it will run.
 */
static int64_t
run_on_other_cpu(uint64_t mpidr, uint64_t entry, uint64_t boot_args_pa, const struct kernel_live *live, uint64_t slide,
    uint64_t budget)
{
	uint64_t daif = 0, group1 = 0, started, last_pet, last_battery, last_beat_at, last_beat = 0, noted = 0;
	int64_t status;
	int arrived = 0, watching_only = 0;

	running_live = live;
	running_slide = slide;
	other_cpu_start.entry = entry;
	other_cpu_start.boot_args = boot_args_pa;
	other_cpu_stage = 0;
	other_cpu_done = 0;
	psci_by_hvc = PLAT->psci_hvc;
	/* that core starts with its caches off: all it reads must be in memory, not in this core's cache */
	clean_dcache((uint64_t)(uintptr_t)&other_cpu_start, (uint64_t)(uintptr_t)&other_cpu_start + sizeof(other_cpu_start));
	clean_dcache((uint64_t)(uintptr_t)&other_cpu_stage, (uint64_t)(uintptr_t)&other_cpu_stage + 8);
	clean_dcache((uint64_t)(uintptr_t)&other_cpu_done, (uint64_t)(uintptr_t)&other_cpu_done + 8);
	clean_dcache((uint64_t)(uintptr_t)&psci_by_hvc, (uint64_t)(uintptr_t)&psci_by_hvc + 8);
	clean_dcache((uint64_t)(uintptr_t)&other_cpu_entry, (uint64_t)(uintptr_t)&other_cpu_entry + 0x1000);
	clean_dcache((uint64_t)(uintptr_t)loader_ctx, (uint64_t)(uintptr_t)loader_ctx + sizeof(loader_ctx));

	/* the last argument arrives in that core's x0 */
	status = psci_call(PSCI_CPU_ON, mpidr, (uint64_t)(uintptr_t)&other_cpu_entry, (uint64_t)(uintptr_t)&other_cpu_start);

	started = last_pet = last_battery = last_beat_at = READ_SYSREG(CNTVCT_EL0);
	print("core %x: the firmware answers %d to the request to start it\n", mpidr, (uint64_t)status);
	if (PLAT->log_other_cpu) {
		flush_log();
	}
	while (status == 0) {
		/*
		 * The first seconds are the ones in which a new arrangement goes wrong, and a machine
		 * that resets takes this loader's memory with it: where there is storage for the log,
		 * what the kernel is seen to do goes there as it happens. That needs UEFI's services,
		 * so until NOTE_SECONDS are over this core keeps its interrupts.
		 */
		if (!watching_only && seconds_since(started) >= noted + 2) {
			noted = seconds_since(started);
			if (PLAT->log_other_cpu) {
				/*
				 * CHIRON_WATCH_QUIET: the per-second line went to the panel and scrolled
				 * it every two seconds for the whole run.  What matters is the log in
				 * "logfs"; nothing of this loop belongs on the screen.
				 */
				if (arrived) {
					note_kernel_progress(live, slide, noted);
				}
				flush_log();
			}
		}
		/*
		 * After that this core only watches: no interrupts (the kernel reprograms the interrupt
		 * controller's shared half; UEFI's handlers had better not run on top of that for long).
		 */
		if (!watching_only && seconds_since(started) >= NOTE_SECONDS) {
			watching_only = 1;
			daif = READ_SYSREG(DAIF);
			__asm__ volatile ("msr daifset, #0xf");
			group1 = READ_SYSREG(S3_0_C12_C12_7);          /* ICC_IGRPEN1_EL1 */
			__asm__ volatile ("msr S3_0_C12_C12_7, %0\nisb" : : "r" ((uint64_t)0));
		}
		/* both are written by a core with its caches off: look at memory, not at our copy */
		flush_dcache((uint64_t)(uintptr_t)&other_cpu_done, (uint64_t)(uintptr_t)&other_cpu_done + 8);
		if (other_cpu_done) {
			/* what the kernel returned, written the same way */
			flush_dcache((uint64_t)(uintptr_t)&loader_ctx[CTX_LOG_PA], (uint64_t)(uintptr_t)&loader_ctx[CTX_KSP + 1]);
			break;
		}
		if (!arrived) {
			flush_dcache((uint64_t)(uintptr_t)&other_cpu_stage, (uint64_t)(uintptr_t)&other_cpu_stage + 8);
			arrived = other_cpu_stage != 0;
			if (!arrived && seconds_since(started) >= START_SECONDS) {
				status = OTHER_CPU_NOT_STARTED;
			}
		}
		/*
		 * The watchdog is this core's to feed for as long as the kernel is expected to run:
		 * the kernel does it too, but whether that counts from another core is not known.
		 * After that a kernel that neither returns nor hangs visibly meets the watchdog.
		 */
		if (wdt_armed && seconds_since(last_pet) >= 5 && seconds_since(started) < budget + 60) {
			wdt_pet();
			last_pet = READ_SYSREG(CNTVCT_EL0);
		}
		/* Qualcomm's UEFI charger stack owns the PMIC/GLINK side; keep XNU's cache live. */
		if (charger_enabled && seconds_since(last_battery) >= 5 && hc_list_is_uefis()) {
			/* (not while the kernel's own transfer list is in: Qualcomm's DXEs are not to touch the storage) */
			charger_poll();
			last_battery = READ_SYSREG(CNTVCT_EL0);
		}
		if (arrived && live != NULL) {
			if (live->heartbeat != last_beat) {
				last_beat = live->heartbeat;
				last_beat_at = READ_SYSREG(CNTVCT_EL0);
			} else if (seconds_since(last_beat_at) >= SILENCE_SECONDS) {
				log_of_hung_kernel(live, slide);
				status = OTHER_CPU_HUNG;
			}
		}
		if (block_enabled) {
			block_poll();
		}
		usb_poll_command();
		if (block_enabled) {
			/*
			 * The pause is spent looking at the kernel's mailbox: with one look a pass, a
			 * request waited 60-75 us on average before this core noticed it, more than a
			 * 4 KB ReadBlocks takes (27 us). Same length of pause as below.
			 */
			for (int k = 0; k < 64; k++) {
				block_poll();
				for (volatile int i = 0; i < 300; i++) {
				}
			}
		} else {
			for (volatile int i = 0; i < 20000; i++) {
			}
		}
	}
	running_live = NULL;

	if (watching_only) {
		__asm__ volatile ("msr S3_0_C12_C12_7, %0\nisb" : : "r" (group1));
		__asm__ volatile ("msr daif, %0" : : "r" (daif));
	}
	return status;
}

/* ------------------------------------------------------------------------ */
/* Hypervisor watchdog (Qualcomm "Haven" virtual watchdog, SMC interface as  */
/* used by Linux drivers/virt/haven/hh_virt_wdt.c). Armed for the whole stay */
/* in the loader and the kernel: any hang ends in a reset without a human.   */

#define VIRT_WDT_CONTROL   0x86000005u
#define VIRT_WDT_STATUS    0x86000006u
#define VIRT_WDT_PET       0x86000007u
#define VIRT_WDT_SET_TIME  0x86000008u
#define WDT_BITE_MS        30000u

static const struct platform *PLAT;
static int wdt_armed;

static uint64_t smc_x3;             /* the fourth argument register, for the one call that has one */

static uint64_t
smc_call(uint64_t id, uint64_t a1, uint64_t a2, uint64_t *r1, uint64_t *r2)
{
	register uint64_t x0 __asm__("x0") = id;
	register uint64_t x1 __asm__("x1") = a1;
	register uint64_t x2 __asm__("x2") = a2;
	register uint64_t x3 __asm__("x3") = smc_x3;

	__asm__ volatile ("smc #0" : "+r" (x0), "+r" (x1), "+r" (x2), "+r" (x3)
                : : "x4", "x5", "x6", "x7", "x8", "x9", "x10", "x11", "x12", "x13", "x14", "x15", "x16", "x17");
	if (r1 != NULL) {
		*r1 = x1;
	}
	if (r2 != NULL) {
		*r2 = x2;
	}
	return x0;
}

static void
wdt_pet(void)
{
	if (wdt_armed) {
		smc_call(VIRT_WDT_PET, 0, 0, NULL, NULL);
	}
}

/* Change the time to the bite, and start counting again. The hypervisor takes 16 bits of milliseconds. */
static void
wdt_set_ms(uint64_t ms)
{
	if (ms > 65000) {
		ms = 65000;
	}
	if (wdt_armed) {
		smc_call(VIRT_WDT_SET_TIME, ms, ms, NULL, NULL);
		smc_call(VIRT_WDT_PET, 0, 0, NULL, NULL);
	}
}

static void
wdt_arm(void)
{
	uint64_t ctl = 0, since = 0;

	if (PLAT != &platform_redwood) {
		return; /* SMC is not routed anywhere useful on QEMU virt */
	}
	uint64_t st = smc_call(VIRT_WDT_STATUS, 0, 0, &ctl, &since);
	uint64_t r_time = smc_call(VIRT_WDT_SET_TIME, WDT_BITE_MS, WDT_BITE_MS, NULL, NULL);
	uint64_t r_ctl = smc_call(VIRT_WDT_CONTROL, 3, 0, NULL, NULL);
	uint64_t r_pet = smc_call(VIRT_WDT_PET, 0, 0, NULL, NULL);
	print("watchdog: status ret=%x ctl=%x since_pet=%x; set_time=%x enable=%x pet=%x\n", st, ctl, since, r_time,
	    r_ctl, r_pet);
	wdt_armed = (r_pet == 0);
}

/* ------------------------------------------------------------------------ */
/* UEFI exception hook: put the fault into the log instead of on the screen  */

extern char __ImageBase;

static void EFIAPI
exception_handler(int64_t type, uint64_t *ctx)
{
	print("\nUEFI EXCEPTION type=%d elr=%x esr=%x far=%x lr=%x sp=%x spsr=%x\n", (uint64_t)type, ctx[EXC_CTX_ELR],
	    ctx[EXC_CTX_ESR], ctx[EXC_CTX_FAR], ctx[EXC_CTX_LR], ctx[EXC_CTX_SP], ctx[EXC_CTX_SPSR]);
	print("loader image base %x (elr offset %x)\n", (uint64_t)(uintptr_t)&__ImageBase,
	    ctx[EXC_CTX_ELR] - (uint64_t)(uintptr_t)&__ImageBase);
	flush_log();
	/* CHIRON_HALT_NO_REBOOT: do not reset -- the bootloader would boot Android and the
	 * fault would be gone from the screen before it could be read. */
	print("\n== HALTED (no reboot) ==\n");
	for (;;) {
	}
}

static void
install_exception_hook(void)
{
	static const efi_guid cpu_guid = EFI_CPU_ARCH_GUID;
	efi_cpu_arch *cpu;

	if (EFI_ERROR(BS->locate_protocol(&cpu_guid, NULL, (void **)&cpu))) {
		return;
	}
	for (int64_t type = 0; type <= 3; type += 3) { /* synchronous, SError */
		cpu->register_interrupt_handler(cpu, type, NULL);
		efi_status s = cpu->register_interrupt_handler(cpu, type, exception_handler);
		if (EFI_ERROR(s)) {
			print("exception hook %d: status %x\n", (uint64_t)type, s);
		}
	}
}

/* ------------------------------------------------------------------------ */
/* Payload                                                                  */

struct payload_info {
	const uint8_t *kernel;
	const uint8_t *ramdisk;
	uint32_t ramdisk_size;
	const char *cmdline;
	uint64_t checkpoint;
	uint64_t forced_base;
	uint64_t resident_rd;           /* size of a root image the host put at the resident address */
	int usb_mode;
};

static uint64_t
parse_number(const char *c, unsigned base)
{
	uint64_t v = 0;
	for (; *c; c++) {
		uint64_t d = (*c >= '0' && *c <= '9') ? (uint64_t)(*c - '0') : (*c >= 'a' && *c <= 'f') ? (uint64_t)(*c - 'a' + 10) : 16;
		if (d >= base) {
			break;
		}
		v = v * base + d;
	}
	return v;
}

static int
parse_payload(struct payload_info *pi, int verbose)
{
	struct payload_header *ph = (struct payload_header *)PAYLOAD_BASE;

	memset(pi, 0, sizeof(*pi));
	pi->cmdline = "";
	if (ph->magic != PAYLOAD_MAGIC) {
		print("no payload at %x (magic %x)\n", PAYLOAD_BASE, (uint64_t)ph->magic);
		return 0;
	}
	const uint8_t *p = (const uint8_t *)(ph + 1), *pend = p + ph->size;
	while (p + sizeof(struct payload_entry) <= pend) {
		const struct payload_entry *e = (const struct payload_entry *)p;
		const char *text = (const char *)(p + sizeof(*e));
		if (e->name[0] == 0) {
			break;
		}
		if (verbose) {
			print("payload entry '%s' size %x\n", e->name, (uint64_t)e->size);
		}
		if (str_eq(e->name, "ramdisk")) {
			pi->ramdisk = p + sizeof(*e);             /* becomes /dev/md0, the root device */
			pi->ramdisk_size = e->size;
		} else if (str_eq(e->name, "kernel")) {
			pi->kernel = p + sizeof(*e);
		} else if (str_eq(e->name, "cmdline")) {
			pi->cmdline = text;
		} else if (str_eq(e->name, "physbase")) {
			pi->forced_base = parse_number(text, 16); /* testing aid; must be free RAM */
		} else if (str_eq(e->name, "rdres")) {
			pi->resident_rd = parse_number(text, 16); /* e.g. loaded there by QEMU; see RESIDENT_RD_OFFSET */
		} else if (str_eq(e->name, "checkpoint")) {
			pi->checkpoint = parse_number(text, 10);  /* where the kernel should stop and come back */
		} else if (str_eq(e->name, "usb")) {
			pi->usb_mode = 1;                         /* stay in the loader and take commands over USB */
		} else if (str_eq(e->name, "usb_idle")) {
			usb_idle_seconds = (int)parse_number(text, 10);   /* CHIRON_USB_IDLE_RESET */
		}
		p += sizeof(*e) + ((e->size + 15) & ~15u);
	}
	return 1;
}

/* ------------------------------------------------------------------------ */
/* NVRAM image                                                              */
/*                                                                          */
/* iBoot hands the kernel a copy of the NVRAM contents in CHRP format       */
/* (iokit/Kernel/IONVRAMCHRPHandler.cpp). There is no NVRAM here, so build  */
/* an image with a valid header and one empty "common" partition.           */

static void
nvram_chrp_header(uint8_t *h, uint8_t sig, uint32_t bytes, const char *name)
{
	uint16_t blocks = (uint16_t)(bytes / 16), sum;

	memset(h, 0, 16);
	h[0] = sig;
	h[2] = (uint8_t)blocks;
	h[3] = (uint8_t)(blocks >> 8);
	memcpy(h + 4, name, str_len(name));
	/* checksum over signature, length and name, folded to 8 bits */
	sum = h[0];
	for (int i = 2; i < 16; i++) {
		sum += h[i];
	}
	while (sum > 0xff) {
		sum = (sum & 0xff) + (sum >> 8);
	}
	h[1] = (uint8_t)sum;
}

static void
build_nvram_image(uint8_t *image)
{
	uint32_t lo = 1, hi = 0, generation = 1;

	memset(image, 0, NVRAM_BANK_SIZE);
	nvram_chrp_header(image, 0x5a, 0x20, "nvram");                           /* Apple header: 32 bytes */
	nvram_chrp_header(image + 0x20, 0x70, NVRAM_BANK_SIZE - 0x20, "common"); /* the rest: common partition */
	memcpy(image + 20, &generation, 4);
	/* Adler-32 over everything after the checksum field itself */
	for (uint32_t i = 20; i < NVRAM_BANK_SIZE; i++) {
		lo = (lo + image[i]) % 65521;
		hi = (hi + lo) % 65521;
	}
	uint32_t adler = (hi << 16) | lo;
	memcpy(image + 16, &adler, 4);
}

/* ------------------------------------------------------------------------ */
/* Running the kernel                                                       */

static efi_gop *GOP;
/* The display handed to the kernel: the firmware's, or one we set up ourselves (QEMU). base 0 = none. */
static struct {
	uint64_t base;
	uint32_t width, height, stride;
} SCREEN;
static uint64_t win_base, win_size; /* XNU's physical memory window, claimed once */
static uint64_t resident_rd_size;   /* root image kept at win_base + RESIDENT_RD_OFFSET, 0 if none */
static char last_result[64] = "idle";

static void
set_result(const char *what, uint64_t a, uint64_t b)
{
	uint32_t saved = log_len;
	uint32_t start = log_len;
	print("%s %d %x", what, a, b);
	uint32_t n = log_len - start;
	if (n > sizeof(last_result) - 1) {
		n = sizeof(last_result) - 1;
	}
	memcpy(last_result, log_buf + start, n);
	last_result[n] = 0;
	log_len = saved;
}

/* Every range of the firmware's memory map of 1 MB or more, and the total of each type. */
static void
print_memory_map(void)
{
	static uint8_t map_buf[65536];
	uint64_t map_size = sizeof(map_buf), map_key, desc_size, totals[16];
	uint32_t desc_ver;

	if (EFI_ERROR(BS->get_memory_map(&map_size, map_buf, &map_key, &desc_size, &desc_ver))) {
		print("GetMemoryMap failed\n");
		return;
	}
	memset(totals, 0, sizeof(totals));
	print("memory map (type 7 = free, 1/2 = loader, 3/4 = boot services, 5/6 = runtime, 0 = reserved):\n");
	for (uint64_t off = 0; off < map_size; off += desc_size) {
		efi_memory_descriptor *d = (efi_memory_descriptor *)(map_buf + off);

		if (d->type < 16) {
			totals[d->type] += d->pages << 12;
		}
		if (d->pages >= 256) {
			print("  %x - %x  type %d  %d MB\n", d->phys_start, d->phys_start + (d->pages << 12), (uint64_t)d->type,
			    d->pages >> 8);
		}
	}
	for (int t = 0; t < 16; t++) {
		if (totals[t] != 0) {
			print("  total of type %d: %d MB\n", (uint64_t)t, totals[t] >> 20);
		}
	}
}

static int
choose_window(const struct payload_info *pi)
{
	static uint8_t map_buf[65536];
	uint64_t map_size = sizeof(map_buf), map_key, desc_size;
	uint32_t desc_ver;
	uint64_t best_base = 0, best_size = 0;
	uint64_t pay_lo = PAYLOAD_BASE, pay_hi = PAYLOAD_BASE + PAYLOAD_MAX_SIZE;

	if (win_size != 0) {
		return 1;
	}
	if (EFI_ERROR(BS->get_memory_map(&map_size, map_buf, &map_key, &desc_size, &desc_ver))) {
		print("GetMemoryMap failed\n");
		return 0;
	}
	for (uint64_t off = 0; off < map_size; off += desc_size) {
		efi_memory_descriptor *d = (efi_memory_descriptor *)(map_buf + off);
		if (d->type != EfiConventionalMemory) {
			continue;
		}
		uint64_t lo = d->phys_start, hi = d->phys_start + (d->pages << 12);
		/* the payload sits in RAM that UEFI may consider free: stay clear of it */
		if (lo < pay_hi && hi > pay_lo) {
			if (pay_lo - lo > hi - pay_hi && pay_lo > lo) {
				hi = pay_lo;
			} else {
				lo = pay_hi;
			}
		}
		lo = (lo + BASE_ALIGN - 1) & ~(BASE_ALIGN - 1);
		hi &= ~(BASE_ALIGN - 1);
		if (hi > lo && hi - lo > best_size) {
			best_base = lo;
			best_size = hi - lo;
		}
	}
	print("largest free block %x size %x\n", best_base, best_size);
	if (pi->forced_base != 0) {
		best_base = pi->forced_base;
		best_size = MAX_MEM_SIZE;
	}
	if (best_size > MAX_MEM_SIZE) {
		best_size = MAX_MEM_SIZE;
	}
	/* UEFI stays alive while the kernel runs, so the kernel must own all of its window. */
	uint64_t claim = best_base;
	efi_status s = BS->allocate_pages(AllocateAddress, EfiLoaderData, best_size >> 12, &claim);
	print("phys window %x size %x, claim status %x\n", best_base, best_size, s);
	if (EFI_ERROR(s)) {
		return 0;
	}
	win_base = best_base;
	win_size = best_size;
	return 1;
}

/*
 * Load and run the kernel from the payload. Returns when the kernel comes
 * back (panic, checkpoint, early exception); the combined log is staged and
 * written to the log partition. Returns 0 if the kernel could not be started.
 */
static int starts_with(const char *s, const char *prefix);

static int
run_kernel(int have_checkpoint, uint64_t checkpoint)
{
	static uint8_t map_buf[65536];
	uint64_t map_size, map_key, desc_size;
	uint32_t desc_ver;
	struct payload_info pi;

	if (!parse_payload(&pi, 1) || pi.kernel == NULL) {
		print("no kernel in payload\n");
		return 0;
	}
	if (!have_checkpoint) {
		checkpoint = pi.checkpoint;
	}
	const uint8_t *kernel = pi.kernel;
	const struct mach_header_64 *mh = (const struct mach_header_64 *)kernel;
	if (mh->magic != MH_MAGIC_64) {
		print("kernel is not a 64-bit Mach-O\n");
		return 0;
	}

	/* --- kernel extent -------------------------------------------------- */
	uint64_t vm_lo = ~0ULL, vm_hi = 0, entry_va = 0;
	const struct load_command *lc = (const struct load_command *)(mh + 1);
	for (uint32_t i = 0; i < mh->ncmds; i++, lc = (const void *)((const uint8_t *)lc + lc->cmdsize)) {
		if (lc->cmd == LC_SEGMENT_64) {
			const struct segment_command_64 *sg = (const void *)lc;
			if (sg->vmsize == 0) {
				continue;
			}
			if (sg->vmaddr < vm_lo) {
				vm_lo = sg->vmaddr;
			}
			if (sg->vmaddr + sg->vmsize > vm_hi) {
				vm_hi = sg->vmaddr + sg->vmsize;
			}
		} else if (lc->cmd == LC_UNIXTHREAD) {
			/* cmd, cmdsize, flavor, count, x0..x28, fp, lr, sp, pc */
			entry_va = ((const uint64_t *)((const uint8_t *)lc + 16))[32];
		}
	}
	print("kernel va %x..%x entry %x\n", vm_lo, vm_hi, entry_va);
	if (vm_lo < KERNEL_VIRT_BASE + KERNEL_LINK_OFFSET || entry_va == 0) {
		print("unexpected kernel layout\n");
		return 0;
	}
	if (!choose_window(&pi)) {
		return 0;
	}

	uint64_t phys_base = win_base;
	uint64_t slide = phys_base - KERNEL_VIRT_BASE; /* pa = va + slide */
	uint64_t kern_lo = vm_lo + slide, kern_hi = (vm_hi + slide + PAGE_SIZE_MAX - 1) & ~(PAGE_SIZE_MAX - 1);
	/* The ramdisk must sit inside the kernel's static mapping, i.e. below topOfKernelData. */
	uint64_t rd_pa = kern_hi;
	uint64_t rd_size = (pi.ramdisk_size + PAGE_SIZE_MAX - 1) & ~(PAGE_SIZE_MAX - 1);
	int rd_resident = 0;
	/* A resident image next to a payload ramdisk: two disks (which is which is decided where the device tree is written). */
	uint64_t rd1_pa = 0, rd1_size = 0;

	if (pi.resident_rd != 0) {
		resident_rd_size = pi.resident_rd;
	}
	if (resident_rd_size != 0) {
		uint64_t res_pa = phys_base + RESIDENT_RD_OFFSET;
		uint64_t res_size = (resident_rd_size + PAGE_SIZE_MAX - 1) & ~(PAGE_SIZE_MAX - 1);

		if (kern_hi + rd_size > res_pa) {
			print("kernel and ramdisk overlap the resident image\n");
			return 0;
		}
		if (rd_size == 0) {
			rd_pa = res_pa;
			rd_size = res_size;
			rd_resident = 1;
		} else {
			rd1_pa = res_pa;
			rd1_size = res_size;
		}
	}
	/* everything up to topOfKernelData is the kernel's static region: it must cover both images */
	uint64_t dt_pa = rd1_size != 0 ? rd1_pa + rd1_size : rd_pa + rd_size;
	uint64_t dt_max = 0x10000;
	uint64_t ba_pa = dt_pa + dt_max;
	uint64_t top = ba_pa + PAGE_SIZE_MAX;

	if (win_size < top - phys_base + 0x4000000ULL) {
		print("not enough contiguous RAM\n");
		return 0;
	}

	/* --- load segments -------------------------------------------------- */
	lc = (const struct load_command *)(mh + 1);
	for (uint32_t i = 0; i < mh->ncmds; i++, lc = (const void *)((const uint8_t *)lc + lc->cmdsize)) {
		const struct segment_command_64 *sg = (const void *)lc;
		if (lc->cmd != LC_SEGMENT_64 || sg->vmsize == 0) {
			continue;
		}
		memset((void *)(sg->vmaddr + slide), 0, sg->vmsize);
		memcpy((void *)(sg->vmaddr + slide), kernel + sg->fileoff, sg->filesize);
	}
	print("kernel loaded at pa %x..%x\n", kern_lo, kern_hi);
	if (rd_resident) {
		print("resident ramdisk at pa %x size %x\n", rd_pa, rd_size);
	} else if (rd_size != 0) {
		memset((void *)rd_pa, 0, rd_size);
		memcpy((void *)rd_pa, pi.ramdisk, pi.ramdisk_size);
		print("ramdisk at pa %x size %x\n", rd_pa, rd_size);
	}
	if (rd1_size != 0) {
		print("resident image at pa %x size %x: it is the root (md0), the payload ramdisk is md1\n", rd1_pa, rd1_size);
	}

	/* "bootcpu=N" among the kernel's arguments: run it on core N (see run_on_other_cpu) */
	uint64_t this_mpidr = READ_SYSREG(MPIDR_EL1) & 0xFFFFFF, kernel_mpidr = this_mpidr;
	/* "cpus=N" or "cpumask=M" there too: the kernel may have more cores than the one it starts on */
	int more_cores = 0, battery_requested = 0, ufs_requested = 0;
	/* "torch=N" (not 0) there too: the phone's flashlight is the kernel's (bsd/dev/redwood_torch.c) */
	int torch_requested = 0;
	/* "cam=5" there too: the phone's wide camera is iOS's (bsd/dev/redwood_camera.c) */
	int camera_requested = 0;
	/* (the loader stays for run after run: what the last run's arguments said must not hold for this one) */
	gamut_p3 = 0;
	/* a run that does not ask for writes does not get them, whatever an earlier run of this
	 * loader asked for (the loader stays resident across runs) */
	block_write_requested = 0;
	block_write_part = -1;
	for (const char *c = pi.cmdline; *c; c++) {
		if (starts_with(c, "bootcpu=") && (c == pi.cmdline || c[-1] == ' ') && c[8] >= '0' && c[8] <= '7') {
			kernel_mpidr = core_to_mpidr(PLAT, c[8] - '0');
		}
		auto_reboot |= starts_with(c, "reboot=1") && (c == pi.cmdline || c[-1] == ' ') &&
		    (c[8] == 0 || c[8] == ' ');
		more_cores |= (starts_with(c, "cpus=") || starts_with(c, "cpumask=")) && (c == pi.cmdline || c[-1] == ' ');
		battery_requested |= starts_with(c, "battery=1") && (c == pi.cmdline || c[-1] == ' ') &&
		    (c[9] == 0 || c[9] == ' ');
		torch_requested |= starts_with(c, "torch=") && (c == pi.cmdline || c[-1] == ' ') && c[6] >= '1' && c[6] <= '9';
		camera_requested |= starts_with(c, "cam=5") && (c == pi.cmdline || c[-1] == ' ') && (c[5] == 0 || c[5] == ' ');
		gamut_p3 |= starts_with(c, "gamut=p3") && (c == pi.cmdline || c[-1] == ' ');
		if (starts_with(c, "ufs=") && (c == pi.cmdline || c[-1] == ' ') && c[4] >= '1' && c[4] <= '2' &&
		    (c[5] == 0 || c[5] == ' ')) {
			ufs_requested = c[4] - '0';
		}
		block_probe_requested |= starts_with(c, "ufs_probe=1") && (c == pi.cmdline || c[-1] == ' ');
		block_write_requested |= starts_with(c, "ufs_write=1") && (c == pi.cmdline || c[-1] == ' ') &&
		    (c[11] == 0 || c[11] == ' ');
		hc_requested |= starts_with(c, "ufs_native=") && (c == pi.cmdline || c[-1] == ' ') && c[11] >= '1' &&
		    c[11] <= '9';
	}
	/*
	 * CHIRON_CHARGER_FOR_USB
	 *
	 * The charger protocols are not a battery feature here: UsbConfigDxe asks the
	 * PMIC and the charger port whether anything is plugged in, and without an
	 * answer it never announces a connection -- so a USB session starts the
	 * controller and then waits for a host that is never told to appear.
	 * Open them for a USB session too.
	 */
	/*
	 * CHIRON_CHARGER_FOR_USB
	 *
	 * pi.usb_mode is not known yet at this point (parse_payload below reads it), so
	 * ask the payload directly whether it carries a "usb" entry: that is what
	 * --usb writes.  UsbConfigDxe needs the PMIC and charger-port state to announce
	 * a connection at all.
	 */
	if (battery_requested || pi.usb_mode) {
		charger_start();
	}
	if (ufs_requested >= 2) {
		hc_init();              /* (ufs_native=: UEFI's transfer list kept, before anything reads) */
	}
	if (ufs_requested >= 1) {
		ufs_survey();
	}
	if (ufs_requested >= 2) {
		block_start();
	}
	if (checkpoint == CHECKPOINT_SELFTEST) {
		kernel_mpidr = this_mpidr;
	}

	/* where the kernel will show its signs of life, and how long it has said it will run */
	const struct kernel_live *kernel_live = NULL;
	uint64_t kernel_budget = 0;
	for (uint64_t *q = (uint64_t *)kern_lo; q < (uint64_t *)kern_hi; q++) {
		if (*q == KERNEL_LIVE_MAGIC) {
			/* CHIRON_LIVE_SCAN: the same constant is an immediate inside the kernel's
			 * own "if (*q == KERNEL_LIVE_MAGIC)" instruction, so a bare match can be
			 * code. The real struct has kernel virtual addresses after the magic. */
			uint64_t l = q[2], lp = q[3];
			print("live candidate at %x: log=%x log_len=%x\n",
			    (uint64_t)(uintptr_t)q, l, lp);
			if (l >= KERNEL_VIRT_BASE && lp >= KERNEL_VIRT_BASE &&
			    (l & 7) == 0 && (lp & 3) == 0) {
				kernel_live = (const struct kernel_live *)q;
				print("live: accepted at %x\n", (uint64_t)(uintptr_t)q);
				break;
			}
			print("live: rejected (not a struct)\n");
		}
	}
	if (kernel_live == NULL) {
		print("live: no struct found in %x..%x\n", kern_lo, kern_hi);
	}
	for (const char *c = pi.cmdline; *c; c++) {
		if (starts_with(c, "loader_return_after=")) {
			for (c += 20; *c >= '0' && *c <= '9'; c++) {
				kernel_budget = kernel_budget * 10 + (uint64_t)(*c - '0');
			}
			break;
		}
	}

	/* Give the kernel the address of our return stub and the checkpoint to stop at. */
	for (uint64_t *q = (uint64_t *)kern_lo; q < (uint64_t *)kern_hi; q++) {
		if (*q == 0x545352444C554E58ULL /* "XNULDRST" */) {
			q[1] = kernel_mpidr != this_mpidr ? (uint64_t)(uintptr_t)&other_cpu_return_stub :
			    (uint64_t)(uintptr_t)&loader_return_stub;
			q[2] = checkpoint;
			q[3] = slide;
			print("return slot patched at %x, checkpoint %d\n", (uint64_t)(uintptr_t)q, checkpoint);
			break;
		}
	}

	/* --- boot_args ------------------------------------------------------ */
	struct boot_args *ba = (struct boot_args *)ba_pa;
	memset(ba, 0, sizeof(*ba));
	ba->revision = 2;
	ba->version = 2;
	ba->virtBase = KERNEL_VIRT_BASE;
	ba->physBase = phys_base;
	ba->memSize = win_size;
	ba->memSizeActual = win_size;
	ba->topOfKernelData = top;
	/* any display the firmware has set up: the phone's panel, or QEMU's ramfb */
	if (SCREEN.base != 0) {
		/*
		 * v_display is how iBoot says "graphics mode": the kernel then keeps
		 * its text off the screen. A verbose boot (-v) wants the text.
		 */
		int verbose = 0;
		for (const char *c = pi.cmdline; *c; c++) {
			verbose |= starts_with(c, "-v") && (c[2] == ' ' || c[2] == 0) && (c == pi.cmdline || c[-1] == ' ');
		}
		ba->video.v_baseAddr = SCREEN.base;
		ba->video.v_display = verbose ? 0 : 1;
		ba->video.v_rowBytes = SCREEN.stride;
		ba->video.v_width = SCREEN.width;
		ba->video.v_height = SCREEN.height;
		ba->video.v_depth = 32;
	}
	/*
	 * No "-v" by default: on the phone the verbose console is a text
	 * framebuffer that scrolls 10 MB per line and slows boot to a crawl.
	 * The log comes back through the loader instead. Add -v via the
	 * payload's cmdline entry to watch the boot on screen.
	 */
	/*
	 * serial=3 sends the console to the UART. Where there is none it would
	 * only silence the screen; and a "serial=" in the payload's own
	 * arguments must win, which means ours must not come first.
	 */
	int own_serial = 0;
	for (const char *c = pi.cmdline; *c; c++) {
		own_serial |= starts_with(c, "serial=");
	}
	const char *base_cmdline = (PLAT->uart != 0 && !own_serial) ? "debug=0x8 serial=3 " : "debug=0x8 ";
	uint32_t n = 0;
	for (const char *c = base_cmdline; *c && n < BOOT_LINE_LENGTH - 1; c++) {
		ba->commandLine[n++] = *c;
	}
	/* one processor unless the payload asks for more (of two "cpus=" the kernel takes the first) */
	if (!more_cores) {
		for (const char *c = "cpus=1 "; *c && n < BOOT_LINE_LENGTH - 1; c++) {
			ba->commandLine[n++] = *c;
		}
	}
	/* the root is the first RAM disk unless the payload says otherwise */
	int own_root = 0;
	for (const char *c = pi.cmdline; *c; c++) {
		own_root |= starts_with(c, "rd=") && (c == pi.cmdline || c[-1] == ' ');
	}
	if (rd_size != 0 && !own_root) {
		for (const char *c = "rd=md0 "; *c && n < BOOT_LINE_LENGTH - 1; c++) {
			ba->commandLine[n++] = *c;
		}
	}
	if (wdt_armed) {
		for (const char *c = "hv_wdt_pet=1 "; *c && n < BOOT_LINE_LENGTH - 1; c++) {
			ba->commandLine[n++] = *c;
		}
	}
	if (block_enabled) {
		static const char prefix[] = "ufs_shared_pa=0x";
		static const char hex[] = "0123456789abcdef";
		uint64_t address = (uint64_t)(uintptr_t)&block_shared;

		for (const char *c = prefix; *c && n < BOOT_LINE_LENGTH - 1; c++) {
			ba->commandLine[n++] = *c;
		}
		for (int shift = 60; shift >= 0 && n < BOOT_LINE_LENGTH - 1; shift -= 4) {
			ba->commandLine[n++] = hex[(address >> shift) & 0xf];
		}
		if (n < BOOT_LINE_LENGTH - 1) ba->commandLine[n++] = ' ';
	}
	if (battery_requested) {
		static const char prefix[] = "battery_shared_pa=0x";
		static const char hex[] = "0123456789abcdef";
		uint64_t address = (uint64_t)(uintptr_t)&charger_shared;

		for (const char *c = prefix; *c && n < BOOT_LINE_LENGTH - 1; c++) {
			ba->commandLine[n++] = *c;
		}
		for (int shift = 60; shift >= 0 && n < BOOT_LINE_LENGTH - 1; shift -= 4) {
			ba->commandLine[n++] = hex[(address >> shift) & 0xf];
		}
		if (n < BOOT_LINE_LENGTH - 1) ba->commandLine[n++] = ' ';
	}
	for (const char *c = pi.cmdline; *c && n < BOOT_LINE_LENGTH - 1; c++) {
		ba->commandLine[n++] = *c;
	}

	/* --- device tree ---------------------------------------------------- */
	const struct platform *plat = PLAT;
	struct dt_writer w = { .base = (uint8_t *)dt_pa, .cur = (uint8_t *)dt_pa, .depth = 0 };
	uint64_t cntfrq = READ_SYSREG(CNTFRQ_EL0);
	uint64_t ranges[3] = { 0, plat->io_base, plat->io_size };
	uint64_t reg2[2];
	uint8_t seed[64];

	for (unsigned i = 0; i < sizeof(seed); i++) {
		seed[i] = (uint8_t)(READ_SYSREG(CNTVCT_EL0) >> (i & 7)) ^ (uint8_t)(i * 37);
	}

	dt_begin(&w, "device-tree");
	/*
	 * The identity is the iPhone's (model, compatible, target-type ...): iOS user space looks
	 * its device up by these, and its files -- the dyld shared cache to begin with -- are
	 * those of that phone. XNU itself does not care; the hardware is described further down.
	 */
	dt_identity(&w, identity_root, sizeof(identity_root) / sizeof(identity_root[0]), identity_root_data);
	dt_prop_str(&w, "platform-name", "t8015");
	/* what iBoot takes from the factory configuration of a real phone; fixed size fields */
	dt_prop_padded(&w, "serial-number", "RDW00POCOX5P", 32);
	dt_prop_padded(&w, "mlb-serial-number", "RDW00POCOX5PMLB00", 32);
	dt_prop_padded(&w, "model-number", "MQAC2", 32);
	dt_prop_padded(&w, "region-info", "LL/A", 32);
	dt_prop_padded(&w, "regulatory-model-number", "A1865", 32);
	dt_prop_u32(&w, "#address-cells", 2);
	dt_prop_u32(&w, "#size-cells", 2);

	dt_begin(&w, "chosen");
	dt_prop(&w, "random-seed", seed, sizeof(seed));
	dt_prop_u64(&w, "dram-base", phys_base);
	dt_prop_u64(&w, "dram-size", win_size);
	dt_prop_u32(&w, "debug-enabled", 1);
	/* what MobileGestalt answers "main screen scale" from: 3 device pixels per point */
	dt_prop_u32(&w, "display-scale", 3);
	dt_prop_u32(&w, "display-rotation", 0);
	/* how the kernel is to ask the firmware for more cores (PSCI) */
	dt_prop_str(&w, "psci-method", plat->psci_hvc ? "hvc" : "smc");
	/* the time now, by the firmware's clock (the kernel has no real-time clock driver) */
	uint64_t epoch = firmware_epoch();
	if (epoch != 0) {
		dt_prop_u64(&w, "boot-epoch", epoch);
	}
	/*
	 * More of what iBoot reports about the phone. MobileGestalt builds the device identifier
	 * (UDID) from the serial number, the chip ID and the two addresses; when one is missing it
	 * asks its helper for the factory data, is refused and waits forever (and lsd with it).
	 */
	static const uint8_t wifi_address[6] = { 0x02, 0x52, 0x44, 0x57, 0x00, 0x01 };
	static const uint8_t bluetooth_address[6] = { 0x02, 0x52, 0x44, 0x57, 0x00, 0x02 };
	static const uint8_t manifest_hash[48] = { 0x72, 0x65, 0x64, 0x77, 0x6f, 0x6f, 0x64 };
	static const uint8_t no_behavior[16];
	dt_prop_u64(&w, "unique-chip-id", 0x000052445730001ULL);
	dt_prop_u32(&w, "chip-id", 0x8015);
	dt_prop_u32(&w, "board-id", 0x06);
	dt_prop(&w, "mac-address-wifi0", wifi_address, sizeof(wifi_address));
	dt_prop(&w, "mac-address-bluetooth0", bluetooth_address, sizeof(bluetooth_address));
	dt_prop(&w, "boot-manifest-hash", manifest_hash, sizeof(manifest_hash));
	dt_prop(&w, "software-behavior", no_behavior, sizeof(no_behavior));
	dt_prop_str(&w, "firmware-version", "iBoot-8422.100.650");
	dt_prop_u32(&w, "certificate-production-status", 1);
	dt_prop_u32(&w, "certificate-security-mode", 1);
	dt_prop_u32(&w, "effective-production-status-ap", 1);
	dt_prop_u32(&w, "effective-security-mode-ap", 1);
	dt_prop_u32(&w, "secure-boot", 1);
	dt_prop_u32(&w, "production-cert", 1);
	dt_prop_u32(&w, "development-cert", 0);
	dt_prop_u32(&w, "embedded-panic-log-size", PANIC_LOG_SIZE);
	/* An empty but well-formed NVRAM image: IOKit refuses to start without it. */
	static uint8_t nvram_image[NVRAM_BANK_SIZE];
	build_nvram_image(nvram_image);
	dt_prop_u32(&w, "nvram-bank-size", NVRAM_BANK_SIZE);
	dt_prop_u32(&w, "nvram-bank-count", 1);
	dt_prop_u32(&w, "nvram-current-bank", 0);
	dt_prop(&w, "nvram-proxy-data", nvram_image, sizeof(nvram_image));
	dt_begin(&w, "memory-map");
	/*
	 * "RAMDisk" becomes /dev/md0, the root (the kernel and launchd treat
	 * only md0 as a RAM disk boot); "RAMDisk1" becomes /dev/md1. With both
	 * images present the big resident one is the root and the payload's
	 * small one is the second disk.
	 */
	if (rd_size != 0 || rd1_size != 0) {
		uint64_t first[2] = { rd1_size != 0 ? rd1_pa : rd_pa, rd1_size != 0 ? rd1_size : rd_size };
		dt_prop(&w, "RAMDisk", first, sizeof(first));
	}
	if (rd_size != 0 && rd1_size != 0) {
		uint64_t second[2] = { rd_pa, rd_size };
		dt_prop(&w, "RAMDisk1", second, sizeof(second));
	}
	dt_end(&w);
	if (more_cores && plat->timeout_scale != 0) {
		/* multiplies every "machine timeout" of the kernel (machine_timeout_init_with_suffix()) */
		dt_begin(&w, "machine-timeouts");
		dt_prop_u32(&w, "global-scale", plat->timeout_scale);
		dt_end(&w);
	}
	dt_end(&w);

	/*
	 * What iBoot's device tree tells the kernel to do unless told otherwise. The compressor: an
	 * embedded kernel left to itself keeps it for the freezer alone, and with nothing being
	 * compressed the memory is gone twice as fast (2 = VM_PAGER_COMPRESSOR_NO_SWAP, as on a phone).
	 */
	dt_begin(&w, "defaults");
	dt_prop_u32(&w, "kern.vm_compressor", 2);
	dt_end(&w);

	/* the product: screen class, artwork scale, name ... as on the real phone */
	dt_begin(&w, "product");
	dt_identity(&w, identity_product, sizeof(identity_product) / sizeof(identity_product[0]), identity_product_data);
	/*
	 * and its haptics: "closed-loop" (MobileGestalt's DeviceSupportsClosedLoopHaptics) makes iOS play
	 * its vibrations and feedbacks as waveforms on the "Actuator" audio device (the audio plug-in
	 * hands them to the kernel's motor driver); without it iOS looks for an IOKit vibration motor
	 * that the iPhone X does not have, and nothing vibrates.
	 */
	dt_begin(&w, "haptics");
	dt_identity(&w, identity_haptics, sizeof(identity_haptics) / sizeof(identity_haptics[0]), identity_haptics_data);
	dt_end(&w);
	/*
	 * and of its camera what is here: with torch=N the flash (MobileGestalt's camera-flash; without
	 * it Control Center has no flashlight); with cam=5 the node itself, for a camera there is (with it
	 * MobileGestalt's video-camera). The rest of the iPhone's camera is not here, nor said to be.
	 */
	if (torch_requested || camera_requested) {
		dt_begin(&w, "camera");
		if (torch_requested) {
			dt_identity_one(&w, identity_camera, sizeof(identity_camera) / sizeof(identity_camera[0]), identity_camera_data, "flash");
		}
		dt_end(&w);
	}
	dt_end(&w);

	/* IOKit publishes its NVRAM object on this node; without it IOKit asserts. */
	dt_begin(&w, "options");
	dt_end(&w);

	/* Panic log region: RAM outside XNU's window (tail of the payload reservation). */
	uint64_t pram_reg[2] = { PANIC_LOG_BASE, PANIC_LOG_SIZE };
	memset((void *)PANIC_LOG_BASE, 0, PANIC_LOG_SIZE);
	dt_begin(&w, "pram");
	dt_prop(&w, "reg", pram_reg, sizeof(pram_reg));
	dt_end(&w);

	/*
	 * The processors. The first is the one the kernel starts on. With "cpus=N" in its
	 * arguments the kernel takes that one and the next N-1 of this list and starts them
	 * itself (PSCI CPU_ON); "cpumask=M" picks by position, bit 0 being the first. So the
	 * order matters: after the boot core come those whose numbers are nearest to its own
	 * (on the phone, where the kernel boots on the biggest core, 7: the other big ones
	 * 6, 5, 4, then the small ones 3, 2, 1). Only cores that are off are listed: the one
	 * this loader stays on while it watches is not the kernel's, nor any the firmware runs.
	 */
	uint64_t cpu_mpidr[8] = { kernel_mpidr };
	int cpu_count = 1, boot_core = mpidr_to_core(plat, kernel_mpidr);

	if (more_cores) {
		for (int distance = 1; distance < plat->cores; distance++) {
			for (int side = 0; side < 2; side++) {
				int core = side == 0 ? boot_core + distance : boot_core - distance;
				uint64_t mpidr = core_to_mpidr(plat, core);
				int64_t state;

				if (core < 0 || core >= plat->cores || mpidr == this_mpidr) {
					continue;
				}
				state = psci_call(PSCI_AFFINITY_INFO, mpidr, 0, 0);
				if (state == 1 || state == PSCI_NOT_SUPPORTED) {
					cpu_mpidr[cpu_count++] = mpidr;
				} else if (state >= 0) {
					print("core %x is not off (the firmware says %d): not the kernel's to take\n", mpidr, (uint64_t)state);
				}
			}
		}
		print("cores for the kernel, in the order it takes them:");
		for (int i = 0; i < cpu_count; i++) {
			print(" %x", cpu_mpidr[i]);
		}
		print("\n");
	}

	dt_begin(&w, "cpus");
	for (int i = 0; i < cpu_count; i++) {
		char name[5] = { 'c', 'p', 'u', (char)('0' + i), 0 };

		dt_begin(&w, name);
		dt_prop_str(&w, "device_type", "cpu");
		dt_prop_str(&w, "state", i == 0 ? "running" : "waiting");
		dt_prop_u32(&w, "reg", (uint32_t)cpu_mpidr[i]);
		dt_prop_u32(&w, "cpu-id", (uint32_t)i);
		dt_prop_u64(&w, "timebase-frequency", cntfrq);
		dt_prop_u64(&w, "fixed-frequency", cntfrq);
		dt_prop_u64(&w, "clock-frequency", 1800000000ULL);
		dt_prop_u64(&w, "bus-frequency", 100000000ULL);
		dt_prop_u64(&w, "memory-frequency", 100000000ULL);
		dt_prop_u64(&w, "peripheral-frequency", 24000000ULL);
		if (plat->small_cores & (1u << (mpidr_to_core(plat, cpu_mpidr[i]) & 31))) {
			dt_prop_u32(&w, "small-core", 1);
		}
		dt_end(&w);
	}
	dt_end(&w);

	dt_begin(&w, "arm-io");
	dt_prop_str(&w, "device_type", plat->name);
	dt_prop(&w, "ranges", ranges, sizeof(ranges));
	dt_prop_u32(&w, "#address-cells", 2);
	dt_prop_u32(&w, "#size-cells", 2);
	/*
	 * With cam=5, where MobileGestalt looks for the cameras (IODeviceTree:/arm-io/isp, its still-camera and
	 * rear-facing-camera, by which SpringBoard shows Camera.app): the iPhone's ISP node, of its
	 * properties only the camera at the back. Neither a compatible nor a device_type: no driver matches it.
	 */
	if (camera_requested) {
		dt_begin(&w, "isp");
		dt_prop_u32(&w, "camera-rear", 1);
		dt_end(&w);
	}
	dt_begin(&w, "gic");
	dt_prop_str(&w, "device_type", "interrupt-controller");
	dt_prop_str(&w, "compatible", "arm,gic-v3");
	uint64_t gic_reg[4] = { plat->gic_dist - plat->io_base, 0x10000, plat->gic_redist - plat->io_base, 0x100000 };
	dt_prop(&w, "reg", gic_reg, sizeof(gic_reg));
	/* the kernel reads this rather than assuming Apple's 27: on MSM8998 the
	 * EL1 virtual timer is PPI 19, and the wrong number is no clock at all. */
	dt_prop_u32(&w, "virtual-timer-intid",
	    plat->virtual_timer_intid != 0 ? plat->virtual_timer_intid : 27);
	dt_end(&w);
	if (plat->uart != 0) {
		dt_begin(&w, "uart0");
		dt_prop_str(&w, "device_type", "uart");
		dt_prop_str(&w, "compatible", "arm,pl011");
		reg2[0] = plat->uart - plat->io_base;
		reg2[1] = 0x1000;
		dt_prop(&w, "reg", reg2, sizeof(reg2));
		dt_prop_u32(&w, "boot-console", 1);
		dt_end(&w);
	}
	dt_end(&w);

	dt_end(&w);

	uint32_t dt_len = (uint32_t)(w.cur - w.base);
	ba->deviceTreeP = dt_pa - slide;
	ba->deviceTreeLength = dt_len;
	print("device tree %x len %x, boot_args %x, top %x\n", dt_pa, (uint64_t)dt_len, ba_pa, top);
	print("CHIRON_CMDLINE rd_size=%x rd1_size=%x rc=%d\n", rd_size, rd1_size, resident_rd_size);
	print("cmdline: %s\n", ba->commandLine);
	if (kernel_mpidr != this_mpidr) {
		print("the kernel will run on core %x (this is core %x)\n", kernel_mpidr, this_mpidr);
	}
	print("jumping to %x\n", entry_va + slide);
	flush_log();
	/* From here on the kernel feeds the watchdog (boot-arg hv_wdt_pet, see loader_return.c in XNU). */
	wdt_set_ms(60000);

	/* --- hand off (UEFI is left resident, see loader_save_ctx) ------------ */
	if (loader_save_ctx() == 0) {
		/*
		 * On real hardware (under the Qualcomm hypervisor) dirty data-cache
		 * lines do not survive the MMU-off round trip. UEFI stays resident,
		 * so everything it owns must be written back to RAM first: clean
		 * every allocated region in the memory map, then this stack again.
		 */
		map_size = sizeof(map_buf);
		if (!EFI_ERROR(BS->get_memory_map(&map_size, map_buf, &map_key, &desc_size, &desc_ver))) {
			for (uint64_t off = 0; off < map_size; off += desc_size) {
				efi_memory_descriptor *d = (efi_memory_descriptor *)(map_buf + off);
				/* loader/boot-services/runtime code and data, ACPI tables; XNU's own window is handled below */
				if (d->phys_start >= win_base && d->phys_start < win_base + win_size) {
					continue;
				}
				if ((d->type >= 1 && d->type <= 6) || d->type == 9 || d->type == 10) {
					/* CHIRON_CLAMP_CLEAN: stop at the kernel's window. A descriptor that
					 * starts below win_base may extend far past it, into addresses this
					 * firmware never mapped: dc civac there faults (ESR 0x96000145,
					 * FAR=0x10f0000000 was exactly such a line). */
					uint64_t c_start = d->phys_start;
					uint64_t c_end   = d->phys_start + (d->pages << 12);
					if (c_end > (uint64_t)win_base) {
						c_end = (uint64_t)win_base;
					}
					if (c_start < c_end) {
						clean_dcache(c_start, c_end);
					}
				}
			}
		}
		uint64_t sp_now = (uint64_t)(uintptr_t)__builtin_frame_address(0);
		clean_dcache(sp_now - 0x2000, sp_now + 0x2000);
		flush_dcache(phys_base, top);
		if (checkpoint == CHECKPOINT_SELFTEST) {
			/* Do not enter the kernel at all: exercise only the return path. */
			jump_to_kernel((uint64_t)(uintptr_t)&loader_return_stub, 0);
		}
		if (kernel_mpidr != this_mpidr) {
			int64_t status = run_on_other_cpu(kernel_mpidr, entry_va + slide, ba_pa, kernel_live, slide, kernel_budget);

			wdt_set_ms(WDT_BITE_MS);
			if (status != 0) {
				/* a kernel that hung may have left its own transfer list in the controller */
				hc_take_back(status == OTHER_CPU_HUNG ? "the kernel hung" : "the kernel did not start");
			}
			if (status == OTHER_CPU_HUNG) {
				/* the kernel still has that core; what it logged can be had all the same */
				print("THE KERNEL HUNG on core %x: no sign of life for %d seconds; its log follows\n", kernel_mpidr,
				    (uint64_t)SILENCE_SECONDS);
				set_result("hung", loader_ctx[CTX_LOG_LEN], 0);
				write_logs((const char *)loader_ctx[CTX_LOG_PA], loader_ctx[CTX_LOG_LEN]);
				return 1;
			} else if (status != 0) {
				/* the kernel was told it would be on that core (return path, device tree): no second try */
				if (status == OTHER_CPU_NOT_STARTED) {
					print("core %x was started but never arrived\n", kernel_mpidr);
				} else {
					print("core %x did not start: PSCI error %d\n", kernel_mpidr, (uint64_t)-status);
				}
				set_result("no-such-core", (uint64_t)(status < 0 ? -status : status), 0);
				write_logs(NULL, 0);
				return 1;
			}
		} else {
			jump_to_kernel(entry_va + slide, ba_pa);
		}
	}

	/* --- the kernel came back ------------------------------------------- */
	wdt_set_ms(WDT_BITE_MS);
	hc_take_back("the kernel came back");   /* before anything here touches the storage */
	if (hc_known) {
		flush_dcache((uint64_t)(uintptr_t)&block_shared.kernel_native,
		    (uint64_t)(uintptr_t)&block_shared.kernel_native + sizeof(block_shared.kernel_native));
		print("ufs: the kernel put its own list in %d times and took it out %d times\n",
		    (uint64_t)block_shared.kernel_native.switched_in, (uint64_t)block_shared.kernel_native.switched_out);
	}
	if (block_write_requested) {
		print("ufs: %d writes into darwin, %d bytes, read back the same; %d refused\n", block_writes,
		    block_write_bytes, block_writes_refused);
	}
	/* ... and its other cores should all be off again: the next kernel cannot start one that is not */
	for (int i = 1; i < cpu_count; i++) {
		int64_t state = psci_call(PSCI_AFFINITY_INFO, cpu_mpidr[i], 0, 0);

		if (state != 1 && state != PSCI_NOT_SUPPORTED) {
			print("THE KERNEL LEFT CORE %x RUNNING (the firmware says %d): restart before running another\n", cpu_mpidr[i],
			    (uint64_t)state);
		}
	}
	recording_data = NULL;
	recording_len = 0;
	if (kernel_live != NULL && kernel_live->recording != 0 && checkpoint != CHECKPOINT_SELFTEST) {
		const uint64_t *recording = (const uint64_t *)(kernel_live->recording + slide);

		if (recording[0] != 0 && recording[1] > 24 && recording[1] <= (1ULL << 30)) {
			recording_data = (const char *)recording[0];
			recording_len = recording[1];
			print("the kernel left a screen recording: %d bytes at %x\n", recording_len, recording[0]);
		}
	}
	sound_data = NULL;
	sound_len = 0;
	if (kernel_live != NULL && kernel_live->magic2 == KERNEL_LIVE_MAGIC2 && kernel_live->sound != 0 &&
	    checkpoint != CHECKPOINT_SELFTEST) {
		const uint64_t *sound = (const uint64_t *)(kernel_live->sound + slide);

		if (sound[0] != 0 && sound[1] > 24 && sound[1] <= (1ULL << 30)) {
			sound_data = (const char *)sound[0];
			sound_len = sound[1];
			print("the kernel left a sound recording: %d bytes at %x\n", sound_len, sound[0]);
		}
	}
	const char *klog = (const char *)loader_ctx[CTX_LOG_PA];
	uint64_t klog_len = loader_ctx[CTX_LOG_LEN];
	uint64_t reason = loader_ctx[CTX_REASON];
	if (checkpoint == CHECKPOINT_SELFTEST) {
		print("return-path self test passed\n");
		set_result("selftest-ok", 0, 0);
		klog = NULL;
		klog_len = 0;
	} else {
		print("kernel returned: log at %x, %d bytes\n", (uint64_t)(uintptr_t)klog, klog_len);
		if (reason == 2) {
			print("STOPPED AT CHECKPOINT %d\n", loader_ctx[CTX_ESR]);
			set_result("checkpoint", loader_ctx[CTX_ESR], 0);
		} else if (reason == 1) {
			print("EARLY KERNEL EXCEPTION: esr=%x elr=%x far=%x lr=%x sp=%x\n", loader_ctx[CTX_ESR], loader_ctx[CTX_ELR],
			    loader_ctx[CTX_FAR], loader_ctx[CTX_LR], loader_ctx[CTX_KSP]);
			print("  (pa-va slide %x: subtract it from physical addresses to symbolicate)\n", slide);
			set_result("early-exception", 0, loader_ctx[CTX_ELR]);
			klog_len = klog_len > (1u << 20) ? 0 : klog_len;
		} else {
			set_result("returned", klog_len, 0);
		}
	}
	write_logs(klog, klog_len);
	return 1;
}

/* ------------------------------------------------------------------------ */
/* USB command channel: a small fastboot-protocol server.                    */
/*                                                                          */
/* Host side (stock `fastboot` tool):                                        */
/*   fastboot stage payload.bin    download a new "XNUP" payload            */
/*   fastboot oem run [N]          run its kernel (optionally stop at N)    */
/*   fastboot getvar result        blocks until the kernel is back          */
/*   fastboot get_staged log.txt   fetch loader + kernel log                */
/*   fastboot oem hang             stop petting the watchdog (test)         */
/*   fastboot reboot               cold reset                               */

#define USB_EP_OUT   0x01
#define USB_EP_IN    0x81
#define USB_CHUNK    (1024 * 1024)

static usb_device_protocol *USB;
static int download_to_ramdisk;     /* set by "oem ramdisk" for the one download that follows */
static uint8_t *usb_rx_buf, *usb_tx_buf;
static int usb_connected;
/* CHIRON_USB_NATIVE: usb_native=1 skips the manual PHY/DWC3 work. */
static int usb_native_mode;
/* usb_manual=1 runs only the manual register work. */
static int usb_manual_mode;
/* usb_pure=1: HK6 + VBUS only, no other PHY writes. */
static int usb_pure_mode;
/* usb_restore=1: put the PHY back to its entry values at the end. */
static int usb_restore_mode;
/* usb_probe=1: interrogate the transport before touching anything. */
static int usb_probe_mode;
/* usb_sweep=1: try each UTMI transceiver setting. */
static int usb_sweep_mode;
/* usb_hk6_only=1: drive UsbFnIo only, never call start_ex. */
static int usb_hk6_only_mode;
/* usb_diag=1: run the register map and write-path test on the boot path. */
static int usb_diag_mode;

/*
 * CHIRON_BCDUSB: 0x0200, not 0x0210.
 *
 * 0x0210 claims USB 2.0 with Link Power Management.  The phone's own gadget code
 * only uses that value when the controller is SuperSpeed capable
 * (composite.c:1681-1690); chiron is micro-USB with a USB2-only phy, so it must
 * not advertise L1.  A host that believes the claim will try LPM entry against
 * DCTL fields this port never programs.
 */
static const uint8_t usb_dev_desc[18] = { 18, 1, 0x00, 0x02, 0, 0, 0, 64, 0xd1, 0x18, 0x0d, 0xd0, 0x00, 0x01, 1, 2, 3, 1 };
static const uint8_t usb_ss_dev_desc[18] = { 18, 1, 0x00, 0x03, 0, 0, 0, 9, 0xd1, 0x18, 0x0d, 0xd0, 0x00, 0x01, 1, 2, 3, 1 };
static const uint8_t usb_cfg_desc[32] = {
	9, 2, 32, 0, 1, 1, 0, 0x80, 0x50,
	9, 4, 0, 0, 2, 0xff, 0x42, 0x03, 4,   /* fastboot interface */
	7, 5, USB_EP_IN, 2, 0x00, 0x02, 0,
	7, 5, USB_EP_OUT, 2, 0x00, 0x02, 0,
};
static const uint8_t usb_ss_cfg_desc[44] = {
	9, 2, 44, 0, 1, 1, 0, 0x80, 0x10,
	9, 4, 0, 0, 2, 0xff, 0x42, 0x03, 4,
	7, 5, USB_EP_IN, 2, 0x00, 0x04, 0,   6, 0x30, 4, 0, 0, 0,
	7, 5, USB_EP_OUT, 2, 0x00, 0x04, 0,  6, 0x30, 4, 0, 0, 0,
};
/* bcdUSB 0x0200, class unknown, EP0 max packet 64, 1 config */
static const uint8_t usb_qualifier[10] = { 10, 6, 0x00, 0x02, 0xff, 0xff, 0xff, 64, 1, 0 };
static const uint8_t usb_bos[42] = {
	5, 0x0f, 42, 0, 3,
	7, 0x10, 0x02, 0x06, 0, 0, 0,
	10, 0x10, 0x03, 0x00, 0x0e, 0x00, 0x01, 0x07, 0x65, 0x00,
	20, 0x10, 0x0a, 0x00, 0x01, 0, 0, 0, 0x00, 0x11, 0, 0, 0x30, 0x40, 0x0a, 0x00, 0xb0, 0x40, 0x0a, 0x00,
};
static const uint8_t usb_str0[4] = { 4, 3, 0x09, 0x04 };
static const uint8_t usb_str_mfr[8] = { 8, 3, 'X', 0, 'N', 0, 'U', 0 };
static const uint8_t usb_str_prod[20] = { 20, 3, 'x', 0, 'n', 0, 'u', 0, 'l', 0, 'o', 0, 'a', 0, 'd', 0, 'e', 0, 'r', 0 };
static const uint8_t usb_str_serial[20] = { 20, 3, 'x', 0, 'n', 0, 'u', 0, 'l', 0, 'o', 0, 'a', 0, 'd', 0, 'e', 0, 'r', 0 };
static const uint8_t usb_str_iface[18] = { 18, 3, 'f', 0, 'a', 0, 's', 0, 't', 0, 'b', 0, 'o', 0, 'o', 0, 't', 0 };

static void EFIAPI
usb_dummy_notify(void *event, void *ctx)
{
}


static void
proto_dump(void)
{
	static const efi_guid usb_dev = QCOM_USB_DEVICE_GUID;
	static const efi_guid usbfn = QCOM_USBFN_IO_GUID;
	efi_handle *h = NULL;
	uint64_t n = 0;

	if (!EFI_ERROR(BS->locate_handle_buffer(ByProtocol, &usb_dev, NULL, &n, &h)) && n)
		print("proto: UsbDevice %d\n", n);
	else
		print("proto: UsbDevice ABSENT\n");
	if (!EFI_ERROR(BS->locate_handle_buffer(ByProtocol, &usbfn, NULL, &n, &h)) && n)
		print("proto: UsbfnIo %d\n", n);
	else
		print("proto: UsbfnIo ABSENT\n");
}

/*
 * CHIRON_DEPEX_CHECK
 *
 * UsbfnDwc3Dxe is in the volume and listed after everything it names, yet
 * gEfiUsbfnIoProtocolGuid never appears -- so one of the protocols in its depex
 * is never satisfied and the driver is never dispatched.  The depex is one AND
 * over fifteen GUIDs; check every one of them and say which are missing.
 *
 * The table is generated from the driver's own .depex, so it cannot drift.
 */
static const struct {
	const char *name;
	efi_guid guid;
} chiron_depex_deps[] = {
	{"gEfiDriverBindingProtocolGuid", {0x18a031ab, 0xb443, 0x4d1a, {0xa5, 0xc0, 0x0c, 0x09, 0x26, 0x1e, 0x9f, 0x71}}},
	{"dep01", {0x76b95dad, 0x1e66, 0x4d98, {0x9c, 0xe7, 0xb2, 0x94, 0xd9, 0x59, 0x68, 0x95}}},
	{"gEfiPlatformInfoProtocolGuid", {0x157a5c45, 0x21b2, 0x43c5, {0xba, 0x7c, 0x82, 0x2f, 0xee, 0x5f, 0xe5, 0x99}}},
	{"gEfiBdsArchProtocolGuid", {0x665e3ff6, 0x46cc, 0x11d4, {0x9a, 0x38, 0x00, 0x90, 0x27, 0x3f, 0xc1, 0x4d}}},
	{"gEfiCpuArchProtocolGuid", {0x26baccb1, 0x6f42, 0x11d4, {0xbc, 0xe7, 0x00, 0x80, 0xc7, 0x3c, 0x88, 0x81}}},
	{"gEfiMetronomeArchProtocolGuid", {0x26baccb2, 0x6f42, 0x11d4, {0xbc, 0xe7, 0x00, 0x80, 0xc7, 0x3c, 0x88, 0x81}}},
	{"gEfiMonotonicCounterArchProtocolGuid", {0x1da97072, 0xbddc, 0x4b30, {0x99, 0xf1, 0x72, 0xa0, 0xb5, 0x6f, 0xff, 0x2a}}},
	{"gEfiRealTimeClockArchProtocolGuid", {0x27cfac87, 0x46cc, 0x11d4, {0x9a, 0x38, 0x00, 0x90, 0x27, 0x3f, 0xc1, 0x4d}}},
	{"gEfiResetArchProtocolGuid", {0x27cfac88, 0x46cc, 0x11d4, {0x9a, 0x38, 0x00, 0x90, 0x27, 0x3f, 0xc1, 0x4d}}},
	{"gEfiRuntimeArchProtocolGuid", {0xb7dfb4e1, 0x052f, 0x449f, {0x87, 0xbe, 0x98, 0x18, 0xfc, 0x91, 0xb7, 0x33}}},
	{"gEfiSecurityArchProtocolGuid", {0xa46423e3, 0x4617, 0x49f1, {0xb9, 0xff, 0xd1, 0xbf, 0xa9, 0x11, 0x58, 0x39}}},
	{"gEfiTimerArchProtocolGuid", {0x26baccb3, 0x6f42, 0x11d4, {0xbc, 0xe7, 0x00, 0x80, 0xc7, 0x3c, 0x88, 0x81}}},
	{"gEfiVariableWriteArchProtocolGuid", {0x6441f818, 0x6362, 0x4e44, {0xb5, 0x70, 0x7d, 0xba, 0x31, 0xdd, 0x24, 0x53}}},
	{"gEfiVariableArchProtocolGuid", {0x1e5668e2, 0x8481, 0x11d4, {0xbc, 0xf1, 0x00, 0x80, 0xc7, 0x3c, 0x88, 0x81}}},
	{"gEfiWatchdogTimerArchProtocolGuid", {0x665e3ff5, 0x46cc, 0x11d4, {0x9a, 0x38, 0x00, 0x90, 0x27, 0x3f, 0xc1, 0x4d}}}
};

static void
chiron_depex_check(void)
{
	unsigned missing = 0;
	unsigned total = sizeof(chiron_depex_deps) / sizeof(chiron_depex_deps[0]);

	print("depex: UsbfnDwc3Dxe needs %d protocols\n", (uint64_t)total);
	for (unsigned i = 0; i < total; i++) {
		efi_handle *h = NULL;
		uint64_t n = 0;

		if (!EFI_ERROR(BS->locate_handle_buffer(ByProtocol, &chiron_depex_deps[i].guid,
		    NULL, &n, &h)) && n != 0) {
			continue;
		}
		missing++;
		print("depex: MISSING %s\n", (uint64_t)(uintptr_t)chiron_depex_deps[i].name);
	}
	print("depex: %d of %d missing\n", (uint64_t)missing, (uint64_t)total);
}


/*
 * CHIRON_PSCI_RESET
 *
 * The one way to reset this phone that needs no driver at all: PSCI SYSTEM_RESET
 * over SMC (chiron's platform entry has psci_hvc = 0).  Used when the loader has
 * to give up while a USB session may not be answering -- there is no watchdog on
 * this platform, so otherwise the phone sits until someone holds the power key.
 *
 * SYSTEM_RESET, function 0x00000009 in the PSCI control range: a0 = 0x84000009,
 * a1 = 0 Cold Reset, a2 = 0 no vendor-specific reason, a3.. = 0.
 */
static void
chiron_psci_reset(void)
{
	register uint64_t a0 __asm__("x0") = 0x84000009ULL;
	register uint64_t a1 __asm__("x1") = 0;         /* cold reset */
	register uint64_t a2 __asm__("x2") = 0;
	register uint64_t a3 __asm__("x3") = 0;

	__asm__ volatile ("smc #0" : "+r" (a0) : "r" (a1), "r" (a2), "r" (a3) : "memory");
	/* if the SMC came back, fall through and let UEFI try */
	if (ST != NULL && ST->rt != NULL && ST->rt->reset_system != NULL) {
		ST->rt->reset_system(0, 0, 0, NULL);
	}
	for (;;) {
	}
}

/*
 * CHIRON_USB_HANDLE_BOUNDED
 *
 * USB->handle_event() is where a stalled session blocks: with the controller
 * started but no host enumerating it, the Qualcomm driver's event call never
 * returns, so no deadline inside usb_wait() can ever be checked.  Poll it a
 * bounded number of times from here, and when the deadline passes, reset the
 * phone instead of waiting for ever.
 */
static uint64_t usb_session_deadline;    /* CNTVCT value, 0 = no deadline */
static uint64_t usb_session_freq;

static void
usb_session_begin(uint64_t seconds)
{
	uint64_t f = 0, now = 0;

	__asm__ volatile ("mrs %0, CNTFRQ_EL0" : "=r" (f));
	__asm__ volatile ("mrs %0, CNTVCT_EL0" : "=r" (now));
	if (f == 0) {
		f = 19200000;
	}
	usb_session_freq = f;
	usb_session_deadline = now + f * seconds;
}

static void
usb_session_check(void)
{
	uint64_t now = 0;

	if (usb_session_deadline == 0) {
		return;
	}
	__asm__ volatile ("mrs %0, CNTVCT_EL0" : "=r" (now));
	if (now - usb_session_deadline < (1ULL << 63)) {       /* unsigned "not yet" */
		return;
	}
	print("\n== USB session deadline reached; resetting the phone ==\n");
	chiron_psci_reset();
}


/*
 * CHIRON_PHY_DUMP
 *
 * The QUSB2 PHY and the DWC3 core, as the firmware left them.  chiron's device
 * tree puts them at:
 *
 *   qusb@c012000   qcom,qusb2phy-v2   -- 0xC012000, 0x2A8
 *   ssusb@a800000  qcom,dwc-usb3-msm  -- 0xA800000, 0xF8C00
 *   dwc3@a800000   snps,dwc3          -- 0xA800000, 0xCD00
 *
 * Nothing in this firmware drives the PHY (no driver, and UsbInitDxe opens a
 * protocol that no binary declares), so without this the port can start the
 * controller and still never appear on the wire.
 */
/*
 * CHIRON_DWC3_RUNSTOP
 *
 * Bring the DWC3 device controller up and, more importantly, RUN it.  The
 * registers this port measured say the second half never happened:
 *
 *   DCTL = 0x10f00000  -- RunStop (bit 31) clear: the core is not running
 *   DSTS = 0x00d29011  -- Connected (bit 24) clear: nothing on the wire
 *
 * StartController() returning success only means the request was accepted.
 * UsbInitDxe is what would set RunStop, and in this firmware it cannot run, so
 * do it here.
 */
/*
 * CHIRON_PHY_CLOCK
 *
 * Turn the QUSB2 PHY's reference clock on before touching anything else.  The
 * PHY answered every register read with 0x80808080 / 0x13131313, which is what an
 * unclocked block returns, and its device tree node says what it wants:
 *
 *   //soc/qusb@c012000
 *     clocks = ref_clk_src, ref_clk
 *     clock-names = "ref_clk_src", "ref_clk"
 *
 * The clock driver publishes EFI_CLOCK_PROTOCOL; ask it for those two by name.
 */
/*
 * CHIRON_USBFN_ENDPOINTS
 *
 * Configure the endpoints through the controller's own protocol, BEFORE
 * UsbDeviceDxe's StartEx presents the device: that call is what puts us on the
 * wire, and endpoints configured afterwards are too late.
 *
 * UsbInitDxe normally does this.  It never runs here because its depex names
 * 3fb022e7-50b2-ce42-8ebd-5bd51812d037, a protocol no binary in this firmware
 * declares, so the loader does it instead with the descriptors it advertises.
 *
 * The chain is the one QcomPkg/Include/Protocol/EFIUsbfnIo.h specifies:
 *   EFI_USB_DEVICE_INFO    { DeviceDescriptor*, ConfigInfoTable** }
 *   EFI_USB_CONFIG_INFO    { ConfigDescriptor*, InterfaceInfoTable** }
 *   EFI_USB_INTERFACE_INFO { InterfaceDescriptor*, EndpointDescriptorTable** }
 */

/*
 * CHIRON_USB_HK6
 *
 * A port of ios-party's HK6 peripheral handshake.  Their disassembly of the
 * vendor UsbConfigDxe shows why requesting a peripheral controller does nothing
 * visible: StartController() rewrites the requested mode from a private static
 * policy before comparing it, then returns success without running the
 * peripheral ConnectController.  Our probes agree -- E722B03F and the USB
 * Function IO protocol never appeared at any measured point.
 *
 * This does not touch the private policy.  It installs its own public USB Config
 * table with ModeType 4 and lets the vendor DWC3 driver bind to that instead.
 */
static const efi_guid QCOM_USB_INIT_GUID = {0x2da15ac7, 0x4909, 0x4c4c,
    {0xb8, 0xc3, 0xa7, 0x42, 0x19, 0x5e, 0xa4, 0x6e}};
static const efi_guid QCOM_USB_INIT_FILE_GUID = {0x0a134f0e, 0x075e, 0x40b3,
    {0x9c, 0x63, 0x3b, 0x39, 0x06, 0x80, 0x46, 0x63}};
static const efi_guid QCOM_DWC3_FILE_GUID = {0x94f8a6a7, 0xdc34, 0x4101,
    {0x88, 0xc1, 0x99, 0x17, 0x9c, 0xce, 0xae, 0x83}};
static const efi_guid QCOM_USBFN_GUID = {0x32d2963a, 0xfe5d, 0x4f30,
    {0xb6, 0x33, 0x6e, 0x5d, 0xc5, 0x58, 0x03, 0xcc}};
static const efi_guid QCOM_USB_CONFIG_GUID = {0xe722b03f, 0xb250, 0x42ce,
    {0x8e, 0xbd, 0x5b, 0xd5, 0x18, 0x12, 0xd0, 0x37}};
static const efi_guid QCOM_USB_CONFIG_FILE_GUID = {0xcd823a4d, 0x7dec, 0x4531,
    {0xae, 0x5d, 0x41, 0x34, 0xfa, 0x41, 0x27, 0xb8}};

/*
 * CHIRON_FIND_IMAGE_BY_SIG
 *
 * Loaded images here carry no firmware-volume node in their device path (all 45
 * report "(no fv node)"), so they cannot be identified by path.  Identify them by
 * content instead: walk the loaded images and let the caller test each one.
 *
 * ios-party's static analysis of the pinned MSM8998 binaries gives the marks:
 *
 *   UsbConfigDxe    image size 0x13000, and its public methods sit at
 *                   base + 0x1440 (Methods[0]), +0x1514 (Methods[1]),
 *                   +0x1750 (Methods[4])
 *   UsbfnDwc3Dxe    DriverBinding->Supported at base + 0x1548
 */
typedef int (*chiron_image_test)(efi_handle handle, efi_loaded_image *li, uint64_t base);

static efi_handle
chiron_find_image_by_sig(chiron_image_test test, uint64_t *out_base)
{
	efi_handle *handles = NULL;
	uint64_t count = 0;
	efi_handle found = NULL;

	if (EFI_ERROR(BS->locate_handle_buffer(ByProtocol, &EFI_LOADED_IMAGE_GUID, NULL,
	    &count, &handles))) {
		return NULL;
	}
	for (uint64_t i = 0; i < count && found == NULL; i++) {
		efi_loaded_image *li = NULL;
		uint64_t base;

		if (EFI_ERROR(BS->handle_protocol(handles[i], &EFI_LOADED_IMAGE_GUID,
		    (void **)&li)) || li == NULL || li->image_base == NULL) {
			continue;
		}
		base = (uint64_t)(uintptr_t)li->image_base;
		if (test(handles[i], li, base)) {
			found = handles[i];
			if (out_base != NULL) {
				*out_base = base;
			}
		}
	}
	if (handles != NULL) {
		BS->free_pool(handles);
	}
	return found;
}

/* UsbConfigDxe: size and public-method RVAs are pinned by the HK6 handshake */
static int
chiron_is_usb_config(efi_handle handle, efi_loaded_image *li, uint64_t base)
{
	efi_qcom_usb_config *cfg = NULL;

	if (li->image_size != 0x13000) {
		return 0;
	}
	if (EFI_ERROR(BS->handle_protocol(handle, &QCOM_USB_CONFIG_GUID, (void **)&cfg)) ||
	    cfg == NULL) {
		return 0;
	}
	if (cfg->revision != 0x10003) {
		return 0;
	}
	return (uint64_t)(uintptr_t)cfg->methods[0] == base + 0x1440 &&
	       (uint64_t)(uintptr_t)cfg->methods[1] == base + 0x1514 &&
	       (uint64_t)(uintptr_t)cfg->methods[4] == base + 0x1750;
}

/*
 * UsbfnDwc3Dxe.
 *
 * Identified by image size: UsbfnDwc3Dxe.efi is 86016 bytes = 0x15000, and a
 * scan of the loaded images shows exactly one of that size among 45.  The
 * base-relative RVA that ios-party recorded (Supported at +0x1548) does not hold
 * for this build, so the size is the reliable mark; the DriverBinding check just
 * makes sure the image is the driver we think it is.
 */
static int
chiron_is_dwc3(efi_handle handle, efi_loaded_image *li, uint64_t base)
{
	efi_driver_binding *b = NULL;

	(void)base;
	if (li->image_size != 0x15000) {
		return 0;
	}
	if (EFI_ERROR(BS->handle_protocol(handle, &EFI_DRIVER_BINDING_GUID, (void **)&b)) ||
	    b == NULL || b->supported == NULL) {
		return 0;
	}
	return 1;
}




/*
 * CHIRON_USB_HK6_CLONE
 *
 * Copy the public USB Config table, point it at the default core in peripheral
 * mode, install it on a fresh handle, and let the vendor DWC3 driver bind.
 * The copy keeps every vendor callback; only CoreNum and ModeType change.
 */
static int
chiron_usb_clone_config(efi_qcom_usb_init *init, efi_driver_binding *binding,
    efi_qcom_usb_config *original, uint8_t core)
{
	efi_qcom_usb_config *config;
	efi_handle controller = NULL;
	efi_handle drivers[2];
	efi_handle cfg_image;
	void *usbfn = NULL;
	efi_status s;

	if (init->stop_controller == NULL || original->revision != 0x10003) {
		print("hk6: USB Config revision %x, cannot clone\n", (uint64_t)original->revision);
		return 0;
	}

	/*
	 * Only clone a table we recognise: the vendor module is 0x13000 bytes and its
	 * first public callbacks sit at fixed offsets from its load base.  A different
	 * build would make the copied table meaningless.
	 */
	cfg_image = chiron_find_image_by_sig(chiron_is_usb_config, NULL);
	if (cfg_image == NULL) {
		print("hk6: USB Config image signature not found\n");
		return 0;
	}
	print("hk6: pinned USB Config API verified\n");

	if (EFI_ERROR(BS->allocate_pool(EfiLoaderData, sizeof(efi_qcom_usb_config),
	    (void **)&config)) || config == NULL) {
		return 0;
	}
	memcpy(config, original, sizeof(efi_qcom_usb_config));
	config->core_num = core;
	config->mode_type = UsbModePeripheralAlt;        /* 4 = peripheral */

	s = init->stop_controller(init, core, UsbModeHost);
	print("hk6: stop host controller %x\n", (uint64_t)s);
	if (EFI_ERROR(s)) {
		BS->free_pool(config);
		return 0;
	}

	s = BS->install_protocol_interface(&controller, &QCOM_USB_CONFIG_GUID, 0, config);
	print("hk6: install peripheral USB Config %x\n", (uint64_t)s);
	if (EFI_ERROR(s)) {
		BS->free_pool(config);
		return 0;
	}

	s = binding->supported(binding, controller, NULL);
	print("hk6: DWC3 Supported -> %x\n", (uint64_t)s);
	if (EFI_ERROR(s)) {
		return 0;
	}

	drivers[0] = binding->image_handle;
	drivers[1] = NULL;
	s = BS->connect_controller(controller, drivers, NULL, 0);
	print("hk6: connect DWC3 -> %x\n", (uint64_t)s);
	if (EFI_ERROR(s)) {
		return 0;
	}

	s = BS->handle_protocol(controller, &QCOM_USBFN_GUID, &usbfn);
	print("hk6: cloned controller UsbFnIo %x\n", (uint64_t)s);
	return !EFI_ERROR(s);
}

/*
 * CHIRON_USB_HK6
 *
 * The whole handshake.  Returns 1 when USB Function IO exists afterwards.
 */
static int
chiron_usb_hk6(void)
{
	efi_qcom_usb_init *init = NULL;
	efi_driver_binding *binding = NULL;
	efi_handle dwc3 = NULL;
	efi_handle *handles = NULL;
	uint64_t count = 0;
	void *usbfn = NULL;
	efi_status s;

	print("hk6: begin\n");

	/* already there?  then nothing to do */
	if (!EFI_ERROR(BS->locate_protocol(&QCOM_USBFN_GUID, NULL, &usbfn))) {
		print("hk6: UsbFnIo already present\n");
		return 1;
	}

	s = BS->locate_protocol(&QCOM_USB_INIT_GUID, NULL, (void **)&init);
	print("hk6: USB Init %x\n", (uint64_t)s);
	if (EFI_ERROR(s) || init == NULL) {
		return 0;
	}
	if (init->revision < 0x10000 || init->query_core_info == NULL ||
	    init->start_controller == NULL) {
		print("hk6: USB Init incomplete rev %x\n", (uint64_t)init->revision);
		return 0;
	}

	dwc3 = chiron_find_image_by_sig(chiron_is_dwc3, NULL);
	if (dwc3 == NULL) {
		print("hk6: DWC3 image not resident\n");
		return 0;
	}
	if (EFI_ERROR(BS->handle_protocol(dwc3, &EFI_DRIVER_BINDING_GUID, (void **)&binding)) ||
	    binding == NULL || binding->supported == NULL) {
		print("hk6: DWC3 driver binding missing\n");
		return 0;
	}
	print("hk6: DWC3 driver binding ok\n");

	/* the default core and what it can do */
	{
		efi_qcom_usb_core core;

		memset(&core, 0, sizeof(core));
		s = init->query_core_info(init, NULL, &core);
		print("hk6: query core %x\n", (uint64_t)s);
		if (EFI_ERROR(s)) {
			return 0;
		}
		print("hk6: core %x modes %x\n", (uint64_t)core.core_num, (uint64_t)core.mode_type);

		/* ask for peripheral */
		s = init->start_controller(init, core.core_num, UsbModePeripheral);
		print("hk6: start peripheral %x\n", (uint64_t)s);

		if (!EFI_ERROR(BS->locate_protocol(&QCOM_USBFN_GUID, NULL, &usbfn))) {
			print("hk6: UsbFnIo after start\n");
			return 1;
		}
		print("hk6: still no UsbFnIo; cloning a peripheral handle\n");

		/*
		 * Walk the USB Config controllers, remember the host one on the default
		 * core, and clone from it.  Any controller already in mode 4 that carries
		 * UsbFnIo is good enough as is.
		 */
		if (EFI_ERROR(BS->locate_handle_buffer(ByProtocol, &QCOM_USB_CONFIG_GUID, NULL,
		    &count, &handles))) {
			print("hk6: no USB Config controllers\n");
			return 0;
		}
		{
			efi_qcom_usb_config *host_cfg = NULL;

			for (uint64_t i = 0; i < count; i++) {
				efi_qcom_usb_config *cfg = NULL;

				if (EFI_ERROR(BS->handle_protocol(handles[i], &QCOM_USB_CONFIG_GUID,
				    (void **)&cfg)) || cfg == NULL) {
					continue;
				}
				print("hk6: cfg ", 0);
				print("%x rev %x core %x mode %x\n", (uint64_t)i,
				    (uint64_t)cfg->revision, (uint64_t)cfg->core_num,
				    (uint64_t)cfg->mode_type);
				if (cfg->revision == 0x10003 && cfg->core_num == core.core_num &&
				    cfg->mode_type == UsbModeHost) {
					host_cfg = cfg;
				}
			}
			BS->free_pool(handles);
			if (host_cfg == NULL) {
				print("hk6: no host config to clone on core %x\n",
				    (uint64_t)core.core_num);
				return 0;
			}
			return chiron_usb_clone_config(init, binding, host_cfg, core.core_num);
		}
	}
}

/*
 * CHIRON_USB_NATIVE
 *
 * UsbConfigDxe installs E722B03F-B250-42CE-8EBD-5BD51812D037, which is what
 * UsbInitDxe's depex waits for.  Until this build UsbInitDxe was absent, so
 * nothing consumed the protocol and nothing called UsbInitStartController().
 * With it back, the firmware can bring the gadget up on its own -- and the manual
 * register writes below may be what has been preventing it.
 *
 * usb_native=1  skip all manual PHY/DWC3 work, just measure.
 */
static int usb_native_mode;
static int usb_init_proto_present;

static void
chiron_usb_probe_protos(const char *when)
{
	static const efi_guid init_proto = {0xE722B03F, 0xB250, 0x42CE,
	    {0x8E, 0xBD, 0x5B, 0xD5, 0x18, 0x12, 0xD0, 0x37}};
	static const efi_guid cfg_proto = {0x9A4E9246, 0xD553, 0x11D5,
	    {0x87, 0xE2, 0x00, 0x06, 0x29, 0x45, 0xC3, 0xB9}};
	uint64_t n = 0;
	efi_status s;

	s = BS->locate_handle_buffer(ByProtocol, &init_proto, NULL, &n, NULL);
	usb_init_proto_present = !EFI_ERROR(s) && n > 0;
	print("proto ", 0);
	print((char *)when, 0);
	print(" Init st %x n %x\n", (uint64_t)s, (uint64_t)n);
	n = 0;
	s = BS->locate_handle_buffer(ByProtocol, &cfg_proto, NULL, &n, NULL);
	print("proto ", 0);
	print((char *)when, 0);
	print(" Cfg st %x n %x\n", (uint64_t)s, (uint64_t)n);
}

/* CHIRON_UDELAY: the PHY's own timings are given in microseconds. */
static void
chiron_udelay(uint64_t us)
{
	uint64_t freq = 0, began = 0, now = 0;

	__asm__ volatile ("mrs %0, CNTFRQ_EL0" : "=r" (freq));
	__asm__ volatile ("mrs %0, CNTVCT_EL0" : "=r" (began));
	for (;;) {
		__asm__ volatile ("mrs %0, CNTVCT_EL0" : "=r" (now));
		if (now - began >= freq * us / 1000000ULL) {
			break;
		}
	}
}

/*
 * CHIRON_GDSC
 *
 * Android lists two power domains as enabled under the PHY:
 *
 *     gdsc_usb30            state=enabled
 *     qusb@c012000          state=enabled
 *
 * and names the USB3 one 175004.qcom,gdsc -- GCC base 0x100000 plus 0x75004.
 * The msm8998 GDSC layout is a control word and a status word 4 bytes on:
 *
 *     0x175000  POWER_CONTROL   bit0 SW_COLLAPSE (0 = on)
 *     0x175004  POWER_STATUS    bit0 POWR_STS    (1 = on)
 *
 * A PHY whose power domain is off answers register reads but cannot drive the
 * wires, which matches what this port kept seeing: correct configuration, PLL
 * locked, and both D+ and D- reading low.
 */
/*
 * CHIRON_GCC_BCR
 *
 * Release the USB3 block resets.  Offsets from msm-clocks-hwio-8998.h, which the
 * GCC driver itself includes: a BCR register holds its block in reset whenever
 * bit0 is set.
 *
 *   GCC_USB_30_BCR        0x0F000   the controller's "core_reset" in the DTS
 *   GCC_QUSB2PHY_PRIM_BCR 0x12000   QUSB2 primary phy
 *   GCC_USB3_PHY_BCR      0x50020
 *
 * The DTS asks for core_reset by name; nothing in this loader had ever released it.
 */
/*
 * CHIRON_GCC_BCR
 *
 * Put the USB blocks through a full reset, the way drivers/clk/msm/reset.c does it:
 *
 *   msm_reset_assert    regval |=  BIT(bit);    set   = held in reset
 *   msm_reset_deassert  regval &= ~BIT(bit);    clear = released
 *   msm_reset           assert; udelay(1); deassert;
 *
 * Registers and bits from clock-gcc-8998.c's gcc_8998_resets[] table, which gives
 * only a register per line, so bit is zero throughout:
 *
 *   USB_30_BCR        0x0f000    the controller's "core_reset" in the DTS
 *   QUSB2PHY_PRIM_BCR 0x12000
 *   QUSB2PHY_SEC_BCR  0x12004
 *   USB3_PHY_BCR      0x50020
 *
 * Asserting first matters: a block left in some indeterminate state by the firmware
 * is not put into a defined one by releasing a reset that was never asserted.
 */
static void
chiron_gcc_bcr(void)
{
	static const struct { uint32_t off; const char *name; } list[] = {
		{0x0F000, "usb30   "},
		{0x12000, "qusb2p  "},
		{0x12004, "qusb2s  "},
		{0x50020, "usb3phy "},
	};
	const uint64_t gcc = 0x100000ULL;

	for (unsigned i = 0; i < sizeof(list) / sizeof(list[0]); i++) {
		volatile uint32_t *bcr = (volatile uint32_t *)(uintptr_t)(gcc + list[i].off);
		uint32_t before = *bcr;
		uint32_t asserted;

		/* assert: hold the block in reset */
		*bcr = before | 1u;
		__asm__ volatile ("dsb sy" ::: "memory");
		asserted = *bcr;
		chiron_udelay(10);

		/* deassert: release it into a defined state */
		*bcr = (before | 1u) & ~1u;
		__asm__ volatile ("dsb sy" ::: "memory");
		chiron_udelay(2000);

		print("bcr: ", 0);
		print((char *)list[i].name, 0);
		print("%x ", 0);
		print("%x", (uint64_t)list[i].off);
		print(" before ", 0);
		print("%x", (uint64_t)before);
		print(" assert ", 0);
		print("%x", (uint64_t)asserted);
		print(" released ", 0);
		print("%x", (uint64_t)*bcr);
		print("\n", 0);
	}
}

/*
 * CHIRON_GDSC_USB30
 *
 * USB3's power domain, at the address the device tree gives it
 * (chiron.dtb, qcom,gdsc@10f004, regulator-name "gdsc_usb30", phandle 0x84):
 *
 *   ssusb@a800000 { USB3_GDSC-supply = <0x84>; }
 *
 * Register layout (drivers/clk/qcom/gdsc.c):
 *   +0x00 control  bit0 BLOCK_RESET, poll until clear
 *   +0x04 status   bit0 reads 1 when the domain is powered
 *
 * This loader had been writing 0x175000 and 0x174000 instead, with a comment
 * admitting it was guessing; whatever those addresses are, they are not USB3's
 * power domain, and nothing they did could have powered it.
 */
static void
chiron_gdsc_on(void)
{
	const uint64_t gdsc = 0x10F004ULL;
	uint32_t ctl = *(volatile uint32_t *)(uintptr_t)gdsc;
	uint32_t sts = *(volatile uint32_t *)(uintptr_t)(gdsc + 4);

	print("gdsc: 10f004 ctl ", 0);
	print("%x", (uint64_t)ctl);
	print(" sts ", 0);
	print("%x", (uint64_t)sts);

	if ((ctl & 1u) != 0) {
		/* release the block reset */
		*(volatile uint32_t *)(uintptr_t)gdsc = ctl & ~1u;
		__asm__ volatile ("dsb sy" ::: "memory");

		/* and wait for the domain to report powered */
		for (unsigned i = 0; i < 200; i++) {
			chiron_udelay(100);
			sts = *(volatile uint32_t *)(uintptr_t)(gdsc + 4);
			if ((sts & 1u) != 0) {
				break;
			}
		}
		print(" -> ctl ", 0);
		print("%x", (uint64_t)*(volatile uint32_t *)(uintptr_t)gdsc);
		print(" sts ", 0);
		print("%x", (uint64_t)sts);
	}
	print("\n", 0);
}
/*
 * CHIRON_USB_CLOCKS
 *
 * The names are the running kernel's own (read from /sys/kernel/debug/clk on this
 * phone), not the device tree's short names -- GetId rejected every short name.
 * gcc_qusb2phy_prim_reset is a reset line rather than a clock and GetId refuses it
 * too, so it is handled by writing its BCR directly in the PHY init.
 */
static void
chiron_clocks_on(void)
{
	static const efi_guid clock_guid = {0x241AFAE6, 0x885F, 0x4F6C,
	    {0xA7, 0xEA, 0xC2, 0x8E, 0xAB, 0x79, 0xC3, 0xE5}};
	static const char *names[] = {
		"gcc_cfg_noc_usb3_axi_clk",
		"gcc_aggre1_usb3_axi_clk",
		"gcc_usb30_master_clk",
		"gcc_usb30_mock_utmi_clk",
		"gcc_usb3_phy_aux_clk",
		"gcc_usb30_sleep_clk",
		"gcc_rx1_usb2_clkref_clk",
		"gcc_usb3_clkref_clk",
	};
	efi_clock_protocol *clk = NULL;

	if (EFI_ERROR(BS->locate_protocol(&clock_guid, NULL, (void **)&clk)) || clk == NULL) {
		print("clk: no clock protocol\n");
		return;
	}
	for (unsigned i = 0; i < sizeof(names) / sizeof(names[0]); i++) {
		uint32_t id = 0xffffffffu;
		efi_status g = clk->get_id(clk, names[i], &id);
		efi_status e = 0xffffffffffffffffULL;

		if (!EFI_ERROR(g)) {
			e = clk->enable(clk, id);
		}
		print("clk: ", 0);
		print((char *)names[i], 0);
		print(" get=%x enable=%x\n", (uint64_t)g, (uint64_t)e);
	}
}

/*
 * CHIRON_QUSB2_INIT
 *
 * The QUSB2 PHY, following msm_qusb_phy_init() in
 * drivers/usb/phy/phy-msm-qusb-v2.c step for step:
 *
 *   reset assert/deassert
 *   PWR_CTRL1 |=  POWR_DOWN          <- power down before programming
 *   write qcom,qusb-phy-init-seq
 *   PWR_CTRL1 &= ~POWR_DOWN          <- power up
 *   wmb(); wait 150 us for the PLL
 *   PLL_COMMON_STATUS_ONE bit0 CORE_READY must be 1
 *
 * The previous attempt powered up before the reset, and the reset set POWR_DOWN
 * again; the run showed r210=0x23 (bit0 set) and r1a0=0x64 (CORE_READY clear),
 * i.e. the PHY was still off and its PLL never locked.
 *
 *   QUSB2PHY_PWR_CTRL1              0x210   bit0 POWR_DOWN
 *   QUSB2PHY_PLL_COMMON_STATUS_ONE  0x1A0   bit0 CORE_READY
 *   GCC_QUSB2PHY_PRIM_BCR           0x112000  (GCC 0x100000 + 0x12000), bit0 reset
 *   TCSR clamp                      0x1FCB24C
 */

/*
 * CHIRON_EFUSE_TUNE1
 *
 * Fold the per-chip trim into tune1, as qusb_phy_get_tune1_param() does:
 *
 *     reg = tune1 & 0x0f;  reg |= (trim << 4);
 *
 * The working hardware reads tune1 = 0x45, and 0x45 is (0xa5 & 0x0f) | (4 << 4),
 * so this chip's efuse trim is 4.  Reading it rather than hard-coding 4 keeps the
 * port correct on a chip trimmed differently.
 *
 * The efuse register address comes from msm8998-v2.dtsi's third reg entry,
 * 0x00784238, with bit-pos 16 and four bits.
 */
static void
chiron_efuse_tune1(void)
{
	const uint64_t phy = 0xC012000ULL;
	const uint64_t efuse = 0x784238ULL;
	uint32_t raw = *(volatile uint32_t *)(uintptr_t)efuse;
	uint32_t trim = (raw >> 16) & 0xf;
	uint8_t tune1 = *(volatile uint8_t *)(uintptr_t)(phy + 0x23C);

	print("efuse: raw ", 0);
	print("%x", (uint64_t)raw);
	print(" trim ", 0);
	print("%x", (uint64_t)trim);
	print(" tune1 ", 0);
	print("%x", (uint64_t)tune1);

	if (trim != 0) {
		uint8_t merged = (uint8_t)((tune1 & 0x0f) | (trim << 4));

		*(volatile uint8_t *)(uintptr_t)(phy + 0x23C) = merged;
		__asm__ volatile ("dsb sy" ::: "memory");
		print(" -> ", 0);
		print("%x", (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0x23C));
	}
	print("\n", 0);
}

static void
chiron_qusb2_init(void)
{
	/*
	 * qcom,qusb-phy-init-seq as (value, offset), written one byte per register:
	 * a 32-bit store at 0x00 spread 0x80 over four registers, which is where the
	 * misleading 0x80808080 readbacks came from.
	 */
	/*
	 * CHIRON_MEASURED_INIT_SEQ
	 *
	 * Values from msm8998-v2.dtsi, confirmed against the register map captured at
	 * loader entry while fastboot still had this port working:
	 *
	 *   0x184 = 0x0a   0x18c = 0x7c   0x240 = 0x09   0xb4 = 0x19   all match
	 *   0x23c = 0x45, which is 0xa5 with the efuse trim folded in -- see below
	 *
	 * The v1 numbers from msm8998.dtsi (0xf0 / 0x0f, no 0xb4 entry) do not match
	 * what the hardware actually held.
	 */
	/*
	 * CHIRON_MEASURED_INIT_SEQ
	 *
	 * Values from msm8998-v2.dtsi, confirmed against the register map captured at
	 * loader entry while fastboot still had this port working:
	 *
	 *   0x184 = 0x0a   0x18c = 0x7c   0x240 = 0x09   0xb4 = 0x19   all match
	 *   0x23c = 0x45, which is 0xa5 with the efuse trim folded in -- see below
	 *
	 * The v1 numbers from msm8998.dtsi (0xf0 / 0x0f, no 0xb4 entry) do not match
	 * what the hardware actually held.
	 */
	/*
	 * CHIRON_MEASURED_INIT_SEQ
	 *
	 * Values from msm8998-v2.dtsi, confirmed against the register map captured at
	 * loader entry while fastboot still had this port working:
	 *
	 *   0x184 = 0x0a   0x18c = 0x7c   0x240 = 0x09   0xb4 = 0x19   all match
	 *   0x23c = 0x45, which is 0xa5 with the efuse trim folded in -- see below
	 *
	 * The v1 numbers from msm8998.dtsi (0xf0 / 0x0f, no 0xb4 entry) do not match
	 * what the hardware actually held.
	 */
	/*
	 * CHIRON_MEASURED_INIT_SEQ
	 *
	 * Values from msm8998-v2.dtsi, confirmed against the register map captured at
	 * loader entry while fastboot still had this port working:
	 *
	 *   0x184 = 0x0a   0x18c = 0x7c   0x240 = 0x09   0xb4 = 0x19   all match
	 *   0x23c = 0x45, which is 0xa5 with the efuse trim folded in -- see below
	 *
	 * The v1 numbers from msm8998.dtsi (0xf0 / 0x0f, no 0xb4 entry) do not match
	 * what the hardware actually held.
	 */
	static const uint32_t seq[][2] = {
		{0x13, 0x004},   /* analog_controls_two */
		{0x7c, 0x18c},   /* pll_clock_inverter */
		{0x80, 0x02c},   /* pll_cmode */
		{0x0a, 0x184},   /* pll_lock_delay */
		{0xa5, 0x23c},   /* tune1, efuse trim folded in afterwards */
		{0x09, 0x240},   /* tune2 */
		{0x19, 0x0b4},   /* digital_timers_two */
	};
	const uint64_t phy = 0xC012000ULL;
	const uint64_t bcr = 0x112000ULL;
	const uint64_t tcsr = 0x1FCB24CULL;
	uint8_t ready = 0;

	/* clamp released, then reset the PHY */
	*(volatile uint32_t *)(uintptr_t)tcsr = 1;
	__asm__ volatile ("dsb sy" ::: "memory");
	*(volatile uint32_t *)(uintptr_t)bcr = 1;
	chiron_udelay(150);
	*(volatile uint32_t *)(uintptr_t)bcr = 0;
	chiron_udelay(50);

	/*
	 * CHIRON_QUSB2_PWRDOWN: PWR_CTRL1 is a 32-bit word (the driver uses
	 * readl/writel), so touch it as one: bit0 POWR_DOWN set, bit1 CLAMP_N_EN
	 * kept set so the clamp stays released.
	 */
	*(volatile uint32_t *)(uintptr_t)(phy + 0x210) =
	    (*(volatile uint32_t *)(uintptr_t)(phy + 0x210) | 1u) | 2u;
	__asm__ volatile ("dsb sy" ::: "memory");

	for (unsigned i = 0; i < sizeof(seq) / sizeof(seq[0]); i++) {
		*(volatile uint8_t *)(uintptr_t)(phy + seq[i][1]) = (uint8_t)seq[i][0];
	}
	__asm__ volatile ("dsb sy" ::: "memory");

	/* fold the per-chip trim in, as the working hardware has it (0x45 from 0xa5) */
	chiron_efuse_tune1();
	/* CHIRON_QUSB2_PWRUP: 32-bit again, POWR_DOWN clear, CLAMP_N_EN set */
	*(volatile uint32_t *)(uintptr_t)(phy + 0x210) =
	    (*(volatile uint32_t *)(uintptr_t)(phy + 0x210) & ~1u) | 2u;
	__asm__ volatile ("dsb sy" ::: "memory");
	chiron_udelay(200);

	for (int i = 0; i < 100; i++) {
		ready = *(volatile uint8_t *)(uintptr_t)(phy + 0x1A0);
		if (ready & 1) {
			break;
		}
		chiron_udelay(100);
	}

	print("qusb2: PLL %x ready %x\n", (uint64_t)ready, (uint64_t)(ready & 1));
	print("qusb2: r210 %x (pwrdn %x clamp %x)\n",
	    (uint64_t)*(volatile uint32_t *)(uintptr_t)(phy + 0x210),
	    (uint64_t)(*(volatile uint32_t *)(uintptr_t)(phy + 0x210) & 1),
	    (uint64_t)((*(volatile uint32_t *)(uintptr_t)(phy + 0x210) >> 1) & 1));
	print("qusb2: r00 %x r04 %x r2c %x r18c %x\n",
	    (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0x000),
	    (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0x004),
	    (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0x02c),
	    (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0x18c));
}

/*
 * CHIRON_DWC3_RUN
 *
 * Start the DWC3 device core and report whether a host has noticed us:
 *   DCTL bit 31  RunStop
 *   DSTS bit 24  Connected
 *   DSTS bits 2:0  speed (1 low, 2 full, 3 high)
 */
/*
 * CHIRON_DWC3_RUN
 *
 * Running the core is not enough: DSTS reported LinkState=2 (SUSPEND), so the link
 * never went ON and the host stayed invisible.  Drive the link out of suspend
 * (DCTL.ULStChngReq), make sure the PHY is not held in suspend
 * (GUSB2PHYCFG0.SUSPENDUSB2), and report what changed.
 */
/*
 * CHIRON_DWC3_HIGHSPEED
 *
 * DCFG.SPEED was left at 4 (SuperSpeed), so the core advertised SuperSpeed and
 * waited for an SS link that cannot exist on chiron's micro-USB port.  DSTS kept
 * reporting USBLNKST=4 (DISCONNECT) with CONNECTSPD=4 (SS) for that reason.
 *
 * DWC3_DCFG_SPEED_MASK (7 << 0): 0 HS, 1 FS2, 2 LS, 3 FS1, 4 SS.
 * Switched to HIGHSPEED, which is what this port's USB2 PHY provides.
 */
static void
chiron_dwc3_highspeed(void)
{
	const uint64_t dwc = 0xA800000ULL;
	uint32_t dcfg = *(volatile uint32_t *)(uintptr_t)(dwc + 0xC700);

	print("dwc3: DCFG before %x speed %x\n",
	    (uint64_t)dcfg, (uint64_t)(dcfg & 7));

	dcfg &= ~7u;                    /* DWC3_DCFG_SPEED_MASK */
	dcfg |= 0u;                     /* DWC3_DCFG_HIGHSPEED */
	*(volatile uint32_t *)(uintptr_t)(dwc + 0xC700) = dcfg;
	__asm__ volatile ("dsb sy" ::: "memory");

	dcfg = *(volatile uint32_t *)(uintptr_t)(dwc + 0xC700);
	print("dwc3: DCFG after %x speed %x\n",
	    (uint64_t)dcfg, (uint64_t)(dcfg & 7));
}

/*
 * CHIRON_DWC3_DEVICE_MODE
 *
 * GCTL.PrtCapDir (bits 13:12) = 1 means HOST: 00/01 host, 10 device, 11 OTG.
 * Every log so far showed GCTL=0x00112000, i.e. host mode, which is why the core
 * ran, the PLL locked and the PHY was programmed correctly, yet DSTS never
 * reported Connected -- a host-mode controller has no device pull-up to present.
 *
 * dwc3_core_init_mode() does it like this; so does this.
 */
static void
chiron_dwc3_device_mode(void)
{
	const uint64_t dwc = 0xA800000ULL;
	uint32_t gctl = *(volatile uint32_t *)(uintptr_t)(dwc + 0xC110);

	print("dwc3: GCTL before %x dir %x\n",
	    (uint64_t)gctl, (uint64_t)((gctl >> 12) & 3));

	gctl &= ~(3u << 12);            /* clear PrtCapDir */
	gctl |= (2u << 12);             /* DEVICE */
	*(volatile uint32_t *)(uintptr_t)(dwc + 0xC110) = gctl;
	__asm__ volatile ("dsb sy" ::: "memory");

	gctl = *(volatile uint32_t *)(uintptr_t)(dwc + 0xC110);
	print("dwc3: GCTL after %x dir %x\n",
	    (uint64_t)gctl, (uint64_t)((gctl >> 12) & 3));
}

/*
 * CHIRON_QUSB2_RESUME
 *
 * Take the PHY's link out of susnd.  The core runs and the PLL is locked, yet
 * DSTS keeps reporting LinkState=2 (SUSPEND); these are the writes the driver's
 * resume path makes (phy-msm-qusb-v2.c, qusb_phy_set_suspend(..., 0)):
 *
 *   QUSB2PHY_PLL_ANALOG_CONTROLS_ONE   0x000 = 0x80   (clock bypass off)
 *   QUSB2PHY_PLL_ANALOG_CONTROLS_TWO   0x004 = analog_ctrl_two (default 0x8c)
 *   QUSB2PHY_INTR_CTRL                 0x22C = 0x00   (clear all interrupts)
 *   QUSB2PHY_TEST1                     0x24C = 0x91, then 0x90   (auto-resume)
 *
 * The last pair is what lets the PHY leave suspend when the host drives the bus.
 */
static void
chiron_qusb2_resume(void)
{
	const uint64_t phy = 0xC012000ULL;

	/*
	 * 0x004 keeps the value the init sequence wrote (0x13).  The driver saves it
	 * on suspend and writes the same value back on resume; it is not 0x8c.
	 */
	*(volatile uint8_t *)(uintptr_t)(phy + 0x000) = 0x80;
	/*
	 * CHIRON_INTR_AS_FOUND
	 *
	 * INTR_CTRL (0x22C) is not touched.  This used to write 0x03 here on the
	 * theory that INTR_STAT reading 0 meant the single-ended detectors were
	 * disabled.  The register map captured while fastboot still had this port
	 * working shows the opposite:
	 *
	 *     0x22c INTR_CTRL = 0x00      0x230 INTR_STAT = 0x00
	 *
	 * so zero is the working configuration, and arming the detectors here changes
	 * the PHY's behaviour on the strength of a misreading.
	 */

	*(volatile uint8_t *)(uintptr_t)(phy + 0x24C) = 0x91;
	__asm__ volatile ("dsb sy" ::: "memory");
	*(volatile uint8_t *)(uintptr_t)(phy + 0x24C) = 0x90;
	__asm__ volatile ("dsb sy" ::: "memory");

	print("qusb2: resume r0 %x r4 %x r22c %x r24c %x\n",
	    (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0x000),
	    (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0x004),
	    (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0x22C),
	    (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0x24C));
}

/*
 * CHIRON_QUSB2_REASSERT
 *
 * Put the port configuration back on the PHY after the vendor driver has had its
 * turn.  The tune dump taken once UsbConfigDxe had run showed
 *
 *     PORT_TUNE1 (0x23C) = 0x45,  0x240 = 0x09
 *
 * where qcom,qusb-phy-init-seq asks for 0xF0 and 0x0F, and with those values the
 * transceiver leaves D+ and D- both low.  Re-applying the sequence after HK6 and
 * after start_ex makes the PHY carry the port setup this phone needs instead of
 * the host-mode leftovers.
 */
static void
chiron_qusb2_reassert(void)
{
		/*
	 * CHIRON_MEASURED_INIT_SEQ
	 *
	 * Values from msm8998-v2.dtsi, confirmed against the register map captured at
	 * loader entry while fastboot still had this port working:
	 *
	 *   0x184 = 0x0a   0x18c = 0x7c   0x240 = 0x09   0xb4 = 0x19   all match
	 *   0x23c = 0x45, which is 0xa5 with the efuse trim folded in -- see below
	 *
	 * The v1 numbers from msm8998.dtsi (0xf0 / 0x0f, no 0xb4 entry) do not match
	 * what the hardware actually held.
	 */
	static const uint32_t seq[][2] = {
		{0x13, 0x004},   /* analog_controls_two */
		{0x7c, 0x18c},   /* pll_clock_inverter */
		{0x80, 0x02c},   /* pll_cmode */
		{0x0a, 0x184},   /* pll_lock_delay */
		{0xa5, 0x23c},   /* tune1, efuse trim folded in afterwards */
		{0x09, 0x240},   /* tune2 */
		{0x19, 0x0b4},   /* digital_timers_two */
	};
	const uint64_t phy = 0xC012000ULL;

	for (unsigned i = 0; i < sizeof(seq) / sizeof(seq[0]); i++) {
		*(volatile uint8_t *)(uintptr_t)(phy + seq[i][1]) = (uint8_t)seq[i][0];
	}
	__asm__ volatile ("dsb sy" ::: "memory");

	/*
	 * CHIRON_INTR_LEFT_ALONE
	 *
	 * INTR_CTRL (0x22C) is left as the firmware left it.  The working port reads
	 * 0x00 there and 0x00 in INTR_STAT; arming the single-ended detectors changes
	 * PHY behaviour for readings that were never reliable anyway -- 0xF0 and 0xF4
	 * are unimplemented on this part.
	 */
	*(volatile uint8_t *)(uintptr_t)(phy + 0x24C) = 0x91;
	__asm__ volatile ("dsb sy" ::: "memory");
	*(volatile uint8_t *)(uintptr_t)(phy + 0x24C) = 0x90;
	__asm__ volatile ("dsb sy" ::: "memory");

	print("phy: reasserted, tune ", 0);
	print("%x", (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0x23C));
	print(" ", 0);
	print("%x", (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0x240));
	print("\n", 0);
}

/*
 * CHIRON_QUSB2_LEVEL
 *
 * Read D+ and D- in both trigger polarities.  QUSB2PHY_INTR_CTRL (0x22C):
 *   bit0 DPSE_INTR_EN  bit1 DMSE_INTR_EN
 *   bit3 DPSE_INTR_HIGH_SEL   bit4 DMSE_INTR_HIGH_SEL
 * QUSB2PHY_INTR_STAT (0x230): bit0 DPSE, bit1 DMSE.
 *
 * A detector only latches when its line matches the selected level, so running
 * the pair once with low-trigger and once with high-trigger and comparing says
 * what the line actually is:
 *
 *   low-trigger set, high-trigger clear -> the line is LOW
 *   high-trigger set, low-trigger clear -> the line is HIGH
 *   neither                             -> the pair is not being driven
 */
static uint8_t
chiron_qusb2_level(uint8_t ctrl_bits)
{
	const uint64_t phy = 0xC012000ULL;

	*(volatile uint8_t *)(uintptr_t)(phy + 0x22C) = (uint8_t)(0x03 | ctrl_bits);
	__asm__ volatile ("dsb sy" ::: "memory");
	chiron_udelay(2000);
	return *(volatile uint8_t *)(uintptr_t)(phy + 0x230);
}

static void
chiron_qusb2_report_levels(void)
{
	uint8_t low_trig = chiron_qusb2_level(0x00);      /* DPSE/DMSE low trigger */
	uint8_t high_trig = chiron_qusb2_level(0x18);     /* both high trigger */

	print("level: low ", 0);
	print("%x", (uint64_t)low_trig);
	print(" high ", 0);
	print("%x", (uint64_t)high_trig);

	/* decode: 1 = that line is at the level its detector latched */
	print(" Dp=", 0);
	print("%x", (uint64_t)((high_trig & 1) ? 1 : ((low_trig & 1) ? 0 : 2)));
	print(" Dm=", 0);
	print("%x", (uint64_t)(((high_trig >> 1) & 1) ? 1 : (((low_trig >> 1) & 1) ? 0 : 2)));
	print("  (Dp/Dm: 1=high 0=low 2=undriven)\n", 0);

	/* leave INTR_CTRL as found: the working port has it at 0x00 */
}

/*
 * CHIRON_PORT_POWERDOWN
 *
 * Release the PHY's IO freeze.  QUSB2PHY_PORT_POWERDOWN (0xB4) is
 *
 *     BIT(5) CLAMP_N_EN   clamp released
 *     BIT(1) FREEZIO_N    IO not frozen
 *     BIT(0) POWER_DOWN   PHY off
 *
 * and the reference driver writes all three (0x22) when it wants the PHY *off*.
 * For the transceiver to drive the wires, POWER_DOWN has to be clear and FREEZIO_N
 * set.  This port had never written 0xB4 at all, so the block stayed frozen:
 * powered, PLL locked, and neither data line driven -- exactly what was measured.
 *
 * UTMI_CTRL1 (0xC0) is set for device operation as well: TERM_SELECT and
 * XCVR_SELECT_FS on, OP_MODE_NON_DRIVE off.
 */
/*
 * CHIRON_PORT_NORMAL
 *
 * The reference driver's return-to-normal sequence (phy-msm-qusb.c:951-973):
 * power the PHY down, program PLL auto-programming, select ULPI/UTMI, set
 * TERM_SELECT, then power it up with the clamp released and the IO unfrozen.
 *
 * This port had two details wrong: UTMI_CTRL1 was left at 0x14 instead of plain
 * TERM_SELECT (0x10), and PLL_AUTOPGM_CTL1 was never programmed.
 *
 * Afterwards the read-only status registers say what the wires are doing:
 *   PORT_INT_STATUS  (0xF0)  bit0 DP, bit1 DM
 *   PORT_UTMI_STATUS (0xF4)  UTMI line-state view
 */
/*
 * CHIRON_PROBE_ENTRY
 *
 * Ask the transport what it thinks, before any write of ours.
 *
 * The upper Qualcomm protocol is located first (it is what fastboot itself used),
 * then handle_event is polled a few times and send() is tried once.  If the
 * firmware's session survived the hand-off, this reports a live device; if it did
 * not, everything this loader does afterwards starts from a dead controller and
 * that, not the PHY, is what has to be fixed.
 */
static void chiron_dwc3_snap(const char *where);

/*
 * CHIRON_PROBE_ENTRY
 *
 * What the controller thinks, before this loader writes anything.
 *
 * Registers only -- no driver calls.  An earlier version called
 * USB->handle_event() here, which does not return when no event is pending, and the
 * phone stopped responding with the reset path never reached.  Everything this probe
 * needed to know is readable directly:
 *
 *   DCFG        0xC700  device address (bits 9:3) and speed (bits 2:0)
 *   DSTS        0xC70C  link state (bits 21:18), device controller halted (22)
 *   DEVTEN      0xC708  which device events are unmasked
 *   GEVNTCOUNT  0xC40C  events pending in the ring
 *   GCTL        0xC110  port capability (bits 13:12), 2 = device
 *
 * A non-zero device address is the one reading that proves the host reached
 * SET_ADDRESS, i.e. that enumeration actually began.
 */
static void
chiron_probe_entry(void)
{
	const uint64_t dwc = 0xA800000ULL;
	uint32_t gctl  = *(volatile uint32_t *)(uintptr_t)(dwc + 0xC110);
	uint32_t dcfg  = *(volatile uint32_t *)(uintptr_t)(dwc + 0xC700);
	uint32_t dctl  = *(volatile uint32_t *)(uintptr_t)(dwc + 0xC704);
	uint32_t devten = *(volatile uint32_t *)(uintptr_t)(dwc + 0xC708);
	uint32_t dsts  = *(volatile uint32_t *)(uintptr_t)(dwc + 0xC70C);
	uint32_t evcnt = *(volatile uint32_t *)(uintptr_t)(dwc + 0xC40C);

	print("prob: cap ", 0);
	print("%x", (uint64_t)((gctl >> 12) & 3));
	print(" run ", 0);
	print("%x", (uint64_t)((dctl >> 31) & 1));
	print(" addr ", 0);
	print("%x", (uint64_t)((dcfg >> 3) & 0x7f));
	print(" spd ", 0);
	print("%x", (uint64_t)(dcfg & 7));
	print(" lkst ", 0);
	print("%x", (uint64_t)((dsts >> 18) & 0xf));
	print(" hlt ", 0);
	print("%x", (uint64_t)((dsts >> 22) & 1));
	print(" devten ", 0);
	print("%x", (uint64_t)devten);
	print(" evt ", 0);
	print("%x", (uint64_t)(evcnt & 0xfffc));
	print("\n", 0);
	flush_log();
}

/*
 * CHIRON_ENV_SNAP
 *
 * Everything outside the PHY that fastboot was using and this loader may have
 * disturbed: the TCSR clamp, the GCC USB clocks, and the controller's own PHY
 * configuration registers.  None of these has ever been captured at entry.
 *
 *   TCSR clamp        0x1FCB24C
 *   GCC base          0x100000  (a few USB clock branches)
 *   GUSB2PHYCFG0      0xA800000 + 0xC200
 *   GUSB3PIPECTL0     0xA800000 + 0xC2C0
 *   GHWPARAMS0..3     0xA800000 + 0xC100, 0xC104, 0xC108, 0xC10C
 */
static void
chiron_env_snap(const char *tag)
{
	const uint64_t dwc = 0xA800000ULL;
	const uint64_t gcc = 0x100000ULL;

	print("env ", 0);
	print((char *)tag, 0);
	print(": tcsr ", 0);
	print("%x", (uint64_t)*(volatile uint32_t *)(uintptr_t)0x1FCB24CULL);
	print(" phycfg ", 0);
	print("%x", (uint64_t)*(volatile uint32_t *)(uintptr_t)(dwc + 0xC200));
	print(" pipe ", 0);
	print("%x", (uint64_t)*(volatile uint32_t *)(uintptr_t)(dwc + 0xC2C0));
	print("\n", 0);
	print("env ", 0);
	print((char *)tag, 0);
	print(": hw0 ", 0);
	print("%x", (uint64_t)*(volatile uint32_t *)(uintptr_t)(dwc + 0xC100));
	print(" hw1 ", 0);
	print("%x", (uint64_t)*(volatile uint32_t *)(uintptr_t)(dwc + 0xC104));
	print(" hw2 ", 0);
	print("%x", (uint64_t)*(volatile uint32_t *)(uintptr_t)(dwc + 0xC108));
	print(" hw3 ", 0);
	print("%x", (uint64_t)*(volatile uint32_t *)(uintptr_t)(dwc + 0xC10C));
	print("\n", 0);
	print("env ", 0);
	print((char *)tag, 0);
	print(": gcc 17004 ", 0);
	print("%x", (uint64_t)*(volatile uint32_t *)(uintptr_t)(gcc + 0x17004));
	print(" 2a004 ", 0);
	print("%x", (uint64_t)*(volatile uint32_t *)(uintptr_t)(gcc + 0x2A004));
	print(" 2a008 ", 0);
	print("%x", (uint64_t)*(volatile uint32_t *)(uintptr_t)(gcc + 0x2A008));
	print(" 2a040 ", 0);
	print("%x", (uint64_t)*(volatile uint32_t *)(uintptr_t)(gcc + 0x2A040));
	print("\n", 0);
}

/*
 * CHIRON_COUNT_PROTOS
 *
 * How many handles publish each of the three USB protocols this loader juggles.
 *
 *   UsbFnIo    the controller
 *   UsbDevice  the upper Qualcomm device protocol
 *   UsbConfig  the per-controller configuration table
 *
 * Every one of them is looked up with plain locate_protocol somewhere in this
 * file, which silently takes the first match.  If any of the three counts is more
 * than one, those lookups are picking blind and the choice has to be made
 * explicitly instead of inherited from handle order.
 */
static void
chiron_count_protos(const char *tag)
{
	static const efi_guid fn_guid = QCOM_USBFN_IO_GUID;
	static const efi_guid dev_guid = QCOM_USB_DEVICE_GUID;
	static const efi_guid cfg_guid = QCOM_USB_CONFIG_GUID;
	static const efi_guid chg_guid = QCOM_USBFN_CHG_GUID;

	for (unsigned i = 0; i < 4; i++) {
		const efi_guid *g = (i == 0) ? &fn_guid : (i == 1) ? &dev_guid :
		                    (i == 2) ? &cfg_guid : &chg_guid;
		uint64_t n = 0;
		efi_status s = BS->locate_handle_buffer(ByProtocol, (efi_guid *)g, NULL, &n, NULL);

		print("cnt ", 0);
		print((char *)tag, 0);
		print(" ", 0);
		print("%x", (uint64_t)i);
		print(": st ", 0);
		print("%x", (uint64_t)s);
		print(" n ", 0);
		print("%x", (uint64_t)n);
		print("\n", 0);
	}
}

/*
 * CHIRON_FN_EVENTS
 *
 * Poll EFI_USBFN_IO_PROTOCOL::EventHandler and report what comes back.
 *
 * This is the layer that sees the wire.  EfiUsbMsgBusEventAttach (5),
 * BusEventReset (6) and SetupPacket (1) are the messages that prove the host found
 * this device and started talking to it, and none of them exist in the upper
 * USB_DEVICE_EVENT enum this port has been reading.
 *
 * Bounded on purpose: EventHandler is a poll, and a poll on a silent controller may
 * never return.  Each call is preceded by its own budget check, and the whole sweep
 * stops after fn_events_budget counters.
 */
static void
chiron_fn_events(const char *tag)
{
	static const efi_guid usbfn_guid = QCOM_USBFN_IO_GUID;
	efi_usbfn_io *fn = NULL;
	uint64_t freq = 0, began = 0;
	uint32_t seen[16];
	unsigned distinct = 0;

	if (EFI_ERROR(BS->locate_protocol(&usbfn_guid, NULL, (void **)&fn)) || fn == NULL ||
	    fn->event_handler == NULL) {
		print("fnev ", 0);
		print((char *)tag, 0);
		print(": no event_handler\n", 0);
		return;
	}

	__asm__ volatile ("mrs %0, CNTFRQ_EL0" : "=r" (freq));
	__asm__ volatile ("mrs %0, CNTVCT_EL0" : "=r" (began));

	for (unsigned i = 0; i < 400; i++) {
		uint32_t msg = 0;
		uint64_t size = sizeof(uint64_t) * 8;
		uint64_t payload[8];
		efi_status s;
		uint64_t now = 0;
		int known = 0;

		__asm__ volatile ("mrs %0, CNTVCT_EL0" : "=r" (now));
		if (now - began > freq) {          /* 1 s of polling is plenty */
			break;
		}

		memset(payload, 0, sizeof(payload));
		s = fn->event_handler(fn, &msg, &size, payload);
		if (EFI_ERROR(s) || msg == 0) {    /* EfiUsbMsgNone */
			continue;
		}

		for (unsigned k = 0; k < distinct; k++) {
			if (seen[k] == msg) {
				known = 1;
				break;
			}
		}
		if (!known && distinct < 16) {
			seen[distinct++] = msg;
			print("fnev ", 0);
			print((char *)tag, 0);
			print(": msg ", 0);
			print("%x", (uint64_t)msg);
			print("\n", 0);
			flush_log();
		}
	}

	print("fnev ", 0);
	print((char *)tag, 0);
	print(": done, ", 0);
	print("%x", (uint64_t)distinct);
	print(" distinct\n", 0);
}

/*
 * CHIRON_PICK_USB_DEVICE
 *
 * Choose the peripheral controller's UsbDevice protocol, not whatever handle
 * happens to come first.
 *
 * Each USB controller publishes both a UsbDevice protocol and a USB Config table.
 * The Config table says which mode that controller is in (core_num / mode_type),
 * so walk the Config handles, and for each one find the UsbDevice protocol on
 * either that same handle or the controller it points at.
 *
 * Peripheral modes are UsbModePeripheral (0x02) and UsbModePeripheralAlt (0x04);
 * UsbModeHost is 0x01 and must never be chosen -- installing device descriptors on
 * a host controller is a no-op that reports success.
 *
 * Returns the UsbDevice protocol to use, or NULL.
 */
static usb_device_protocol *
chiron_pick_usb_device(void)
{
	static const efi_guid usb_guid = QCOM_USB_DEVICE_GUID;
	static const efi_guid cfg_guid = QCOM_USB_CONFIG_GUID;
	efi_handle *handles = NULL;
	uint64_t count = 0;
	usb_device_protocol *chosen = NULL;

	if (EFI_ERROR(BS->locate_handle_buffer(ByProtocol, &cfg_guid, NULL, &count,
	    &handles))) {
		print("pick: no config handles\n");
		return NULL;
	}
	print("pick: ", 0);
	print("%x", (uint64_t)count);
	print(" config handles\n", 0);

	for (uint64_t i = 0; i < count; i++) {
		efi_qcom_usb_config *cfg = NULL;
		usb_device_protocol *dev = NULL;
		uint32_t mode = 0xff;
		uint32_t core = 0xff;
		int is_peripheral;

		if (EFI_ERROR(BS->handle_protocol(handles[i], &cfg_guid, (void **)&cfg)) ||
		    cfg == NULL) {
			continue;
		}
		if (cfg->revision == 0x10003) {
			core = (uint32_t)cfg->core_num;
			mode = cfg->mode_type;
		}
		is_peripheral = (mode == UsbModePeripheral || mode == UsbModePeripheralAlt);

		/* the UsbDevice protocol usually sits on the same handle as the config */
		if (EFI_ERROR(BS->handle_protocol(handles[i], &usb_guid, (void **)&dev)) ||
		    dev == NULL) {
			dev = NULL;
		}

		print("pick ", 0);
		print("%x", (uint64_t)i);
		print(": core ", 0);
		print("%x", (uint64_t)core);
		print(" mode ", 0);
		print("%x", (uint64_t)mode);
		print(" dev ", 0);
		print("%x", (uint64_t)(dev != NULL));
		print("\n", 0);

		if (dev != NULL && is_peripheral && chosen == NULL) {
			chosen = dev;
		}
	}
	if (handles != NULL) {
		BS->free_pool(handles);
	}

	if (chosen == NULL) {
		/*
		 * Nothing advertised peripheral mode.  Fall back to the single-handle
		 * lookup so behaviour is unchanged rather than broken, and say so.
		 */
		print("pick: no peripheral controller advertised; using first\n", 0);
		if (!EFI_ERROR(BS->locate_protocol(&usb_guid, NULL, (void **)&chosen))) {
			return chosen;
		}
		return NULL;
	}
	print("pick: chose a peripheral controller\n", 0);
	return chosen;
}

/*
 * CHIRON_EVENT_PROBE
 *
 * Report the device event mask and how many events the controller has latched.
 * If GEVNTCOUNT stays zero after the core has been running, the host never spoke
 * to this device; if DEVTEN is zero, the controller was not listening and the
 * reading proves nothing either way.
 */
static void
chiron_event_probe(const char *tag)
{
	const uint64_t dwc = 0xA800000ULL;
	uint32_t devten = *(volatile uint32_t *)(uintptr_t)(dwc + 0xC708);
	uint32_t cnt = *(volatile uint32_t *)(uintptr_t)(dwc + 0xC40C);
	uint32_t dgcmd = *(volatile uint32_t *)(uintptr_t)(dwc + 0xC704);

	print("evt ", 0);
	print((char *)tag, 0);
	print(": devten ", 0);
	print("%x", (uint64_t)devten);
	print(" pending ", 0);
	print("%x", (uint64_t)(cnt & 0xfffc));
	print(" ehb ", 0);
	print("%x", (uint64_t)((cnt >> 31) & 1));
	print(" dgcmd ", 0);
	print("%x", (uint64_t)dgcmd);
	/* CHIRON_EVTBUF: a controller with no event buffer cannot latch anything */
	print(" evtadr ", 0);
	print("%x", (uint64_t)*(volatile uint32_t *)(uintptr_t)(dwc + 0xC400));
	print(" evtsz ", 0);
	print("%x", (uint64_t)*(volatile uint32_t *)(uintptr_t)(dwc + 0xC408));
	print("\n", 0);
}

/*
 * CHIRON_EVENT_ARM
 *
 * Enable the device events that matter, so the controller can report a reset, a
 * disconnect or a completed control command.  Without this the controller is
 * mute and "nothing happened" means nothing.
 */
static void
chiron_event_arm(void)
{
	const uint64_t dwc = 0xA800000ULL;
	uint32_t want = (1u << 0) | (1u << 1) | (1u << 2) | (1u << 3) | (1u << 10);

	*(volatile uint32_t *)(uintptr_t)(dwc + 0xC708) = want;
	__asm__ volatile ("dsb sy" ::: "memory");
	chiron_udelay(2000);

	print("evt: armed devten now ", 0);
	print("%x", (uint64_t)*(volatile uint32_t *)(uintptr_t)(dwc + 0xC708));
	print("\n", 0);
}

/*
 * CHIRON_UTMI_SWEEP
 *
 * Try each UTMI transceiver setting and report DSTS after it.  One boot answers
 * which value actually asserts the D+ pull-up, instead of guessing one per run.
 *
 *   UTMI_CTRL1 (0xC0)  bit4 TERM_SELECT, bit2 XCVR_SELECT_FS,
 *                      bit0 OP_MODE_NON_DRIVE, bit5 SUSPEND_N
 *   UTMI_CTRL2 (0xC4)  bit7 UTMI_ULPI_SEL, bit6 UTMI_TEST_MUX_SEL
 *
 * 0x14 is full-speed transceiver with terminations on -- the state that presents
 * a USB2 device.  0x10 is terminations only.  0x00 and 0x04 are controls.
 */
static void
chiron_utmi_sweep(void)
{
	static const uint8_t values[] = {0x14, 0x10, 0x04, 0x00, 0x24, 0x34};
	const uint64_t phy = 0xC012000ULL;
	const uint64_t dwc = 0xA800000ULL;

	for (unsigned i = 0; i < sizeof(values) / sizeof(values[0]); i++) {
		uint32_t dctl, dsts;

		*(volatile uint8_t *)(uintptr_t)(phy + 0xC4) = 0x80;   /* UTMI mode */
		*(volatile uint8_t *)(uintptr_t)(phy + 0xC0) = values[i];
		__asm__ volatile ("dsb sy" ::: "memory");

		/* run the core at this setting and give the host a moment */
		dctl = *(volatile uint32_t *)(uintptr_t)(dwc + 0xC704);
		dctl |= (1u << 31);
		*(volatile uint32_t *)(uintptr_t)(dwc + 0xC704) = dctl;
		chiron_udelay(30000);

		dsts = *(volatile uint32_t *)(uintptr_t)(dwc + 0xC70C);
		print("sweep: c0 ", 0);
		print("%x", (uint64_t)values[i]);
		print(" readback ", 0);
		print("%x", (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0xC0));
		print(" dsts ", 0);
		print("%x", (uint64_t)dsts);
		print(" conn ", 0);
		print("%x", (uint64_t)((dsts >> 24) & 1));
		print(" lkst ", 0);
		print("%x", (uint64_t)((dsts >> 18) & 0xf));
		print(" spd ", 0);
		print("%x", (uint64_t)(dsts & 7));
		print("\n", 0);
		flush_log();
	}
}

/*
 * CHIRON_PHY_RESTORE
 *
 * Put the PHY back to the values measured at loader entry, which is the state in
 * which the firmware's own fastboot was driving this port successfully:
 *
 *   0xB4  = 0x19   as the firmware left it (not overridden)
 *   0x210 = 0x23   PWR_CTRL1 POWR_DOWN=1, CLAMP_N_EN=1
 *
 * and leave 0x1A0 (PLL status) alone -- at entry it read 0x64, unlocked, because a
 * powered-down PHY has no locked PLL.
 *
 * Every other write this loader performed moved the block away from that state.
 */
static void
chiron_phy_restore(void)
{
	const uint64_t phy = 0xC012000ULL;

	/*
	 * 0xB4 is left exactly as the firmware left it.  chiron.dtb does not set
	 * digital_timers_two, so there is no documented value to restore it to --
	 * the earlier 0x19 here came from msm8998-v2.dtsi, which is not this
	 * phone's device tree.
	 */
	__asm__ volatile ("dsb sy" ::: "memory");
	*(volatile uint8_t *)(uintptr_t)(phy + 0x210) = 0x23;
	__asm__ volatile ("dsb sy" ::: "memory");

	print("restore: b4 ", 0);
	print("%x", (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0xB4));
	print(" 210 ", 0);
	print("%x", (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0x210));
	print(" 1a0 ", 0);
	print("%x", (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0x1A0));
	print("\n", 0);
}

/*
 * CHIRON_PHY_ENTRY_SNAP
 *
 * The PHY as the firmware left it, before this loader writes anything.  At this
 * point fastboot has just been talking to the host over this very port, so these
 * values are a working reference -- the one thing this port has never had.
 *
 * Only the offsets that matter are printed, so the line stays short.
 */
static void
chiron_phy_entry_snap(const char *tag)
{
	const uint64_t phy = 0xC012000ULL;

	print("phy ", 0);
	print((char *)tag, 0);
	print(": b4 ", 0);
	print("%x", (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0xB4));
	print(" c0 ", 0);
	print("%x", (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0xC0));
	print(" c4 ", 0);
	print("%x", (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0xC4));
	print(" 210 ", 0);
	print("%x", (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0x210));
	print(" 1a0 ", 0);
	print("%x", (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0x1A0));
	print(" 23c ", 0);
	print("%x", (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0x23C));
	print(" 240 ", 0);
	print("%x", (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0x240));
	print(" 70 ", 0);
	print("%x", (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0x70));
	print(" 74 ", 0);
	print("%x", (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0x74));
	print(" f0 ", 0);
	print("%x", (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0xF0));
	print(" f4 ", 0);
	print("%x", (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0xF4));
	print("\n", 0);
}

/*
 * CHIRON_PHY_MAP
 *
 * Read-only sweep of the QUSB2 window.  Every row is 16 bytes at 0x20 stride, so
 * the rows cover 0x00..0x2FF in 24 lines.  A decoded register rarely reads as a
 * flat 0x00 or 0xFF, so the shape of the map says which offsets are real.
 */
static void
chiron_phy_map(void)
{
	const uint64_t phy = 0xC012000ULL;

	/* low window 0x00..0xFF, one row per 0x20 */
	for (uint32_t base = 0; base < 0x100; base += 0x20) {
		print("map ", 0);
		print("%x", (uint64_t)base);
		print(":", 0);
		for (uint32_t off = 0; off < 0x20; off += 4) {
			print(" ", 0);
			print("%x", (uint64_t)*(volatile uint32_t *)(uintptr_t)(phy + base + off));
		}
		print("\n", 0);
	}

	/*
	 * CHIRON_PHY_MAP_HIGH: the window the init sequence actually uses.  0x184,
	 * 0x18c, 0x23c and 0x240 all live up here, so these rows say whether the
	 * byte stores land where the reads look.
	 */
	for (uint32_t base = 0x100; base < 0x300; base += 0x40) {
		print("hi ", 0);
		print("%x", (uint64_t)base);
		print(":", 0);
		for (uint32_t off = 0; off < 0x40; off += 4) {
			print(" ", 0);
			print("%x", (uint64_t)*(volatile uint32_t *)(uintptr_t)(phy + base + off));
		}
		print("\n", 0);
	}
}


/*
 * CHIRON_WRITE_TEST
 *
 * Which access width does this PHY honour?  Evidence it might not honour byte
 * stores: "port: c4 0->0" -- 0x80 written to UTMI_CTRL2 read back as 0.
 *
 * TUNE5 (0x90) is a tuning byte the init sequence does not use, so a pattern
 * written there cannot disturb the port setup.  Write with a byte store, read a
 * byte; write with a word store, read a word; then the same on PLL_TEST (0x04).
 * The original values are restored afterwards.
 */
static void
chiron_write_test(void)
{
	const uint64_t phy = 0xC012000ULL;
	uint8_t b_before, b_after, p_before, p_after;
	uint32_t w_before, w_after;

	b_before = *(volatile uint8_t *)(uintptr_t)(phy + 0x90);
	*(volatile uint8_t *)(uintptr_t)(phy + 0x90) = 0x5a;
	__asm__ volatile ("dsb sy" ::: "memory");
	b_after = *(volatile uint8_t *)(uintptr_t)(phy + 0x90);
	*(volatile uint8_t *)(uintptr_t)(phy + 0x90) = b_before;

	w_before = *(volatile uint32_t *)(uintptr_t)(phy + 0x90);
	*(volatile uint32_t *)(uintptr_t)(phy + 0x90) = 0x5a5a5a5a;
	__asm__ volatile ("dsb sy" ::: "memory");
	w_after = *(volatile uint32_t *)(uintptr_t)(phy + 0x90);
	*(volatile uint32_t *)(uintptr_t)(phy + 0x90) = w_before;

	p_before = *(volatile uint8_t *)(uintptr_t)(phy + 0x04);
	*(volatile uint8_t *)(uintptr_t)(phy + 0x04) = 0x5a;
	__asm__ volatile ("dsb sy" ::: "memory");
	p_after = *(volatile uint8_t *)(uintptr_t)(phy + 0x04);
	*(volatile uint8_t *)(uintptr_t)(phy + 0x04) = p_before;

	print("wtest: b90 ", 0);
	print("%x", (uint64_t)b_before);
	print("->", 0);
	print("%x", (uint64_t)b_after);
	print(" w90 ", 0);
	print("%x", (uint64_t)w_before);
	print("->", 0);
	print("%x", (uint64_t)w_after);
	print(" b04 ", 0);
	print("%x", (uint64_t)p_before);
	print("->", 0);
	print("%x", (uint64_t)p_after);
	print("\n", 0);
}
static void
chiron_port_powerdown(void)
{
	const uint64_t phy = 0xC012000ULL;
	uint8_t b4_before = *(volatile uint8_t *)(uintptr_t)(phy + 0xB4);
	uint8_t c0_before = *(volatile uint8_t *)(uintptr_t)(phy + 0xC0);
	uint8_t c4_before = *(volatile uint8_t *)(uintptr_t)(phy + 0xC4);
	uint8_t st_f0, st_f4;

	/* power down, clamp asserted, IO frozen */
	*(volatile uint8_t *)(uintptr_t)(phy + 0xB4) = 0x23;
	__asm__ volatile ("dsb sy" ::: "memory");

	/* PLL auto-programming: enable | reset_n | reset count 5 */
	*(volatile uint8_t *)(uintptr_t)(phy + 0x1C) = 0x00;
	__asm__ volatile ("dsb sy" ::: "memory");

	/*
	 * CHIRON_UTMI_UNTOUCHED
	 *
	 * UTMI_CTRL1 (0xC0) and UTMI_CTRL2 (0xC4) are left alone.  Working hardware
	 * reads 0x00 in both: the controller drives these across the UTMI interface and
	 * the firmware never writes them.  Setting TERM_SELECT / XCVR_SELECT_FS /
	 * UTMI_ULPI_SEL by hand overrides the controller's own selection.
	 */

	/*
	 * Leave 0xB4 alone: the msm8998-v2 device tree sets digital_timers_two to
	 * 0x19 and that is what the entry snapshot shows the firmware had written.
	 * Writing 0x22 here, as the v1 driver's return-to-normal path does, was
	 * undoing the correct value.
	 */
	__asm__ volatile ("dsb sy" ::: "memory");
	chiron_udelay(3000);

	st_f0 = *(volatile uint8_t *)(uintptr_t)(phy + 0xF0);
	st_f4 = *(volatile uint8_t *)(uintptr_t)(phy + 0xF4);

	print("port: b4 ", 0);
	print("%x", (uint64_t)b4_before);
	print("->", 0);
	print("%x", (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0xB4));
	print(" c0 ", 0);
	print("%x", (uint64_t)c0_before);
	print("->", 0);
	print("%x", (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0xC0));
	print(" c4 ", 0);
	print("%x", (uint64_t)c4_before);
	print("->", 0);
	print("%x", (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0xC4));
	print("\n", 0);
	print("port: status f0 ", 0);
	print("%x", (uint64_t)st_f0);
	print(" f4 ", 0);
	print("%x", (uint64_t)st_f4);
	print("\n", 0);
}


/*
 * CHIRON_USBFN_EP
 *
 * Configure the endpoints through the vendor USB Function IO protocol that HK6
 * installs -- the entry the upper Qualcomm protocol normally uses underneath.
 *
 *   ConfigureEnableEndpoints(DeviceInfo): device descriptor plus the endpoint
 *     chain the interface declares
 *   start_controller(): bring the controller up in the configured mode
 *
 * Until HK6 existed there was no UsbFnIo here, so this path had never been tried.
 */
static int
chiron_usbfn_endpoints(void)
{
	static const efi_guid usbfn_guid = QCOM_USBFN_IO_GUID;
	efi_usbfn_io *fn = NULL;
	static efi_usb_device_descriptor dev_desc;
	static efi_usb_config_descriptor cfg_desc;
	static efi_usb_interface_descriptor if_desc;
	static efi_usb_endpoint_descriptor ep_in, ep_out;
	static efi_usb_endpoint_descriptor *ep_table[3];
	static efi_usb_interface_info if_info;
	static efi_usb_interface_info *if_table[2];
	static efi_usb_config_info cfg_info;
	static efi_usb_config_info *cfg_table[2];
	static efi_usb_device_info dev_info;
	efi_status se, ss;

	if (EFI_ERROR(BS->locate_protocol(&usbfn_guid, NULL, (void **)&fn)) || fn == NULL) {
		print("usbfn: protocol absent\n");
		return 0;
	}

	memcpy(&dev_desc, usb_dev_desc, sizeof(dev_desc));

	cfg_desc.length = 9;
	cfg_desc.descriptor_type = 2;
	cfg_desc.total_length = 9 + 9 + 7 + 7;
	cfg_desc.num_interfaces = 1;
	cfg_desc.configuration_value = 1;
	cfg_desc.attributes = 0x80;
	cfg_desc.max_power = 0x50;

	if_desc.length = 9;
	if_desc.descriptor_type = 4;
	if_desc.num_endpoints = 2;
	if_desc.interface_class = 0xff;
	if_desc.interface_sub_class = 0x42;
	if_desc.interface_protocol = 0x03;

	ep_in.length = 7;
	ep_in.descriptor_type = 5;
	ep_in.endpoint_address = USB_EP_IN;
	ep_in.attributes = 2;
	ep_in.max_packet_size = 512;

	ep_out.length = 7;
	ep_out.descriptor_type = 5;
	ep_out.endpoint_address = USB_EP_OUT;
	ep_out.attributes = 2;
	ep_out.max_packet_size = 512;

	ep_table[0] = &ep_in;
	ep_table[1] = &ep_out;
	ep_table[2] = NULL;
	if_info.interface_descriptor = &if_desc;
	if_info.endpoint_descriptor_table = ep_table;
	if_table[0] = &if_info;
	if_table[1] = NULL;
	cfg_info.config_descriptor = &cfg_desc;
	cfg_info.interface_info_table = if_table;
	cfg_table[0] = &cfg_info;
	cfg_table[1] = NULL;
	dev_info.device_descriptor = &dev_desc;
	dev_info.config_info_table = cfg_table;

	/*
	 * CHIRON_USBFN_ORDER
	 *
	 * StartController first: "Initializes the hardware and internal data
	 * structures, but must not activate the port."  ConfigureEnableEndpoints
	 * second: "Enable the device by setting the run/stop bit."
	 *
	 * This function had them the other way round, so the port was told to activate
	 * before the controller owning it had been initialised, and was then "started"
	 * afterwards -- both returning success, nothing appearing on the wire.
	 */
	if (fn->start_controller != NULL) {
		ss = fn->start_controller(fn);
		print("usbfn: start_controller ", 0);
		print("%x", (uint64_t)ss);
		print("\n", 0);
	} else {
		print("usbfn: no start_controller\n");
	}

	if (fn->configure_enable_endpoints == NULL) {
		print("usbfn: no ConfigureEnableEndpoints\n");
		return 0;
	}
	/* revision first: UsbfnDwc3Dxe checks endpoint state, so say which ABI we speak */
	print("usbfn: revision ", 0);
	print("%x", (uint64_t)fn->revision);
	print("\n", 0);
	se = fn->configure_enable_endpoints(fn, &dev_info);
	print("usbfn: ConfigureEnableEndpoints ", 0);
	print("%x", (uint64_t)se);
	print("\n", 0);

	return !EFI_ERROR(se);
}

/*
 * CHIRON_FW_VBUS
 *
 * Ask the firmware to enable VBUS through its own USB Config callback instead of
 * faking the controller-internal signal.  UsbConfigDxe asserts both callbacks are
 * present and uses them to talk to the PMIC, so this is the only VBUS path the
 * loader can reach without an SPMI driver of its own.
 *
 * Returns 1 if the firmware afterwards reports VBUS present.
 */
static int
chiron_fw_vbus(efi_qcom_usb_config *cfg)
{
	uint8_t before = 0xff, after = 0xff;
	efi_status s_get, s_en, s_after;

	if (cfg == NULL || cfg->get_vbus_status == NULL || cfg->enable_vbus == NULL) {
		print("fwvbus: callbacks missing\n");
		return 0;
	}

	s_get = cfg->get_vbus_status(cfg, &before);
	s_en = cfg->enable_vbus(cfg, 1);
	s_after = cfg->get_vbus_status(cfg, &after);

	print("fwvbus: get ", 0);
	print("%x", (uint64_t)s_get);
	print(" val ", 0);
	print("%x", (uint64_t)before);
	print(" enable ", 0);
	print("%x", (uint64_t)s_en);
	print(" then get ", 0);
	print("%x", (uint64_t)s_after);
	print(" val ", 0);
	print("%x", (uint64_t)after);
	print("\n", 0);

	return !EFI_ERROR(s_after) && after != 0;
}

/*
 * CHIRON_VBUS_OVERRIDE
 *
 * Convince the controller that VBUS is present.  DWC3 will not start a session,
 * and therefore will not report CONNSTAT, until it believes there is bus power;
 * on chiron that belief normally arrives from the PMIC through extcon, which this
 * firmware never brings up.
 *
 * Mainline solves it the same way (dwc3-msm.c, dwc3_override_vbus_status):
 *
 *   HS_PHY_CTRL_REG = QSCRATCH_REG_OFFSET + 0x10 = 0xF8810
 *   UTMI_OTG_VBUS_VALID = BIT(20)   VBUS is valid
 *   SW_SESSVLD_SEL      = BIT(28)   let software drive the session-valid input
 *
 * Both bits are set, so the controller's session-valid input comes from here
 * rather than from a PMIC line that reads zero.
 */
static void
chiron_vbus_override(void)
{
	const uint64_t ctrl = 0xA800000ULL + 0xF8810ULL;      /* HS_PHY_CTRL_REG */
	uint32_t before = *(volatile uint32_t *)(uintptr_t)ctrl;
	uint32_t value = before | (1u << 20) | (1u << 28);

	*(volatile uint32_t *)(uintptr_t)ctrl = value;
	__asm__ volatile ("dsb sy" ::: "memory");

	print("vbus: hs_phy_ctrl ", 0);
	print("%x", (uint64_t)before);
	print(" -> ", 0);
	print("%x", (uint64_t)*(volatile uint32_t *)(uintptr_t)ctrl);
	print("\n", 0);
}

/*
 * CHIRON_DWC3_LATE_RUN
 *
 * UsbConfigDxe handles the USB init event by resetting the controller, and then
 * leaves DCTL.RunStop at 0 -- the snapshots show DCTL=0x00f00000 from just before
 * start_ex all the way into the command loop.  In the stock firmware UsbInitDxe
 * starts it again; that module cannot run in this build, so this loader does it,
 * after start_ex, and clears the auto-suspend bits the way dwc3-msm.c does.
 */
/* CHIRON_DWC3_SNAP: the controller's state at a named point. */
static void
chiron_dwc3_snap(const char *where)
{
	const uint64_t dwc = 0xA800000ULL;
	const uint64_t phy = 0xC012000ULL;
	uint32_t gctl = *(volatile uint32_t *)(uintptr_t)(dwc + 0xC110);
	uint32_t dctl = *(volatile uint32_t *)(uintptr_t)(dwc + 0xC704);
	uint32_t dsts = *(volatile uint32_t *)(uintptr_t)(dwc + 0xC70C);
	uint32_t dcfg = *(volatile uint32_t *)(uintptr_t)(dwc + 0xC700);
	uint8_t  pll  = *(volatile uint8_t *)(uintptr_t)(phy + 0x1A0);
	uint8_t  pwrc = *(volatile uint8_t *)(uintptr_t)(phy + 0x210);
	uint8_t  istat = *(volatile uint8_t *)(uintptr_t)(phy + 0x230);

	print("snap ", 0);
	print((char *)where, 0);
	print(" cap %x run %x hlt %x lkst %x spd %x | pll %x pw%x ln %x\n",
	    (uint64_t)((gctl >> 12) & 3),
	    (uint64_t)((dctl >> 31) & 1),
	    (uint64_t)((dsts >> 22) & 1),
	    (uint64_t)((dsts >> 18) & 0xf),
	    (uint64_t)(dcfg & 7),
	    (uint64_t)pll, (uint64_t)pwrc, (uint64_t)istat);

	/*
	 * CHIRON_DEVADDR
	 *
	 * DCFG bits 9:3 hold the address the host assigned.  Anything other than zero
	 * proves the host reached SET_ADDRESS, i.e. enumeration actually started.
	 * Zero after the core has been running means no enumeration traffic has ever
	 * arrived, whatever the link state says.
	 */
	print("addr ", 0);
	print((char *)where, 0);
	print(": devaddr ", 0);
	print("%x", (uint64_t)((dcfg >> 3) & 0x7f));
	print(" lpmcap ", 0);
	print("%x", (uint64_t)((dcfg >> 22) & 1));
	print("\n", 0);
}

/*
 * CHIRON_DWC3_RUN: start the core before HK6 has had its say.  Only used when the
 * HK6 handshake is not in play; HK6 leaves the core halted and the late run below
 * is what starts it in that case.
 */
static void
chiron_dwc3_run(void)
{
	const uint64_t dwc = 0xA800000ULL;
	uint32_t dctl, dsts;

	dctl = *(volatile uint32_t *)(uintptr_t)(dwc + 0xC704);
	dctl &= ~(1u << 30);
	dctl |= (1u << 31);
	*(volatile uint32_t *)(uintptr_t)(dwc + 0xC704) = dctl;
	chiron_udelay(2000);

	dctl = *(volatile uint32_t *)(uintptr_t)(dwc + 0xC704);
	dsts = *(volatile uint32_t *)(uintptr_t)(dwc + 0xC70C);
	print("dwc3: DCTL %x run %x | DSTS %x conn %x lkst %x\n",
	    (uint64_t)dctl, (uint64_t)((dctl >> 31) & 1), (uint64_t)dsts,
	    (uint64_t)((dsts >> 24) & 1), (uint64_t)((dsts >> 18) & 0xf));
}

/*
 * CHIRON_RUNSTOP_IS_REQUIRED
 *
 * This is not a workaround, it is the step the vendor stack leaves out.
 *
 * Measured, from the last full run:
 *
 *   snap A-before-start_ex  run 0 hlt 1    after HK6's StartController
 *   snap B-after-start_ex   run 0 hlt 1    after ConfigureEnableEndpoints + start_ex
 *   late                    run 1 hlt 0    only after this function wrote RunStop
 *
 * ConfigureEnableEndpoints and start_ex both returned EFI_SUCCESS and the core stayed
 * halted.  A halted controller fetches nothing, so the GET_DESCRIPTOR setup packet is
 * never collected and SET_ADDRESS never happens -- DEVADDR stays zero, which is the
 * symptom this port has been chasing.
 *
 * Write RunStop, then read DSTS back and say whether the core actually came up.  If
 * DCTL.RunStop does not stick, or DSTS.DEVCTRLHLT stays set, that is worth knowing
 * explicitly rather than inferring from silence.
 */
static void
chiron_dwc3_late_run(void)
{
	const uint64_t dwc = 0xA800000ULL;
	uint32_t gusb2, dctl, dsts;
	unsigned tries;

	gusb2 = *(volatile uint32_t *)(uintptr_t)(dwc + 0xC200);
	gusb2 &= ~((1u << 8) | (1u << 6));      /* ENBLSLPM | SUSPHY */
	*(volatile uint32_t *)(uintptr_t)(dwc + 0xC200) = gusb2;

	for (tries = 0; tries < 10; tries++) {
		dctl = *(volatile uint32_t *)(uintptr_t)(dwc + 0xC704);
		dctl &= ~(1u << 30);
		dctl |= (1u << 31);                 /* RunStop */
		*(volatile uint32_t *)(uintptr_t)(dwc + 0xC704) = dctl;
		__asm__ volatile ("dsb sy" ::: "memory");
		chiron_udelay(2000);

		dsts = *(volatile uint32_t *)(uintptr_t)(dwc + 0xC70C);
		if ((dsts & (1u << 22)) == 0) {     /* DEVCTRLHLT clear = not halted */
			break;
		}
	}

	/* one ULStChngReq to nudge the link, then report */
	dctl = *(volatile uint32_t *)(uintptr_t)(dwc + 0xC704);
	dctl &= ~(0x0fu << 5);
	dctl |= (2u << 5);                      /* U2 */
	*(volatile uint32_t *)(uintptr_t)(dwc + 0xC704) = dctl;
	chiron_udelay(5000);

	dctl = *(volatile uint32_t *)(uintptr_t)(dwc + 0xC704);
	dctl &= ~(0x0fu << 5);
	*(volatile uint32_t *)(uintptr_t)(dwc + 0xC704) = dctl;

	/* leave 0xB4 as the working hardware has it */
	*(volatile uint8_t *)(uintptr_t)(0xC012000ULL + 0xB4) = 0x19;
	__asm__ volatile ("dsb sy" ::: "memory");

	dctl = *(volatile uint32_t *)(uintptr_t)(dwc + 0xC704);
	dsts = *(volatile uint32_t *)(uintptr_t)(dwc + 0xC70C);
	print("late: DCTL %x run %x hlt %x lkst %x spd %x tries %x addr %x\n",
	    (uint64_t)dctl, (uint64_t)((dctl >> 31) & 1),
	    (uint64_t)((dsts >> 22) & 1), (uint64_t)((dsts >> 18) & 0xf),
	    (uint64_t)(dsts & 7), (uint64_t)tries,
	    (uint64_t)((*(volatile uint32_t *)(uintptr_t)(dwc + 0xC700) >> 3) & 0x7f));
}

static int
usb_start(void)
{
	static const efi_guid usb_guid = QCOM_USB_DEVICE_GUID;
	static const efi_guid init_guid = QCOM_USB_INIT_EVENT_GUID;
	static const void *cfg = usb_cfg_desc, *ss_cfg = usb_ss_cfg_desc;
	static const void *strings[5] = { usb_str0, usb_str_mfr, usb_str_prod, usb_str_serial, usb_str_iface };
	static usb_device_descriptor_set set;
	void *event;

	/*
	 * CHIRON_CHARGER_FOR_USB
	 *
	 * UsbConfigDxe asks the PMIC and the charger port whether anything is plugged
	 * in and never announces a connection without an answer, so the controller
	 * starts and then waits for a host that was never told to look.  charger_start()
	 * opens those protocols; it used to run only for battery=1, and the earlier
	 * decision point runs before the payload entries are parsed, so do it here --
	 * the one place that is certainly a USB session.
	 */
	/*
	 * CHIRON_SNAP_ENTRY
	 *
	 * Measured first, before signal_event() and before any write of our own: this
	 * is what the firmware's own USB stack left behind -- the one fastboot was
	 * using successfully moments ago.
	 */
	chiron_dwc3_snap("0-ENTRY");
	chiron_phy_entry_snap("ENTRY");
	chiron_env_snap("ENTRY");

	charger_start();

	/*
	 * CHIRON_USB_NATIVE: usb_native=1 skips the manual PHY/DWC3 work so the
	 * firmware's own drivers (UsbInitDxe + UsbConfigDxe) can be tested alone.
	 */
	/*
	 * CHIRON_USB_HK6 selection
	 *
	 * usb_native=1  only the HK6 handshake
	 * usb_manual=1  only the manual PHY/DWC3 register work
	 * default       HK6 first, then the manual work if it did not help
	 */
	usb_native_mode = 0;
	usb_manual_mode = 0;
	usb_pure_mode = 0;
	usb_restore_mode = 0;
	usb_probe_mode = 0;
	usb_sweep_mode = 0;
	usb_hk6_only_mode = 0;
	usb_diag_mode = 0;
	{
		struct payload_info npi;

		if (parse_payload(&npi, 0) && npi.cmdline != NULL) {
			for (const char *c = npi.cmdline; *c; c++) {
				/* both names are 12 characters: terminator is c[12] */
				if (starts_with(c, "usb_native=1") &&
				    (c[12] == 0 || c[12] == ' ')) {
					usb_native_mode = 1;
				}
				if (starts_with(c, "usb_manual=1") &&
				    (c[12] == 0 || c[12] == ' ')) {
					usb_manual_mode = 1;
				}
				/* "usb_pure=1" is 10 characters */
				if (starts_with(c, "usb_pure=1") &&
				    (c[10] == 0 || c[10] == ' ')) {
					usb_pure_mode = 1;
				}
				/* "usb_restore=1" is 13 characters */
				if (starts_with(c, "usb_restore=1") &&
				    (c[13] == 0 || c[13] == ' ')) {
					usb_restore_mode = 1;
				}
				/* "usb_probe=1" is 11 characters */
				if (starts_with(c, "usb_probe=1") &&
				    (c[11] == 0 || c[11] == ' ')) {
					usb_probe_mode = 1;
				}
				/* "usb_sweep=1" is 11 characters */
				if (starts_with(c, "usb_sweep=1") &&
				    (c[11] == 0 || c[11] == ' ')) {
					usb_sweep_mode = 1;
				}
				/* "usb_hk6_only=1" is 15 characters */
				if (starts_with(c, "usb_hk6_only=1") &&
				    (c[15] == 0 || c[15] == ' ')) {
					usb_hk6_only_mode = 1;
				}
				/* "usb_diag=1" is 10 characters */
				if (starts_with(c, "usb_diag=1") &&
				    (c[10] == 0 || c[10] == ' ')) {
					usb_diag_mode = 1;
				}
			}
		}
	}
	/* CHIRON_PROBE_ENTRY: usb_probe=1 asks the transport before any write. */
	if (usb_probe_mode) {
	chiron_probe_entry();
	flush_log();
	}

	print("usb: native ", 0);
	print("%x", (uint64_t)usb_native_mode);
	print(" manual ", 0);
	print("%x", (uint64_t)usb_manual_mode);
	print(" pure ", 0);
	print("%x", (uint64_t)usb_pure_mode);
	print("\n", 0);

	/*
	 * Run the HK6 handshake first.  ios-party's disassembly of the vendor
	 * UsbConfigDxe shows a private static-mode policy that makes a peripheral
	 * request answer success while the core stays in host mode, skipping the
	 * peripheral ConnectController; this handshake is what actually assembles a
	 * peripheral controller.
	 */
	/*
	 * CHIRON_POWER_FIRST
	 *
	 * Clocks, power domain, block resets and the PHY all have to be up before
	 * any driver is asked to start the controller.  HK6 used to run first, on a
	 * block with no clocks, no power and held in reset -- which ignores its
	 * register writes, so StartController answered success and nothing happened.
	 */
	if (!usb_pure_mode) {
		chiron_clocks_on();
		chiron_gdsc_on();
		chiron_gcc_bcr();
		/*
		 * CHIRON_DIAG_OFF_PATH
		 *
		 * The register map and the write-path test both poke scratch registers, and
		 * both now run between releasing the block resets and programming the PHY --
		 * disturbing analogue settings in a block that has only just come out of
		 * reset, for information already gathered.  Off unless asked for.
		 */
		if (usb_diag_mode) {
			chiron_phy_map();
			chiron_write_test();
		}
		chiron_qusb2_init();
	}

	if (!usb_manual_mode) {
		chiron_count_protos("pre-hk6");
		if (chiron_usb_hk6()) {
			print("usb: HK6 gave us UsbFnIo\n");
			chiron_usbfn_endpoints();
			chiron_count_protos("post-hk6");
		} else {
			print("usb: HK6 did not reach UsbFnIo\n");
		}

		/*
		 * CHIRON_FW_VBUS_CALL
		 *
		 * HK6 has the USB Config protocol in place.  Use the firmware's own VBUS
		 * callback on the peripheral controller it created: UsbConfigDxe routes
		 * that to the PMIC, which is the only supply path this loader can reach.
		 */
		{
			efi_handle *cfgs = NULL;
			uint64_t n = 0;

			if (!EFI_ERROR(BS->locate_handle_buffer(ByProtocol, &QCOM_USB_CONFIG_GUID,
			    NULL, &n, &cfgs))) {
				for (uint64_t i = 0; i < n; i++) {
					efi_qcom_usb_config *c = NULL;

					if (EFI_ERROR(BS->handle_protocol(cfgs[i],
					    &QCOM_USB_CONFIG_GUID, (void **)&c)) || c == NULL) {
						continue;
					}
					/* prefer the peripheral-mode table */
					if (c->mode_type == UsbModePeripheralAlt ||
					    c->mode_type == UsbModePeripheral) {
						chiron_fw_vbus(c);
						break;
					}
				}
				BS->free_pool(cfgs);
			}
		}
		flush_log();
	}

	chiron_depex_check();
	chiron_usb_probe_protos("pre");
	print("usb: native mode ", 0);
	print("%x", (uint64_t)usb_native_mode);
	print("\n", 0);
	/*
	 * The PHY must be programmed in every mode: HK6 drives the vendor stack,
	 * but the block still needs its clocks, power domain and init sequence
	 * before it can carry a signal.  chiron_dwc3_run() is only useful when HK6
	 * did not run, so it stays conditional.
	 */
	if (!usb_native_mode || usb_manual_mode) {
		chiron_dwc3_run();
	}
	flush_log();
	/* Ask the platform to bring the controller up in peripheral mode (as the stock fastboot does). */
	if (!EFI_ERROR(BS->create_event_ex(0x200 /* EVT_NOTIFY_SIGNAL */, 8 /* TPL_CALLBACK */, usb_dummy_notify, NULL,
	    &init_guid, &event))) {
		BS->signal_event(event);
		BS->close_event(event);
	}
	chiron_usb_probe_protos("postsignal");
	/*
	 * CHIRON_PICK_USB_DEVICE: take the peripheral controller's protocol.  A plain
	 * locate_protocol returns whichever handle comes first, which on a dual-role
	 * controller can be the host one; installing device descriptors there reports
	 * success and does nothing.
	 */
	USB = chiron_pick_usb_device();
	if (USB == NULL) {
		if (EFI_ERROR(BS->locate_protocol(&usb_guid, NULL, (void **)&USB))) {
			print("usb: device protocol not found\n");
			return 0;
		}
	}
	/*
	 * CHIRON_USB2_ONLY
	 *
	 * chiron is micro-USB with a USB2-only QUSB2 phy.  Advertise only what the
	 * hardware is: bcdUSB 0x0200, no BOS, no SuperSpeed descriptors, no LPM.
	 *
	 * Leaving usb_bos attached while bcdUSB reads 0x0200 makes the device
	 * self-contradictory -- a BOS descriptor requires 2.1 or later -- and a host
	 * that validates the set will refuse to configure it, which presents as "no
	 * enumeration" even though the link comes up fine.
	 */
	set.device_descriptor = usb_dev_desc;
	set.descriptors = &cfg;
	set.ss_device_descriptor = NULL;
	set.ss_descriptors = NULL;
	set.device_qualifier = usb_qualifier;
	set.bos = NULL;
	set.string_count = 5;
	set.strings = strings;
	/* ios-party: say what the revision is and refuse a half-built interface, rather
	 * than calling through a null pointer later. */
	print("usb: Qualcomm protocol revision %x\n", (uint64_t)USB->revision);
	if (USB->start_ex == NULL || USB->send == NULL || USB->handle_event == NULL ||
	    USB->allocate_transfer_buffer == NULL || USB->free_transfer_buffer == NULL) {
		print("usb: incomplete Qualcomm USB interface\n");
		return 0;
	}
	chiron_dwc3_snap("A-before-start_ex");
	/*
	 * CHIRON_SKIP_START_EX
	 *
	 * HK6 already started this controller, and chiron_usbfn_endpoints() configured
	 * it through UsbFnIo.  Calling start_ex on top of that asks the same driver to
	 * start again; it answers success and does nothing, which looks exactly like a
	 * working start.  usb_hk6_only=1 leaves start_ex out entirely so the two can be
	 * told apart.
	 */
	efi_status s = 0;   /* EFI_SUCCESS */

	if (!usb_hk6_only_mode) {
		s = USB->start_ex(&set);
	} else {
		print("usb: start_ex skipped (usb_hk6_only)\n");
		chiron_fn_events("after-hk6");
	}
	chiron_dwc3_snap("B-after-start_ex");
	chiron_usb_probe_protos("poststart");
	/*
	 * CHIRON_USB_FINISH
	 *
	 * HK6 assembles the protocol stack and leaves the core halted (run 0,
	 * hlt 1), so these four steps are still needed afterwards regardless of
	 * mode: advertise HighSpeed, stay in device mode, wake the PHY's link and
	 * line detectors, and finally run the core so D+ is driven.
	 */
	if (usb_pure_mode) {
		/*
		 * Even this mode has to start the core: the vendor path leaves RunStop
		 * clear, and a halted core fetches nothing.  Skipping it here would make a
		 * "clean" run that never had a chance of enumerating.
		 */
		chiron_vbus_override();
		chiron_dwc3_late_run();
	} else {
		chiron_dwc3_highspeed();
		chiron_dwc3_device_mode();
		chiron_qusb2_resume();
		chiron_vbus_override();
		chiron_qusb2_reassert();
		chiron_port_powerdown();
		/*
		 * CHIRON_START_THEN_REPORT
		 *
		 * The line-level probe used to run just before this, while the core was
		 * still halted.  It reads INTR_STAT, which is not meaningful on this part,
		 * and writes 0x22C, which working hardware leaves at zero.  Start the core
		 * first -- that is the step that makes enumeration possible -- and keep the
		 * probe behind usb_diag=1.
		 */
		chiron_dwc3_late_run();
		if (usb_diag_mode) {
			chiron_qusb2_report_levels();
		}
	}
	chiron_event_arm();
	chiron_event_probe("armed");

	/*
	 * CHIRON_PUMP_IN_USB_START
	 *
	 * The core is running and D+ is up.  The host will reset us and ask for the
	 * device descriptor within milliseconds, so the class driver has to be serviced
	 * from right here -- not after this function returns, where flush_log() does a
	 * storage write and read-back first, and not after usb_command_loop() has printed
	 * its banner.  A host that times out on the descriptor does not ask again.
	 *
	 * Pump for a short window and report how many times the driver was serviced and
	 * whether a state change arrived, so the log shows whether anything was caught.
	 */
	{
		uint64_t freq = READ_SYSREG(CNTFRQ_EL0), began = READ_SYSREG(CNTVCT_EL0);
		unsigned pumped = 0, changes = 0;
		uint32_t last_msg = 0;

		/*
		 * CHIRON_BUDGET_BEFORE_CALL
		 *
		 * The time check has to come BEFORE handle_event, not after.  The call does
		 * not return when the controller is up and nothing is pending, so a check
		 * that follows it is never reached -- that is precisely how the phone was
		 * lost earlier in this session, and this loop had the same shape.
		 */
		while (pumped < 200000) {
			uint32_t m = UsbDeviceEventNoEvent;
			uint64_t sz = 0;
			usb_device_event_data d;
			uint64_t now = READ_SYSREG(CNTVCT_EL0);

			if (now - began > freq / 4) {           /* 250 ms */
				break;
			}

			memset(&d, 0, sizeof(d));
			USB->handle_event(&m, &sz, &d);
			pumped++;

			if (m != UsbDeviceEventNoEvent) {
				last_msg = m;
			}
			if (m == UsbDeviceEventDeviceStateChange) {
				changes++;
				usb_connected = (d.device_state == UsbDeviceStateConnected);
			}
			if (pumped == 1 || (pumped % 50000) == 0) {
				wdt_pet();                      /* keep the reset path alive */
			}
		}
		print("usb: pre-loop pumped %d changes %d last %x connected %d\n",
		    (uint64_t)pumped, (uint64_t)changes, (uint64_t)last_msg,
		    (uint64_t)(usb_connected != 0));
		flush_log();
	}
	if (EFI_ERROR(s)) {
		print("usb: start failed %x\n", s);
		return 0;
	}
	/*
	 * CHIRON_USB_PRESENTED
	 *
	 * StartEx succeeding means the firmware has been told to present the device.
	 * Say it: "started but blind" and "presented but blind" point at different
	 * faults, and until now the log could not tell them apart.
	 */
	print("usb: device presented (start_ex ok); waiting for the host\n");
	if (EFI_ERROR(USB->allocate_transfer_buffer(USB_CHUNK, (void **)&usb_rx_buf)) ||
	    EFI_ERROR(USB->allocate_transfer_buffer(USB_CHUNK, (void **)&usb_tx_buf))) {
		print("usb: no transfer buffers\n");
		return 0;
	}
	print("usb: started\n");
	return 1;
}

/*
 * Pump controller events until a transfer on `endpoint` finishes.
 * Returns the byte count, or -1 if the transfer was cancelled or the cable
 * state changed. Keeps the watchdog fed while idle.
 */
static int64_t
usb_wait(uint8_t endpoint)
{
	/* static: a long transfer is many short waits, and the watchdog must be fed across them */
	static uint64_t last_pet;
	uint64_t freq = READ_SYSREG(CNTFRQ_EL0), began = READ_SYSREG(CNTVCT_EL0);
	/*
	 * CHIRON_USB_WAIT_BOUNDED
	 *
	 * handle_event() may not return at all when the controller is up and no host
	 * ever attaches.  Poll a bounded number of times so the caller gets control
	 * back and can act on its own deadline; without this the phone hangs with no
	 * way out short of holding the power key.
	 */
	unsigned polls = 0;
	const unsigned poll_limit = 20000;      /* CHIRON_USB_PRE_POLL: cheap polls, then give up */

	for (;;) {
		uint32_t msg = UsbDeviceEventNoEvent;
		uint64_t size = 0;
		usb_device_event_data data;

		/*
		 * CHIRON_USB_PRE_POLL
		 *
		 * Check the budget BEFORE calling in, because handle_event() is the call
		 * that does not return when no host is attached: a counter incremented
		 * after it can never be reached.  Two limits, whichever comes first:
		 * the wall clock (3 s) and a hard pass count.
		 */
		if (++polls > poll_limit) {
			/*
			 * CHIRON_POLL_EXHAUSTED
			 *
			 * Say it once.  Nothing so far has distinguished "the host never
			 * attached" from "event service stopped before the host got going",
			 * and this is the only place that can tell them apart.
			 */
			static int said_exhausted;

			if (!said_exhausted) {
				uint32_t devten = *(volatile uint32_t *)(uintptr_t)(0xA800000ULL + 0xC708);
				uint32_t pending = *(volatile uint32_t *)(uintptr_t)(0xA800000ULL + 0xC40C);

				said_exhausted = 1;
				print("poll: budget spent connected=%d devten=%x pending=%x\n",
				    (uint64_t)(usb_connected != 0),
				    (uint64_t)devten, (uint64_t)(pending & 0xfffc));
				flush_log();
			}
			return -1;
		}
		USB->handle_event(&msg, &size, &data);
		if (msg == UsbDeviceEventDeviceStateChange) {
			usb_connected = (data.device_state == UsbDeviceStateConnected);
			return -1;
		}
		/*
		 * CHIRON_USB_WAIT_TIMEOUT
		 *
		 * This used to give up only when running_live != NULL.  In USB mode there
		 * is no kernel, so waiting for a cable state change spun for ever and the
		 * idle deadline in usb_command_loop() was never reached -- which is why a
		 * session with no host never reset the phone.  Always bound the wait.
		 */
		if (READ_SYSREG(CNTVCT_EL0) - began > 3 * freq) {
			return -1;
		}
		if (msg == UsbDeviceEventTransferNotification && data.transfer.endpoint_index == endpoint) {
			return data.transfer.status == UsbDeviceTransferStatusCompleteOK ? (int64_t)data.transfer.bytes_completed : -1;
		}
		if (READ_SYSREG(CNTVCT_EL0) - last_pet > freq) {
			last_pet = READ_SYSREG(CNTVCT_EL0);
			wdt_pet();
		}
	}
}

static int usb_rx_queued;       /* usb_poll_command() has left the receive for the next command with the controller */

static int64_t
usb_rx(uint8_t *buf, uint64_t len)
{
	if (usb_rx_queued) {
		usb_rx_queued = 0;      /* (every command is received the same way, into the same buffer) */
	} else if (EFI_ERROR(USB->send(USB_EP_OUT, len, buf))) {
		return -1;
	}
	return usb_wait(USB_EP_OUT);
}

static int64_t
usb_tx(const uint8_t *data, uint64_t len)
{
	if (data != usb_tx_buf) {
		memcpy(usb_tx_buf, data, len);
	}
	if (EFI_ERROR(USB->send(USB_EP_IN, len, usb_tx_buf))) {
		return -1;
	}
	return usb_wait(USB_EP_IN);
}

static void
fb_reply(const char *code, const char *text)
{
	uint32_t n = 0;
	for (; *code; code++) {
		usb_tx_buf[n++] = (uint8_t)*code;
	}
	for (; *text && n < 63; text++) {
		usb_tx_buf[n++] = (uint8_t)*text;
	}
	usb_tx(usb_tx_buf, n);
}

static void
fb_reply_data(uint64_t len)
{
	char msg[13] = "DATA00000000";
	for (int i = 0; i < 8; i++) {
		msg[4 + i] = "0123456789abcdef"[(len >> (28 - 4 * i)) & 0xf];
	}
	usb_tx((const uint8_t *)msg, 12);
}

static int
starts_with(const char *s, const char *prefix)
{
	while (*prefix) {
		if (*s++ != *prefix++) {
			return 0;
		}
	}
	return 1;
}

/*
 * One command from the host. While a kernel runs on another core (running_live) only what does
 * not disturb it: questions, the screen, the log so far, and "oem stop".
 */
static void
fb_command(char *cmd)
{
	int busy = running_live != NULL;

	{
		if (busy && (starts_with(cmd, "oem ramdisk") || starts_with(cmd, "download:") || starts_with(cmd, "oem run") ||
		    starts_with(cmd, "oem selftest") || starts_with(cmd, "oem hang") || starts_with(cmd, "oem recording") ||
		    starts_with(cmd, "oem sound") || starts_with(cmd, "oem clearscreen") || starts_with(cmd, "oem memmap"))) {
			fb_reply("FAIL", "a kernel is running (oem stop ends it)");
		} else if (starts_with(cmd, "oem stop")) {
			/* the kernel looks at this once a second and comes back as it does when its time is up */
			if (busy) {
				((struct kernel_live *)(uintptr_t)running_live)->stop = 1;
			}
			fb_reply("OKAY", "");
		} else if (starts_with(cmd, "getvar:")) {
			const char *var = cmd + 7;
			if (str_eq(var, "board")) {
				fb_reply("OKAY", PLAT->name);
			} else if (str_eq(var, "product")) {
				fb_reply("OKAY", "xnuloader");
			} else if (str_eq(var, "version")) {
				fb_reply("OKAY", "0.5");
			} else if (str_eq(var, "max-download-size")) {
				fb_reply("OKAY", download_to_ramdisk ? "0xffffffff" : "0x03f00000");
			} else if (str_eq(var, "result")) {
				fb_reply("OKAY", last_result);
			} else if (str_eq(var, "screen") && SCREEN.base != 0) {
				/* width height bytes-per-row */
				uint32_t mark = log_len;
				print("%d %d %d", (uint64_t)SCREEN.width, (uint64_t)SCREEN.height, (uint64_t)SCREEN.stride);
				log_buf[log_len] = 0;
				fb_reply("OKAY", log_buf + mark);
				log_len = mark;
			} else {
				fb_reply("OKAY", "");
			}
		} else if (starts_with(cmd, "oem ramdisk")) {
			/* "oem ramdisk": the next download is a root image for the resident area; "oem ramdisk none" drops it */
			struct payload_info pi;

			if (starts_with(cmd, "oem ramdisk none")) {
				resident_rd_size = 0;
				fb_reply("OKAY", "");
				return;
			}
			parse_payload(&pi, 0);
			log_len = 0;
			if (!choose_window(&pi) || win_size <= RESIDENT_RD_OFFSET + RESIDENT_RD_RESERVE) {
				fb_reply("FAIL", "no memory window");
				return;
			}
			download_to_ramdisk = 1;
			fb_reply("OKAY", "");
		} else if (starts_with(cmd, "download:")) {
			uint64_t total = parse_number(cmd + 9, 16), got = 0;
			uint64_t limit = PAYLOAD_MAX_SIZE - 0x100000;
			uint8_t *dest = (uint8_t *)PAYLOAD_BASE;
			int to_ramdisk = download_to_ramdisk;

			download_to_ramdisk = 0;
			if (to_ramdisk) {
				limit = win_size - RESIDENT_RD_OFFSET - RESIDENT_RD_RESERVE;
				dest = (uint8_t *)(win_base + RESIDENT_RD_OFFSET);
				resident_rd_size = 0;
			}
			if (total == 0 || total > limit) {
				fb_reply("FAIL", "bad size");
				return;
			}
			fb_reply_data(total);
			while (got < total) {
				uint64_t want = total - got > USB_CHUNK ? USB_CHUNK : total - got;
				int64_t r = usb_rx(usb_rx_buf, want);
				if (r <= 0) {
					break;
				}
				memcpy(dest + got, usb_rx_buf, (size_t)r);
				got += (uint64_t)r;
			}
			if (got == total) {
				if (to_ramdisk) {
					resident_rd_size = total;
				}
				fb_reply("OKAY", "");
			} else {
				fb_reply("FAIL", "short download");
			}
		} else if (starts_with(cmd, "upload")) {
			uint64_t sent = 0;
			fb_reply_data(staged_len);
			while (sent < staged_len) {
				uint64_t chunk = staged_len - sent > USB_CHUNK ? USB_CHUNK : staged_len - sent;
				if (usb_tx((const uint8_t *)staged_data + sent, chunk) < 0) {
					break;
				}
				sent += chunk;
			}
			fb_reply("OKAY", "");
		} else if (starts_with(cmd, "oem screenshot")) {
			/* stage the raw framebuffer; "getvar screen" gives its geometry */
			if (SCREEN.base == 0) {
				fb_reply("FAIL", "no display");
				return;
			}
			staged_data = (const char *)(uintptr_t)SCREEN.base;
			staged_len = (uint64_t)SCREEN.stride * SCREEN.height;
			fb_reply("OKAY", "");
		} else if (starts_with(cmd, "oem recording")) {
			/* stage what the kernel's display driver recorded (boot-arg rec_secs) */
			if (recording_data == NULL) {
				fb_reply("FAIL", "no recording");
				return;
			}
			staged_data = recording_data;
			staged_len = recording_len;
			fb_reply("OKAY", "");
		} else if (starts_with(cmd, "oem sound")) {
			/* stage what the kernel recorded of the sound (boot-arg rec_sound) */
			if (sound_data == NULL) {
				fb_reply("FAIL", "no sound recording");
				return;
			}
			staged_data = sound_data;
			staged_len = sound_len;
			fb_reply("OKAY", "");
		} else if (starts_with(cmd, "oem clearscreen")) {
			if (SCREEN.base != 0) {
				memset((void *)(uintptr_t)SCREEN.base, 0, (size_t)SCREEN.stride * SCREEN.height);
			}
			fb_reply("OKAY", "");
		} else if (starts_with(cmd, "oem run") || starts_with(cmd, "oem selftest")) {
			int selftest = starts_with(cmd, "oem selftest");
			const char *arg = cmd + 7;
			while (*arg == ' ') {
				arg++;
			}
			int have_cp = selftest || (*arg >= '0' && *arg <= '9');
			uint64_t cp = selftest ? CHECKPOINT_SELFTEST : parse_number(arg, 10);

			set_result("running", cp, 0);
			fb_reply("OKAY", "");
			log_len = 0;
			print("== XNULOADER run (usb) ==\n");
			if (!run_kernel(have_cp, cp)) {
				set_result("not-started", 0, 0);
				compose_logs(NULL, 0);
			}
		} else if (starts_with(cmd, "oem hang")) {
			fb_reply("OKAY", "watchdog test: not petting any more");
			for (;;) {
			}
		} else if (starts_with(cmd, "oem memmap")) {
			/* the firmware's memory map into the log (then "oem log" and fetch it) */
			print_memory_map();
			fb_reply("OKAY", "");
		} else if (starts_with(cmd, "oem log")) {
			if (busy) {
				compose_live_log(running_live, running_slide);
			} else {
				compose_logs(NULL, 0);
			}
			fb_reply("OKAY", "");
		} else if (starts_with(cmd, "reboot") || starts_with(cmd, "oem reboot")) {
			fb_reply("OKAY", "");
			BS->stall(200000);
			ST->rt->reset_system(0 /* EfiResetCold */, 0, 0, NULL);
		} else {
			fb_reply("FAIL", "unknown command");
		}
	}
}

/*
 * A kernel is running on another core and this one watches it: see whether the host has said
 * something meanwhile, without waiting for it to. This is how a run can be asked to end, and
 * the screen and the log be had while it lasts.
 */
static void
usb_poll_command(void)
{
	uint32_t msg = UsbDeviceEventNoEvent;
	uint64_t size = 0, n;
	usb_device_event_data data;
	char cmd[128];

	if (USB == NULL) {
		return;         /* this run was not started over USB */
	}
	if (!usb_rx_queued && usb_connected && !EFI_ERROR(USB->send(USB_EP_OUT, 511, usb_rx_buf))) {
		usb_rx_queued = 1;
	}

	/*
	 * CHIRON_PUMP_EVERY_PASS
	 *
	 * UsbDeviceDxe is this device's class driver -- its binary carries
	 * UsbDeviceHandleEvent, EfiUsbMsgSetupPacket, Dev_Common_SetupPkt and the UsbFnIo
	 * GUID -- so it is what answers GET_DESCRIPTOR on EP0.  It only does that while
	 * something pumps USB->handle_event().
	 *
	 * An earlier version of this loop gated the call on GEVNTCOUNT being non-zero.
	 * That was wrong: GEVNTCOUNT counts the controller's event ring, while a setup
	 * packet reaches the driver by its own path.  With the ring empty the gate
	 * skipped the call, the setup packet was never collected, and the host got no
	 * descriptor -- which matches the measurement exactly: link at U0 and high speed
	 * (so the bus reset happened) with the device address still zero.
	 *
	 * So call in every pass.  The original hazard was that the call does not return
	 * when nothing is pending; the answer is to bound it rather than to skip it, and
	 * to keep the watchdog fed so the reset path stays reachable if it never returns.
	 */
	{
		uint64_t t0 = READ_SYSREG(CNTVCT_EL0);
		uint64_t freq = READ_SYSREG(CNTFRQ_EL0);

		(void)freq;
		USB->handle_event(&msg, &size, &data);

		/*
		 * If that call was slow, do not compound it; a single call per pass is
		 * enough for the class driver to drain what is waiting, and the loop will
		 * come back around immediately.
		 */
		{
			uint64_t t1 = READ_SYSREG(CNTVCT_EL0);

			if (t1 - t0 > READ_SYSREG(CNTFRQ_EL0) / 100) {
				/* took longer than 10 ms: note it once and carry on */
				static int said_slow;

				if (!said_slow) {
					said_slow = 1;
					print("usb: handle_event slow (%d ticks)\n", t1 - t0);
				}
			}
		}
	}
	if (msg == UsbDeviceEventDeviceStateChange) {
		usb_connected = (data.device_state == UsbDeviceStateConnected);
		usb_rx_queued = 0;
		return;
	}
	if (msg != UsbDeviceEventTransferNotification || data.transfer.endpoint_index != USB_EP_OUT) {
		return;
	}
	usb_rx_queued = 0;
	if (data.transfer.status != UsbDeviceTransferStatusCompleteOK || data.transfer.bytes_completed == 0) {
		return;
	}
	n = data.transfer.bytes_completed < sizeof(cmd) - 1 ? data.transfer.bytes_completed : sizeof(cmd) - 1;
	memcpy(cmd, usb_rx_buf, (size_t)n);
	cmd[n] = 0;
	fb_command(cmd);
}

static void
usb_command_loop(void)
{
	/* CHIRON_USB_IDLE_RESET: a host that never connects must not strand the phone */
	uint64_t idle_freq = 0, idle_from = 0, idle_limit;
	int idle_secs = usb_idle_seconds > 0 ? usb_idle_seconds : 300;
	__asm__ volatile ("mrs %0, CNTFRQ_EL0" : "=r" (idle_freq));
	__asm__ volatile ("mrs %0, CNTVCT_EL0" : "=r" (idle_from));
	if (idle_freq == 0) {
		idle_freq = 19200000;			/* msm8998 */
	}
	idle_limit = idle_freq * (uint64_t)idle_secs;

	/*
	 * CHIRON_USB_LOOP_ENTER
	 *
	 * Say we are here, and put it in logfs before touching the controller: if the
	 * log stops after this line the very first USB call is what hangs, and if this
	 * line never appears usb_command_loop() was never reached.
	 */
	if (usb_restore_mode) {
		chiron_phy_restore();
	}
	if (usb_sweep_mode) {
		chiron_utmi_sweep();
	}
	chiron_fn_events("final");
	chiron_event_probe("final");
	print("usb: command loop entered\n");
	flush_log();

	/*
	 * CHIRON_DWC3_SNAP at C
	 *
	 * A second after the loop starts, the driver has had its say.  Comparing this
	 * with B says whether our RunStop write survives or the driver undoes it.
	 */
	/*
	 * CHIRON_PUMP_AT_ENTRY
	 *
	 * This used to be a bare one-second spin.  The core is started a few statements
	 * earlier, so the host begins resetting and asking for the device descriptor
	 * within milliseconds -- and during a bare spin nothing calls handle_event(), so
	 * the setup packet sits uncollected until the host gives up and never issues
	 * SET_ADDRESS.  Pump the class driver while waiting instead.
	 */
	{
		uint64_t freq = 0, began = 0, now = 0;
		unsigned pumped = 0;

		__asm__ volatile ("mrs %0, CNTFRQ_EL0" : "=r" (freq));
		__asm__ volatile ("mrs %0, CNTVCT_EL0" : "=r" (began));
		/*
		 * CHIRON_BUDGET_BEFORE_CALL (second site)
		 *
		 * The budget check belongs before handle_event, not after it.  The call does
		 * not return when nothing is pending, so a check placed after it is
		 * unreachable and one stalled call hangs the loop.  This is the fourth time
		 * this shape has appeared in this session; a full audit of call sites found
		 * it here after the same mistake had already been fixed twice elsewhere.
		 */
		while (pumped < 200000) {
			uint32_t m = UsbDeviceEventNoEvent;
			uint64_t sz = 0;
			usb_device_event_data d;

			__asm__ volatile ("mrs %0, CNTVCT_EL0" : "=r" (now));
			if (now - began > freq) {           /* 1 s */
				break;
			}

			memset(&d, 0, sizeof(d));
			USB->handle_event(&m, &sz, &d);
			pumped++;

			if (m == UsbDeviceEventDeviceStateChange) {
				usb_connected = (d.device_state == UsbDeviceStateConnected);
			}
			if (pumped == 1 || (pumped % 50000) == 0) {
				wdt_pet();
			}
		}
		print("usb: pumped %d times during the first second\n", (uint64_t)pumped);
		flush_log();
	}
	chiron_dwc3_snap("C-in-loop-1s");
	/*
	 * CHIRON_QUSB2_LINES
	 *
	 * ln bits from QUSB2PHY_INTR_STAT (0x230): 1 = D+, 2 = D-.  Both high is the
	 * undriven idle state; a device in full/high speed pulls D+ up and holds D-
	 * low.  The PHY's own tuning registers are dumped alongside so the trim can be
	 * compared with what the running kernel programs.
	 */
	{
		const uint64_t phy = 0xC012000ULL;
		uint8_t ctrl = *(volatile uint8_t *)(uintptr_t)(phy + 0x22C);
		uint8_t stat = *(volatile uint8_t *)(uintptr_t)(phy + 0x230);

		print("lines: ctrl %x stat %x Dp %x Dm %x\n",
		    (uint64_t)ctrl, (uint64_t)stat,
		    (uint64_t)(stat & 1), (uint64_t)((stat >> 1) & 1));
		print("tune: 00 %x 04 %x 2c %x 184 %x 18c %x 23c %x 240 %x 24c %x\n",
		    (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0x000),
		    (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0x004),
		    (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0x02C),
		    (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0x184),
		    (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0x18C),
		    (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0x23C),
		    (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0x240),
		    (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + 0x24C));
	}
	/*
	 * CHIRON_QUSB2_STAT: the PHY's own view of the wire.  INTR_STAT (0x230)
	 * carries the single-ended D+/D- levels (DPSE / DMSE).
	 */
	{
		const uint64_t phy = 0xC012000ULL;

		print("phy230 ", 0);
		for (uint32_t off = 0x200; off <= 0x250; off += 0x10) {
			print("+", (uint64_t)off);
			print("=", (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + off));
			print(" ", 0);
		}
		print("\n", 0);
		for (uint32_t off = 0; off <= 0x30; off += 0x10) {
			print("lo+", (uint64_t)off);
			print("=", (uint64_t)*(volatile uint8_t *)(uintptr_t)(phy + off));
			print(" ", 0);
		}
		print("\n", 0);
	}
	flush_log();

	screen_quiet = 1;
	for (;;) {
		char cmd[128];
		uint64_t pass_now = 0;

		/*
		 * CHIRON_USB_NO_SPAM
		 *
		 * Nothing here may run once per pass without a bound: an unconditional
		 * flush_log() writes the log partition every iteration, and a print() per
		 * pass makes the graphics console blit the framebuffer for every newline,
		 * which is what kept the phone unresponsive and stopped the deadline below
		 * from ever being reached.
		 */
		__asm__ volatile ("mrs %0, CNTVCT_EL0" : "=r" (pass_now));

		int64_t n;
		uint64_t idle_now = 0;

		/* CHIRON_USB_NO_SPAM: checked first, every pass, cheaply */
		__asm__ volatile ("mrs %0, CNTVCT_EL0" : "=r" (idle_now));
		if (idle_now - idle_from > idle_limit) {
			print("\n== USB session idle for %d s; resetting ==\n", (uint64_t)idle_secs);
			auto_reboot = 1;
			reboot();
		}

		usb_session_check();
		if (!usb_connected) {
			/*
			 * CHIRON_USB_QUIET_WAIT: with no host attached this runs again and again.
			 * Say it, but not on every pass.
			 */
			static uint64_t said_disconnected;
			static int announced;

			usb_wait(0xff);        /* bounded now, see usb_wait() */
			__asm__ volatile ("mrs %0, CNTVCT_EL0" : "=r" (idle_now));
			if (!announced || idle_now - said_disconnected > idle_freq * 5) {
				announced = 1;
				said_disconnected = idle_now;
				print("usb: waiting for a host (%d s of %d) connected=%d\n",
				    (idle_now - idle_from) / idle_freq, (uint64_t)idle_secs,
				    (uint64_t)(usb_connected != 0));
			}
			continue;
		}
		n = usb_rx(usb_rx_buf, 511);
		if (n <= 0) {
			/* CHIRON_USB_LOOP_ENTER: a wait that returned nothing */
			static uint64_t said_nothing;
			uint64_t t = 0;

			__asm__ volatile ("mrs %0, CNTVCT_EL0" : "=r" (t));
			if (said_nothing == 0 || t - said_nothing > idle_freq * 3) {
				said_nothing = t;
				print("usb: no command yet (connected=%d)\n",
				    (uint64_t)(usb_connected != 0));
			}
			continue;
		}
		if (n > (int64_t)sizeof(cmd) - 1) {
			n = sizeof(cmd) - 1;
		}
		__asm__ volatile ("mrs %0, CNTVCT_EL0" : "=r" (idle_from));   /* a live host */
		memcpy(cmd, usb_rx_buf, (size_t)n);
		cmd[n] = 0;
		fb_command(cmd);
	}
}

/* ------------------------------------------------------------------------ */

/*
 * QEMU's "ramfb" display shows whatever guest memory it is told to, in any size; the firmware
 * only offers a few small landscape modes of it. So we point it at memory of our own with the
 * shape of the iPhone's screen, through the fw_cfg file "etc/ramfb" (the firmware's own mode
 * is simply replaced). In QEMU the display is then exactly what iOS expects; on the real phone
 * the kernel's display driver scales that picture to the panel.
 */
/* chiron's own panel: 1080 x 2160 (the loader's boot_args report the same, and the
 * UEFI's framebuffer is that size). This used to be the iPhone X's 1125 x 2436, which
 * made the kernel draw at a size the panel does not have. */
#define PHONE_WIDTH     1080
#define PHONE_HEIGHT    2160
#define FW_CFG_BASE     0x09020000ULL   /* QEMU virt: data at +0, selector at +8, DMA address at +16 */
#define FW_CFG_FILE_DIR 0x19
#define FW_CFG_DMA_SELECT 0x08
#define FW_CFG_DMA_WRITE  0x10

static uint32_t
be32(uint32_t v)
{
	return __builtin_bswap32(v);
}

static void
fw_cfg_read(void *buf, uint32_t len)
{
	for (uint32_t i = 0; i < len; i++) {
		((uint8_t *)buf)[i] = *(volatile uint8_t *)FW_CFG_BASE;
	}
}

static void
ramfb_phone_screen(void)
{
	static struct {
		uint64_t addr;
		uint32_t fourcc, flags, width, height, stride;
	} __attribute__((packed)) cfg;
	static struct {
		/*
		 * control is written back by QEMU when the DMA request completes (0 on success,
		 * FW_CFG_DMA_CTL_ERROR set if it failed), so it must be volatile: without that the
		 * compiler sees only its own store, folds the check below to "always non-zero", and
		 * every ramfb request looks like it failed -- which leaves the display at the
		 * firmware's 800x600 instead of the phone's 1125x2436.
		 */
		volatile uint32_t control;
		uint32_t length;
		uint64_t address;
	} dma;
	struct {
		uint32_t size;
		uint16_t select, reserved;
		char name[56];
	} file;
	uint32_t count, select = 0;
	uint64_t fb = 0, bytes = (uint64_t)PHONE_WIDTH * 4 * PHONE_HEIGHT;

	*(volatile uint16_t *)(FW_CFG_BASE + 8) = __builtin_bswap16(FW_CFG_FILE_DIR);
	fw_cfg_read(&count, sizeof(count));
	count = be32(count);
	for (uint32_t i = 0; i < count && i < 256 && select == 0; i++) {
		fw_cfg_read(&file, sizeof(file));
		if (str_eq(file.name, "etc/ramfb")) {
			select = __builtin_bswap16(file.select);
		}
	}
	if (select == 0 || EFI_ERROR(BS->allocate_pages(AllocateAnyPages, EfiLoaderData, (bytes + 0xFFF) >> 12, &fb))) {
		return;
	}
	memset((void *)(uintptr_t)fb, 0, (size_t)bytes);
	cfg.addr = __builtin_bswap64(fb);
	cfg.fourcc = be32(0x34325258);          /* 'XR24': blue, green, red, unused */
	cfg.flags = 0;
	cfg.width = be32(PHONE_WIDTH);
	cfg.height = be32(PHONE_HEIGHT);
	cfg.stride = be32(PHONE_WIDTH * 4);
	dma.control = be32(select << 16 | FW_CFG_DMA_SELECT | FW_CFG_DMA_WRITE);
	dma.length = be32(sizeof(cfg));
	dma.address = __builtin_bswap64((uint64_t)(uintptr_t)&cfg);
	*(volatile uint64_t *)(FW_CFG_BASE + 16) = __builtin_bswap64((uint64_t)(uintptr_t)&dma);
	if (dma.control != 0) {
		print("ramfb: control %x after the request\n", (uint64_t)be32(dma.control));
		return;
	}
	SCREEN.base = fb;
	SCREEN.width = PHONE_WIDTH;
	SCREEN.height = PHONE_HEIGHT;
	SCREEN.stride = PHONE_WIDTH * 4;
}

efi_status EFIAPI
efi_main(efi_handle image, efi_system_table *st)
{
	static const efi_guid gop_guid = EFI_GOP_GUID;
	struct payload_info pi;

	ST = st;
	BS = st->bs;
	IMAGE = image;

	/* Take the console away from the drivers before they start talking: UsbConfigDxe
	 * reports a failed Type-C query every millisecond, which would bury everything here.
	 * loader keeps the original pointer, so its own output still reaches the panel. */
	mute_driver_console();

	BS->set_watchdog_timer(0, 0, 0, NULL);
	print("== XNULOADER v3 ==\n");
	print("CurrentEL=%x MIDR=%x MMFR0=%x CNTFRQ=%d image=%x\n", READ_SYSREG(CurrentEL) >> 2, READ_SYSREG(MIDR_EL1),
	    READ_SYSREG(ID_AA64MMFR0_EL1), READ_SYSREG(CNTFRQ_EL0), (uint64_t)(uintptr_t)&__ImageBase);

	PLAT = &platform_qemu_virt;
	if (EFI_ERROR(BS->locate_protocol(&gop_guid, NULL, (void **)&GOP)) || GOP->mode == NULL ||
	    GOP->mode->info == NULL || GOP->mode->fb_base == 0) {
		GOP = NULL;                     /* no display (QEMU without -device ramfb) */
	} else {
		SCREEN.base = GOP->mode->fb_base;
		SCREEN.width = GOP->mode->info->width;
		SCREEN.height = GOP->mode->info->height;
		SCREEN.stride = GOP->mode->info->pixels_per_scanline * 4;
		for (unsigned i = 0; i < sizeof(platforms) / sizeof(platforms[0]); i++)
			if (platforms[i]->fb_base == SCREEN.base)
				PLAT = platforms[i];
		if (PLAT == &platform_qemu_virt)
			ramfb_phone_screen();
		print("CHIRON_GOP w=%d h=%d ppsl=%d fmt=%d stride=%d fbsize=%x base=%x\n",
		    (uint64_t)GOP->mode->info->width, (uint64_t)GOP->mode->info->height,
		    (uint64_t)GOP->mode->info->pixels_per_scanline,
		    (uint64_t)GOP->mode->info->pixel_format,
		    (uint64_t)SCREEN.stride, (uint64_t)GOP->mode->fb_size, (uint64_t)SCREEN.base);
		print("display %d x %d at %x\n", (uint64_t)SCREEN.width, (uint64_t)SCREEN.height, SCREEN.base);
	}
	print("platform %s\n", PLAT->name);
	dump_partitions();
	list_partitions();

	install_exception_hook();
	wdt_arm();

	int have_payload = parse_payload(&pi, 0);
	/* CHIRON_USB_FAIL_RESET: no gadget means nothing to drive and nothing to boot;
	 * go back to Android rather than sit on a black screen for ever. */
	if (have_payload && pi.usb_mode) {
		if (usb_start()) {
			flush_log();
			/* CHIRON_USB_HANDLE_BOUNDED: a session with no host must end by itself */
			usb_session_begin(usb_idle_seconds > 0 ? (uint64_t)usb_idle_seconds : 300);
			usb_command_loop();
		}
		print("\n== USB session unavailable; resetting ==\n");
		auto_reboot = 1;
		reboot();
	}

	/*
	 * CHIRON_QUIET_EARLY
	 *
	 * One-shot mode is where the panel was being scrolled to death: every print() of
	 * this loader and of the kernel's log went to the firmware's graphics console, and
	 * each newline is a full-framebuffer blit there.  The log goes to "logfs" (the host
	 * reads it over adb), so the screen has nothing left to do: turn it off here, once.
	 */
	screen_quiet = 1;

	/* One-shot mode: run the kernel that came with the image, then reset. */
	if (have_payload) {
		run_kernel(0, 0);
	}
	reboot();
	return 0;
}
