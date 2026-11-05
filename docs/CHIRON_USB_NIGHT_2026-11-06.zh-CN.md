# 2026-11-06 夜班最终报告（至 07:00）

**目标**：让 chiron 的 loader 在 PC 侧枚举出 USB 设备。
**结果：未达成。** 但把失败点从"到处都是问题"缩小到一个具体的、可命名的位置。

---

## 一、今晚最重要的突破

### 1. 找到并修好了 4 小时失联的真正原因

上一份日志抓到了崩溃：

```
UEFI EXCEPTION type=0 elr=9bfa66b0 esr=96000007 far=48 lr=a10033e0
```

而 `exception_handler()` 结尾是 `for(;;)`。**一次 `usb_probe=1` 运行崩在固件里，
异常处理器把手机永久停住——这就是那 4 小时。**

**已修（`9306a50`）**：异常后默认重启，`halt=1` 保留旧行为。
**验证**：今晚之后每次运行，手机都在 50 秒内自动回到 adb。

### 2. 事件环第一次被建立

```
ring: adr 0 sz 0 | write test a5a50000
ring: programmed by the loader at a102e000 siz 400
evt: armed devten now f ring adr a102e000 sz 400  ring present
```

今晚之前 `GEVNTADR` 一直是 0。现在它指向 loader 自己的静态缓冲区。

### 3. 核心第一次运行，链路第一次到 U0

```
snap A-before-start_ex  run 1 hlt 0 lkst 0 conn 0
late: driver left the core RUNNING  run 1 hlt 0 lkst 0 spd 0 evt 18
```

`run 1 hlt 0` + `lkst 0`（U0）+ `evt 18`（事件在累积）——三项从未同时成立过。

### 4. StartEx 的失败点被定位到第 5 步

用 `usb_probe_steps=1` 逐段复现 StartEx 自己的调用序列：

```
step: locate UsbFnIo            0
step: AllocateTransferBuffer    0
step: DetectPort                8000000000000006   <- EFI_NOT_READY
step: GetEndpointMaxPacketSize  0  mps 0
```

**修好后：**

```
usbfn: reinstalled table with SDP DetectPort -> 0
step: DetectPort                0  port 1        <- SDP
step: GetEndpointMaxPacketSize  0  mps 200       <- 512
step: ConfigureEnableEndpoints  left to start_ex
```

StartEx 从第 3 步推进到第 5 步。

---

## 二、修复清单（每一条都有日志验证）

| # | 缺陷 | 提交 |
|---|---|---|
| 1 | 异常处理后 `for(;;)` 永久停机 | `9306a50` |
| 2 | 最终退出路径 `for(;;)` | `c42a676` |
| 3 | 选控器丢弃外设控制器 | — |
| 4 | `clone` 路径不可达 | `c6d3e79` |
| 5 | 事件环从未建立（loader 现在自己建） | — |
| 6 | 核心从未运行（loader 现在自己启动） | — |
| 7 | 链路在 `start_ex` 之后才建立（顺序错） | — |
| 8 | `DetectPort` 循环依赖（拷贝表 + reinstall） | `bafb2dc` |
| 9 | `EFI_USB_BUS_SPEED` 枚举值用错（High 是 3 不是 2） | `bafb2dc` |

第 9 条值得单独说：第一次写 `usbfn_mps_hs` 时我假设 `1=Full, 2=Low`，
实际是 `0=Unknown, 1=Low, 2=Full, 3=High, 4=Super`。
后果是 `elr=a100bf98 esr=0x96000047 far=8`——我自己的函数解引用了 `size=8`。
**通过反汇编崩溃地址找到的，不是猜的。**

---

## 三、当前精确卡点

```
snap A-before-start_ex  run 1 hlt 0 lkst 0 conn 0     <- 一切正常
usb: start failed 8000000000000002                     <- EFI_DEVICE_ERROR
```

StartEx 的七步，现在过了四步：

| 步骤 | 状态 |
|---|---|
| locate UsbFnIo | ✅ |
| AllocateTransferBuffer | ✅ |
| DetectPort | ✅（拷贝表回答 SDP） |
| GetEndpointMaxPacketSize | ✅（拷贝表回答 512/64） |
| **ConfigureEnableEndpoints** | ❓ |
| **UsmInitialize** | ❓ |
| **Start USB Controller** | ❓ |

`ConfigureEnableEndpoints` 无法从外部探测——**在驱动自己的启动流程之外调用它，
固件内部会空指针崩溃**（`elr=0x9bfa6600 far=0x50`）。

### 关键的对照实验

`usb_no_epcfg=1 usb_skip_start=1` 去掉所有干预（不配端点、不启动控制器、
不建环、不碰 RunStop）：

```
usb: endpoint config left to UsbDeviceDxe
usb: manual core start skipped; left to start_ex
usb: start failed 8000000000000002
```

**和其他所有配置的结果完全一样。**

**结论：loader 干预厂商栈不是失败的原因。** 无论干预、不干预、全做、全不做，
`start_ex` 都返回 `EFI_DEVICE_ERROR`。

---

## 四、根因判断

**`DWC3_DEV` 实例从未被 `UsbFnDriverBindingStart` 自己的路径填充。**

HK6 的做法是：安装一个克隆的 USB Config 记录，然后 `connect_controller`
让驱动绑定到它。**于是 binding start 看到一个不是它创建的控制器。**

后果是一个规律：**凡是依赖内部状态的入口点都失败，凡是纯查表的都成功**——
而纯查表的那两个，正是我必须用拷贝表绕过的两个。

---

## 五、下一步（明确的单一方向）

**用厂商的 `ConfigUsb` API**——ios-party 静态定位在 RVA `0x1514`，实现 `0x3990`。

它与 `StartController` 的关键区别：

- `StartController`（`0x4a24`）：在 `0x4b2c–0x4b88` 有静态模式替换，
  请求 peripheral 却得到 host，然后 `0x4b8c–0x4b9c` 比较相等就返回成功
- `ConfigUsb`（`0x3990`）：`0x3acc` 直接比较 mode 4，`0x3ae0` 调用 `InitDevice`，
  **不经过模式替换**

**厂商 DWC3 驱动自己的 Start 用的正是这条路径。** 这就是为什么原厂栈能在这台手机上
把 gadget 跑起来，而模仿它协议表面的 loader 不能。

---

## 六、硬件事实（今晚首次确定性获得）

```
env ENTRY: ghw0 4020400a ghw1 162493b ghw3 10420085 ghw6 7ea0020
env ENTRY: hsphy_if 1 ssphy_if 2  superspeed phy present
```

- **`GHWPARAMS0 = 0x4020400a`**，bits 15:8 = `0x40` = **64 个事件缓冲**
- **`GHWPARAMS3 = 0x10420085`**，`SSPHY_INTERFACE` (7:6) = 2，**确有 SuperSpeed PHY**

**这关闭了任务清单第 4 项，"没有 SS PHY"的推测是错的。**

### 真机固件与手上的源码不是同一份

构建产物暴露了真机路径：

```
/work/home/jenkins/16859_OXYGEN_Q_MP_OU_USER/MODEM/MSM8998/msm8998/boot_images/
    QcomPkg/Drivers/UsbfnDwc3Dxe/UsbfnDwc3.c  (+UsbfnDwc3Impl.c, UsbfnDwc3Ch9.c, UsbfnCtrlSmImpl.c)
```

而 `Mu-Silicium/Silicon/Samsung/SamsungPkg/Drivers/UsbfnDwc3Dxe/` 下的
`UsbfnDwc3Dxe.c` + `Dwc3Core.c` 是 Samsung 移植版。差异：

| | Samsung 移植版 | 真机 MSM8998 |
|---|---|---|
| 入口 | `InitUsbfnDwc3Driver` | `EfiEntry` |
| StartController | 有 | **函数列表里没有** |
| 事件环 | `Dwc3EventBufferSetup` | `Dwc3ConfigureEventBuffer` |
| depex | — | `06 08` = `TRUE,END` |

**`chiron` 的 `UsbfnDwc3Dxe.depex` 只有 2 字节**，而 equuleus 等是 288 字节含 16 个 GUID。
**loader 里那张 15 项依赖表是抄别的机型的，`MISSING dep01` 是假警报。**

---

## 七、方法记录

**今晚反复出现同一个错误：从日志标签推断含义，而不先读产生它的代码。**

| # | 我以为 | 实际 |
|---|---|---|
| 1 | `0xc0`/`0xc4` 写入失败 | 固件让它们为 0 |
| 2 | `run`/`hlt` 位不存在 | 数据一直在，看漏了 |
| 3 | `wtest` 行 = 写失败 | 写入成功，`0x5a&~0x40=0x1a` |
| 4 | `GHWPARAMS` 在 `0xC100` | 实际 `0xC140` |
| 5 | `spd` 是链路速度 | 读的是 DCFG |
| 6 | `StartController` 分配环 | 真机驱动无此函数 |
| 7 | 总线速度 `1=Full,2=Low` | 实际 `3=High` |
| 8 | 进程内 `USB` 指针替换够用 | `StartEx` 自己 `handle_protocol`，必须 `reinstall` |

**规则**：任何从寄存器或日志读出的值，先找到产生它的那一行代码，再解释它的含义。

**另有一条反过来的教训**：第 9 条（枚举值）是靠**反汇编崩溃地址**找到的，
不是靠读源码。当崩溃地址落在自己代码里时，反汇编比读源码更快。
