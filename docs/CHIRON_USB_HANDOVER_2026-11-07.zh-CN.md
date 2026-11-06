# chiron USB 枚举排查 —— 2026-11-07 交接文档

## 目标
让 Mi MIX 2（chiron / MSM8998）的 HackiOS loader 在 PC 侧枚举出 USB 设备。

## 唯一可外部验证的成功判据
Windows 设备树中出现：

    USB\VID_18D1&PID_D00D\xnuloader
    CompatibleIDs : USB\COMPAT_VID_18D1&Class_FF&SubClass_42&Prot_03
    Service       : WinUSB

依据：VID `18d1` / PID `d00d` 硬编码在 `loader.c:4195` 的 `usb_dev_desc[]`；
序列号默认串 `"xnuloader"` 在 `loader.c:4237` 的 `usb_str_serial[]`。
这台机器上只有 loader 会公告这个组合。**历史上该节点出现过**（状态 CM_PROB_PHANTOM + WinUSB），
证明枚举曾经成功过。

**不要用 adb/fastboot 判断成败** —— `fastboot boot` 是单向的，loader 跑起来后主机不会自动
重新发现它。Android 回退会显示 `VID_18D1&PID_4EE7` 的 "Mi Mix 2"，那是假阳性。

---

## 一、已彻底推翻的结论（不要再测）

| 结论 | 推翻依据 |
|---|---|
| `CONNSTAT`(DSTS bit0) 是实时连接指示 | `DCTL.RUN_STOP` 清零后仍为 1；PHY 掉电 250ms 后仍为 1 |
| `USBLNKST`(DSTS bits21:18) 有意义 | 任何状态下都是 4，包括 fastboot 正在枚举时 |
| `PORT_UTMI_STATUS`(0xF4) 是线电平 | `CONNSTAT=1` 时就是 0 |
| `DCTL` bit28 是 DISCONNECT | 它是 `HIRD_THRES`(bits28:24) 的一部分 |
| `0x1A0` 是 PLL 锁定指示 | v2 里它叫 `PLL_COMMON_STATUS_ONE`；v1 的 `PLL_STATUS` 在 `0x38`、`LOCK` 是 BIT(5) |
| `0xB4` / `0xC4` / `0x74` 是这块 PHY 的寄存器 | 全是 v1 驱动(`phy-msm-qusb.c`)宏；chiron 用 v2，`grep 0xb4` 无结果 |
| 字节写通路有问题 | `bwt: 0x90 wrote 5a read 5a (TAKES)` |
| 本 PHY 能读 D+/D- 电平 | v2 的 `qusb_phy_get_linestate()` 直接返回软件标志 `cable_connected`，不读硬件 |
| `SOFFN` 可判断主机是否看见我们 | 入口是 4995、之后是 0，计数器不会倒着走，是残留值 |
| `TUNE1` 应该写 0x45 | 入口实测是 `0xf0`（fastboot 工作值）；0x45 是 `(0xa5&0x0f)|(4<<4)` 算出来的 |
| `REFCLKPER` 有问题 | 固件本来就是 52 |

---

## 二、入口快照 —— 唯一记录"fastboot 工作时是什么样"的数据

在 `efi_main` 最开头、任何 USB 写之前采集，多次一致：

    ENTRY: DSTS d29c19 conn=1 lkst=4 spd=1 | DCTL 10f00000 | DCFG 4808c0 | GCTL 112000 | phycfg 2400
    ENTRY: evtadr 99f2a000 evtsiz 80001000 evtcnt 0 devten 277
    ENTRY listen: count 0 -> 0 after 2000 polls -- host silent
    ENTRY: phy f4 0 f0 0 | 210 23 1a0 64 c0 0 23c f0 70 ff 74 0
    snap 0-ENTRY: cap 2 run 0 hlt 1
    addr 0-ENTRY: devaddr 0x15(每次不同)

关键事实：**入口时核心是停的(`run 0 hlt 1`)，主机静默，两端都空闲。**
所以任务是**建立一个会话**，不是继承一个。

### 曾一直被改掉、现已保住的值
| 项 | 入口值 | 曾改成 | 修复方式 |
|---|---|---|---|
| `DCFG` speed | 0 (HighSpeed) | 1 (FullSpeed) | `chiron_match_speed()` 只报告不改 |
| `TUNE1` | `0xf0` | `0x45` | init 和 reassert 都恢复入口值 |
| `GCTL` bit16 `U2RSTECN` | 置上 | 驱动清掉 | `chiron_restore_gctl()` 补回 |
| `PWR_CTRL1` bit0 `POWR_DOWN` | 1 | 被清 | 保留入口值 |
| `DEVTEN` | `0x277` | 驱动清成 0，旧代码只补 `0xf` | 从入口值重建 → `0x27f` |
| 事件环 | `99f2a000`（固件真实 DMA 缓冲） | loader 静态数组 | 恢复固件环 |

---

## 三、核心架构事实

### 1. 枚举只在命令循环里发生，且是不可达的

```c
if (usb_start()) {
        usb_session_begin(...);
        usb_command_loop();     // 枚举在这里，永不返回
}
print("== USB session unavailable; resetting ==\n");
reboot();
```

`usb_start()` 在 `start_ex` 失败时返回 0，直接 `reboot()`。**顶层没有"部分成功"状态。**

### 2. 驱动协议表只有 9 个函数指针

逐槽 dump 并按目标处字节分类：

    +0x00 10000001   revision
    +0x08 9bfa6478   [fc 6f ba a9]  DetectPort
    +0x10 9bfa65cc   [f4 4f be a9]  ConfigureEnableEndpoints
    +0x18 9bfa6660   [f8 5f bc a9]  GetEndpointMaxPacketSize
    +0x20 9bfa69ec   [f6 57 bd a9]  GetDeviceInfo
    +0x28 9bfa6a6c   [f4 4f be a9]  GetVendorIdProductId
    +0x30 9bfa6ac8   [f4 4f be a9]  AbortTransfer
    +0x38 9bfa6b9c   [f4 4f be a9]  GetEndpointStallState
    +0x40 9bfa6bf8   [f4 4f be a9]  SetEndpointStallState
    +0x48 9bfa6c5c   [f6 57 bd a9]  EventHandler
    +0x50 9bfab924   [44 45 56 5f]  "DEV_STATE_DETACHED"  ← 字符串，表到此结束

**`0x50` 之后全是相邻内存。** 之前把 `free_transfer_buffer`(0x68) 读成 `9bfa7500` 并解释为
"和 start/stop 共用的桩"是错的 —— 那是相邻数据恰好指向真实代码。

### 3. `ConfigureEnableEndpoints` 无法带外调用

从 `chiron_usbfn_configure_only()` 直接调用时，崩溃固定在同一地址：

    cfgonly: fn a1644220 slot10 a100f570 word f81f0ffe
    cfgonly: calling ConfigureEnableEndpoints on a1644220
    UEFI EXCEPTION elr=9bfab924

调用进入了 loader 的 shim(`a100f570`)，shim 转发给厂商函数(`9bfa65cc`)，
**崩溃发生在那函数内部**。每次都同一地址 —— 这是"缺少初始化"的特征，不是竞态或参数错误。

**结论：要么 `StartEx` 成功，要么枚举不发生。恢复路径不可能成功。**

### 4. `usb_probe_steps=1` 的实测

    step: locate UsbFnIo 0 (fn 1)                  ← 协议找到
    step: AllocateTransferBuffer a1644220          ← 真指针
    step: DetectPort 0 port 1                      ← port 1 = StandardDownstreamPort
    step: GetEndpointMaxPacketSize 0 mps 200       ← 512，正确
    step: ConfigureEnableEndpoints left to start_ex
    step: StartController 7                        ← 桩返回 EFI_OUT_OF_RESOURCES

**能通过表访问的入口全部正常，三个返回数据的都返回正确值。** 只有 `StartController` 是桩。

---

## 四、下过的开关及其结果

| 开关 | 结果 |
|---|---|
| `usb_noop_startstop=1` | `StopController 0 / StartController 0`，但 `StartEx` 前进到 `EventHandler` 后仍失败(ret 2) |
| `usb_evt_none=1` | 环为空时按协议返回 `EfiUsbMsgNone`+`SUCCESS`。**崩溃消失**，但手机完全离开总线、4分钟不回来 |
| 两者合用 | 无 UEFI EXCEPTION，手机静默挂起 |

**重要**：`usb_command_loop()` 里的 poll 用的是 `USB->handle_event`（`UsbDevice` 协议），
而 `usb_evt_none` 加在 `UsbFnIo::event_handler` 上 —— **是两个不同的接口，改动不覆盖循环。**

---

## 五、下一步（手机重启后）

1. **跑 `usb_noop_startstop=1 usb_evt_none=1`，读 logfs 看有没有 `usb: command loop entered`**
   - 有 → 端口在被呈现，故障在协议层
   - 没有 → `usb_start()` 仍返回 0，恢复路径仍是死点
2. 若循环被到达，需要给 `UsbDevice::handle_event` 也加同样的 MsgNone 处理
3. 若未到达，需要查 `StartEx` 在 `EventHandler` 之后还做了什么

## 六、设备恢复
手机从总线消失时：**长按电源键 15 秒强制重启**。
若仍不行，进 recovery 或 9008（`VID_05C6&PID_9008`）。