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

## 5. What each step's failure means on real hardware

A table written for whoever runs this on a phone, so that a failure points somewhere.

| Symptom | Most likely meaning | Where to look |
|---|---|---|
| Step 1: all 15 GPUCC registers read `0xffffffff` | the hypervisor or XPU refuses this kernel the GPU's clock controller | the `kgsl-hyp` node; compare against what the vendor kernel is allowed |
| Step 1: `gcc_gpu_cfg_ahb_clk` never clears `bit31` | the GPUCC register bus is not being clocked, so nothing behind it can answer | the GCC node's protected clocks |
| Step 1: registers do not repeat between two reads | no real bus there — wrong base address, or the mapping is not what it seems | the device tree's `reg` |
| Step 1: PLL `LOCK` clear but everything else fine | **not necessarily a fault** — the boot loader may leave the PLL idle | step 2 programs the rate; watch step 2 |
| Step 2: CX GDSC `bit31` never sets | the CX rail has no voltage — Linux raises it through RPMh and this kernel has no RPMh client | §6, "what XNU cannot do" |
| Step 2: GDSCs report on but the always-on counter never moves | the switches obeyed and the block is still dead: **almost always the rail** | same |
| Step 2: counter moves but slower than 19.2 MHz | the crystal is not reaching the block at full rate, or the interval measured is longer than intended (loop overhead only ever lengthens it) | the ratio is printed; a value *below* 1000 is the interesting one |
| Step 3: `CP_HW_FAULT` ≠ 0 | the micro engine started and refused something — most often an instruction base address it cannot read | step 6: is the GPU's stream bypassed? |
| Step 3: no CP busy bit ever seen | **not proof of failure** with an empty ring; a parked engine looks idle | step 4 is the real test |
| Step 4: RPTR never moves at all | the engine is not fetching: either it is not running, or the ring's address is not one it can read | step 6 first, then step 3 |
| Step 4: RPTR moved part way and stopped | the engine *is* fetching and choked on the packet it stopped at | the packet built there; check its parity word by hand |
| Step 5: no `0xBABEFACE` | the GPMU did not start. `GENERAL_1`, `RBBM_INTR_INFO`, `CP_HW_FAULT` and `RBBM_STATUS` are all printed raw | firmware version (§6) |
| Step 6: stream 0 is **not** `BYPASS` | **steps 3–5's addresses will not mean what the driver thinks** — this is the explanation for a step 3/4 failure, not a separate problem | a translation context has to be built |
| Step 6: `sGFSR` ≠ 0 | something already faulted through this SMMU, possibly before this kernel ran | `sGFSYNR0/1` are printed |

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

**Resetting the GPMU** after a bad start. There is no path back; a wrong firmware image wedges it until
the phone reboots. This is why step 5 checks the version first.

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
