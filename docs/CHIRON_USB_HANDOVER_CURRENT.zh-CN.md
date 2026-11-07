# chiron USB 枚举 —— 完整交接（当前状态）

## 一句话

设备已在 Windows 出现（`VID_0000&PID_0002`，主机完成复位/寻址/GET_DESCRIPTOR），
**只差有人应答描述符**。下一步是照 Mi 6 的做法自己实现 EP0。

---

## 一、已成功（实测日志）

### 1.1 设备出现在 Windows

```
USB\VID_0000&PID_0002\5&276C915B&0&10    "未知 USB 设备(设备描述符请求失败)"
```

`VID_0000`/`PID_0002` 是 Windows 拿不到描述符时的占位符。主机已经：
- 检测到 D+ 上拉
- 发出总线复位
- 分配地址
- 发出 GET_DESCRIPTOR

这在之前任何一轮都没发生过。

### 1.2 D+ 全程保持

```
snap A-before-start_ex  ... ln 0     PHY 未驱动
snap B-after-start_ex   ... ln 1     start_ex 拉起 D+
snap C-after-recover    ... ln 1     保持
snap C-after-mi6        ... ln 1     保持
```

`ln` = QUSB2PHY_INTR_STAT(0x230) 的 bit[1:0]，单端接收器读数。两线都低 = 0。

### 1.3 PHY 上电成功

```
qusb2: powered up, 210 22 1a0 17 (lock 1)
```

`0x1A0` bit0 = PLL 锁定。之前所有运行都是 `210 23 ... lock 0`。

### 1.4 DWC3 端点配置成功

```
mi6ep: StartConfiguration 1 reply 0
mi6ep: Configure ep0out 1 reply 1
mi6ep: Configure ep0in 1 reply 1
mi6ep: Resource ep0out 1 reply 10002
mi6ep: Resource ep0in 1 reply 20002
mi6ep: DALEPENA now 3
mi6ev: installed adr 99f2b000 siz 1000 | now adr 99f2b000 siz 80001000
mi6: after run DSTS 920001 (Halted 0)
```

### 1.5 事件环收到主机流量

```
mi6ring: adr 99f28000 cnt 1c
  ev0 raw 301
  ev1 raw 50301
  ev2 raw 30301
  ev3 raw 30601
  ev4 raw 101
  ev5 raw 201
  ev6 raw 301
```

控制器把主机事件写进环了。但**没有类驱动消费它们** —— 这些是我自己 dump 出来的。

### 1.6 自动重启正常

每轮 USB 失败后约 20-40 秒自动重启回 Android，不需要手动按键。

---

## 二、已修复的 bug（都是"自己拆自己成果"）

### 2.1 post-start_ex 的 PHY 重初始化

```
snap B ... ln 1      start_ex 成功
post-start_ex: full PHY re-init
snap C ... ln 0      D+ 没了
```

设备出现在 Windows 随后消失，就是这两个快照之间的间隔。

**修法**：只在链路确实断开时才重初始化。
判据：`CONNECTSTAT` 或单端接收器。

### 2.2 Mi 6 序列无条件执行

厂商路径已把 D+ 拉起，序列又做软复位把成果拆掉。

**修法**：改成后备，链路活着就跳过。
```
mi6: gate conn 0 ln 1 -> skip, vendor link is live
```

### 2.3 usb_connected 标志不可信

只在收到 `UsbDeviceEventDeviceStateChange` 时置位，这个事件从不出现。
标志读 0 时线路其实活的，代码据此丢掉会话。

**修法**：驱动中的线路也算连接。
```
usb: recover view conn 0 ln 1 wire 1 flag 0
usb: connected after endpoint recovery (by wire)
```

### 2.4 VBUS 不该跳过

旧代码在 `CONNECTSTAT` 置位时跳过 VBUS 写入。但 `CONNECTSTAT` 无论 PHY 是否驱动线路都读 1。

**修法**：无条件下发 HS + SS scratch。

### 2.5 print 的 %s 传了整数

```c
print("... %s ...", (uint64_t)(... ? 1 : 0));   // far=1 崩溃
```

**已修成 %d。**

---

## 三、当前卡点

`ConfigureEnableEndpointsEx` 返回 `0x8000000000000002`。

### 3.1 已确认的事实（反汇编）

```
usbfn: stop_controller 0                      ← 成功
usbfn: start_controller 0                     ← 成功
usbfn: ConfigureEnableEndpoints 0             ← 非 _ex 版本成功
usbfn: ConfigureEnableEndpoints_ex(NULL ss) 8000000000000002
usbfn: ConfigureEnableEndpoints_ex(ss=cfg_info) 8000000000000002
usbfn: self 9bdc4020 self-8 66627375 (want 73756662)
```

`_ex` 真实入口是 **0x2598**，不是 0x2584（后者只有 `ret`）：

```asm
2598: stp  x22,x21,[sp,#-0x30]!
25ac: mov  x19, x3           ← 第 4 个参数
25b8: mov  x1, x19
25c4: bl   0x26d0            ← 校验它
25c8: tbz  x0,#0x3f, 0x26b8  ← bit63 清就失败，返回 7
```

`0x26d0` 把 `x3` 当描述符读：

```
26f8: ldrb w9,[x20]          byte[0]，检查 bit5/6，非零失败
2710: ldrb w3,[x20,#1]       byte[1] 当 bDescriptorType
2714: cmp  w3,#0xb
2750: type-0x30 < 2 -> ok    只接受 0x30 / 0x31
2a40: ldrb w10,[x20,#7]      通过后读 byte[7:6] 当 wTotalLength
2a58: ldr x15,[x19,#0x220]   和 self+0x220 比较
```

**已补第 4 参数（SS 能力描述符，type 0x30），但 `_ex` 仍返回 0x02** →
失败点在 `0x26d0` 之后、`0x2a40` 之后的某个地方。

### 3.2 为什么这条路不好走

即使修好 `_ex`，后面还有整个 UsbDeviceDxe 类驱动栈要调通。
而且 `usb_no_start_ex=1` 时 UsbDeviceDxe 被绕过，没人拥有 EP0 —— 这才是
`VID_0000&PID_0002` 的直接原因。

---

## 四、Mi 6 的做法（关键参考）

仓库：https://github.com/MC-XiaoXiao/ios_sagit
路径：`drivers/usb/QcomUSB/`
**同一颗 SoC（MSM8998），USB device mode 工作正常，High-Speed 枚举成功。**

### 4.1 Mi 6 完全不用 UEFI 的 Usb*Dxe

它自己实现 IOKit 驱动，直接操作 DWC3 寄存器。

### 4.2 启动顺序（QcomUSBDevice.cpp:255-294）

```
Admission → SelectDevice → StartConfiguration → ConfigureEP0In/Out
→ ControlNegotiate → InstallEvents → ControlStart → RunDevice → Running
```

### 4.3 select()：DWC3Core.h:121-175

```cpp
// 1. 清所有中断器的事件指针
for (n = 0; n < interrupts; ++n) {
    count = read(eventCount(n));
    if (count) write(eventCount(n), count);
    write(eventSize(n), EventMask);              // 1<<31
    write(eventAddressLo(n), 0); write(eventAddressHi(n), 0);
}
// 2. GCTL 切设备模式
ctl &= ~(PortMask | (3u << 4) | (1u << 1));
ctl |= PortDevice;                                // 2<<12
write(GCTL, ctl);
// 3. 清 PHY 挂起
write(GUSB2PHYCFG, usb2 & ~((1u << 6) | (1u << 8)));
write(GUSB3PIPECTL, pipe & ~(1u << 17));
write(GUCTL1, uctl | (1u << 17));
// 4. 先清 Run，软复位，等 Halted
write(DCTL, (ctl & ~Run) | SoftReset);           // Run=1<<31, SoftReset=1<<30
poll(DCTL, SoftReset, 0, 1000);
poll(DSTS, Halted, Halted, 10000);               // Halted=1<<22
write(DEVTEN, 0); write(DALEPENA, 0);
```

### 4.4 installEvents()：DWC3Core.h:174-188

```cpp
write(eventSize(0), EventMask);              // 先 mask
count = read(eventCount(0));
if (count) write(eventCount(0), count);      // drain
write(eventAddressLo(0), address);
write(eventAddressHi(0), address >> 32);
write(eventSize(0), EventMask | bytes);      // 最后 unmask
```

### 4.5 configureEndpoint()：DWC3Core.h:328-354

```cpp
command(ep, Command::Configure, param0, param1, 0, 0, reply);
command(ep, Command::Resource, 1, 0, 0, 0, reply);
io.write(DALEPENA, read(DALEPENA) | (1u << ep));
```

DEPCMD 寄存器在 `0xc800 + ep*16`：
```
base+0  PAR2    base+4  PAR1    base+8  PAR0    base+12 CMD
```
硬件要求先写 PAR2/PAR1/PAR0，最后写 CMDACT。

参数编码（DWC3Endpoint.h:45-59）：
```cpp
parameter0 = type<<1 | mps<<3 | (ep&1 ? ep/2<<17 : 0) | burst<<22 | (modify ? 2<<30 : 0);
parameter1 = ep<<25 | 1<<8 | (type==Iso ? (1<<9)|(1<<10) : ep<2 ? 1<<10 : 0) | exponent<<16;
```

### 4.6 runDevice()：DWC3Core.h:190-210

```cpp
if ((read(DALEPENA) & 3) != 3) return NotReady;   // 必须两个端点都使能
cfg &= ~(7u | (127u<<3) | (1u<<22));               // 清 speed/addr/LPM
write(DCFG, cfg);
write(DEVTEN, (1<<11)|(1<<9)|(1<<6)|(1<<4)|(1<<3)|7u);   // = 0xa5f
write(eventSize(0), eventBytes);
write(DCTL, (ctl & ~USB3LinkEnable) | Run);        // 清 U1/U2 再 Run
poll(DSTS, Halted, 0, 10000);
```

**注意 DEVTEN = 0xa5f，不是我们用的 0x277。**

### 4.7 端点参数（HighSpeed 控制端点）

```
EP0 out: PAR0=0x200, PAR1=0x500
EP0 in : PAR0=0x200, PAR1=0x20500
```

### 4.8 标准请求应答 —— 最关键的部分

`USBCDCACM.h:95-160` 的 `setup()` 函数，约 60 行，直接应答所有标准请求：

```cpp
Response setup(const SetupPacket &s, Speed speed, uint8_t *out) const {
    const unsigned type = s.value >> 8, index = s.value & 255;

    // GET_DESCRIPTOR (0x80, 6)
    if (s.requestType == 0x80 && s.request == 6) {
        if (type == 1 && !index) {          // 设备描述符
            const uint8_t data[] = {18, 1, 0, 2, 2, 0, 0, 64,
                uint8_t(vendor), uint8_t(vendor >> 8),
                uint8_t(product), uint8_t(product >> 8),
                0, 1, 1, 2, 0, 1};
            return reply(out, data, sizeof(data), s.length);
        }
        if ((type == 2 || type == 7) && !index) {   // 配置描述符
            const bool high = (speed == Speed::High) != (type == 7);
            const unsigned packet = high ? 512 : 64;
            const uint8_t data[] = {9, type, 67, 0, 2, 1, 0, 0x80, 50,
                9, 4, 0, 0, 1, 2, 2, 1, 0, ...};
            return reply(out, data, sizeof(data), s.length);
        }
        if (type == 6 && !index) {          // 设备限定符
            const uint8_t data[] = {10, 6, 0, 2, 2, 0, 0, 64, 1, 0};
            return reply(out, data, sizeof(data), s.length);
        }
        if (type == 3) {                    // 字符串
            if (!index && !s.index) { const uint8_t data[] = {4, 3, 9, 4}; return reply(out, data, 4, s.length); }
            if (s.index != 0x0409) return {};
            if (index == 1) return string(out, "MI6 iOS development", s.length);
            if (index == 2) return string(out, "Kernel USB console", s.length);
        }
        return {};
    }
    // SET_ADDRESS
    if (s.requestType == 0 && s.request == 5 && !s.index && !s.length && s.value < 128 && !configuration)
        return {Action::Address, 0, s.value};
    // SET_CONFIGURATION
    if (s.requestType == 0 && s.request == 9 && !s.index && !s.length && s.value <= 1 && address)
        return {Action::Configuration, 0, s.value};
    // GET_CONFIGURATION
    if (s.requestType == 0x80 && s.request == 8 && !s.value && !s.index && s.length == 1 && address) {
        out[0] = configuration; return {Action::Reply, 1};
    }
    // GET_STATUS
    if (s.request == 0 && !s.value && s.length == 2) {
        out[0] = out[1] = 0;
        if (s.requestType == 0x80 && !s.index) return {Action::Reply, 2};
        if (s.requestType == 0x81 && configuration && s.index < 2) return {Action::Reply, 2};
        if (s.requestType == 0x82 && (s.index == 0 || s.index == 0x80)) return {Action::Reply, 2};
    }
    // ... CLEAR_FEATURE / SET_FEATURE / GET_INTERFACE / SET_INTERFACE
}
```

`commit()` 在状态阶段成功后更新状态：
```cpp
if (setup.requestType == 0 && setup.request == 5) address = uint8_t(setup.value);
if (setup.requestType == 0 && setup.request == 9) {
    configuration = uint8_t(setup.value);  notification = !!configuration;
}
```

---

## 五、下一步（两条路）

### 路线 B（推荐）：照 Mi 6 自己实现 EP0

不用 UEFI USB 栈，在 loader 里实现最小 gadget：

1. **DMA 内存**：分配三块，彼此不重叠，16 字节对齐
   - `outTRBs`（64 个 TRB）、`inTRBs`（64 个 TRB）、`setupDMA`（8 字节）
2. **armSetup()**：向 EP0 OUT 提交 `TRBType::Setup` 的 TRB，长度 8，指向 setupDMA
3. **轮询事件环**：收到 `event.type()==1 && endpointNumber()==0` 且 `bytes==8`
4. **解析 8 字节 SETUP**，按 `USBCDCACM.h` 的 `setup()` 应答
5. **提交 DATA TRB**（IN 方向传描述符）
6. **提交 STATUS TRB** 收尾，回来 armSetup()

TRB 结构（DWC3Registers.h）：
```cpp
struct alignas(16) TRB { uint32_t addressLo, addressHi, size, control; };
enum class TRBType : uint8_t { Normal=1, Setup=2, Status2=3, Status3=4, ControlData=5, ... };
constexpr uint32_t Owned=1, Last=2, Chain=4, ContinueShort=8;
```

### 路线 A：修 ConfigureEnableEndpointsEx

已确认 4 参数签名 + 校验要求，但失败点在其后未知处。
即使修好，后面还有整个类驱动栈。

---

## 六、测试流程（必须分开做）

**每条命令单独执行，不要合并。**

```powershell
# 1. 清日志（在 adb 模式）
C:\Program Files (x86)\搞机助手\adb.exe -s 41bc0f2d shell "dd if=/dev/zero of=/dev/block/sda10 bs=4096 count=2048"

# 2. 切 fastboot
C:\Program Files (x86)\搞机助手\adb.exe -s 41bc0f2d reboot bootloader
# 等 5-12 秒，然后确认：
C:\Program Files (x86)\搞机助手\fastboot.exe devices

# 3. 如果没进 fastboot，设备会在 recovery，重新执行第 2 步

# 4. 刷入
C:\Program Files (x86)\搞机助手\fastboot.exe -s 41bc0f2d boot "E:\ios-sweat\XXX.img"

# 5. 等 75-90 秒，然后观察
Get-PnpDevice -PresentOnly | Where-Object { $_.InstanceId -match 'VID_18D1|VID_05C6|VID_2717|VID_0000' }

# 6. 等手机自动重启（20-40 秒），读日志
C:\Program Files (x86)\搞机助手\adb.exe -s 41bc0f2d shell "dd if=/dev/block/sda10 of=/data/local/tmp/x.bin bs=4096 count=2048"
C:\Program Files (x86)\搞机助手\adb.exe -s 41bc0f2d pull /data/local/tmp/x.bin "E:\ios-sweat\x.bin"
```

**注意：`reboot bootloader` 从 recovery 发起时经常失败，需要重试。**
失败就再发一次，通常第二次就进去了。

---

## 七、构建

```bash
# 远程 helper
python.exe remote.py run "<bash 命令>"
python.exe remote.py get "<远程路径>" "<本地路径>"
python.exe remote.py put "<本地路径>" "<远程路径>"

# 编译
cd /root/hk/kernel/xnuloader && bash build.sh

# 打包三种变体
cd /root/hk/kernel && bash xnuloader/build_three.sh
# 输出: /root/hk/chiron-out/USB_A.img (完整 StartEx)
#       /root/hk/chiron-out/USB_B.img
#       /root/hk/chiron-out/USB_C.img (no_start_ex)

# 当前 build_three.sh 里 USB_A 的 cmdline:
#   build USB_A.img "debug=0x8 epoch=A usb_noop_startstop=1"
```

Python helper 路径：
`C:\Users\11588\.dsh\dsh-runtimes\dsh-primary-runtime\dependencies\python\python.exe`

---

## 八、关键代码位置（loader.c）

| 行号 | 内容 |
|---|---|
| ~3105 | `chiron_mi6_dwc3_bringup()` — select/软复位 |
| ~3230 | `chiron_mi6_endpoints()` — DEPCMD 端点配置 |
| ~3340 | `chiron_mi6_install_events()` — 事件环安装 |
| ~3390 | `chiron_mi6_run_device()` — runDevice |
| 9522 | `chiron_enable_dp_pullup()` |
| 9939 | `chiron_vbus_override()` — 已改成无条件 |
| 10521 | `usb_start()` |
| 11450 | descriptor set 构造（`set.ss_device_descriptor` 等） |
| 12562 | post-start_ex PHY 重 init — 已改成条件执行 |
| 13031 | `usb_command_loop()` |
| ~13900 | `efi_main` 里 Mi6 后备调用点 |

固件反汇编：`/root/hk/usbdis/`
- `UsbDeviceDxe.efi` / `.asm`（49152 字节）
- `UsbConfigDxe.efi` / `.asm`
- `UsbfnDwc3Dxe.efi` / `.asm`

Mi 6 参考：`/tmp/ios_sagit/drivers/usb/QcomUSB/`
（如果 /tmp 被清，重新 clone：
`git clone --depth 1 https://github.com/MC-XiaoXiao/ios_sagit.git`）

---

## 九、已实测排除（别再测）

- PHY 挂起 bit8、SUSPHY bit6、TERM_SELECT(0xC0)、RDP_UP_EN(0x74)
- GCTL 方向（`dir=2` DevSS 正确）
- DCFG 速度（0 = HighSpeed 正确）
- DSTS 位域：`[2:0]=CONNECTSPD [16:3]=SOFFN [21:18]=DEVLNKST [22]=Halted`
- `USBLNKST` 恒 4、`SOFFN` 陈旧、`CONNSTAT` 非实时
- PHY `0xB4/0xC4/0x74` 是 v1 驱动宏，不适用
- 强制 detach（DCTL bit29）

---

## 十、驱动来源真相（重要）

`Mu-Silicium/Binaries/chiron/QcomPkg/Drivers/` 下的 USB 驱动**不是 chiron 原厂**：

- `UsbDeviceDxe` / `UsbConfigDxe` / `UsbfnDwc3Dxe` 与 **OnePlus 5（cheeseburger）md5 完全相同**
- `chiron.dsc:121` 自己写着 `# OnePlus 5 build that was measured to work on MSM8998`
- `UsbfnChgDxe` / `UsbTypeCDxe` 只在 chiron 目录存在，其他 72 个设备都没有
- `chiron.dsc:127` 注释说这三个应排除，但 107-110、118 行仍然包含，还有重复条目

**手机原厂 abl(2MB) / xbl(7.8MB) 里没有任何 PE 模块**，是 Qualcomm XBL 架构，
不是 UEFI DXE。

xbl 里的 USB 配置：
```
## USB ##
USBHS1_Config = 0x0
UsbFnIoRevNum = 0x00010001

0x0A800000, 0x0011B000, "USB30_PRIM", AddDev, MMIO, UNCACHEABLE, MmIO, NS_DEVICE
```
