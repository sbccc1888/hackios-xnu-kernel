# DCFG 速度问题：时序决定的后果

`DCFG` 低 3 位是设备速度，实测驱动设为 `4 = SuperSpeed`，而 chiron 是纯 USB2 硬件。

**本文件记录这个问题的时序后果，以及为什么"事后纠正"可能不够。**

---

## 1. 已确认的事实链

```
dwc3/gadget.c:  switch (maximum_speed) {
                    case HIGH:  HIGHSPEED
                    case SUPER:  fallthrough
                    case UNKNOWN: fallthrough
                    default:     SUPERSPEED     ← 走这里
                }
```

`maximum_speed` 未设定 → 走 default → 设 `DCFG = 4 (SuperSpeed)`。

`maximum_speed` 是驱动内部结构体字段，**`UsbInit` 和 `UsbConfig` 协议都不带速度参数**
（两者都只有 `core_num` / `mode_type`），所以 loader 无法通过协议告知。

---

## 2. 执行时序

```
7134  USB->start_ex(&set)
        └─ 驱动内部：DCFG = SuperSpeed，然后按 SS 配置端点
7165  snap B            ← DSTS spd 4（此时 DCFG 仍为 SS，快照在纠正之前）
7198  chiron_dwc3_highspeed()   ← 我们才把 DCFG 改成 HighSpeed
```

**快照 B 的 `spd 4` 不能作为"纠正无效"的证据**——它是在纠正之前读的。
这一点容易误判，因为日志里 `dwc3: DCFG after 80800 speed 0` 出现在 `snap B` 之后。

---

## 3. 后果：事后纠正可能太晚

`start_ex` 内部做了三件事（来自 `UsbDeviceDxe.efi` 的字符串顺序）：

```
UsbDevDescInitDescriptors
configure and enable endpoints       ← 此时 DCFG 是 SuperSpeed
initialize state machine
Start USB Controller
```

**如果端点是在 SS 模式下配置的，那么之后的 DCFG 修正只是改了速度字段，
端点的内部配置可能仍按 SS 语义完成。**

这可以解释：
- 控制器报告成功
- 链路能起来（PHY 层面工作）
- 但控制传输从未完成

---

## 4. 可行的干预点

| 位置 | 可行性 |
|---|---|
| 通过 `UsbInit`/`UsbConfig` 协议告知速度 | **不可行**——协议无此参数 |
| 在 `start_ex` 之前写 `DCFG` | **无效**——驱动会在内部重写 |
| 在 `start_ex` 之后写 `DCFG` | **已实现**，但可能太晚 |
| 修改驱动读取的平台配置 | 需要找到数据来源，尚未定位 |
| 用 `usb_manual_mode` 完全绕开驱动 | 现有模式，但失去厂商协议栈 |

---

## 5. 待验证

`GHWPARAMS3` 的 `SSPHY_INTERFACE`（bits 6:7）：

- **为 0** → 硬件无 SS PHY，驱动默认值错误，事后纠正可能是唯一途径，
  但需要在 `start_ex` **之前**找到干预方法
- **非零** → 硬件确有 SS 能力，则 `DCFG = 4` 是合理的，
  `DSTS spd 4` 也就不是问题，方向要重新考虑

**这一个字段决定整个方向。**

---

## 6. 方法记录

写这份文档时差点犯一个错误：把快照 B 的 `spd 4` 当成"纠正无效"的证据。
实际读代码发现纠正发生在快照**之后**。

**规则：任何从日志里读出的"矛盾"，先核对两条日志的先后顺序，
再确认产生它们的两段代码的先后顺序。** 日志顺序和代码顺序不一定一致。
