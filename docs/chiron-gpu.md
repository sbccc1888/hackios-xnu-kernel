# chiron's GPU — the Adreno 540 driver

`bsd/dev/chiron_adreno.c`. The Xiaomi Mi MIX 2 (chiron, MSM8998) has an **Adreno 540**, architecture
**a5xx**. The POCO X5 Pro's driver (`bsd/dev/redwood_adreno.c`) is **a6xx**, built on the GMU, and cannot
be reduced to changed addresses — so this is a driver of its own.

> **Status: written and compiled, not run.** Every step is verified by compilation (twice: host and
> aarch64) and by comparison with Qualcomm's own code. **Nothing here has touched the phone**, because
> chiron's UEFI port is not done. Where a claim rests on reasoning rather than observation, this
> document says so.

---

## 1. Two facts that decide the shape of everything

### a5xx is not a6xx, and its GPMU is not a6xx's GMU

Both have a power-management processor. They are different things:

| | a6xx (redwood) | a5xx (chiron) |
|---|---|---|
| what it is called | GMU | GPMU |
| firmware | `a660_gmu.bin` | `a540_gpmu.fw2` (a `.fw2`, blocks with version headers) |
| loaded by | its own memory window | **type-4 PM4 packets through the command processor** |
| talks to the host by | HFI message queues | two registers (`GENERAL_0`, `GENERAL_1`) |
| needed for the 3D core to run? | yes | **no** |

That last row is a genuine fallback: `drivers/gpu/drm/msm/adreno/a5xx_power.c:408-411` returns without
initialising the GPMU when the device tree has no `qcom,gpmu-firmware` — the driver prints one line and
carries on. So if the GPMU does not come up, steps 1–4 still stand and freedreno can still draw; what is
lost is dynamic frequency and thermal control.

Because the GPMU's firmware goes through the CP, **the CP must be running first**. Step 5 depends on
step 4, which depends on step 3.

### a5xx has no GPU ID register

There is no `RBBM_REVISION` or `RBBM_ID` anywhere in `a5xx_reg.h` or `a5xx.xml.h`, and the vendor's
driver does not read one: it takes the chip identity from the device tree,
`adreno.c:678` `kgsl_property_read_u32(..., "qcom,chipid", ...)`, decoded by `adreno.h:51-54`
(core `>>24`, major `>>16`, minor `>>8`, patch `&0xFF`). chiron says `0x5040001` (`chiron.dts:10127`)
= core 5, major 4, minor 0, patch 1 = A540.

So "read the GPU ID to prove it is alive" is not available here. Step 1 uses a better test — §4.

---

## 2. The seven steps

Each announces what it will touch before touching it, reads before writing, and **stops the sequence**
rather than continuing blind. An access the hypervisor dislikes ends the run, sometimes a quarter of a
minute later and without a word (`redwood_adreno.c`, the note at the top).

| # | What it does | Verifies | Can fail honestly? |
|---|---|---|---|
| 0 | prints one line with a compile-time stamp | the file is in the kernel at all | no (it either prints or it does not) |
| 1 | enables `gcc_gpu_cfg_ahb_clk`; reads 15 GPUCC registers twice | **may this kernel reach the GPU's registers?** | yes — stops if all 15 read `0xffffffff` |
| 2 | CX then GX power switches on; 3D clock source root enabled | power and clocks really came up | yes — GDSC `bit31` never sets |
| 3 | ~40 RBBM registers as a540 wants; CP microcode loaded; `ME_HALT` cleared | micro engine out of halt without faulting | yes — `CP_HW_FAULT` ≠ 0 |
| 4 | ring buffer, `CP_ME_INIT`, then a `CP_INTERRUPT` | **the CP fetches and executes what it is given** | yes — RPTR never reaches WPTR |
| 5 | `a540_gpmu.fw2` → PM4 → its instruction RAM; handshake | the GPMU's firmware started | yes — no `0xBABEFACE` |
| 6 | reads the SMMU (identity, `sCR0`, stream 0's `SMR`/`S2CR`) | **what steps 3–5 are assuming about addresses** | read-only; always reports |
| 7 | zap shader through TrustZone | the 3D core may leave secure mode | yes — and **unverified**, see §6 |

All of it is gated on `chiron_gpu=1`. Without the boot-arg the driver says it is present and does
nothing.

---

## 3. The two addressing conventions, which are load-bearing

This is the single easiest thing to get wrong in this file, and getting it wrong is **silent**.

### `a5xx_reg.h` offsets are DWORD indices

`adreno.c:2424-2436`:

```c
static void adreno_regwrite(struct kgsl_device *device,
                            unsigned int offsetwords, ...)      /* offsetwords */
{
        BUG_ON(offsetwords*sizeof(uint32_t) >= device->reg_len); /* times 4 */
        reg = (device->reg_virt + (offsetwords << 2));           /* shifted */
        __raw_writel(value, reg);
}
```

Upstream agrees by a different route: its register table entries are `(a5xx.xml.h value + 1)`
(`adreno_gpu.h:34`), and `gpu_write()` writes at `msm_writel(mmio + (reg << 2))` (`msm_gpu.h:204-207`).
So `A5XX_RBBM_STATUS 0x4F5` is **byte `0x13D4`**. `GPU_REG()` in the driver does that shift.

### The clock controller, the device tree and the SMMU use BYTES

`clock-local2.c:51` addresses them with no shift (`CMD_RCGR_REG(x) = base + cmd_rcgr_reg`), and the
device tree's absolute addresses agree: `gpu_cx_gdsc 0x5066004` is `0x1004` past `gpucc@5065000`, which
is exactly `GPU_CX_GDSCR_OFFSET 0x1004` (`clock-gpu-8998.c:44`). Those are used as they are.

### Both forms of one register exist in the tree — the cleanest proof

`qcom,micro-mmu-control = <0x6000>` is a **byte** offset, and `adreno_iommu.c:86` puts
`micro_mmu_ctrl >> 2` (`0x1800`) into a CP packet, because **a PM4 packet's register address is a dword
index**.

The driver asserts both conventions numerically in its first line of output, so a future reader can
check them from a log without reading any of this:

```
chiron-adreno: addressing: kgsl 0x5000000 + RBBM_STATUS(0x4f5)*4 = 0x5013d4; gpucc 0x5065000 + 0x1004 = 0x5066004
```

`tools/verify_regs.py` mechanically compares every constant in the driver against `a5xx_reg.h` and
prints the byte address each one resolves to. It needs the vendor tree:

```sh
VNSRC=/root/src/kernel_msm8998 tools/verify_regs.py
```

Current result: **50 registers compared, 0 mismatches, every byte address inside
`0x5000000..0x503ffff`.** Run it after touching any register constant — it is the check that the
second defect below would have failed.

`tools/verify_patch.py` does the same job for the patch itself: every one of the 192 hunk headers in
`xnu/redwood.patch` is compared with the lines it actually carries, because a malformed hunk is how a
whole file goes missing while CI stays green.

---

## 4. Step 1: how the hypervisor question is asked

This is the most important unknown in the whole port. If the hypervisor refuses access to the GPU's
registers, everything after step 1 needs redesigning.

Three tests, in increasing strength. **None of them has been run on the phone yet.**

1. **Not all ones.** A register that reads `0xffffffff` is what a refused access usually looks like.
   But a register may legitimately hold that value, so **one** such reading is reported and not treated
   as a verdict. Only **all fifteen** reading all-ones stops the sequence.
2. **It repeats.** The fifteen are read twice. A bus that is not really there answers differently, or
   answers a constant.
3. **The hardware says something it could not have got from us.** `gpu_pll0`'s `PLL_MODE` has
   `LOCK` = `bit31` and `ACTIVE` = `bit30` (the vendor's own masks, `clock-gpu-8998.c:72-78`). Nothing
   this driver has done could set those — it has written one clock-enable bit and nothing else. **A set
   LOCK bit is evidence this kernel is reading real status out of the real clock controller.**

> A **clear** LOCK bit is *not* evidence of the opposite: an idle PLL reads exactly like that. The log
> reports which of the two situations it is in, by name, rather than folding both into one verdict.

---

## 5. On a real phone: a decision tree

Written for the person holding the phone at 3 a.m., so that a symptom points somewhere instead of
sending them back into 2000 lines of code.

### Read the log in this order — it is not the order of the steps

The driver prints step 1's result before anything writes, so **always look at step 1 first**, even
if a later step is what failed. Step 6 is read *before* interpreting any failure in 3, 4 or 5,
because it can explain those failures outright.

```
                    ┌─────────────────────────┐
                    │  step 0 printed a line? │
                    └───────────┬─────────────┘
                    no ─────────┴───────── yes
                     │                     │
        the file is not in the kernel      ▼
        → tools/verify_patch.py        ┌──────────────────────────────┐
        → the build log: "CC           │ step 1: 15 GPUCC registers   │
          chiron_adreno.o"?            │        all 0xffffffff?       │
                                       └───────────┬──────────────────┘
                                       yes ────────┴──────── yes/no
                                        │                    │
              HYPERVISOR / XPU REFUSES  │                    ▼
              everything after needs   │        ┌──────────────────────────┐
              redesigning              │        │ step 1: gpu_cfg_ahb_clk  │
              → compare with the       │        │  still has bit31 set?    │
                vendor kernel's        │        └──────────┬───────────────┘
                permissions on         │        yes ───────┴──── no
                kgsl-3d0@5000000       │         │              │
                                       │   GPUCC bus not        ▼
                                       │   clocked: the      ┌──────────────────────┐
                                       │   GCC node's        │ step 1: PLL0 LOCK?   │
                                       │   protected-clocks  └──────────┬───────────┘
                                       │                          set ─┴─ clear
                                       │                           │        │
                                       │              reads are REAL│        │ not evidence
                                       │              keep going    │        │ either way
                                       │                            ▼        ▼
                                       └──────────────────────► step 2 …
```

### Then, by symptom

| What you see | Read it as | Go to |
|---|---|---|
| **step 1**, all 15 read `0xffffffff` | this kernel may not touch the GPU's clock controller at all | the `kgsl-hyp` node (`chiron.dts:10097`); what the vendor kernel is allowed |
| **step 1**, `gcc_gpu_cfg_ahb_clk` keeps `bit31` | the GPUCC register bus is unclocked; nothing behind it can answer | GCC's protected clocks |
| **step 1**, values differ between the two reads | no real bus there | the device tree's `reg` for `gpucc@5065000` |
| **step 1**, PLL `LOCK` clear, nothing else wrong | **not a fault** — an idle PLL reads that way | continue; step 2 sets the rate |
| **step 2**, CX GDSC `bit31` never sets | the CX rail has no voltage — Linux raises it through RPMh and XNU has no RPMh client (§7) | nothing in this kernel can fix it; the boot loader's rail level is all there is |
| **step 2**, GDSCs say `POWER ON` but the counter never moves | switches obeyed, block still silent — **almost always the rail** | same as above |
| **step 2**, counter moves, ratio **below** 1000 | the crystal is not reaching the block at full rate (loop overhead only ever makes the ratio *higher*, so a low one is real) | the PLL's post-divider; step 1's PLL reading |
| **step 3**, `CP_HW_FAULT` ≠ 0 | the engine started and refused something — most often an instruction base address it cannot read | **step 6 first** (is the stream bypassed?), then the microcode address |
| **step 3**, no busy bit ever seen | **not proof of failure** — a parked engine with an empty ring looks idle | step 4 is the real test |
| **step 4**, RPTR never moved at all | the engine is not fetching: not running, or the ring's address is unreadable | **step 6 first**, then step 3 |
| **step 4**, RPTR moved and stopped part way | the engine *is* fetching and choked on the packet it stopped at | that packet; check its parity word by hand against `odd_parity()` in a compiled test |
| **step 5**, no `0xBABEFACE` | the GPMU did not start | the four raw registers it prints; then the firmware's version (§6) |
| **step 5**, the log says the firmware was refused for its version | it is the wrong file — e.g. `a530v3_gpmu.fw2` is 2.4 and this phone asks for 3.0 | get `a540_gpmu.fw2` from the phone |
| **step 6**, stream 0 is **not** `BYPASS` | **steps 3–5's addresses do not mean what the driver thinks** — this is the *explanation* for a 3/4 failure, not a separate problem | a translation context must be built before 3–5 can work |
| **step 6**, `sGFSR` ≠ 0 | something already faulted through this SMMU, possibly before this kernel | `sGFSYNR0/1` are printed raw |
| **step 7**, refuses for want of `chiron_zap_mem` | by design — see §7 | give the loader a reserved address |
| **step 7**, TrustZone refuses the signature | taken to mean it already keeps a zap shader from a previous kernel; the sequence continues | whether the 3D core leaves secure mode is the real answer |

### The three readings that are traps

1. **"All ones" on a single register is not proof of refusal.** The driver says `NOTE` and continues
   unless *all fifteen* read that way. A register may legitimately hold `0xffffffff`.
2. **A clear PLL `LOCK` bit is not proof of failure.** An idle PLL reads exactly like that.
3. **No busy bit in `RBBM_STATUS` is not proof the engine is dead.** An empty ring parks it. Step 4's
   read pointer is the test; step 3's is only "did not fault".

Each of those is a place where a plausible-looking conclusion would be wrong, and the log says which
case it is in rather than folding both into one verdict.

---

## 6. External files

None of these are in the repository and none can be. They come from the phone's `/vendor/firmware`,
are put in `fw-gpu/`, and `userland/build.sh` puts them into the kernel's small image as `fw/`.

| File | Needed by | Available here? | Note |
|---|---|---|---|
| `a530_pm4.fw` | step 3 | **yes** — `/usr/lib/firmware/qcom/a530_pm4.fw.zst`, 19572 bytes, version `0x005ff063` | **a540 uses a530's CP microcode.** There is no `a540_pm4.fw` (`adreno-gpulist.h:251-252`) |
| `a530_pfp.fw` | step 3 | **yes** — same package, 16144 bytes | likewise |
| `a540_gpmu.fw2` | step 5 | **no** | must come from the phone. The `a530v3_gpmu.fw2` in a Linux firmware package is **version 2.4** and this phone's tree asks for **3.0** (`chiron.dts:10144`), so it is refused — correctly |
| `a540_zap.mdt` | step 7 | **no** | must come from the phone. `a530_zap` is not a substitute |

The microcode's version is printed before it is used: a file that is not what we think it is should say
so before it goes into a micro engine.

The GPMU's refusal rule matches the vendor's (`adreno_a5xx.c:1265-1273`: refuse a major mismatch, warn
on a minor one) — loading a wrong-major image into a processor nothing here can reset again would be
the one mistake that cannot be undone from this kernel.

---

## 7. What XNU cannot do here, and what that costs

**Raising the graphics voltage rail.** Linux does it between CX and GX through its regulator framework
(`clock-gpu-8998.c:414-416`, via `vdd_gpucc`), which reaches a PM8998 regulator through RPMh. This
kernel has **no RPMh client**. So the sequence is CX, then GX, with nothing in between, and the boot
loader's rail level is what the GPU gets.

The consequence is specific and worth knowing before a run: **if the rail is too low, the GDSCs will
report on and the block will stay silent.** That is exactly what a dead always-on counter after step 2
means, and the log says so.

### The zap shader is a different risk class — it can brick the phone

Steps 1–6 write to registers. A wrong value makes a step fail, and a reboot undoes it.

**Step 7 hands a signed image to the secure processor and tells it to run it.** Two ways that differs:

- **The address must be real reserved memory.** `PAS_MEM_SETUP` points TrustZone at a physical range.
  If that range belongs to something else — the kernel, a modem, the display — TrustZone writes a
  signed image over it, or refuses and leaves the GPU half-initialised. That is why the driver takes
  the address from the loader (`chiron_zap_mem=`) and **refuses without it**: redwood's
  `0x8b71a000` is a redwood address and would be meaningless here, and picking one by guesswork is
  not a thing to do to somebody's phone.
- **There is no undo.** `PAS_SHUTDOWN` asks TrustZone to give the image up, but a wedged secure
  processor is not something this kernel can reset. The GPMU has the same property (below).

So: **run steps 1–6 first, on their own, and only add step 7 when the phone has a spare boot path
and `chiron_zap_mem` is a range the loader really reserved.** The step says in its own log line which
of the two inputs is missing, so a refusal is never ambiguous.

**Resetting the GPMU.** There is no path back; a wrong firmware image wedges it until the phone
reboots. This is why step 5 checks the version before loading anything, and why it treats a
major-version mismatch as a refusal rather than a warning.

---

## 8. Unverified assumptions

Things that are reasoned, not observed. Each is a place a run could surprise us.

1. **Kernel memory is identity-mapped where the GPU's micro-MMU passes through.** Steps 3–5 hand the GPU
   `kvtophys()` addresses with no SMMU context programmed. Step 6 reports whether the GPU's stream is
   bypassed; if it is not, this assumption is simply false and steps 3–5 will fail — visibly.
2. **The boot loader leaves `gpu_pll0` locked.** Step 2 sets the divider and the source but does not
   program the PLL. If the PLL is not running, the clock exists but has nothing to divide. Step 1's
   `LOCK` reading is the evidence for this, and it is printed either way.
3. **`CM3_SYSRESET = 0` is the right way to start the GPMU.** Taken from `adreno_a5xx.c:798`, not
   observed.
4. **`0xBABEFACE` arrives within 5000 µs.** The vendor's own comment says 3000 cycles ≈ 5–24 µs; the
   poll is far longer on purpose, because a falsely failed step is worse than a slow one.
5. **Whoever calls `chiron_adreno_init()` does so after enough of the kernel is up to allocate memory.**
   It is called from `redwood_input_init()` (`bsd/dev/redwood_input.c:225`), beside where redwood's GPU
   driver is started, so it inherits that timing.
6. **The whole file's biggest assumption: that these are the right registers and values at all.** They
   are the vendor's, cited line by line, and two independent sources are given where two exist — but
   they have never been written to this phone by this kernel.

---

## 9. Three defects worth remembering

All three were found **without a phone**, by reading Qualcomm's code against this one. All three would
have looked like hardware failure.

| # | Defect | What it would have looked like | How it was found |
|---|---|---|---|
| 1 | PM4 parity computed over the low 7 bits instead of the whole word | the CP silently **drops the packet** → "the engine does not run" | compared against `pm4_calc_odd_parity_bit`, then compiled both and ran them over 12 values: the short form was wrong on 2, including `0x8000` = `CP_RB_BASE` |
| 2 | every GPU-block offset read as **bytes** instead of dword indices | writes go 4 registers left — still inside the block, so **nothing faults**; the driver reports "the GPU did not start" with every number in the log looking reasonable | followed `micro_mmu_ctrl >> 2` while starting the SMMU step, found `offsetwords << 2` in `adreno_regwrite` |
| 3 | `S2CR_TYPE` assumed `FAULT = 0` | the one state this driver can survive (`BYPASS = 1`) reported as its opposite, sending the reader to the wrong subsystem | `arm-smmu.c:174-176` gives `TRANS = 0`, `BYPASS = 1`, `FAULT = 2` |

**The pattern**: each mistake was self-consistent, compiled cleanly, and produced plausible output. None
crashed. The only thing that caught them was **comparison against the vendor's source, line by line**.

Two working rules came out of it, and they are worth keeping:

- **Compile the real function and run it against the vendor's, rather than re-deriving the arithmetic.**
  A hand-written copy of a bit-twiddling routine carries the same misunderstanding as the code it is
  checking. (This was proved: a reviewer's independent Python transcription of the parity function came
  out systematically inverted, while the compiled C matched.)
- **When something looks odd, stop and follow it.** Defect 2 was found because
  `micro_mmu_ctrl >> 2` looked wrong while doing something else. Continuing with the plan would have
  left it in place until the phone.

---

## 10. A note on evidence

The port's own history has two lessons that shaped this driver:

- A patch was once skipped by `[warning] Skipping patch` and the build stayed green with none of it in
  the product. So step 0 exists purely to prove the file is in the kernel — and it is proved three ways:
  `CC chiron_adreno.o` in the build log, `_chiron_adreno_init` in `__TEXT_EXEC`, and the `bl` that
  reaches it from `redwood_input_init` (`fffffff0074adca8: 94006df2 bl ... <_chiron_adreno_init>`).
  A symbol in the symbol table proves linking; the `bl` proves it is called.
- A probe once assumed an unverified register state and crashed. So every step announces before it
  touches, reads before it writes, and states what it does **not** prove. Step 2's counter is the
  clearest case: upstream calls it "the 19.2 Mhz always on counter" (`a5xx_gpu.c:104`), so a counter
  that moves shows the block is powered and the crystal reaches it — **it does not show the 3D core's
  clock runs**, and the log says so in as many words.

Every hunk of the patch that registers this file is checked mechanically against the lines it carries
(192 hunk headers), because a malformed hunk is exactly how a change goes missing quietly.

---

## Appendix A — what sits above this driver, and what it will ask for

Read-only survey of `iokit/Kernel/RedwoodGPU.cpp` (1295 lines), done so that the next stage starts
with information rather than from scratch. **No code was written from it.**

### The shape

```
freedreno (Mesa)
    ↓ Linux DRM ioctl
userland/tools/mesa/redwood-drm/redwood_drm.c    the shim that stands in for libdrm   ← reuse
    ↓ IOKit user client: selector = request number, structure in and out
iokit/Kernel/RedwoodGPU.cpp                                                             ← reuse
    ↓ the 15 extern "C" redwood_gpu_* functions
bsd/dev/redwood_adreno.c  →  chiron needs its own equivalent                            ← rewrite
```

**The middle two layers do not know what GPU is underneath.** They speak Linux's `msm` DRM protocol.
Only the bottom layer is hardware-bound, which is the whole of chiron's remaining work.

### The 15 functions this layer calls (the M8 work order)

```c
bool     redwood_gpu_ready(void);
bool     redwood_gpu_parameter(uint32_t which, uint64_t *value);
uint64_t redwood_gpu_address(uint64_t size);
void     redwood_gpu_address_free(uint64_t address, uint64_t size);
void     redwood_gpu_space(...);
bool     redwood_gpu_map(uint64_t address, uint64_t phys, bool read_only);   /* the core one */
void     redwood_gpu_mapped(void);
void     redwood_gpu_unmap(uint64_t address, uint64_t size);
uint64_t redwood_gpu_to_memory(void *start, uint64_t size);
void     redwood_gpu_done(uint32_t fence);
uint32_t redwood_gpu_last(void);
uint64_t redwood_gpu_submit(const uint64_t *addresses, const uint32_t *words, uint32_t count);
bool     redwood_gpu_worked(uint64_t *us, uint32_t *n, uint32_t by[7]);
void     redwood_gpu_report(const char *why);
void     redwood_gpu_recover(void);
```

`redwood_gpu_map()` is the one that matters, and **it is the same question step 6 asks**. With the GPU's
stream bypassed, it can be a table of physical↔GPU address pairs; with a translating stream it needs a
real arm-smmu page table and the secure side's permission to build one. So step 6's one log line decides
whether M8 is a moderate piece of work or a large one.

`gpu_recover()` has no a5xx equivalent: redwood can reset its GMU and start again, and a5xx's GPMU
cannot be reset from this kernel (§7). chiron's would have to report and stop, and say so.

### Selectors

Linux's, from `msm_drm.h`/`drm.h`: `0x09` GEM close, `0x40`–`0x48` parameters/GEM/submit/fence/madvise,
`0x4a`–`0x4c` submit queues. Three of redwood's own: `0x7d` worked, `0x7e` surface, `0x7f` show. The
three custom ones touch no hardware (MiniIOSurface and buffers), so chiron keeps them.

### Compute needs no new kernel interface

This is worth recording because it is easy to assume otherwise:

| compute needs | what provides it | enough? |
|---|---|---|
| SSBO — a read/write buffer of any size | `kMsmGemNew` takes any `size`; `kMsmGemInfo` gives its GPU address | **yes** — an SSBO is the same kind of object as a vertex or texture buffer |
| read/write permission | `redwood_gpu_map(..., read_only)` | **yes** — `read_only = false` |
| threadgroup memory | a shader-internal concept | **no kernel involvement at all** |
| a dispatch | one `kMsmGemSubmit` with the workgroup dimensions in the command stream | **yes** — indistinguishable from any other submit |

### What chiron inherits, including the shortcomings

`RedwoodGPU.cpp:25-30` lists what it deliberately does not do: no interrupts (waits poll five times a
millisecond), no per-client isolation (every client's buffers share one address space), no fences or
buffers as file descriptors. Those are design choices, not defects, and chiron would inherit them as
they stand. The first becomes a performance problem only when several GPU programs run at once.

### One thing to change when porting

The selector numbers and the structures they carry are written twice — once in the shim
(`userland/tools/mesa/redwood-drm/`) and once in the kernel — rather than shared through one header.
That is how a `dma.control`-shaped bug happens: both sides compile, and a field is read at the wrong
offset. When chiron's layer is written, the two should include the same header.
