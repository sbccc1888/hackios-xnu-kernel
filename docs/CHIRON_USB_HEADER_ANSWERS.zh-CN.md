# 从固件头文件直接排除的若干怀疑

今晚有几次怀疑，查一下头文件就能排除，不需要硬件。记录在此，避免重复。

---

## 1. `endpoint_index` 的形式 — 比较是正确的

**怀疑**：`usb_wait()` 用 `0x81`/`0x01`（原始端点地址）去比较 `endpoint_index`，
如果驱动报的是裸端点号 `1`，则永不匹配，所有传输静默超时。

**头文件直接回答**（`EFIUsbDevice.h:74`）：

```c
typedef struct {
    USB_DEVICE_TRANSFER_STATUS Status;
    UINT8 EndpointIndex;
    UINTN BytesCompleted;
    VOID *DataBuffer;
} USB_DEVICE_TRANSFER_OUTCOME;
```

`Send()` 的参数文档（`:159`）：

> `EndpointIndex` — Endpoint index, **as specified in endpoint descriptors**

**端点描述符里写的是 `0x81`/`0x01`，事件报的是同一种形式，比较写法正确。**

**结论：不存在这个 bug。**

---

## 2. `usb_rx()` 的返回值 — 是长度，不是状态码

**怀疑**：`download` 路径把 `usb_rx()` 的返回值当字节数用，若返回的是状态码则数据错乱。

**代码直接回答**（`usb_wait` 第 7511 行）：

```c
return data.transfer.status == UsbDeviceTransferStatusCompleteOK
    ? (int64_t)data.transfer.bytes_completed : -1;
```

**成功时返回 `bytes_completed`，是真实长度。用法正确。**

---

## 3. `Descriptors` 数组是否需要 NULL 终止 — 不需要

**怀疑**：`set.descriptors = &cfg` 缺终止符，驱动遍历越界。

**头文件直接回答**（`EFIUsbDevice.h:268`）：

> The size of the array is `DeviceDescriptor->NumConfigurations`

**由计数决定，不靠终止符。`bNumConfigurations = 1`，单元素数组正确。**

（这条已在 `5373843` 撤回，此处合并记录。）

---

## 4. `ghwparams` 偏移 — 是 `0xC140` 不是 `0xC100`

**这条是真的错误**（已在 `178769e` 修正）：

```
dwc3/core.h:
  DWC3_GHWPARAMS0  0xc140
  ...
  DWC3_GHWPARAMS7  0xc15c
```

我们的 `env_snap` 一直读 `0xC100..0xC10C`，那**不是** GHWPARAMS。
任务清单第 4 项"读 GHWPARAMS 确认配置"**从未真正执行过**。

---

## 5. `UsbInit`/`UsbConfig` 能否传速度 — 不能

查过三个协议的完整结构：

| 协议 | 字段 |
|---|---|
| `EFI_PLATFORMINFO_PROTOCOL` | `platform / version / subtype / fusion / OEMVariantID` |
| `UsbInit` | `core_num / mode_type` |
| `UsbConfig` | `core_num / mode_type` + VBUS 回调 |

**都没有 USB 速度字段。`maximum_speed` 在 UEFI 下确定没有来源。**

---

## 模式

**5 次怀疑里，3 次查头文件就能排除，1 次是真错误，1 次是确认无解。**

**共同点：怀疑都产生于"代码看起来应该出错"的直觉，而答案通常写在同一目录的头文件里。**

**今晚有三次是先加了诊断代码、后来才发现文档早就回答了问题**
（`endpoint_index`、`Descriptors` 终止符、`wtest` 的只读位）。

**规则：在写诊断代码之前，先在固件头文件里搜一下那个字段名。**
