# Mi 6 的 USB 到底是怎么工作的（纠正之前的判断）

## 我之前搞错了

之前以为 Mi 6 靠 `drivers/usb/QcomUSB` 自己实现 USB。**这是错的。**

`QcomUSB/Info.plist` 写着：

```xml
<key>CFBundlePackageType</key>
<string>KEXT</string>
<key>CFBundleSupportedPlatforms</key>
<array>
    <string>iPhoneOS</string>
</array>
<key>OSBundleRequired</key>
<string>Root</string>
```

**它是 iOS 内核的 kext，运行在 XNU 里，不是 EDK2 阶段的东西。**
`QcomUSBDevice.cpp` 里那些 `DWC3Control.h` / `armSetup` 是 **iOS 内核驱动**的代码，
跟 UEFI 阶段的枚举完全无关。

用这个去写 loader 的 EP0，方向就错了。

## Mi 6 在 EDK2 阶段用的是标准 EDK2 栈

`boot/bridge/services/fastboot.c` 开头：

```c
static EFI_GUID transport_guid = {0x74bd9fe0,0x8902,0x11e3,{0xb9,0xd3,0xf7,0x22,0x38,0xfc,0x9a,0x31}};
```

这是 `gAndroidFastbootTransportProtocolGuid`。

它的提供者在 `Mu_Basecore/EmbeddedPkg/Drivers/AndroidFastbootTransportUsbDxe/`：

```
[Defines]
  BASE_NAME    = FastbootTransportUsbDxe
  MODULE_TYPE  = UEFI_DRIVER

[Protocols]
  gEfiDriverBindingProtocolGuid
  gUsbDeviceProtocolGuid                    ← 依赖 UsbDeviceDxe
  gAndroidFastbootTransportProtocolGuid
```

**所以 Mi 6 的 USB fastboot 走的是：**

```
FastbootTransportUsbDxe
   └─ gUsbDeviceProtocolGuid
        └─ UsbDeviceDxe          （发送/接收/handle_event）
             └─ UsbfnDwc3Dxe     （控制器驱动，StartEx / ConfigureEnableEndpoints）
                  └─ DWC3 硬件
```

外加 `AndroidFastbootApp.c` 作为应用层。

**没有任何一环是自己写 EP0。** 这些都是 EDK2 通用模块。

## 对 chiron 的意义

`Mu-Silicium/Binaries/chiron/QcomPkg/Drivers/` 里那几个驱动：

- `UsbDeviceDxe` / `UsbConfigDxe` / `UsbfnDwc3Dxe` —— 和 OnePlus 5 md5 相同
- `UsbInitDxe` / `UsbfnChgDxe` / `UsbTypeCDxe` —— 只在 chiron 目录存在

**它们就是上面那条链的实现，本身是通用 EDK2 模块的 Qcom 移植版。**
所以正确的方向不是绕开它们，而是**让它们工作**。

loader 现在的做法（`usb_no_start_ex=1` + 自己写 EP0）是在绕开整条栈，
而 `chiron_ep0_arm_setup()` 的 `Start` 一直返回 status 1，就是因为
端点状态由 `UsbfnDwc3Dxe` 的 `StartEx` 管理，外部硬写 `Start` 命令拿不到合法的传输资源。

## 下一步应该做的

1. **不要再自己发 DEPCMD Start。** 端点生命周期归 `UsbfnDwc3Dxe`。
2. **让 `StartEx` 成功**，之后 `USB->send()` / `USB->handle_event()` 才能正常工作，
   loader 现有的 `usb_rx()` / `usb_tx()` / `fb_command()` 都能直接用。
3. `StartEx` 的失败点是 `ConfigureEnableEndpointsEx` 返回 `0x8000000000000002`，
   真实入口 `0x2598`，4 参数，第 4 个参数由 `0x26d0` 校验为 `0x30`/`0x31` 描述符。
   已补上 SS 能力描述符但仍失败，失败点在其后的 `0x2a40` 附近。

## 已经确认有效的东西（保留）

- PHY 上电：`qusb2: powered up, 210 22 1a0 17 (lock 1)`
- VBUS 清掉 fastboot 残留连接：`vbus: dropping stale conn` → `ln 1` + SOF 在动
- Mi 6 的 DWC3 序列（select / endpoints / installEvents / runDevice）
- 事件环按 Mi 6 模式 drain（4 字节步进、偏移环绕、末尾一次性确认）
- 自动重启（含 EP0 路径的 deadline）

## EP0 代码的去留

`chiron_ep0_*` 这一整套保留但默认不启用，因为它绕开了 `UsbfnDwc3Dxe` 的端点管理，
`Start` 命令拿不到合法资源。留着作为参考，或者等确认 `StartEx` 无法修好时再回来。
