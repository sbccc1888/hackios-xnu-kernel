# 自动重启终于真的修好了（P4 实测）

## 之前为什么一直修不好

试过的都不行，而且每一次都以为修好了：

| 尝试 | 结果 |
|---|---|
| UEFI 定时器在 `usb_start` 前 arm | 定时器需要中断才能跑，卡死在驱动里就永远不触发 |
| `daifclr` 让中断能抢占 | 只是兜底，卡死点仍然存在 |
| 故障处理器里发 PSCI SMC/HVC | 日志到 `fault: attempting reset` 就没了，复位没发生 |
| 故障处理器里调 `ResetSystem` | 同上 |
| `BS->set_watchdog_timer` | 同上 |
| `wdt_arm()` / `VIRT_WDT_*` | MSM8998 不实现 Quest hypervisor 调用，`wdt_armed` 一直是 0 |

**根本原因：全部都是「软件请求另一个软件去复位」，而那个软件正是崩掉的东西。**

## 真正有效的做法：APSS 硬件看门狗

`platforms/qcom/msm8998/soc.dtsi`（Mi 6 项目，同一颗 SoC）：

```
watchdog@17817000 {
    compatible = "qcom,msm-watchdog";
    reg = <0 0x17817000 0 0x1000>;
    clock-frequency = <32765>;
    status = "okay"; // QcomWatchdog takes over the bridge recovery timer.
};
```

**`0x17817000`，32765 Hz。** 它跑在 always-on 时钟上，一旦 bite 时间写进去，
就算所有 CPU 都卡在厂商代码里，SoC 也会复位。

寄存器用法（本项目的实现）：

```c
/* 清状态 */
*(u32 *)(wdt + 0x08) = 1;
/* 解除复位 + 使能 */
*(u32 *)(wdt + 0x04) = 1 | (1 << 1);
/* bite 时间，单位 tick */
*(u32 *)(wdt + 0x10) = 0xF0000;      /* 32765 Hz -> ~30 s */
/* 使能 + 解除复位 + 启用 */
*(u32 *)(wdt + 0x04) = 1 | (1 << 1) | (1 << 3);
```

循环里每轮 `chiron_apss_wdt_reset()`（写 `0x04 = 1 | (1<<1)`）重新计数。

## P4 实测

日志里：

```
wdt: apss armed (983040 ticks, ~30 s) before usb_start
...
reinstall: shim a1649250 rev 10002     ← 卡死在这里
```

**手机 70 秒后自己回到 Android，整轮全程没人碰过手机。**

这是这一系列里第一次做到「不碰手机也能回来」。

## 附带修掉的两处

1. `ConfigureEnableEndpoints_ex` 跳过。它无论传什么 self 都不返回，
   而非 `_ex` 版本每次都返回 0 且端点确实配好了：
   ```
   usbfn: ConfigureEnableEndpoints 0
   usb: endpoints configured after start_ex
   usb: command loop entered (IRQ unmasked)
   ```
2. fastboot 命令处理里的 `reboot` 分支裸调 `ST->rt->reset_system`，加了保护
   （`reboot()` 和 `chiron_reset_notify` 之前已修过，漏了这一处）。

## 还有一个探针 bug（已修）

`desc wTotal` 曾经打印成 `0x8000`，是因为读了 config descriptor 的 `[6..7]`
（`iConfiguration`、`bmAttributes`，`0x80 << 8 == 0x8000`）。
`wTotalLength` 在 `[2..3]`。修正后是 `wTotal 20`，limit `4000`——
**那个比较其实一直是能过的，问题从来不在那里。**
