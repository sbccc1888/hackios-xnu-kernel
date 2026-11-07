# chiron USB 状态（自动整理，最后更新 2026-11-07 13:20）

## 已实测生效的修复

| 提交 | 内容 |
|---|---|
| `f4d68bc` | `EFI_DRIVER_BINDING_PROTOCOL` 布局写反：EDK2 是 `+0x00 Supported / +0x08 Start / +0x10 Stop / +0x18 Version / +0x20 ImageHandle / +0x28 DriverBindingHandle`。之前 `version` 在 `+0x00`，`binding->supported` 读到 Version(`0x30`) 并跳去执行。修正后 `DWC3 Supported -> 0`、`connect -> 0`、`UsbFnIo` 首次出现 |
| `f89b880` | 移除 `USB = usbfn_with_sdp_detect(USB)` 的类型混用 |
| `1c94e54` | 两处 `reinstall_protocol_interface` 改为从真 `usbfn_io` 构建 shim |
| `a098693` | 捕获 vendor 实例时打印 revision（`0x10002` vs `0x10000001`） |
| `9496d2a`/`7cbcf63` | 崩溃后自动重置：先打印，再依次试 PSCI SMC、PSCI HVC、`ST->rt->reset_system`、看门狗 |

## 核心结论：两个协议被一个指针混用

```c
static usb_device_protocol *USB;      // 4181，由 QCOM_USB_DEVICE_GUID 填充
USB = usbfn_with_sdp_detect(USB);     // ← 曾把 usbfn_io 副本赋给它（已移除）
```

| 偏移 | `usb_device_protocol` | `efi_usbfn_io` |
|---|---|---|
| `+0x08` | `start` | `detect_port` |
| `+0x10` | `send` | `configure_enable_endpoints` |
| `+0x18` | `handle_event` | `get_endpoint_max_packet_size` |
| `+0x30` | `stop` | `abort_transfer` |
| `+0x48` | `start_ex` | `event_handler` |

**日志证据**：`shim: EventHandler calls 1 ... ret 2` 就是 `USB->start_ex(&set)` 派发到 `shim_evt_handler`。`StartEx` 从未被到达。

## 关键地址（基于我们的镜像，sha `1b18bf8b`，与 ios-party 分析的另一版不同）

- `UsbDeviceDxe` 协议表：文件 `+0xa0f0`，运行时 `base+0xa0f0`
- `start`=`0x1478`（**六个参数**，`14b4/14b8/14bc` 判空三个）
- `start_ex`=`0x1c5c`
- `send`=`0x15cc`，`handle_event`=`0x1660`
- `0x3a94` 描述符初始化；错误出口 `0x3c44` 打印 `UsbDevDescInitSSDevInfo: Invalid parameter`
- `0x8230` = `ValidateDeviceInfo`，**校验完整 SuperSpeed 树**（所有错误串带 `SS` 前缀，含 `SS endpoint companion`）
- `ConfigureEnableEndpointsEx` = `UsbfnDwc3Dxe` RVA `0x2584`，第三参数是 `efi_usb_config_info`，且**要求 SS 端点伴随描述符**

## 已推翻（勿再测）

- `0x2cd0`/`0x2d64` 是 `EnterLPM`/`ExitLPM`
- `0x4a68` 不是入口（无 qword 引用、无 `bl`）
- `UsbModePeripheral = 0x04`；`0x8000000000000002 = EFI_INVALID_PARAMETER`
- `"0xB4 是 v1 专属"` 错（固件写 `0xB4=0x19`）；`"TUNE1 应保留 0xf0"` 错（固件写 `0xa5`）
- `CONNSTAT`/`USBLNKST`/`0xF4` 不反映线状态；`SOFFN` 不可用
- `"StartEx 停在 stop/start"` 错
- `"cached 0 说明缓存没填"` 错（探针时机不对）
- `"捕获后又被覆盖"` 错（两个数值来自不同构建）
- `"USB->start_ex 能绕过 StartEx"` 错——`+0x48` 就是 `StartEx` 本身

## 待验证

**设备已连续 16 轮不在任何 USB 总线上。** 上述修复中 `f89b880`/`1c94e54`/`a098693` 从未在真机运行过。

## 下一步

1. 设备回来后先跑一次当前构建，确认崩溃自动恢复是否生效
2. 看 `usbfn: captured vendor instance %x rev %x` 印的是否 `usbfn_io`
3. 看 `USB->start_ex` 现在是否真的到达 `0x1c5c`（而非派发到 `event_handler`）
