# chiron USB 枚举 — 完整技术交接（2026-11-08）

## 目标

让 Xiaomi Mi MIX 2 (chiron, MSM8998) 上 iOS 16.5 loader 的 USB device mode 完成枚举。

**成功判据：** Windows 设备树出现
`USB\VID_18D1&PID_D00D\xnuloader`，CompatibleIDs 含
`USB\COMPAT_VID_18D1&Class_FF&SubClass_42&Prot_03`，Service 为 WinUSB。
（Android 的 `VID_18D1&PID_4EE7` 是假阳性，不算成功。）

**当前状态：** 未达成。Windows 只能看到 `USB\VID_0000&PID_0002`（描述符请求失败）。

## 已实测有效（勿重做）

| 项 | 证据 |
|---|---|
| D+ 全程上拉 | `ln 1` |
| PHY 上电 PLL 锁定 | `210 22 1a0 17` |
| 四个 DEPCMD 命令成功 | `DALEPENA now 3` |
| 事件环安装并收到主机流量 | `ep0: raw cnt 60: 301 50301 ...` |
| `ConfigureEnableEndpoints` 成功 | 返回 `0` |
| 到达命令循环 | `usb: command loop entered (IRQ unmasked)` |
| APSS 看门狗复位 | 卡死后 130 秒自动恢复 Android |
| **EP0 的 Start 每次都成功** | `ep0: arm rc 1 DGTYPE 106`（改用驱动 DMA 分配器之后）|

## 已实测排除（勿再试）

- PHY 挂起 bit8、SUSPHY bit6、TERM_SELECT(0xC0)、RDP_UP_EN(0x74)
- GCTL 方向：`0x102000` bit13=1 bit12=0 → dir=2 (DevSS)，固件设的，读法正确
- DCFG 速度：两边都是 0 (HighSpeed)
- 强制 detach
- `usb_no_ring_touch=1`：导致 `GEVNTADR=0`，控制器无处写事件
- `usb_no_start_ex=1`：跳过看门狗武装，导致卡死无法自愈
- 往 Mu-Silicium 里加 `AndroidFastbootApp`：本项目设计是 loader 自己提供 USB
- `ConfigureEnableEndpoints_ex`：任何 self 都不返回，已跳过

## 六项修复（已提交，**全部未经实测**）

手机自 2026-11-07 约 23:50 起不可达，这六项都没有跑过。

### 1. Setup TRB 缺 cache clean ← 最可能的根因

`arm_setup()` 写好 TRB 后直接 Start，没有把数据推送到内存：

```c
memset(g_ep0.out_trb, 0, sizeof(chiron_trb));
chiron_trb_set(&g_ep0.out_trb[0], g_ep0.setup_dma, 8, CHIRON_TRB_SETUP, 0);
// ← 这里应该 clean_dcache
```

控制器从内存读 TRB，看不到 CPU cache 里的 `Owned=1`，认定环为空。

**修复：** Start 前后各 clean 一次（`Owned` 的那次写入最关键）。

### 2. DATA/STATUS TRB 同样缺 clean

`chiron_ep0_submit()` 里同样的遗漏，影响每个控制传输的 DATA 和 STATUS 阶段。

**修复：** clean TRB，CPU 填过 payload 时也 clean payload。

### 3. 总线复位后白等 5ms 的 End

复位后硬件已拆掉端点，但代码仍走 "已 armed" 路径发 End 并轮询 500 次
（`500 × 10µs = 5ms`）。主机复位后只等约 1ms 就要 SETUP。

**修复：** 复位和连接事件先清 `g_ep0.armed`。

### 4. 事件环环绕边界写死 0x1000

三处环绕点都用字面量 `0x1000`，而它应该是 `GEVNTSIZ` 低 16 位。

**修复：** 从寄存器读，字面量只作初值。

### 5. 回复路径没有 STATUS 阶段

控制传输是 SETUP → DATA → STATUS。`chiron_ep0_reply()` 只做了前两步。

**修复：** 按 Mi 6 的 `DWC3Control.h:69-70` 选择：
有 data 阶段用 `Status2 on EP0 OUT`，无 data 用 `Status3 on EP0 IN`。

### 6. 看门狗移到 `efi_main` 最开头

原来在 `usb_start()` 内部受 `wdt=1` 控制，`usb_no_start_ex` 那条路径到不了，
导致卡死后无法自愈。

**修复：** 放在 `efi_main` 开头，无条件执行，bite = `0x2DC6C0`（约 5 分钟）。

## 一项诊断（P5 里）

`arm_setup()` 的 Start 之后读两样东西：

```c
DEPSTAR (0xC710)          TRB 出队指针，动了 = 控制器走过环
out_trb[0].control & 1    Owned 位，控制器回收 TRB 时清零（读前需 invalidate）
```

三种结果对应三个不同病因：

| Owned | DEPSTAR | 含义 | 下一步 |
|---|---|---|---|
| 1 | 未动 | 控制器没看 | 改 TRB 环大小（见下）|
| 0 | — | 取走了但无事件 | 事件丢失，查事件环配置 |
| 0 | 动了 + 有端点事件 | 通了 | 继续处理 SETUP |

## 一个未改动但可疑的点

Mi 6 有两处初始化检查，要求不同：

```cpp
DWC3Transfer.h:55    count < 1      → invalid   普通端点，单 TRB 合法
DWC3Control.h:114    trbCount < 2   → invalid   EP0 专用，要求至少 2 个
```

**我们的 EP0 环只有 1 个 TRB。**

单条目在 `submit` 路径上合法（末条带 `Last|InterruptComplete`），但 DWC3 环形队列
通常需要 ≥2 个条目才能区分满/空。

**故意没改**：要动 `chiron_ep0_init` 的分配、`arm_setup` 的 memset 长度、
`chiron_ep0_submit` 的复用逻辑——三处联动，手机又不可测。

**等诊断结果：如果 `Owned=1` 且 `DEPSTAR` 未动，这就是下一个要改的。**

## 已核对无误的部分

- **Configure 参数**：`PAR0 0x200`、`PAR1 0x500`/`0x20500`，与
  `DWC3Endpoint.h:45-59` 公式逐项一致
- **初始化顺序**：`chiron_ep0_init` 在所有驱动配置之后；
  `chiron_mi6_endpoints()` 有 `DALEPENA & 3` 保护，不会重置已 arm 的端点
- **描述符内容**：`18D1`/`D00D`、接口 `0xff/0x42/0x03`，正是判据要求的

## 恢复测试流程

```powershell
# 1. 人工长按电源键约 15 秒
# 2. 清日志
adb -s 41bc0f2d shell "dd if=/dev/zero of=/dev/block/sda10 bs=4096 count=2048"
# 3. 切 fastboot（从 recovery 发起常失败，需重试 2-3 次）
adb -s 41bc0f2d reboot bootloader
# 4. 确认就绪
fastboot devices
# 5. 刷入
fastboot -s 41bc0f2d boot E:\ios-sweat\P5.img
# 6. 观察
Get-PnpDevice -PresentOnly | Where InstanceId -match 'VID_18D1|VID_0000'
# 7. 恢复后读日志
adb shell "dd if=/dev/block/sda10 of=/data/local/tmp/x.bin bs=4096 count=2048"
adb pull /data/local/tmp/x.bin E:\ios-sweat\x.bin
```

**必须分步执行。** 合并命令会导致白跑一轮。

## 关键文件

- `xnuloader/loader.c` — EP0 gadget 全部代码
  - `chiron_ep0_init()` 分配 DMA 缓冲
  - `chiron_ep0_arm_setup()` 提交 Setup TRB + 诊断
  - `chiron_ep0_poll()` 事件环解析
  - `chiron_ep0_handle_setup()` 标准请求应答
  - `chiron_ep0_reply()` DATA + STATUS
- `xnuloader/build_three.sh` — 构建参数
- `E:\ios-sweat\P5.img` — 待刷镜像

## 仓库

- `sbccc1888/hackios-xnu-kernel` 分支 `chiron`，HEAD `3c2f265`
- `sbccc1888/Mu-Silicium` 分支 `chiron`，HEAD `21a39419`
