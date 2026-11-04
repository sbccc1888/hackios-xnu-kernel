# chiron USB 设备枚举排查记录

Mi MIX 2（chiron / MSM8998 / Snapdragon 835）上 HackiOS loader 的 USB 外设枚举问题，
本轮排查的完整记录。硬件：DWC3 控制器 + QUSB2 PHY，micro-USB，USB2-only。

**状态：未解决。** 本轮结束时枚举仍未成功，但排查范围已从"整个 USB 子系统"收敛到
具体几处，且每一条结论都有可复现的证据。

---

## 1. 已经跑通的部分

移植 `to-mid/ios-party` 的 HK6 握手后，peripheral 协议栈第一次在这台机器上组装成功：

```
hk6: USB Init 0                  UsbInitDxe 协议存在
hk6: DWC3 driver binding ok      按镜像 size 0x15000 识别（唯一此大小）
hk6: query core 0
hk6: core 0 modes 3              支持 host | peripheral
hk6: start peripheral 0          StartController 返回 0
hk6: UsbFnIo after start         USB Function IO 首次安装
usbfn: ConfigureEnableEndpoints 0
usbfn: start_controller 0
```

HK6 的价值在于它绕开了 vendor `UsbConfigDxe` 的一个私有策略：
`0x4b2c–0x4b88` 会用静态模式覆盖调用者请求的模式，`0x4b8c–0x4b9c` 在"当前==目标"时
直接返回成功并跳过 `0x4c50` 的 peripheral `ConnectController`。这解释了为什么早期
调用 `StartController` 一直返回 0 却什么都没发生。

---

## 2. 最关键的实测数据：工作状态下的寄存器快照

在 loader 入口（fastboot 刚释放端口）抓取的完整 PHY 映射。这是本轮所有判断的基准。

```
0x0b4  PORT_POWERDOWN   0x19
0x0c0  UTMI_CTRL1       0x00
0x0c4  UTMI_CTRL2       0x00
0x184  pll_lock_delay   0x0a
0x18c  pll_clk_inverter 0x7c
0x1a0  PLL status       0x17   (ready 置位)
0x210  PWR_CTRL1        0x22   (已上电, clamp 已释放)
0x22c  INTR_CTRL        0x00
0x230  INTR_STAT        0x00
0x23c  TUNE1            0x45
0x240  TUNE2            0x09
0x24c  TEST1            0x90
```

### 两个序列的对照

| 寄存器 | v1 (`msm8998.dtsi` / 仓库里的 `chiron.dtb`) | v2 (`msm8998-v2.dtsi`) | **实测** |
|---|---|---|---|
| `0xb4` | 无此项 | `0x19` | **`0x19`** |
| `0x23c` | `0xf0` | `0xa5` | **`0x45`** |
| `0x240` | `0x0f` | `0x09` | **`0x09`** |

`0x45` 恰好是 `qusb_phy_get_tune1_param()` 处理 `0xa5` 的结果：

```
(0xa5 & 0x0f) | (4 << 4) = 0x05 | 0x40 = 0x45
```

**结论：运行中的固件用的是 v2 序列，并且叠加了 efuse trim（这颗芯片是 4）。**

仓库里 `Mu-Silicium/Resources/DTBs/chiron.dtb` 的 v1 值不是这台 bootloader 实际运行的
内容。**实测寄存器值优先于任何 DTB 文件。**

---

## 3. DWC3 链接状态的时间序列

```
0-ENTRY    run 0 hlt 1 lkst 4 spd 0     fastboot 已释放端口
A-before   run 1 hlt 0 lkst 4 spd 4     loader 启动核心
B-after    run 1 hlt 0 lkst 4 spd 4     start_ex 之后
C-in-loop  run 1 hlt 0 lkst 0 spd 0     一秒后
```

`lkst 0` = U0（链路激活），`spd 0` = 高速。

**U0 + 高速只在主机发出 bus reset 并完成 chirp 之后出现。**

而 `DCFG.DEVADDR`（bits 9:3）读到 **0**。

### 这两条放在一起的含义

不是"主机没看到设备"，而是：

**主机看到了设备、复位了它、完成高速握手，然后停住了 —— `SET_ADDRESS` 没有跟进。**

在 USB 枚举里，设备经过 reset 后主机先发 `GET_DESCRIPTOR(Device)`；设备必须通过 EP0
应答，主机才继续 `SET_ADDRESS`。地址停在 0 说明**描述符交换从未完成**。

---

## 4. 谁负责应答 EP0

`UsbDeviceDxe.efi` 的二进制里有：

```
UsbDeviceHandleEvent
%a: UsbfnIo EventHandler failed: %r
EfiUsbMsgSetupPacket
Dev_Common_SetupPkt
Dev_Configured_SetupPkt
```

以及 `UsbFnIo` 的 GUID 在 `0xa0a0`。固件头文件印证了这个分工：

> `EFI_USBFN_IO_EVENTHANDLER`: "notification on **setup packet on endpoint 0**"
> "A class driver **must call EventHandler() repeatedly**"

**所以 EP0 由 `UsbDeviceDxe` 应答，前提是有人持续调用 `USB->handle_event()`。**

---

## 5. 找到的问题清单

### 5.1 这些是确定的错误

| 问题 | 表现 | 修复 |
|---|---|---|
| `UsbfnEndpointBulk = 1` | 固件是 `0x02`，等于告诉驱动"这是同步端点" | `88c4f23` |
| 上电顺序 | HK6 在无时钟/无电/复位态下启动控制器 | `a8613f4` |
| GDSC 地址 `0x175000` | 实际在 `0x10F004`（DTB 明写 `gdsc_usb30`） | `dd1a459` |
| USB 块复位从未释放 | DTB 的 `core_reset` = `0x10F000` 等四条，从未处理 | `3111d93` `44cd468` |
| 写 `UTMI_CTRL1/2` | 工作硬件这两个是 `0x00`，由控制器驱动 | `df2fc71` |
| `bcdUSB = 0x0210` + BOS | 声称 LPM，但 chiron 不是 SuperSpeed 能力 | `02f3807` |
| `StartController` 顺序 | 固件文档：它只初始化硬件，"不激活端口" | `b870cbe` |
| 事件泵被计数门控 | 用 `GEVNTCOUNT` 门控会挡住 SETUP 包 | `4735b86` |

### 5.2 我自己引入又修掉的

- `usb_probe` 连调 8 次 `handle_event` → **手机失联的直接原因**（该调用无事件时不返回，
  卡在里面连 `reboot()` 都跑不到）。改为纯寄存器探针。
- 给 `usb_poll_command` 加 `GEVNTCOUNT` 门控 → 堵住了枚举必需的 SETUP 包通路。
- 依据内核源码的 `msm8998-v2.dtsi` 改序列，又依据 `chiron.dtb` 改回 v1 → 两次都不对，
  实测数据才是准的。

---

## 6. 现在站得住的判断

```
上电：clocks → GDSC(0x10F004) → BCR 四线 assert→deassert → PHY(按实测值)
启动：HK6(UsbInitStartController) → UsbFnIo(start_controller → ConfigureEnableEndpoints)
运行：主循环每轮 pump USB->handle_event
```

PHY 写入的值现在与工作硬件逐项一致：

```
写：  0xb4=0x19   0x210=0x22   0x23c=0x45(0xa5+trim)   0x240=0x09   0x24c=0x90
不写：0x22c   0xc0   0xc4
```

---

## 6.5 诊断链的闭合（后续补充）

重新解析 `prb.bin` 后，三件事被实测数据确认，且互相独立：

### 6.5.1 VBUS 和物理层不是问题

```
vbus: hs_phy_ctrl 10000000 -> 10100000    bit20 VBUS_VALID, bit28 SW_SESSVLD_SEL 置位
snap C-in-loop-1s  lkst 0 spd 0           U0 + 高速
```

U0 + 高速只在主机发出 bus reset 并完成 chirp 之后出现。**所以主机看到了设备、复位了它、
完成了速度协商。** VBUS、D+ 上拉、PHY 收发器全部工作正常。

PMIC/充电栈确实完全没初始化（`ChargerEx=0`、`QcomCharger=EFI_UNSUPPORTED`、
`get_vbus_status=EFI_NOT_FOUND`），手写的 `HS_PHY_CTRL_REG` override 绕过了这一点，
而且它是有效的。

### 6.5.2 核心一直是停止的

```
snap A-before-start_ex   run 0 hlt 1
snap B-after-start_ex    run 0 hlt 1
late                     run 1 hlt 0    只有 loader 自己写 RunStop 之后
```

`ConfigureEnableEndpoints` 和 `start_ex` **都返回 EFI_SUCCESS**，而 `DCTL.RunStop` 从未置位、
`DSTS.DEVCTRLHLT` 一直是 1。

**停止的核心不会取任何包**，因此 `GET_DESCRIPTOR` 的 SETUP 包永远不被收集。

### 6.5.3 枚举窗口在有人监听之前就关闭

```
late: run 1 hlt 0 lkst 0       核心启动, D+ 上拉
usb: device presented
usb: started
env FINAL / phy FINAL           转储 + 满屏 console 输出
usb: command loop entered
[1 秒纯自旋, 不 pump handle_event]
snap C-in-loop-1s
```

上拉一旦出现，主机在毫秒级内就会发 reset 和 `GET_DESCRIPTOR`。那 1 秒里没有
`handle_event` 调用，SETUP 包无人取走，**主机超时后不会重试**。

### 6.5.4 结论

`DEVADDR = 0` 有三个叠加的原因，全部指向同一个事实：**主机的控制请求没有被应答。**

| 原因 | 修复 |
|---|---|
| 厂商栈报告成功但核心停止 | `7a360d7` 重试 RunStop 直到 `DEVCTRLHLT` 清零 |
| 事件泵被计数门控挡住 | `4735b86` 每轮 pump |
| 枚举窗口被 1 秒空转跳过 | `537fb42` 入口即 pump |

---

## 7. 下一步的判据

一次运行看这一行：

```
prob: cap X run X addr X spd X lkst X hlt X devten X evt X
```

- `addr` 非零 → `SET_ADDRESS` 成功，枚举通了
- `addr` 仍是 0，但 `lkst 0 spd 0` → 主机 reset 了但描述符交换仍未完成
- `devten` 为 0 → 控制器没在监听事件
- `evt` 非零 → 事件环里有东西没被取走

配合 `bcr:` / `gdsc:` 两组输出，可以确定硬件是否真的从上电和复位中走出来。

---

## 8. 方法论上的教训

**权威顺序：硬件实测 > 固件头文件 > 驱动二进制字符串 > 内核源码 > 仓库里的 DTB 文件。**

这条今晚被反复违反。具体表现：

- 从驱动源码 grep 出 PHY 序列，没去看 DTB；后来看 DTB 看的是内核源码树的另一个变体
- 直到最后才去解析手上已有的寄存器快照 `map2.bin`，一次找出两个错误
- 为修一个问题引入另一个问题（事件门控），且没有硬件验证就继续叠加

在没有硬件反馈的情况下，改动的期望收益会变成负的。这一点在暂停时应当明确承认，而不是
继续产出看起来有进展但未经检验的变更。
