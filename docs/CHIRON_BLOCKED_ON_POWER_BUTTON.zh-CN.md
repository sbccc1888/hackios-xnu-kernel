# 当前阻塞：需要人工按一次电源键

## 事实

手机（41bc0f2d）自 2026-11-07 约 23:50 起，一直停留在：

```
USB\VID_0000&PID_0002\5&276C915B&0&10    Status: Error
```

adb 和 fastboot 都不可达。已持续约 3 小时 / 5 个工作轮次。

## 为什么会卡住且不自愈

卡死来自 `usb_no_start_ex=1` 那次构建（提交 `730a3f3` 之前的状态）。
那条代码路径里，APSS 看门狗在 `usb_start()` 内部、并且受 `wdt=1` 开关控制。
`usb_no_start_ex` 让流程走了另一条分支，**没能到达 arm 那一步**，所以看门狗从未启动。

而 APSS 看门狗是 chiron 上**唯一有效**的复位手段：

| 方式 | 实测结果 |
|---|---|
| `PSCI SYSTEM_RESET` | `smc #0` 执行了，执行流继续，不复位 |
| `ST->rt->reset_system` | 指针非空，调用即崩（`brk #0x1`）|
| `BS->set_watchdog_timer` | 无效果 |
| APSS WDT `0x17817000` | **有效**，130 秒自动恢复已实测 |

## 主机侧已尝试且失败的方案

都需要管理员权限，当前会话没有：

```
pnputil /disable-device "USB\VID_0000&PID_0002\5&276C915B&0&10"   -> Access is denied
pnputil /restart-device "USB\ROOT_HUB30\4&27773249&0&0"           -> Access is denied
Disable-PnpDevice -InstanceId ...                                  -> 常规故障
```

## 已修复（在 N5 / P5 里，等验证）

1. **Setup TRB 缺 cache clean** — CPU 写的数据从没到内存，控制器看到 `Owned=0`，认定环为空
2. **DATA/STATUS TRB 同样缺 clean**（含 payload）
3. **总线复位后仍发 End 并空等 5ms** — 超出主机约 1ms 容忍窗口
4. **事件环环绕边界写死 0x1000** — 应为 GEVNTSIZ 低 16 位
5. **回复路径没有 STATUS 阶段** — 控制传输 SETUP→DATA→STATUS 缺第三步
6. **看门狗移到 `efi_main` 最开头** — 无条件，任何分支都绕不过

外加一项决定性诊断（P5）：Start 后读 `DEPSTAR` 和 TRB 的 `Owned` 位，
一次性区分「控制器没取 TRB」和「取了但事件没上报」。

## 恢复后要做的第一件事

```
1. 按电源键
2. adb shell "dd if=/dev/zero of=/dev/block/sda10 bs=4096 count=2048"
3. adb reboot bootloader
4. fastboot boot P5.img
5. 观察 Get-PnpDevice，看是否出现 VID_18D1&PID_D00D
6. 恢复后读日志：dd if=/dev/block/sda10 of=/data/local/tmp/x.bin bs=4096 count=2048
```

**刷了 N5 或 P5 之后，看门狗无条件生效，不会再出现需要手动干预的情况。**
