# chiron USB 固件反汇编 第三轮：表结构定案与启动路径

## 一、UsbConfigDxe 协议表（最终定案）

文件偏移 **+0xc160** 是 revision（0x10003），其后 8 个条目，到 **+0xc1a0** 结束
（+0xc1a8 为 0，表长 8 项）。

条目地址与实现：

| 表内偏移 | 条目 | 转发到 | 名称依据（字符串引用位置） |
|---|---|---|---|
| +0xc168 | 0x13a4 | 0x28b8 | GetConnStatus |
| +0xc170 | 0x13b0 | 0x29c4 | |
| +0xc178 | 0x13bc | 0x2ba4 | |
| +0xc180 | 0x13c8 | 0x2df8 | |
| +0xc188 | 0x13d0 | 0x2e00 | |
| +0xc190 | 0x13d8 | 0x3bd4 | |
| +0xc198 | 0x1424 | 0x2e48 | |
| +0xc1a0 | 0x1434 | 0x3b3c | |

**`0x1440`（StartController）和 `0x1488`（StopController）不在这个表里** —— 它们是
另一张表（+0xc1a8 之后）的条目，或者由别处安装。

命名依据是字符串交叉引用：

    0x146c  add x2, x2, #0xeaf   -> "UsbConfigStartController"  (0x7eaf)
           所在函数起始 = 0x1440
    0x14b4  add x2, x2, #0xec8   -> "UsbConfigStopController"   (0x7ec8)
           所在函数起始 = 0x1488

## 二、StartController 的签名

发布条目 0x1440：

```asm
144c:  mov  w0, w1        ; 调用者的 w1 -> 实现的 w0
1450:  mov  w1, w2        ; 调用者的 w2 -> 实现的 w1
1454:  bl   0x32a4
```

实现 0x32a4 开头：

```asm
32b8:  mov  w8, w1
32bc:  mov  w9, w0
32c4:  cbnz w9, error     ; 实现参数1 必须为 0
```

**所以对外签名 = (This, X, ModeType)，X 必须为 0，This 被丢弃。**

`efi.h` 的 `(self, core, mode)` 在 core=0 时恰好等价，不是错误。

## 三、ModeType 合法值

```asm
32c8:  cmp  w8, #0x10000
32cc:  b.hs error
32d0:  cmp  w8, #0x8
32d8:  orr  w8, wzr, #0x1     ; 8 -> 1
3304:  cmp  w8, #0x10
330c:  orr  w8, wzr, #0x4     ; 0x10 -> 4
3314:  cmp  w8, #0x1
3318:  ccmp w8, #0x4, #0x4, ne
331c:  b.ne 0x343c            ; 既非1也非4 -> 返回预设 0x8000000000000002
```

**合法：1、4、8、0x10。本仓库原先的 0x02 是错的，已改。**

## 四、启动分支（关键）

```asm
3320:  adrp x20, 0xc000
3324:  add  x20, x20, #0x218     ; ★ 固定基址，无 core 索引
3328:  ldp  w14, w15, [x20, #0xc8]
332c:  ldr  w1,  [x20, #0xb4]    ; 当前模式
3330:  tst  w14, #0xff
3334:  csel w21, w8, w15, eq
3338:  cmp  w1,  w21
333c:  b.ne 0x3348
3340:  mov  x19, xzr            ; ★ 相等 -> 直接成功返回，不启动任何东西
3344:  b    0x34a8

3348:  cmp  w1, #0x10000
334c:  b.eq 0x3360
3350:  mov  w0, wzr
3354:  bl   0x384c              ; ★ 调 StopController（当前模式!=目标时先停）
3358:  mov  x19, x0
335c:  tbnz x19, #0x3f, 0x345c  ; 停止失败 -> 错误返回

3360:  cmp  w21, #0x4
3364:  stp  wzr, w21, [x20, #0xb0]  ; 记录当前模式
3368:  b.ne 0x33d4
336c:  ldr  x0, [x20, #0x10]
...
33a4:  ... InstallMultipleProtocolInterfaces / ConnectController
```

**要点：**

1. **这个函数只操作一条全局记录（基址 0xc218），不按 core 号索引。**
   日志里 `cfg 0 ... core 1` 的 `core 1` 是那条记录的 `core_num` 字段值。

2. **当前模式 == 目标模式 → 返回成功但什么都不做。** 这解释了 HK3 的
   "start peripheral controller: Success" 却 "USB Function IO: Not Found"。

3. **当前模式 != 目标模式时，先调 StopController。** 而 StopController（0x384c）
   要求"目标模式 == 当前模式"，否则返回 0x8000000000000002 + 0x11。

4. 当前模式为 `0x10000` 时跳过停止（`334c: b.eq 0x3360`），直接往下走。

## 五、实测对应的现象

最新一次运行（ModeType 修正为 4 之后）：

```
hk6: start peripheral 8000000000000002
hk6: cfg 0 rev 10003 core 1 mode 10000
hk6: no host config to clone on core 0
```

- 当前模式 `0x10000`（哨兵：无模式）
- 目标 4
- `0x10000 != 4`，且 `334c` 判定相等 → 跳过 StopController
- 进入 `3360`，`cmp w21,#4` 相等，继续 `336c`
- `336c: ldr x0,[x20,#0x10]` —— 读 USB 对象指针
- `3370: cbnz x0, 0x33a4` —— 非空则跳过安装，直接 ConnectController
- 最终在 `33bc` 的 ConnectController 或之后失败，返回 0x02

**下一步要确认的是 `[x20,#0x10]` 这个对象在当前状态下是否为空、
以及 `33bc` 的 ConnectController 为何返回错误。这在真机日志里还看不到，
需要在 loader 里读 `0xc218+0x10` 和 `0xc218+0xb4` 的实际值。**
