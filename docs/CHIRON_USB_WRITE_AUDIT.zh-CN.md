# 写入审计：五个多值偏移的结论

`write_audit.py` 标出 `loader.c` 里写了多个不同值的 5 个 PHY 偏移。
其中 2 个是真问题，3 个无害。此处记录后三个，避免重复排查。

---

## 真问题（已修）

| 偏移 | 问题 | 提交 |
|---|---|---|
| `0x01C` `PLL_AUTOPGM_CTL1` | `port_powerdown()` 写 `0x00`，启动核心前无人恢复 | `777c805` |
| `0x210` `PWR_CTRL1` | 32 位读-改-写，但实测 `r210 22222222` 表明是字节宽 | `84b9b0e` |

---

## 无害（已核实）

### `0x24C` TEST1 — 写 `0x91` 然后 `0x90`，在两个函数里各一次

```
chiron_qusb2_resume()    5548-5551
chiron_qusb2_reassert()  5600-5603
```

**`0x91 → 0x90` 是 bit0（auto-resume）的单次握手脉冲**，执行两次与执行一次等价。
**幂等，不是冲突。**

### `0x0B8` PORT_TEST_CTRL — 写 `0x0C` 然后 `0x04`

只在 `chiron_clocks_on()` 里。要确认的问题是：后续的 `reassert()` 是否会覆盖它。

**不会。** `grep 0xB8` 只找到 `chiron_clocks_on()` 里的两次写入和回读。

调用顺序：

```
7052  chiron_clocks_on()       <- 写 0xB8
7067  chiron_qusb2_init()
7341  chiron_qusb2_resume()
7343  chiron_qusb2_reassert()  <- 不碰 0xB8
```

**auto-resume 配置存活。**

### `0x090` TUNE5 — 写 `0x5a` / `0x5a5a5a5a`

写通路测试，**写完立即恢复原值**（`b_before` / `w_before`）。且由 `usb_diag` 门控。

---

## 5 个里 2 个是缺陷，3 个是审计在正常工作

**这个比例正是工具的意义**：它不做判断，只把每个问题放到一分钟内可回答的位置，
而不是留到以后变成谜团。

---

## 两个审计工具的分工

| 工具 | 输入 | 找到的问题 |
|---|---|---|
| `probe_audit.py` | 所有 `phy +` / `dwc +` 读取 | 4 个无定义偏移 → `0x1C` 引发 PLL 冲突 |
| `write_audit.py` | 所有 `phy +` 写入，按偏移分组 | 5 个多值偏移 → `0x1C` 和 `0x210` 是真问题 |

**两者都源自同一个教训**：今晚有五次推理依据的数值来自与假设不同的地方
（`0xc0/0xc4`、`run/hlt`、`wtest`、`GHWPARAMS` 偏移、`spd` 读 DCFG），
每次都是回到产生它的代码才发现的。

**机械化的代价是一分钟，人工回溯的代价是几小时。**
