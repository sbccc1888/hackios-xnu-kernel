# 一个真正跑通的 a5xx XNU GPU 驱动 —— 从 patch 里能读到什么

> 来源：`joranv1/ios-sailfish`（Google Pixel 2016，MSM8996，**Adreno 530**，a5xx）
> 项目页：https://hackiosx.dev/projects.html → "Community ports"
>
> **重要前提**：`bsd/dev/sweet_gpu.c` 和 `iokit/Kernel/arm/SweetGPU.cpp` **没有发布**——
> 两个仓库的树里都没有这个文件，30 多个 patch 是对它的修改（diff），新建 patch 不在其中。
> 所以能读到的是**改动上下文 + 新增代码**，不是完整源文件。下面区分「实测结论」和「代码片段」。

---

## 一、为什么这个参考比厂商 Linux 驱动更值钱

| | 厂商驱动 (`kernel_msm8998`) | sailfish |
|---|---|---|
| 运行环境 | Linux + regulator framework + IOMMU 框架 | **XNU**，无框架 |
| GPMU | 有，且启用 | **不启动**（`0127` 注释 "GPMU firmware left out"） |
| 目的 | 完整功能 | 只要有东西能画 |
| 验证 | — | **在真机上跑通了锁屏/桌面/60Hz** |

**处境相同**才是关键：同样没有 RPMh 客户端、同样没有 IOMMU 框架、同样是 a5xx。

---

## 二、七条实测结论（这些是"别人真机跑出来的"，不是推导）

| # | 问题 | 实测答案 | 出处 | 对我的影响 |
|---|---|---|---|---|
| 1 | SMMU 需要上下文吗？ | **需要**。`"firmware ignores sCR0.CLIENTPD (bypass) and the stream starts as FAULT (S2CR0 0x000200ff), the first CP fetch reset the phone"` | `0121` | **推翻了我的核心假设**，新增 step 6b |
| 2 | 64 位地址模式一个够吗？ | **不够**。`"the CP alone was not enough: the 0127a blit faulted at the source PA's low 32 bits"` | `0128` | step 3a 的 12 个寄存器是对的 |
| 3 | 内部电源岛可以省吗？ | **不行**。`"without them the CP hung on the first 2D blit (RBBM_STATUS c00001c3)"` | `0127` | 新增 step 3a2 |
| 4 | 能不用 zap 退 secure 吗？ | **不能**。`"writing RBBM_SECVID_TRUST_CNTL = 0 (mainline's no-zap-shader path) reset the phone"` | `0125` | step 3c 改为只读 + opt-in |
| 5 | GPMU 必需吗？ | **不**。最终没有加载 GPMU 固件 | `0127` | 证实 step 5 可选 |
| 6 | SMMU 寄存器能普通 store 吗？ | **不能**。`"a trapped str wzr stalled the CPU"` | `0124` | `wr()` 已正确（值总在寄存器里） |
| 7 | 图形 rail 要 RPMh 吗？ | **不要**。直接经 SPMI 写 S2 regulator（固定 745 mV） | `0119` | 是缺驱动，不是硬限制 |

---

## 三、能拿到的完整代码：SMMU identity map（`0121`）

这是**新增代码**（不是 diff 上下文），所以完整可读，我已照抄进 `chiron_adreno.c` 的 `step_smmu_identity()`。

```c
/* GPU SMMU (ARM SMMUv2, 2 context banks, 4 KB pages, CBs from 0x8000) */
vm_offset_t gr1 = smmu + 0x1000, cb = smmu + 0x8000;
uint64_t *l1 = (uint64_t *)pt_va;
for (uint64_t gb = 2; gb < 8; gb++)
        l1[gb] = (gb << 30) | 1u | (1u << 6) | (2u << 8) | (1u << 10);   /* 1 GB blocks, DRAM */

wr(cb, 0x0, 0);                                 /* SCTLR off while configuring */
wr(gr1, 0x0, 1u << 16);                         /* CBAR0: S1 translate, S2 bypass */
wr(gr1, 0x800, 1u);                             /* CBA2R0: VA64 */
wr(cb, 0x10, (7u << 15) | 1u);                  /* TCR2: PASIZE 36 bit */
wr(cb, 0x30, 28u | (1u << 23));                 /* TCR: T0SZ 28, TG0 4K, EPD1 */
wr(cb, 0x38, 0x44u);                            /* MAIR0: normal non-cacheable */
wr(cb, 0x20, (uint32_t)pt); wr(cb, 0x24, (uint32_t)(pt >> 32));
wr(cb, 0x58, 0xffffffffu);                      /* FSR: clear */
wr(cb, 0x0, (1u << 5) | (1u << 2) | (1u << 1) | 1u);   /* CFRE AFE TRE M */
wr(smmu, 0x800, (1u << 31) | (0x7fffu << 16));  /* SMR0: any stream */
wr(smmu, 0xc00, 0);                             /* S2CR0: translate, CB0 */
wr(smmu, 0x68, 0);                              /* TLBIALLNSNH */
wr(smmu, 0x70, 0);                              /* sTLBGSYNC */
poll(smmu, 0x74, 1u, 0, 10);                    /* wait TLBGSYNC */
```

判据（他们的，我照抄）：`synced && SMR0 == 预期 && (S2CR0 & 0x300ff) == 0 && (CBAR0 & (3<<16)) == (1<<16)
&& (SCTLR & 0x27) == 0x27 && TCR == 预期 && TTBR0 == pt`。

---

## 四、M8 的关键：用户客户端 ABI（`0138`、`0150`）

### GPU VA 空间管理（可直接借鉴的设计）

```c
#define GVA_BASE    ...          /* GPU 地址空间起点 */
#define GVA_CHUNKS  ...          /* 2 MB 一块 */
static uint16_t  g_chunk_first[GVA_CHUNKS];   /* 这块属于哪个映射的第一个 chunk */
static uint64_t *g_map_pa[GVA_CHUNKS];        /* 映射的物理页表 */
static uint32_t  g_map_npages[GVA_CHUNKS];
```

**要点**：映射以 **2 MB chunk** 为单位记账，每个映射记录自己的物理页数组。
好处是 `vm_range(va, len)` 能在 O(1) 内判断「这个 VA 范围是否被某个映射完整覆盖」——
**这正是 `redwood_gpu_map()` 需要的语义**。

### 同步提交 + 缓存维护的模式

```c
lck_mtx_lock(&sweet_gpu_vm_lock);       /* 同时保住两个映射 + 串行化 ring */
int sf = vm_range(q->src_va, slen), df = vm_range(q->dst_va, dlen);
if (sf < 0 || df < 0) { unlock; return EFAULT; }
vm_cache(sf, q->src_va, slen);          /* clean+invalidate 按物理页做 */
vm_cache(df, q->dst_va, dlen);
```

**要点**：**先锁 → 验证范围 → 刷缓存 → 提交**。缓存刷的是**物理页**（`g_map_pa[first][p]`），
不是内核 VA —— 因为 GPU 读的是物理内存。

### 参数校验的严格程度（值得照抄）

```c
if (src_w == 0 || src_w > 16384 || src_pitch % 64 || src_pitch < src_w * 4 ||
    (src_va & 63) || x0 >= dst_w || w > dst_w - x0) return EINVAL;
```
- 宽高上限
- **pitch 必须 64 字节对齐**（Adreno 的要求）
- VA 必须 64 字节对齐
- 目标矩形不能越界（用的形式是 `w > dst_w - x0`，**防溢出**）

---

## 五、sailfish 的完整 GPU patch 谱系

| patch | 内容 | 对我 |
|---|---|---|
| 0119 | 电力探针（PMIC rail、GDSC、时钟） | step 2 参考 |
| 0120 | CP 测试 | step 3/4 参考 |
| 0121 | **SMMU identity** | ✅ 已照抄 |
| 0122/0123 | SMMU 追踪、stream0 | 诊断参考 |
| 0124 | **MMIO 不能经 wzr** | ✅ 已符合 |
| 0125 | **不写 TRUST_CNTL** | ✅ 已改 |
| 0126 | 2D blit | M8 |
| 0127 | **RB/CCU + SP 电源岛** | ✅ 已照抄 |
| 0128 | **64 位地址块（12 个）** | ✅ 已符合 |
| 0129 | 试退 secure（失败） | ✅ 已改 |
| 0130 | **zap shader**（TZ PAS 13，a530_zap，carveout） | M7 |
| 0131 | **compute**（SSBO + dispatch） | M8 / Metal Compute |
| 0133 | blend 内核 | 参考 |
| 0136 | 纹理 quad | 参考 |
| 0137 | **GPU VA 空间** | ✅ 已读，M8 |
| 0138 | **用户客户端**（640 行） | ✅ 已读，M8 |
| 0150 | **bo submit**（947 行） | M8 |
| 0164 | present 600MHz | 参考 |

---

## 六、zap shader（`0130`）：M7 的现成答案

```c
#define ZAP_PA      0x90f00000u     /* msm8996.dtsi gpu_mem, 1 MB */
#define ZAP_SIZE    0x00100000u
#define GPU_PAS_ID  13
```
- 用 **`a530_zap`**（不是 a540 —— 但 chiron 是 a540，要用 `a540_zap`）
- 用手机的 **`gpu_mem` carveout**（1 MB，在 iOS DRAM 之外）
- **流程**：TZ PAS 13 加载 → ring 命令退 secure

### chiron 的 zap 地址：查清了两件事，结论和最初的猜测不同

**第一件：chiron 没有 `gpu_mem` carveout。**

```
$ grep gpu_mem /root/chiron.dts                       → 无
$ dtc -I dtb -O dts Android-chiron.dtb | grep gpu_mem  → 无（qcom,gpu-mempools 是内存池，不是 carveout）
```

**所以 MSM8996 的 `gpu_mem` 不是 a5xx 通用的**，chiron 上不存在。

**第二件：8998 的 secure 区是 GPU 全局地址空间顶端 256 MB**（`kgsl_iommu.h:34-37`），
而 a540 有 `ADRENO_64BIT`（`adreno-gpulist.h:247-249` 的 features 里有），所以用 64 位基址：

```
KGSL_IOMMU_GLOBAL_MEM_BASE64 = 0xfc000000
KGSL_IOMMU_SECURE_SIZE       = 0x10000000   (256 MiB)
KGSL_IOMMU_SECURE_BASE       = 0xec000000
```

**第三件（关键，推翻了我一度想改的方案）：`0xec000000` 是 GPU 虚拟地址，不能给 TrustZone 用。**

`kgsl_iommu.c:249-253`：
```c
void kgsl_add_global_secure_entry(struct kgsl_device *device, struct kgsl_memdesc *memdesc)
{
	memdesc->gpuaddr = KGSL_IOMMU_SECURE_BASE(&device->mmu);   /* ← GPU 地址空间里的位置 */
	kgsl_global_secure_pt_entry = memdesc;                      /* ← 物理页由 memdesc 自己带着 */
}
```

而 `PAS_MEM_SETUP` 收到的参数，厂商写得很清楚（`subsys-pil-tz.c:648-675`）：

```c
static int pil_mem_setup_trusted(struct pil_desc *pil, phys_addr_t addr, size_t size)
...
	desc.args[0] = d->pas_id;
	desc.args[1] = addr;          /* phys_addr_t —— 物理地址 */
	desc.args[2] = size;
	desc.arginfo = SCM_ARGS(3);
	scm_call2(SCM_SIP_FNID(SCM_SVC_PIL, PAS_MEM_SETUP_CMD), &desc);
```

**TrustZone 只要「物理地址 + 长度」，它不知道也不关心 GPU 的虚拟地址空间。**
`0xec000000` 是给 *GPU 硬件* 看的映射位置，物理页是另外分配并映射上去的。

### 对 chiron 的结论

**`chiron_zap_mem=<物理地址>` 的设计是对的，不需要改成从 secure 窗口取。**
我一度在文档里写"应该从 256 MB secure 窗口取"——**那是错的**，因为那个窗口是 GPU VA。

真正需要的是：**一段 chiron 上真实可用、且没有被别的东西占用的物理内存**，长度 1 MB
（`KGSL_IOMMU_SECURE_SIZE` 的上限足够，实际 zap 镜像远小于 1 MB）。
这仍然只能由 loader 提供，或者由内核用 `kmem_alloc` + `kvtophys` 自己给——
后者其实更简单，且不需要 boot-arg。**这是 M7 时应该优先试的路子。**

顺带确认：我的 PAS 调用编码与厂商一致——
`args[0]=pas_id, args[1]=addr, args[2]=size, arginfo=SCM_ARGS(3)`，
我的 `SCM_THREE_VALUES` + `(PAS_GPU, zap_memory, 0x1000)` 正是这个形状。

---

## 七、对我的驱动意味着什么（结论）

### 已经修正的（本轮）
1. step 3c 从"写入"改为"只读 + opt-in" —— **避免重启手机**
2. 新增 step 3a2（内部电源岛）
3. 新增 step 6b（SMMU identity map）
4. 文档里把"恒等映射"假设划掉并写明实测反驳

### M8 可以照抄的设计
1. **2 MB chunk 的 GPU VA 记账** —— `vm_range()` 的语义正是 `redwood_gpu_map()` 要的
2. **先锁 → 验范围 → 刷物理页缓存 → 提交**
3. **参数校验的严格程度**（pitch/VA 64 字节对齐、越界用减法形式）

### 还需要确认的
1. **chiron 的 `gpu_mem` carveout 在哪**（决定 `chiron_zap_mem` 怎么给）
2. sailfish 的 `0126`/`0131` 里 blit/compute 命令流的具体形式（M8）

---

## 八、诚实说明

- 我**没有** `sweet_gpu.c` 的完整源码。能看到的是 patch 里的新增片段和改动的上下文行。
- 上面的"实测结论"是**他们写在注释里的观测**，我引用原文。
- 他们的硬件是 **Adreno 530 / MSM8996**，不是 **Adreno 540 / MSM8998**。同代不等于同型号：
  GMEM 大小、highest-bank-bit、CP 队列门限这些 a540 特有的值，我仍用 a540 自己的厂商代码。
