# UsbDeviceDxe 的 Start 已被调用，limit 已填上（实测 K4）

## 突破

之前一直卡在 `ConfigureEnableEndpointsEx` 返回 `0x8000000000000002`，
探针显示 `self+0x220 limit 0`。

K4 实测：

```
startex: dev 9bf85000 cached 0 ours 9bdf2020
devstart: obj 9bf8f140 | 1e8 0 220 0 before
devstart: called -> 0 | 1e8 9bdf2020 220 4000 after
```

**`220` 从 `0` 变成了 `4000`。** 这就是 `UsbDeviceDxe` 的描述符缓冲大小，
之前一直是 0，所以任何 `wTotalLength` 都会被判为超标。

## 怎么做到的

`UsbDeviceDxe` 的 driver-binding Start 在 `模块基址 + 0x200c`，它的开头就是：

```asm
2018: cbz  x0, 0x2080            fn == NULL 就报错
2020: add  x20, x20, #0x140      模块自己的对象 = 基址 + 0xa140
202c: str  x0, [x20, #0x1e8]     对象->0x1e8 = 传进来的 UsbFnIo
2040: str  x9, [x20, #0x220]     对象->0x220 = 0x4000  ← 描述符缓冲
204c: ldr  x10, [x0, #0x60]
2050: blr  x10                   再调 UsbFnIo->fn[0x60]
```

直接调用 `(dbase + 0x200c)(fn)` 就把它跑起来了，返回 `0`。

Mi 6 是通过 `ConnectController` 间接触发的（QcomFastboot 的 `ConnectPeripheral`），
我们这里 `ConnectController` 到不了，所以直接调。

## 顺带修正一个错误的探针

之前读的是 `基址 + 0xa410`，那是错的。该字段在 `0xa140 + 0x1e8 = 0xa328`，
所以永远读到 0，把判断带偏了好几轮。

## 还没解决的

`_ex` 仍然失败，而且 `desc wTotal` 打印成 `0x8000`：

```
usbfn: ConfigureEnableEndpoints_ex(NULL ss) 8000000000000002
usbfn: desc wTotal 8000 | self+0x220 limit 0
```

两个问题：

1. `limit 0` 是在调用 `devstart` **之前**打印的（顺序问题，不是真的还是 0）
2. `wTotal 8000` = 32768，我们传的描述符只有 32 字节

`wTotal` 读错的根源在 `UsbDeviceDxe 0x29d4-0x29e8`：

```asm
29d4: ldr x5, [x19, #0x268]
29dc: ldr x6, [x5]              驱动自己那份描述符副本
29e0: strb w9, [x6, #1]         byte1 = 7
29e4: ldr x7, [x19, #0x268]
29e8: ldr x2, [x7]
2a40: ldrb w10, [x20, #7]       而 x20 是另一条链
```

驱动维护着自己的描述符副本（`self+0x268` 双重解引用），
`wTotalLength` 是从那份副本里读的，不是从我们传的 `dev_info`。
所以即便 `+0x220` 已经正确，比较的双方仍然不是同一个东西。

## 下一步

要让 `self+0x268` 指向的描述符副本里 `wTotalLength` 正确。
那条链的填充在 `0x2e94`（`bl 0x2e94` 之后立刻 `ldr x5, [x19, #0x268]`），
从那里往回找是谁分配的、按什么长度填的。
