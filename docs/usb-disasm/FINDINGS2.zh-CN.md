# chiron 原厂 USB 固件反汇编结论（第二轮修正）

## 已证实：UsbConfig 协议表正确定名

`UsbConfigDxe.efi`，文件偏移 +0xc1a8：

| 偏移 | 地址 | 名称 | 依据字符串 |
|---|---|---|---|
| +0xc1a8 | revision=0x10003 | | |
| +0xc1b0 | 0x1440 | **UsbConfigStartController** | `UsbConfigStartController` @0x7eaf |
| +0xc1b8 | 0x1488 | **UsbConfigStopController** | `UsbConfigStopController` @0x7ec8 |
| +0xc1c0 | 0x14d0 | ToggleMode (EnterLPM) | `UsbConfigToggleMode` @0x7f0a |
| +0xc1c8 | 0x14dc | ToggleMode (ExitLPM) | `ExitLPM` @0x945d |
| +0xc1d0 | 0x14e8 | GetCoreCount | `UsbConfigGetCoreCount` @0x7f35 |
| +0xc1d8 | 0x1530 | GetSupportedMode | `UsbConfigGetSupportedMode` @0x7f6d |
| +0xc1e0 | 0x15a4 |   | `UsbConfigLibGetSupportedMode` @0x7f87 |

**第一轮把 0x2cd0/0x2d64 当成 Start/Stop 是错的 —— 那是 EnterLPM/ExitLPM。**
真正的实现是 **Start @0x32a4**、**Stop @0x384c**。

## 已证实：参数语义

三处内部调用完全一致：

```asm
16a0:  orr  w1, wzr, #0x4      ; peripheral
16a4:  mov  w0, wzr            ; core 0
16a8:  bl   0x32a4

3ac8:  orr  w1, wzr, #0x1      ; host
3acc:  mov  w0, wzr
3ad0:  bl   0x32a4
```

配合 `0x32a4` 开头 `mov w8,w1; mov w9,w0; cbnz w9 -> error`：

**实现签名 = `(w0 = CoreNum, w1 = ModeType)`，CoreNum 必须为 0。**

而协议条目 `0x1440` 是 `mov w0,w1; mov w1,w2; bl 0x32a4`，即调用者看到的是：

```
EFI_USB_CONFIG_START_CONTROLLER(This, ModeType, CoreNum)
```

**这与本仓库 efi.h 声明的 `(self, core, mode)` 顺序相反。**

## 已证实：ModeType 合法值只有 1/4/8/0x10

```asm
32c0:  movk x19, #0x2          ; 预设 0x8000000000000002
32c8:  cmp  w8, #0x10000
32cc:  b.hs error              ; >= 0x10000 -> 保留预设值
32d0:  cmp  w8, #0x8
32d8:  orr  w8, wzr, #0x1      ; 8    -> 1
3304:  cmp  w8, #0x10
330c:  orr  w8, wzr, #0x4      ; 0x10 -> 4
3314:  cmp  w8, #0x1
3318:  ccmp w8, #0x4, #0x4, ne
331c:  b.ne 0x343c             ; 既非 1 也非 4 -> 错误
```

**本仓库原有 `UsbModePeripheral = 0x02` 是错的，0x02 必落到 `b.ne 0x343c`，
返回预设的 `0x8000000000000002`（EFI_INVALID_PARAMETER）。已改为 0x04。**

## 已证实：StartController 可能"成功但什么都不做"

```asm
3328:  ldp  w14, w15, [x20, #0xc8]
332c:  ldr  w1,  [x20, #0xb4]   ; 当前模式
3338:  cmp  w1,  w21            ; 与请求相同？
333c:  b.ne 0x3348
3340:  mov  x19, xzr            ; 是 -> 返回 SUCCESS，不动硬件
3344:  b    0x34a8
```

**这解释了 HK3 的 "start peripheral controller: Success" 却 "USB Function IO: Not Found"。**

确认路径 `0x398c` 会把 `0x10000` 写进当前模式字段（`str w0,[x20,#0xb4]`）——
**这是"无模式"哨兵值，写入后任何 1/4 都会被视为不同，从而走真正启动路径。**

## 已证实：StopController 要求目标模式等于当前模式

```asm
38d4:  ldr  w4, [x20, #0xb4]
38d8:  cmp  w4, w9
38dc:  b.ne 0x3938            ; 不同 -> 错误路径
3958:  add  x19, x19, #0x11   ; 返回 0x8000000000000002 + 0x11
```

字符串佐证：`Error - Unable to stop controller on core %d (curr mode %d, target mode %d)`

## UsbInit 协议 vs UsbConfig 协议

| 协议 | GUID | Start 签名 |
|---|---|---|
| Qualcomm USB Init | `2da15ac7-...` | `(This, CoreNum, ModeType)`（转调 UsbConfig） |
| Qualcomm USB Config | — | `(This, ModeType, CoreNum)` |

**本仓库 `efi_qcom_usb_init` 的 `start_controller(self, core, mode)` 顺序对应 UsbInit，是对的；
但如果直接拿 UsbConfig 表调用，顺序必须反过来。**

## 待办

1. 确认本仓库 HK6 里 `init` 变量到底是 UsbInit 还是 UsbConfig 表
2. 若为 UsbConfig，修正参数顺序为 `(self, mode, core)`
3. 用 `0x10000` 哨兵清模式，避免"成功但无动作"
