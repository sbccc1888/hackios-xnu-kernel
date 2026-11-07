# EP0 代码路径完整核对（2026-11-08，无手机可测期间）

手机卡在 `VID_0000&PID_0002`（`usb_no_start_ex` 那次留下，看门狗未启动），
连续三轮无法测试。利用这段时间把 EP0 的完整代码路径核对了一遍。

## 描述符应答 — 完整且符合判据

`chiron_ep0_handle_setup()`（loader.c:3962）里硬编码的描述符：

```c
dev_desc[18] = { 18, 1, 0x00, 0x02, 0x00, 0x00, 0x00, 64,
                 0xd1, 0x18, 0x0d, 0xd0, 0x00, 0x01, 1, 2, 3, 1 };
```

- `idVendor = 0x18D1`, `idProduct = 0xD00D` ✅ 正是成功判据要求的
- `cfg_desc` 的接口：`class 0xff / subclass 0x42 / protocol 0x03` ✅ 也是判据要求的
- 覆盖了 `GET_DESCRIPTOR` 的 device / config / qualifier / string 全部类型
- 字符串 `XNULoader` / `xnuloader`

**描述符部分不需要改。**

## STATUS 阶段 — 存在且齐全

`chiron_ep0_submit(..., CHIRON_TRB_STATUS2)` 出现在 5 个位置：
4024（GET_STATUS）、4032、4040、4067（SET_*）、4072（默认分支）。

`CHIRON_TRB_STATUS3` 已定义（3502）但未使用——对于有 data 阶段的请求应该用 STATUS3，
这是一个**潜在问题**：`USBCDCACM.h` 的 `startStatus()` 是按 `setup.length ? Status3 : Status2`
选择的（DWC3Control.h:69-70）。当前一律用 STATUS2，可能让主机在 data 阶段之后等不到正确的握手。

**这是核对中新发现的疑点，待手机可用后验证。**

## 已修的四个问题（都未验证）

1. Setup TRB 写后没有 clean cache → 控制器看到 `Owned=0`，认定环为空
2. DATA/STATUS TRB 同样缺 clean（含 payload 缓冲）
3. 总线复位后仍发 End 并空等 5ms，超出主机 ~1ms 容忍窗口
4. 事件环环绕边界写死 0x1000，应为 GEVNTSIZ 低 16 位

## 下一轮要做的

1. 刷 L5，看 `ep0: ep0 type1` 是否出现（Setup 完成事件）
2. 若仍无：打开 `arm_setup` 里 `if (0 && g_ep0.armed)` 的 negotiate 段
   （DWC3Core.h:336-338 的 setupModify 例外）
3. 若 Setup 出现但传输断在回复：把 STATUS2 改成按 `length` 选 STATUS3
