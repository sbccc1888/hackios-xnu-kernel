# 哪些寄存器归驱动，哪些归我们

今晚最后三个提交（`1a5a240`、`471cc55`、`b42b8fa`）移除了对 `StartController`、`DCTL`、
`DCFG`、`GCTL` 的直接写入，理由是“驱动拥有这些寄存器，绕过它会让状态机与硬件不一致”。

这个推理需要一条边界，否则会无限扩大——把所有寄存器写入都当成“绕过驱动”而移除。
本节把边界定下来，并给出判断依据。

---

## 1. 驱动拥有什么

`UsbfnDwc3Dxe.efi` 的字符串是直接证据：

```
DwcConfigureEventBuffer              分配并编程事件环
Failed to get event count            读 GEVNTCOUNT
Failed to get next event             消费 GEVENT 条目
UsmProcessEventWorker                状态机工作线程
Control state machine failed to process reset event
Control state machine failed to process disconnect event
physical endpoint %d already configured
physical endpoint %d is in invalid state %d
Failed to Start USB Controller
```

加上 `UsbDeviceDxe`：

```
UsbDevDescInitDescriptors
Failed to configure and enable endpoints
Failed to initialize state machine
Failed to Start USB Controller
```

**结论：DWC3 控制器的核心状态归驱动。**

| 寄存器 | 归属 | 依据 |
|---|---|---|
| `DCTL` (0xC704) | **驱动** | 状态机管 RunStop |
| `DCFG` (0xC700) | **驱动** | 从链路协商推导速度 |
| `GCTL` (0xC110) | **驱动** | 从请求的模式推导角色 |
| `DEVTEN` (0xC708) | **驱动**（读-改-写） | 驱动选择要哪些事件 |
| `GEVNTADRLO/SIZ` | **驱动** | `DwcConfigureEventBuffer` |
| 端点配置 | **驱动** | `ConfigureEnableEndpoints` |

---

## 2. 驱动**不**拥有什么

`UsbfnDwc3Dxe` 的字符串里**没有任何 QUSB2 PHY 相关的编程代码**：

```
（grep qusb|phy_init|analog|tune|efuse|C012000 → 无匹配）
```

它使用 `UsbConfigProtocol` 的 `GetSSUsbFnConnStatus` 查询连接状态，
但**不写 PHY 寄存器**。

`UsbConfigDxe` 里也没有 QUSB2 PHY 的初始化序列。

**结论：QUSB2 PHY（`0xC012000`）没人管，必须由 loader 自己编程。**

| 寄存器 | 归属 | 依据 |
|---|---|---|
| `0xB4` PORT_POWERDOWN | **loader** | 驱动不写 |
| `0xB8` PORT_TEST_CTRL | **loader**（本轮新增） | 驱动源码有对应序列，UEFI 无 |
| `0x184/0x18c/0x23c/0x240/0x24c` | **loader** | dtsi 初始化序列 |
| `0x210` PWR_CTRL1 | **loader** | 上电控制 |
| `0xC0/0xC4` UTMI_CTRL | **不写** | 工作硬件为 0 |
| `0x90` TUNE5 | **loader** | PHY 调优 |

---

## 3. 灰色的部分

| 项目 | 状态 |
|---|---|
| `HS_PHY_CTRL_REG` (0xF8810) VBUS override | **loader 写是对的**：固件的 `get_vbus_status` 返回 `EFI_NOT_FOUND`，PMIC 栈未初始化，没有别的途径 |
| GCC 时钟/GDSC/BCR | **loader 写是对的**：这是平台初始化，发生在任何驱动启动之前 |
| `DEVTEN` | loader 只做读-改-写，**不覆盖**驱动的选择 |

---

## 4. 判断规则

**如果一个寄存器在驱动二进制里有对应的操作字符串，它归驱动。**

反过来，**如果驱动里搜不到任何操作它的代码，loader 就必须自己写，否则没人写。**

这条规则可以推广到下一处审计：拿到一个寄存器偏移，先在所有 `.efi` 里搜相关字符串，
再决定是否该由 loader 触碰。

---

## 5. 这条边界解释了今晚的一类错误

**三个提交移除的写入，全部是“驱动有对应代码”的寄存器**（`StartController`、`DCTL`、
`DCFG`、`GCTL`）。

**而保留的 PHY 写入，是驱动里搜不到的。**

这不是巧合：早期代码是在协议栈还没组装成功的时候写的，那时**所有**寄存器都得自己管。
后来 HK6 让协议栈真正跑起来了，但那些早期写入没人回头检查哪些已经多余。

---

## 6. 待验证

这条边界是**从二进制字符串推断的，未经硬件验证**。

如果下次运行时 `late:` 报告核心是 `HALTED`，说明驱动确实需要外部帮忙启动它——
那 `StartController` 或 `DCTL` 的写入就得重新考虑。如果报告 `RUNNING`，
说明移除是对的，早期那些写入手动启动了一个驱动本来就会启动的控制器。
