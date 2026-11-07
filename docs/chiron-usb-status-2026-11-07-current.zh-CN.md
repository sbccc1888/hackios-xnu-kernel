# chiron USB 状态 —— 当前进度

## 已经成功的部分（Y2 日志实测）

设备这次真的在 Windows 里出现了：

```
USB\VID_0000&PID_0002\5&276C915B&0&10    "未知 USB 设备(设备描述符请求失败)"
```

`VID_0000`/`PID_0002` 是 Windows 拿不到描述符时的占位符。**主机完成了总线复位、分配地址、发出 GET_DESCRIPTOR**，
这在之前任何一轮都没发生过。

### 链路状态全程保持

```
snap A-before-start_ex  ... ln 0        PHY 未驱动
snap B-after-start_ex   ... ln 1        start_ex 把 D+ 拉起来了
snap C-after-recover    ... ln 1        保持
snap C-after-mi6        ... ln 1        保持
```

`ln` 是 QUSB2PHY_INTR_STAT 的单端接收器读数，两线都低是 `0`。设备模式下拉起 D+ 后应该是 `1`。
**从 start_ex 到进入命令循环，`ln 1` 一次都没掉。**

之前每一轮都是 `ln 0`，或者 `ln 1` 之后立刻被自己的代码打回 `ln 0`。

## 三个把自己成果拆掉的 bug（已修）

1. **post-start_ex 的 PHY 重初始化**
   ```
   snap B ... ln 1      start_ex 成功
   post-start_ex: full PHY re-init
   snap C ... ln 0      D+ 没了
   ```
   设备出现在 Windows 随后消失，就是这两个快照之间的间隔。
   现在改成只在链路确实断开时才重初始化，判据用 CONNECTSTAT 或单端接收器。

2. **Mi 6 序列无条件执行**。厂商路径已经把 D+ 拉起来，序列又做了一次软复位，把成果拆掉。
   现在它只是后备：链路活着就跳过。日志证明判据工作：
   ```
   mi6: gate conn 0 ln 1 -> skip, vendor link is live
   ```

3. **`usb_connected` 标志不可信**。它只在收到 `UsbDeviceEventDeviceStateChange` 时置位，而这个事件
   从不出现，所以标志读 0 时线路其实是活的，代码据此把会话丢掉。现在驱动中的线路也算连接：
   ```
   usb: recover view conn 0 ln 1 wire 1 flag 0
   usb: connected after endpoint recovery (by wire)
   ```

另外 VBUS 改成无条件下发（旧代码在 CONNECTSTAT 置位时跳过，而 CONNECTSTAT 无论 PHY 是否驱动线路都读 1）。

## 还缺的最后一步：EP0 没有应答

```
usbfn: stop_controller 0
usbfn: start_controller 0
usbfn: ConfigureEnableEndpoints 0            ← 非 _ex 版本成功
usbfn: ConfigureEnableEndpoints_ex(NULL ss) 8000000000000002
usbfn: ConfigureEnableEndpoints_ex(ss=cfg_info) 8000000000000002
usbfn: self 9bdc4020 self-8 66627375 (want 73756662)
```

`ConfigureEnableEndpointsEx`（RVA `0x2584`）拒绝描述符集。它开头做 `usbfs` 标签检查：

```
25b0: mov  w8, #0x66620000
25b4: movk w8, #0x7375          w8 = "usbfs"
25b8: ldr  x9, [x21, #-0x8]!    x21 = self, 读 self-8
25bc: cmp  x9, x8
```

实测 `self-8 = 0x66627375`，想要 `0x73756662`，字节序相反。标签不匹配时它走告警分支后继续，
所以这不是决定成败的点，但说明它不认为在和自己的实例说话。

而 StartEx 的端点步骤走的是 `_ex` 入口（`1cf8: ldr x10,[x0,#0x90]; blr x10`），
所以 StartEx 拿到的 `0x02` 就是这个拒绝。

**下一步要么让 `_ex` 接受描述符集，要么绕过 StartEx 直接自己应答 SETUP。**

`usb_no_start_ex=1` 会绕过 UsbDeviceDxe，那样就没有任何东西拥有 EP0，所以描述符请求必然失败 ——
这正是当前 `VID_0000&PID_0002` 的来源。

## 事件环实测

```
mi6ring: adr 99f28000 cnt 1c
  ev0 raw 301       ← 设备事件，type 3 = DISCONNECT
  ev1 raw 50301
  ev2 raw 30301
  ev3 raw 30601
  ev4 raw 101
  ev5 raw 201
  ev6 raw 301
```

控制器把主机流量写进环了，但类驱动没有消费。这些是我自己 dump 出来的，不是驱动读走的。
