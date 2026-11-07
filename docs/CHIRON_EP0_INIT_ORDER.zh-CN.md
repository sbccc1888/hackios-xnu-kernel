# EP0 的初始化顺序已核对（2026-11-08）

担心的是：驱动的 `StartEx` 或 `chiron_mi6_endpoints()` 会不会在 EP0 arm 之后
把端点重置掉，从而丢弃我们提交的 TRB。

## 实际顺序

```
14150:  USB->start_ex(&set)              驱动配置端点
14781:  读 DALEPENA
14785:  chiron_mi6_endpoints()  仅当 (DALEPENA & 3) != 3 时执行
14799:  chiron_ep0_init()                分配 DMA，之后 arm
```

`chiron_ep0_init` 在最后，所以 arm 发生在所有驱动配置之后。

## 关键：mi6_endpoints 的条件判断

```c
uint32_t dalepena = *(volatile uint32_t *)(0xA800000 + 0xC720);
if ((dalepena & 3u) != 3u) {
    chiron_mi6_endpoints();      /* 内部会发 StartConfiguration（命令 9）*/
}
```

`StartConfiguration` 会重置控制器里所有端点。**如果无条件调用，它会把刚 arm 的 EP0 清掉。**
但这里有条件保护：DALEPENA 已经是 3 时跳过。日志实测 `ep0: DALEPENA before ensure 0`
→ 第一次会进；`ep0: DALEPENA now 3` → 之后不再进。

**顺序正确，不需要改。**

## 已无更多可离线确认的问题

六项修复 + 一项诊断都等待实测：
1. Setup TRB 写后 clean cache
2. DATA/STATUS TRB clean（含 payload）
3. 复位后不发 End
4. 环边界读 GEVNTSIZ
5. 回复后补 STATUS 阶段
6. 看门狗移到 efi_main 开头（无条件）

诊断：Start 后读 DEPSTAR 和 TRB 的 Owned 位，一次性区分「控制器没取」和「取了没上报」。

## 阻塞点

手机自 `usb_no_start_ex` 那次起卡在 `VID_0000&PID_0002`，已约 2.5 小时。
那条路径的看门狗在旧代码里受开关限制，没有启动，所以不会自愈。

从主机侧尝试过：`pnputil /disable-device`、`pnputil /restart-device`、
`Disable-PnpDevice`——**全部因缺少管理员权限失败**。

**必须人工按一次电源键。** 之后刷 N5 或 P5，看门狗就会无条件生效，不会再出现这种情况。
