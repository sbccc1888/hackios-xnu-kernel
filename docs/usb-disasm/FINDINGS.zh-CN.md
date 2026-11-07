# chiron 原厂 USB 固件反汇编结论

固件：`Mu-Silicium/Binaries/chiron/QcomPkg/Drivers/*/`
工具：`llvm-objdump -d --no-show-raw-insn`
PE 修补：厂商 PE 的 debug directory（大小 0xee）会让 llvm-objdump 拒绝读取，
       清零 data directory 第 6 项的 8 字节后即可反汇编，其余字节不变。

SHA-256（原始文件）：
- UsbDeviceDxe.efi  8f0de6d355374a16a430fa2aacee81be7f41661e0dfb8c74aff97764cca6b5fb
- UsbConfigDxe.efi  366cccf79a9e6b1050c5dad6450ded698a90c286a087d95a2fee170c628307e2

## 一、UsbDeviceDxe（发布 Qualcomm USB Device 协议）

协议表在 `.data` 文件偏移 **+0xa0f0**：

```
+0xa0f0  revision = 0x10000001
+0xa0f8  0x1478   start
+0xa100  0x15cc   send
+0xa108  0x1660   handle_event
+0xa110  0x19ec   allocate_transfer_buffer
+0xa118  0x1a6c   free_transfer_buffer
+0xa120  0x1ac8   stop
+0xa128  0x1b9c   abort_xfer
+0xa130  0x1bf8   set_endpoint_stall_state
+0xa138  0x1c5c   start_ex
```

**注意：表到 0x1c5c 就结束了，`0x140`（+0xa140）是另一张表的开始，不是本协议的槽位。**

### StartEx @ 0x1c5c 的完整逻辑

```asm
1c70:  cbz  x20, 0x1d14        ; x20 = This，NULL 则返回 0x8000000000000002
1c74:  bl   0x1f1c             ; 取 UsbFnIo 实例 -> x0
1c7c:  tbnz x19, #0x3f, 0x1d54 ; 失败直接返回
1c84:  ldr  x0, [x21, #0x410]  ; 全局缓存的 UsbFnIo
1c88:  ldr  x8, [x0, #0x78]    ; stop_controller
1c8c:  blr  x8
1c98:  ldr  x0, [x21, #0x410]
1c9c:  ldr  x9, [x0, #0x70]    ; start_controller
1ca0:  blr  x9
1cb4:  add  x22, x22, #0x410
1cbc:  add  x1, x22, #0x8      ; 内部状态
1cc0:  add  x2, x22, #0x18
1cc4:  add  x3, x8, #0x238
1cc8:  mov  x0, x20            ; This
1ccc:  bl   0x3a94             ; 端点配置
1cd8:  ldr  x0, [x21, #0x410]
1ce0:  bl   0x200c             ; w1 = 0
1cec:  mov  x1, x22
1cf4:  ldr  x0, [x1], #0x8
1cf8:  ldr  x10, [x0, #0x90]   ; configure_enable_endpoints_ex
1cfc:  blr  x10
```

**决定性事实：整个函数从不访问 `x1`（即传入的描述符集合参数）。**
所以 StartEx 完全不看调用者给的描述符 —— 它只用 This 和内部状态。

**推论：任何关于描述符格式的修改对 StartEx 都无效。**

### 0x1f1c：获取 UsbFnIo

```asm
1f28:  adrp x20, 0xa000
1f2c:  ldr  x8, [x20, #0x410]  ; 已缓存？
1f30:  cbz  x8, 0x1f3c
1f34:  mov  x19, xzr
1f38:  b    0x1f88            ; 有 -> 直接成功
1f3c:  ... locate_handle_buffer(ByProtocol, GUID @ +0xa0a0 ...)
1f58:  ldr  x9, [x9, #0x140]   ; BS->LocateHandleBuffer
1f5c:  blr  x9
```

`+0xa0a0` 的字节是 `3a96d232 5dfe304f b6336e5d c55803cc`
= **`32d2963a-fe5d-4f30-b633-6e5dc55803cc`（UsbFnIo GUID）**

## 二、UsbConfigDxe（USB Config 协议）

协议表在 **+0xc1a8**：

```
+0xc1a8  revision = 0x10003
+0xc1b0  0x1440   QueryCoreCount
+0xc1b8  0x1488   QueryCoreInfo
+0xc1c0  0x14d0   StartController    <- 包装
+0xc1c8  0x14dc   StopController     <- 包装
+0xc1d0  0x14e8   ConfigUsb
+0xc1d8  0x1530   ?
+0xc1e0  0x15a4   ?
```

### StartController：包装 + 实现

```asm
; 包装 @ 0x14d0
14d0:  mov w0, w1     ; 实现参数1 = 原 w1
14d4:  mov w1, w2     ; 实现参数2 = 原 w2
14d8:  b   0x2cd0

; 实现 @ 0x2cd0
2cdc:  mov  w8, w1          ; w8 = 实现参数2
2ce0:  mov  w9, w8
2ce4:  mov  w10, #0xd0      ; core 记录大小 208 字节
2ce8:  cbz  w8, 0x2d14      ; ★ 必须为 0，否则：
2cfc:  orr  w0, wzr, #0x80000000
2d00:  mov  w3, w8
2d08:  movk x19, #0x2       ; ★ 返回 0x8000000000000002
2d10:  b    0x2d54

2d14:  adrp x8, 0xc000
2d18:  add  x8, x8, #0x218
2d1c:  madd x8, x9, x10, x8 ; base + w8 * 0xd0
2d20:  ldr  x0, [x8, #0x18]
2d24:  ldr  x11, [x0, #0x38]
2d28:  blr  x11
```

**w0（实现参数1）在整个函数中从未被读取。索引只用 w1。**

**这意味着 `EFI_USB_CONFIG_START_CONTROLLER(This, X, Y)` 里，Y 必须为 0，X 被丢弃。**

## 三、UsbfnDwc3Dxe（发布 UsbFnIo）

- UsbFnIo GUID 在文件偏移 **0x130e0**
- gEfiDriverBindingProtocolGuid 在 **0x13100**
- 安装点 `0x1b00`：`InstallMultipleProtocolInterfaces(handle, &UsbFnIoGuid, &iface, ...)`
  后接 `ConnectController`（`0x1b38`，BS 槽位 0x90）

**UsbFnIo 实例是运行时在驱动私有结构里构造的（`x20+0xdf8` / `x20+0xe00` 两处 AllocatePool），
不是静态表。所以从 loader 侧看到的 `0x50` 之后的数据不是"表外内存"，
而是这个实例的其他字段 —— 之前"表在 0x48 结束"的结论因此是错的。**

## 四、待解决

1. `StartController(This, ?, ?)` 的两参数语义仍未定论：
   - 可能是 `(This, CoreNum, ModeType)`，ModeType 必须 0
   - 也可能参数顺序不同
   需要找 `UsbfnDwc3Dxe` 里 `[UsbConfig+0x10]` 的实际调用点。

2. `0x8000000000000002` 的确切来源：
   - UsbConfig::StartController 的 mode != 0 分支
   - 或 StartEx 内 `0x3a94` 的失败
   需要在真机日志里区分两者的调用序列。
