# EP0 的 TRB 环大小：单条目是否合法

## 我们现在的做法

`chiron_ep0_init()` 分配 4096 字节给 `out_trb`，但 `arm_setup()` 只用 `out_trb[0]` 一个条目：

```c
memset(g_ep0.out_trb, 0, sizeof(chiron_trb));       // 只清 16 字节
chiron_trb_set(&g_ep0.out_trb[0], ...);             // 只写一个
```

## Mi 6 的两处检查，要求不同

**`DWC3Transfer.h:55`（普通端点）**
```cpp
if (ep >= controller.endpointCount() || !memory ||
    (reinterpret_cast<uintptr_t>(memory) & 15) || count < 1 || count > 64 || ...)
```
→ **`count < 1`，单条目合法。**

**`DWC3Control.h:114`（EP0 专用）**
```cpp
!allocation.outTRBs || !allocation.inTRBs || allocation.trbCount < 2 || allocation.trbCount > 64
```
→ **`trbCount < 2`，EP0 必须至少 2 个。**

## 为什么 EP0 要 2 个

`DWC3Control.h:121` 按 `trbCount * sizeof(TRB)` 计算环大小。EP0 的控制传输是三个阶段
（Setup → Data → Status），虽然 Mi 6 每次只提交一个 TD，但环容量为 1 时控制器可能
无法区分「环已满」和「环为空」——DWC3 的环形队列通常需要至少 2 个可分辨状态。

## 是否要改

**暂不改。** 理由：

1. 单条目在 `submit` 路径上是合法的（`needed = count ? count : 1`，末条带 `Last|InterruptComplete`）
2. 改环大小要动 `chiron_ep0_init` 的分配、`arm_setup` 的 memset 长度、
   以及 `chiron_ep0_submit` 的 ring 复用逻辑——**多处联动**
3. 手机已经连续 6 轮不可用，**无法验证任何改动**

在不能测试的情况下做多处联动改动，只会让下一次测试更难归因。
先验证已有的六项修复（尤其 cache clean 和 STATUS 阶段），如果仍不行再考虑这一项。

## 恢复测试的顺序

1. 刷 P5，看 `ep0: take-back owned %x ... DEPSTAR %x` 这行
   - `owned 1` + `unmoved` → 控制器没取，考虑改环大小（本文档）
   - `owned 0` + 无事件 → 事件丢失
   - `owned 0` + 有事件 → 通了
2. 若 Setup 到达但传输断在回复 → 检查 STATUS 阶段（已修，验证是否生效）
