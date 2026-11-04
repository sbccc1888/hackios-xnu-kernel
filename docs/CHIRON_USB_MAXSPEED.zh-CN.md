# maximum-speed 在 DTB 里写着，驱动却没读到

## 1. DTB 里的事实

反编译的 `chiron.dtb`，`dwc3@a800000` 节点：

```
dwc3@a800000 {
    compatible = "snps,dwc3";
    reg = <0xa800000 0xcd00>;
    usb-phy = <0x30 0x87>;
    snps,has-lpm-erratum;
    snps,hird-threshold = [10];
    snps,num-gsi-evt-buffs = <0x03>;
    maximum-speed = "high-speed";        ← 明确声明
};
```

**`maximum-speed = "high-speed"` 明明白白写在那里。**

而实测 `DCFG = 0x80804`，低 3 位 = `4 = SuperSpeed`。

---

## 2. 这意味着什么

**驱动没有从这个 DTB 读到 `maximum-speed`。**

`gadget.c` 的逻辑是：

```c
switch (dwc->maximum_speed) {
case USB_SPEED_HIGH:    HIGHSPEED; break;
case USB_SPEED_SUPER:   /* fallthrough */
case USB_SPEED_UNKNOWN: /* fallthrough */
default:                SUPERSPEED;      ← 走了这里
}
```

走到 `default` 说明 `dwc->maximum_speed` 是 `USB_SPEED_UNKNOWN`。

**所以 UEFI 下的这个驱动没有这个 DTB 信息。**

---

## 3. 为什么

Android 内核读 `/proc/device-tree` 或 boot 参数里的 DTB，从中解析 `maximum-speed`。
**UEFI 的 `UsbfnDwc3Dxe` 不是 Linux 内核，它走的是 Qualcomm 自己的平台配置路径。**

它调用 `gEfiPlatformInfoProtocolGuid`（二进制里有 `Failed to get gEfiPlatformInfoProtocolGuid`），
但那个协议的结构我们查过，**不含 USB 速度字段**。

**结论：UEFI 环境里没有任何东西把 `maximum-speed = "high-speed"` 传给驱动。**

---

## 4. 这改变了对 `DCFG` 判断的性质

之前的推断是"驱动因为没人告知而默认 SS"。**现在可以更精确地说：**

> **信息是存在的（在 DTB 里），只是 UEFI 驱动拿不到它。**

这让事后纠正 `DCFG` 变得**更有依据**——我们不是在对抗一个"合法的能力推断"，
而是在补上一个**环境缺失的信息传递**。

---

## 5. 也因此确认了 MSM8998 有 SS PHY

```
ssusb@a800000 {
    interrupts = <... 0xf3 ...>;        /* ss_phy_irq */
    interrupt-names = "hs_phy_irq\0ss_phy_irq\0pwr_event_irq";
    ...
}
ssphy@c010000 {
    compatible = "qcom,usb-ssphy-qmp-v2";
};
```

**控制器确实有 SuperSpeed PHY 硬件**，但：

- `maximum-speed = "high-speed"` 明确限制只跑 HighSpeed
- chiron 是 micro-USB 接口，物理上没有 SS 通道

**所以 `DCFG = 4` 对这台设备是错的，尽管硬件有这个能力。**

---

## 6. 下一步该做什么

**在 `start_ex` 之前无法干预 `DCFG`**——驱动会在内部重写。

但有一个此前没考虑过的方向：

**`usb_hk6_only` 模式绕过 `start_ex`，直接用 `UsbFnIo::StartController`。**
那条路径下 `UsbDeviceDxe` 的 `StartEx`（含 DCFG 编程）不执行，
如果 `UsbFnIo::StartController` 内部不重设 DCFG，**我们就可以在调用它之前把 DCFG 设好。**

这值得在手机回来时用一个对照实验验证：
- A：默认路径（start_ex，事后纠正）
- C：`usb_hk6_only`（绕开 StartEx，可以提前设 DCFG）

---

## 7. 记录

**这条 DTB 证据今晚一直在手上**（`/tmp/chiron.dts` 早就反编译过），
但直到现在才去查 `maximum-speed` 字段。

之前查过 `qusb-phy-init-seq`，查过 `gdsc`，**就是没查这个**。
