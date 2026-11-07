# chiron USB 驱动的真实来源 —— 实测

## 结论

**`Mu-Silicium/Binaries/chiron/QcomPkg/Drivers/` 下的 USB 驱动不是 chiron 原厂固件，
其中三个核心驱动是从 OnePlus 5 借来的，另外三个来源不明。**

这不是推测，是哈希对比与目录普查的直接结果。

## 一、原厂 chiron 固件里没有 PE 模块

从手机分区直接提取（`/dev/block/bootdevice/by-name/`）：

```
dd if=/dev/block/bootdevice/by-name/abl of=abl.bin     # 2 MB, ELF64 ARM64
dd if=/dev/block/bootdevice/by-name/xbl of=xbl.bin     # 7.8 MB, ELF64 ARM64
```

扫描全文件找 `MZ` + `PE\0\0` 组合：

```
xbl.bin (0x7d9000):  PE 模块 0 个
abl.bin (0x200000):  PE 模块 0 个
```

**原厂引导链是 Qualcomm XBL 架构，不含 UEFI DXE 模块。**
xbl 里的 FV（`EFI_FIRMWARE_FILE_SYSTEM2_GUID` @ `0x77360`）长度声明 `0x300000`，
但按 FFS 遍历时第一个条目就是 `0xffffff`（空），说明它不含实际模块。

xbl 里能读到的是配置文本，不是驱动：

```
## USB ##
USBHS1_Config = 0x0
UsbFnIoRevNum = 0x00010001

0x0A800000, 0x0011B000, "USB30_PRIM", AddDev, MMAP_IO, UNCACHEABLE, MmIO, NS_DEVICE
0x0A920000, 0x00010000, "USB_RUMI",   AddDev, MMAP_IO, UNCACHEABLE, MmIO, NS_DEVICE
```

**注意 `USB30_PRIM` 的地址 `0x0A800000`、长度 `0x0011B000` —— 这正是我们一直在操作的 DWC3 基址。**

## 二、三个核心驱动与 OnePlus 5 md5 一致

```
UsbDeviceDxe   chiron 8f0de6d355374a16  cheeseburger 8f0de6d355374a16  SAME
UsbConfigDxe   chiron 366cccf79a9e6b10  cheeseburger 366cccf79a9e6b10  SAME
UsbfnDwc3Dxe   chiron 1b18bf8b15d95181  cheeseburger 1b18bf8b15d95181  SAME
```

`Mu-Silicium/Platforms/Xiaomi/chironPkg/chiron.dsc:121` 自己写着：

```
# OnePlus 5 build that was measured to work on MSM8998 (md5-identical files).
```

## 三、另外三个驱动只在 chiron 目录存在

```
UsbfnChgDxe   find . -name 'UsbfnChgDxe.efi'   -> 只有 ./chiron/
UsbTypeCDxe   find . -name 'UsbTypeCDxe.efi'   -> 只有 ./chiron/
UsbInitDxe    多数设备有，但 chiron 的那份与其余不同
```

72 个其他设备都没有 `UsbfnChgDxe` / `UsbTypeCDxe`。

## 四、DSC 注释与实际配置矛盾

`chiron.dsc:127` 注释：

```
# UsbInitDxe, UsbfnChgDxe and UsbTypeCDxe stay out: they poll for a USB Type-C
# protocol this firmware does not publish, which buries the kernel log.
```

但实际构建列表 `chiron.dsc:107-118`：

```
107  Binaries/chiron/QcomPkg/Drivers/UsbfnChgDxe/UsbfnChgDxe.inf   ← 注释说要排除
108  Binaries/chiron/QcomPkg/Drivers/UsbTypeCDxe/UsbTypeCDxe.inf   ← 注释说要排除
109  Binaries/chiron/QcomPkg/Drivers/UsbTypeCDxe/UsbTypeCDxe.inf   ← 重复
110  Binaries/chiron/QcomPkg/Drivers/UsbfnChgDxe/UsbfnChgDxe.inf   ← 重复
111  Binaries/chiron/QcomPkg/Drivers/UsbfnDwc3Dxe/UsbfnDwc3Dxe.inf
112  MdeModulePkg/Bus/Usb/UsbBusDxe/UsbBusDxe.inf
113  MdeModulePkg/Bus/Usb/UsbKbDxe/UsbKbDxe.inf
114  MdeModulePkg/Bus/Usb/UsbMassStorageDxe/UsbMassStorageDxe.inf
115  Binaries/chiron/QcomPkg/Drivers/UsbMsdDxe/UsbMsdDxe.inf
116  Binaries/chiron/QcomPkg/Drivers/UsbDeviceDxe/UsbDeviceDxe.inf
117  Binaries/chiron/QcomPkg/Drivers/UsbConfigDxe/UsbConfigDxe.inf
118  Binaries/chiron/QcomPkg/Drivers/UsbInitDxe/UsbInitDxe.inf      ← 注释说要排除
```

**注释说排除，配置在包含。而且 107/108 与 109/110 是重复条目。**

## 五、这解释了什么

`UsbConfigDxe:0x32a4` 的参数校验（前文已反汇编确认）：

```
32c4: cbnz w9, 0x32e0      ; w0 (CoreNum) 必须 == 0
32c8: cmp  w8, #0x10000
32cc: b.hs 0x32e0          ; w1 (ModeType) 必须 < 0x10000
32e0: ... 返回 0x8000000000000002
```

**OnePlus 5 是单核 USB 配置。而 chiron 的 `pick` 日志显示 `core 1` 与 `core 0` 两个核心都在：**

```
pick 0: core 1 mode 10000 dev 0
pick 1: core 0 mode 4 dev 0
pick 2: core 0 mode 4 dev 0
```

**`hk6: start peripheral 8000000000000002` 一直失败，与"借来的驱动只接受 core 0、而 chiron 报告的前两个是 core 1"完全吻合。**

## 六、下一步方向

1. **让 DSC 与注释一致**：去掉 `UsbfnChgDxe` / `UsbTypeCDxe` / `UsbInitDxe`，看日志是否变干净
   - 风险：loader 的 `QCOM_USB_INIT_GUID` 路径依赖 `UsbInitDxe`，去掉后 `init->start_controller` 不可用
2. **从 xbl 逆出原厂 USB 初始化序列**，在 loader 里自己实现，不依赖任何 DXE 驱动
   - xbl 是 ARM64 ELF，需要先建立 file offset → vaddr 映射
