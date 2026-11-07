# HK6 序列的真实情况（实测，来自 D4/E4 日志）

## 完整枚举（E4）

```
pick: 3 config handles
pick 0: core 1 mode 10000 dev 0
pick 1: core 0 mode 4 dev 0
pick 2: core 0 mode 4 dev 0
pick: peripheral core 0 mode 4, UsbDevice looked up separately
```

**`core 0 mode 4`（peripheral）是存在的**，第 3 次 pick 就找到了。

## UsbFnIo 拿到了

```
fnio[vendor]: rev 10002 detect a1012188 cfg a10122e8 mps a10121b8 ...
cfg[ours 9bd56e18]: rev 10003 core 0 mode 4
```

`cfg[ours]` 是 `core 0 mode 4` —— 正是我们想要的状态。

## 关键：非 _ex 的 ConfigureEnableEndpoints 成功

```
usbfn: ConfigureEnableEndpoints 0
```

**这是成功的。** 端点配置走通了。

## 但 StartEx 仍然失败

```
proto poststart Cfg st 8000000000000002 n 0
usb: start_ex failed 8000000000000002
```

`poststart Cfg st 8000000000000002 n 0` —— `LocateProtocol(QCOM_USB_CONFIG_GUID)` 返回
`EFI_INVALID_PARAMETER` 且 `n = 0`，**说明这个 protocol 没被安装到数据库里**。

所以 `StartEx` 内部要 `LocateProtocol` 拿 `UsbConfig` 时拿不到。

## 之前的两次尝试为什么无效

### 传 core 0 给 start_controller

```
hk6: start peripheral (core 0) 8000000000000002
```

**core 0 也被拒。** 参数校验（`w1==0`、`w2==4`）是过的，失败在 `0x384c` 之后的 `0x38d8` 比较。

### 把 mode 字段改成 4

`hk6: mode ... -> 4` 那行**没打印**，因为第一次 pick 时只有 core 1 的句柄，
core 0 的句柄是后面 `connect_controller` 之后才出现的。

## Mi 6 的 QcomFastboot 怎么做的

`tools/patches/edk2-judypn/0001-judypn-usb-fastboot.patch` 里的 `ConnectPeripheral()`：

```c
// 1. 先试直接拿 UsbFunctionIo
Status = gBS->LocateProtocol(&gEfiUsbFunctionIoProtocolGuid, NULL, &Function);
if (!EFI_ERROR(Status)) return EFI_SUCCESS;

// 2. 拿 UsbConfig，要求 StartController(core 0, mode 4)
Status = gBS->LocateProtocol(&ConfigGuid, NULL, &Config);
Status = Config->StartController(Config, 0, 4);

// 3. 还是拿不到，就重绑 core 0 的句柄
if (Config->Core != 0) continue;
gBS->DisconnectController(handles[i], NULL, NULL);
PreviousMode = Config->Mode;
Config->Mode = 4;
Status = gBS->ConnectController(handles[i], NULL, NULL, TRUE);
```

**它的核心假设是 `LocateProtocol(&ConfigGuid)` 能成功。我们的日志说它不能。**

## 下一步

问题从"USB 枚举"缩小到"`QCOM_USB_CONFIG_GUID` 没装进 protocol 数据库"。

Mi 6 的 `mUsbGuid = {0xd9d9ce48,0x44b8,0x4f49,{0x8e,0x3e,0x2a,0x3b,0x92,0x7d,0xc6,0xc1}}`
是 `QCOM_USB`，`mUsbInitGuid` 和我们的 `QCOM_USB_INIT_EVENT_GUID` 一致。

而 `ConfigGuid = {0xe722b03f,0xb250,0x42ce,{0x8e,0xbd,0x5b,0xd5,0x18,0x12,0xd0,0x37}}`
就是 `UsbConfigDxe` 的 depex GUID —— 我们的日志里 `depex: MISSING dep01` 提到过它。

**所以要么让 `UsbConfigDxe` 真正 install 这个 protocol，要么绕开它直接调 `UsbFnIo`。**
后者已经证明可行（`ConfigureEnableEndpoints 0`），缺的是 `start_controller` 之外的启动路径。
