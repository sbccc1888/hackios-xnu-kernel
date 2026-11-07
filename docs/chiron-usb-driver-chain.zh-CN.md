# chiron USB 驱动链 —— 代码层面的完整流程

本文只描述**代码实际做什么**，每条都指向 loader.c 的行号或固件 RVA。

## 一、入口

```
efi_main (13437)
  ├─ 13452  BS->set_watchdog_timer(0,...)     ← 关掉看门狗（后文解释后果）
  ├─ 13490  ENTRY 快照（DWC3/PHY 寄存器）
  ├─ 13630  wdt_arm()                         ← chiron 上恒为 no-op
  ├─ 13632  parse_payload
  └─ 13635  if (have_payload && pi.usb_mode)
       ├─ 13651  usb_start()
       │    └─ 返回 1 时：
       │         ├─ 13656 usb_session_begin(300)
       │         ├─ 13676 create_event + set_timer(330s)  ← 复位定时器
       │         ├─ 13746 清 GUSB2PHYCFG bit8/bit6
       │         ├─ 13887 transfer() 提交一次 EP0 IN
       │         ├─ 13933 GEVNTCOUNT 探针
       │         └─ 13962 usb_command_loop()            ← 永不返回
       └─ 13964  usb_start() 返回 0 时：reboot()
```

**关键：`usb_command_loop()` 永不返回，所以 13964 的 `reboot()` 只在 `usb_start()` 失败时才走。**

## 二、usb_start() 做了什么（10521 起）

### 1. 选项解析（10606-10760）
从 payload cmdline 解析 `usb_native` / `usb_manual` / `usb_hk6_only` / `usb_no_start_ex` 等开关。

### 2. ENTRY 快照（10579-10583）
`chiron_dwc3_snap` / `chiron_phy_entry_snap` / `chiron_env_snap`，再 `charger_start()`。

### 3. HK6 序列（11400 之前，`chiron_hk6_*`）
```
hk6: USB Init 0                      ← UsbInitDxe 协议
hk6: DWC3 driver binding ok          ← UsbfnDwc3Dxe 的 EFI_DRIVER_BINDING_PROTOCOL
hk6: query core 0 → core 0 modes 3
hk6: start peripheral 8000000000000002   ← init->start_controller 返回 INVALID_PARAMETER
hk6: 克隆一个 peripheral handle
hk6: install peripheral cfg on source handle -> 8000000000000002   ← 也失败
hk6: connect DWC3 on 9bdaba98 -> 0   ← 这条成功
hk6: usb_dev_handle 0 -> 9bdaba98 (rev 10002)
```

**`connect_controller` 成功是转折点：它让 `UsbfnDwc3Dxe` 的 `DriverBinding->Start`（RVA 0x14f8）真的跑了，分配了 0xe18 状态块、32×1120 传输缓冲池、事件环（存 +0xdd0）。**

### 4. descriptor set 构造（11008-11024）
```c
set.device_descriptor    = usb_dev_desc;   // VID 18d1 / PID d00d
set.descriptors          = cfg;
set.ss_device_descriptor = usb_dev_desc;
set.ss_descriptors       = cfg;
set.device_qualifier     = usb_qualifier;
set.bos                  = NULL;
set.string_count         = 5;
set.strings              = strings;
```

### 5. vendor usbfn_io 捕获（11049-11072）
`handle_protocol(usb_dev_handle, QCOM_USBFN_IO_GUID)` → 存 `g_orig_usbfn`，并打印 revision 校验是不是 `0x10002`。

### 6. reinstall shim（11107-11160）
把 `usbfn_with_sdp_detect(orig)` 的副本装上，目的是拦截 `DetectPort`。

### 7. 控制器启动（11200-11254）
```c
if (((d0>>31)&1)==0 || ((s0>>22)&1)!=0)
    DCTL |= (1<<31);       // RunStop
    DCTL 清 bits[28:24] 再设 0x10   // HIRD
```
然后：
```
chiron_dwc3_highspeed()      → DCFG speed=0 (HighSpeed)
chiron_dwc3_device_mode()    → GCTL dir=2
chiron_qusb2_resume()
chiron_vbus_override()
chiron_qusb2_reassert()
chiron_port_powerdown()
chiron_pll_resume()
```

### 8. 环清理（11482-11498）
把 `GEVNTADR` 指向的内存 cache clean + invalidate。

### 9. StartEx 或替代路径（11582 起）
```
if (!usb_hk6_only_mode) {
    if (usb_no_start_ex) {
        11896: configure_only() → UsbFnIo::start_controller
    } else {
        11992: USB->start_ex(&set)
    }
}
```

## 三、usb_command_loop()（13031 起）

### 1. 入口准备（13050-13058）
```c
chiron_fn_events("final");     // 调 400 次 event_handler
chiron_event_probe("final");
print("usb: command loop entered\n");
```

### 2. 一秒 pump 循环（13076-13202）
```c
while (pumped < 200000) {
    if (now - began > freq) break;              // 1 秒上限
    uint32_t cnt = GEVNTCOUNT & 0xfffc;
    if (cnt == 0) { pumped++; continue; }       // ★ 环空就不调 handle_event
    memset(&d, 0, sizeof(d));
    if (chiron_ring_has_events())
        USB->handle_event(&m, &sz, &d);
    pumped++;
}
```

### 3. 快照（13203-13251）
`chiron_dwc3_snap("C-in-loop-1s")`、PHY 寄存器 dump。

### 4. 主循环（13254-13341）
```c
screen_quiet = 1;
for (;;) {
    chiron_reassert_speed();
    
    if (idle_now - idle_from > idle_limit) {     // 300 秒
        print("== USB session idle ...");
        reboot();
    }
    usb_session_check();
    
    if (!usb_connected) {
        usb_wait(0xff);                          // ★ 死点
        print("usb: waiting for a host ...");
        continue;
    }
    n = usb_rx(usb_rx_buf, 511);
    if (n <= 0) { print("usb: no command yet"); continue; }
    fb_command(cmd);
}
```

## 四、usb_wait()（12504 起）—— 死点所在

```c
for (;;) {
    if (++polls > 20000) return -1;              // 预算
    if (chiron_ring_has_events())
        USB->handle_event(&msg, &size, &data);   // ★ 12556 阻塞点
    if (msg == UsbDeviceEventDeviceStateChange) { ... }
    if (READ_SYSREG(CNTVCT_EL0) - began > 3*freq) return -1;   // 3 秒
}
```

**`chiron_ring_has_events()` 读 `GEVNTCOUNT`。日志显示它恒为 0，所以 `handle_event` 不会被调——那 `usb_wait` 应该在 20000 次后或 3 秒后返回。**

## 五、日志停在 `command loop entered` 的矛盾

实测日志（433 行）：
```
usb: entering command loop
usb: state at loop entry: DCFG 480800 DSTS 920001 DCTL 90f00000 devten 277 evtcnt 0 evtadr 99f28000
fnev final: done, 0 distinct
evt final: devten 277 pending 0 ehb 0 dgcmd 90f00000 evtadr 99f28000 evtsz 80001000
usb: command loop entered
```

**之后什么都没有——既没有 `usb: pumped N times during the first second`（13200），也没有 `usb: waiting for a host`（13314）。**

**这说明卡在 13058 与 13200 之间，也就是那一秒 pump 循环里。**

**而该循环有两个出口都会打印：13200 是正常退出。除非……**

## 六、真正的死点候选

13200 的打印在循环**外面**：
```c
    }                          // ← while 结束
    print("usb: pumped %d times during the first second\n", pumped);
    flush_log();
}                              // ← 13202 块结束
```

所以只要 while 退出就一定会打印。**没打印 = while 没退出，或退出前的某处阻塞。**

**`while` 里唯一的阻塞点是 `USB->handle_event`（13189）。它只在 `chiron_ring_has_events()` 为真时才调。**

**所以要么 `GEVNTCOUNT` 在读的那一刻非零（而日志的快照是零），要么卡在别处。**

这就是需要下一步实测确认的地方：在 13189 前后各打一行。
