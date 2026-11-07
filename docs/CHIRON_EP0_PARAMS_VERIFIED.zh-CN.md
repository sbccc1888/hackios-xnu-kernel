# EP0 的 Configure 参数已逐项核对（与 Mi 6 对比）

对照 `/tmp/ios_sagit/drivers/usb/QcomUSB/DWC3Endpoint.h:45-59` 的公式：

```cpp
parameter0 = type << 1 | maximumPacketSize << 3 |
             (physicalEndpoint & 1 ? physicalEndpoint / 2 << 17 : 0) |
             burst << 22 | (modify ? 2u << 30 : 0)

parameter1 = physicalEndpoint << 25 | 1u << 8 |
             (physicalEndpoint < 2 ? 1u << 10 : 0) | exponent << 16
```

## 我们的 mi6_endpoints() 参数

| | 值 | 推导 | 结论 |
|---|---|---|---|
| EP0 OUT PAR0 | `0x200` | `type=Control(0)<<1` + `64<<3` = 512 | 正确 |
| EP0 OUT PAR1 | `0x500` | `ep0<<25` + `1<<8` + `1<<10` | 正确 |
| EP0 IN PAR1 | `0x20500` | `ep1<<25` + `1<<8` + `1<<10` | 正确 |

`1<<10` 是 LST 位，Mi 6 对 `ep<2` 无条件设置（`DWC3Endpoint.h:58`），我们也设了。

## 一个 Mi 6 特有的例外，值得记录

`DWC3Core.h:336-338`：

```cpp
const bool setupModify = modify && ep == 0 && config.type == EndpointType::Control &&
    activeTypes[0] == unsigned(TRBType::Setup);
if ((endpointActive(ep) && !setupModify) || endpointStopping(ep)) return USB::Result::Busy;
```

**当 EP0 上已经 armed 了一个 Setup TRB 时，允许用 `modify=true` 重新配置 MPS**——
这是唯一的例外。`DWC3Core.h:332-335` 解释了原因：CONNECT_DONE 可能把 SuperSpeed
降级到 HS/FS，而这时初始 SETUP TD 已经 armed，不能断开也不能取消。

我们的 `arm_setup()` 里有一段 `if (0 && g_ep0.armed)` 的 negotiate 代码正是这个用途，
目前是关闭状态。**如果之后发现 SETUP 仍然收不到，这里是一个需要打开的候选。**

## 累计已修的三个真实 bug

1. **Setup TRB 缺 cache clean** —— CPU 写的数据从没到内存，控制器看到 `Owned=0`
2. **DATA/STATUS TRB 同样缺 clean** —— 只修 Setup 的话问题会推到回复阶段
3. **总线复位后白等 5ms 的 End** —— 超出主机约 1ms 的容忍窗口

这三条合起来正好解释「Start 成功、端点 enabled、TRB 永不被取走」。

## 未验证

手机卡在 `usb_no_start_ex` 那次留下的 `VID_0000&PID_0002`（那条路径看门狗没启动），
K5 镜像已构建待刷。
