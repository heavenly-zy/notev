---
title: Computer Network
date: 2019-09-18
category: 墨
tags:
   - CS
   - kaoyan
---

::: tip

《计算机网络》复习笔记

:::

<!-- more -->

## 1 计算机网络体系结构

### 1.1 计算机网络概述

#### 1.1.1 计算机网络的组成 <Badge text="!" type="error"/>

-  组成成分
   -  硬件
   -  软件
   -  协议
-  工作方式
   -  边缘部分
      -  C/S 包含 B/S
      -  P2P
   -  核心部分 由路由器连接，进而实现分组交换
-  功能组成
   -  通信子网
   -  资源子网

#### 1.1.2 计算机网络的功能

-  数据通信
-  资源共享
-  分布式处理
-  提高可靠性
-  负载均衡

#### 1.1.3 计算机网络的分类

-  按分布范围的分类
   -  广域网 WAN 基于交换技术
   -  城域网 MAN 基于广播技术
   -  局域网 LAN 基于广播技术
   -  个人局域网 PAN
-  按传输技术分类
   -  广播式网络
   -  点对点网络
-  按拓扑结构分类
   -  星形网络
   -  总线形网络
   -  环形网络
   -  网状形网络
-  按使用者分类
   -  公用网
   -  专用网
-  按交换技术分类
   -  [电路交换网络](#_2-3-1-电路交换)
   -  [报文交换网络](#_2-3-2-报文交换)
   -  [分组交换网络](#_2-3-3-分组交换)
      -  数据报
      -  虚电路
-  按传输介质分类
   -  有线
      -  双绞线
      -  同轴电缆
   -  无线
      -  蓝牙
      -  微波
      -  无线电

::: tip 节点与结点的区别

-  结点是指一个点，常用于数据结构
-  节点是指一个实体，有处理能力，比如一台计算机、路由器

:::

#### 1.1.4 计算机网络的性能指标

-  速率（Speed）单位为 bit/s （bps）
-  带宽（Bandwidth） 频带宽度，数字信道所能传送的“最高数据率”
-  吞吐量（Throughtput）

   单位时间通过某个网络的数据量，受制于网络带宽和额定速率，也即其为**实际值**，带宽速率为额定值
   另外其取决于整个链路中吞吐量最低的链路

-  时延（Delay）发送时延 + 传播时延（ + 处理时延 + 排队时延） （后两者一般可忽略）
   -  发送时延 ==分组长度 / 信道宽度==
   -  传播时延 ==信道长度 / 电磁波在信道的传播速率==
   -  处理时延 存储转发
   -  排队时延 队列等待，与网络中当前数据量相关，每增加一个中间 Node 就会增加一个发送时延
-  时延带宽积 ==传播时延 $\times$ 信道带宽==，即第一个分组到达下一个节点时候信道内的数据，可用于表征该通道可容纳的比特数量
-  往返时延（RTT）
-  利用率 利用率过高会产生非常大的时延

### 1.2 计算机网络的体系结构

#### 1.2.1 网络协议的概念

三要素：语法 语义 时序

#### 1.2.2 网络体系结构的研究方法

-  层次 （layer）

   在计算机网络体系结构的各个层次中，每个报文都分为两部分

   -  一是数据部分，即 SDU（服务数据单元）
   -  二是控制信息部分，即 PCI（协议控制信息）

   他们共同组成 PDU（协议数据单元）

   > 每层的协议数据单元都有一个通俗的名称，比如物理层的 PDU 称为比特

-  各层要完成的功能
   -  差错控制
   -  流量控制
   -  分段和重装
   -  复用和分用
   -  连接建立和释放

::: tip 分层的利弊

-  分层越少，各层协议越复杂
-  分层越多，各层灵活性越好，易于标准化，所以 OSI 的标准使用了 7 层
-  另一方面，分层越多，**会使得有些功能在不同层中难免重复出现，产生额外的开销**，导致整体运行效率越低，因此 OSI 仅仅是理想中的标准，很难投入商用

因此，层次的数量会取一个折中的方案

:::

#### 1.2.3 协议、接口、服务

-  协议 规则的集合 ==对等实体==
-  接口
-  服务

#### 1.2.4 层次模型 <Badge text="!" type="error"/>

路由器只实现到网络层

-  OSI 七层协议
   -  （物理媒体 （双绞线、光缆、无线信道等） 也被称为第 0 层）
   -  ==物理层== （Physical Layer）
      -  传输单位 比特（bit）
      -  任务 透明地传输比特流
      -  功能 在物理媒体上为数据端设备透明地传输**原始比特流**
      -  接口标准
         -  EIA-232C
         -  EIA/TIA RS-449
         -  CCITT 的 X.21
   -  ==数据链路层== （Data Link Layer）
      -  传输单位 帧（frame）
      -  任务 将网络层传来的的 IP 数据包组装成帧
      -  功能 **成帧、差错控制、流量控制、传输管道**
      -  典型协议
         -  SDLC
         -  HDLC
         -  PPP
         -  STP
         -  帧中继
   -  ==网络层== （Network Layer）
      -  传输单位 数据报（datagram）
      -  任务 把网络层的协议数据单元（分组）从源端传到目的端，为分组交换网上的不同主机提供通信服务
      -  功能 对分组进行**路由选择，流量控制、拥塞控制、差错控制、网际互联**等
      -  典型协议
         -  网际协议 IP （无连接）
         -  各种路由选择协议
            -  IPX
            -  ICMP
            -  IGMP
            -  ARP
            -  RARP
            -  OSPF
   -  ==传输层== （Transport Layer）
      -  传输单位 报文段（TCP）或用户数据报（UDP）
      -  任务 负责主机中两个**进程**的通信
      -  功能 为**端到端**提供**可靠**的**传输服务，流量控制、差错控制、服务质量、数据传输管理**等
      -  协议
         -  TCP （面向连接）
         -  UDP （无连接）
   -  ==会话层== （Session Layer）
      -  任务 各个进程之间进行会话
      -  功能 建立同步
   -  ==表示层== （Presentation Layer）
      -  任务 处理在两个通信系统中交换信息的表示方式，采用标准的编码形式
      -  功能 **数据压缩、加密、解密**
   -  ==应用层== （Application Layer）
      -  任务 提高用户与网络的界面
      -  典型协议
         -  FTP
         -  SMTP
         -  HTTP
         -  DNS
         -  Telnet
-  TCP/IP 四层协议
   -  网络接口层（OSI 物理层、数据链路层）
   -  网际层
   -  传输层
   -  应用层
-  五层协议
   -  物理层
   -  数据链路层
   -  网络层
   -  传输层
   -  应用层

::: tip

-  端到端和点对点的区别
   -  数据链路层是**点对点** 主机到主机
   -  传输层是**端到端** 进程到进程
-  ISO/OSI 与 TCP/IP 辨析
   -  ISO/OSI
      -  网络层支持无连接和面向连接
      -  传输层仅支持面向连接
   -  TCP/IP
      -  网络层仅支持无连接的通信
      -  传输层支持无连接和面向连接

:::

## 2 物理层

### 2.1 通信基础

#### 2.1.1 基本概念

-  数据（Data） 传送信息的实体
-  信号（Signal） 数据的电气或电磁表现
   -  模拟信号
   -  数字信号
-  码元 指用一个固定时长的信号波形表示一位 $k$ 进制数字，比如八进制码元可以携带 3bit 的数据
-  信源 产生和发送数据的源头
-  信宿 接收数据的终点
-  信道 信号的传输媒介，是**逻辑通路**，信道的极限容量是指新到的最高码元传输速率或信道的极限信息传输速率
-  速率
   -  码元传输速率 波特（Baud）
   -  信息传输速率 比特/秒（b/s）
-  带宽 原指信号具有的频带宽度，单位是赫兹（Hz），在实际网络中，常用来表示网络的通信线路所能传输数据的能力，表示单位时间内从网络中的某一点到另一点所能通过的“最高数据率”，此时带宽的单位不再是 Hz，而是 b/s

#### 2.1.2 数据传输类型与通信方式

-  数字传输类型
   -  模拟通信
   -  数字通信
-  通信方式

   -  串行 并行
   -  单工 全双工 半双工
      ::: tip 单工、半双工、全双工的区别

      -  单工 一条物理链路、一条信道，相当于单行道，只能向一个方向走
      -  半双工 一条物理链路、两条信道，相当于独木桥，两个方向都能走，但是不能向两个方向走
      -  全双工 两条物理链路、两条信道，相当于两个相反的单工合并而成的双车道，两条信道互不影响

      :::

-  同步方式
   -  同步 为解决时钟频率问题可以让发送方发送时钟脉冲，更好的方法是采用曼彻斯特编码
   -  异步 以字符为单位传输，前后分别加起始位和停止位

### 2.2 传输介质

#### 2.2.1 主要类型

-  有线传输介质
   -  双绞线
   -  同轴电缆
   -  光纤
-  无线传输介质
   -  无线电波
   -  微波、红外线、激光

#### 2.2.2 物理层接口的特性 <Badge text="!" type="error"/>

-  机械特性 定义**物理连接**的边界点
-  电气特性 规定传输二进制位时，线路上信号的**电压高低、阻抗匹配、传输速率和距离限制**等
-  功能特性 指明某条线上出现的某一电平的电压表示**何种意义**，接口部件的信号线的**用途**
-  规程特性 主要定义各条物理线路的**工作规程和时序关系**

### 2.3 交换技术

![CN20](../Images/CN20.png)

#### 2.3.1 电路交换

在通话的全部时间内，通话的两个用户始终占用端到端的通信资源

-  优点
   -  ==时延小==
   -  有序传输
   -  没有冲突
   -  实时性强
-  缺点
   -  ==建立连接时间长==
   -  线路独占
   -  灵活性差
   -  难以规格化，==难以差错控制==

#### 2.3.2 报文交换

数据交换的单位是报文，携有目标地址、源地址等信息

-  优点
   -  无需建立连接
   -  动态分配线路
   -  提高线路利用率
   -  提供多目标服务
-  缺点
   -  转发时延较大（存储转发）
   -  ==报文大小无限制，所以网络结点需要有较大的缓存空间==

#### 2.3.3 分组交换

与报文交换一样采用存储转发的方式，但是进行了分块，再加上部分控制信息形成分组（Packet）

-  优点
   -  无建立时延
   -  线路利用率高
   -  ==简化了存储管理（相对于报文交换）==
   -  减少了出错概率（因为比较短）和重发数据量（因为出错时不需全部重传）
-  缺点

   -  存在传输时延
   -  需要传输额外的信息量
   -  当采用 ==数据报== 服务时，可能会出现 ==失序、丢失、或重复==
   -  当采用 ==虚电路== 服务时，需要 ==呼叫建立、数据传输、虚电路== 释放

-  两种方式
   -  数据报
      由于易于搭建，所以采用的更多
      -  特点
         -  不需要建立连接
         -  尽最大努力交付，可能发生失序、丢失、或重复
         -  对故障适应能力强
         -  资源利用率高
   -  虚电路
      类似于地图的路线规划，同一链路可属于多个虚电路，不独占物理线路
      -  携带的信息
         -  虚电路携带路径、编号、路由表
         -  分组 HEAD 携带编号
      -  特点
         -  建立与拆除有开销，但是对长时间、频繁的数据交换效率较高
         -  路由选择体现在建立阶段，连接建立后，就确定了传输路径
         -  虚电路提供了可靠通信，能保证每个分组正确且有序到达，而且能进行流量控制
         -  致命弱点：某个节点发生故障后，经过该节点的虚电路都会崩溃
         -  虚电路是逻辑连接，非专用，每个节点到其他节点可有无数虚电路

::: tip 为什么数据报采用的更多

有人参考电信网提出了虚电路的方法，这就需要提前建立链路，之后就可以进行比较可靠的传输了，但是计算机网络其实是有着很强的差错处理能力的，所以它并不需要过高的可靠性，可将错误处理等任务交由上层处理，这样有一个好处就是大大提升了网络层的灵活性

:::

::: danger 报文交换与分组交换相关计算

主机甲通过 1 个路由器（存储转发方式）与主机乙互联，两段链路的数据传输率均为 $10Mb/s$ ，主机甲分别采用报文交换和分组大小为 $10kb$ 的分组交换向主机乙发送一个大小为 $8Mb(1M = 10^6)$ 的报文，若忽略链路传播延迟、分组头开销和分组拆装时间，则两种交换方式完成该报文传输所需的总时间分别为 $1600ms, 801ms$

传输图为：甲 -> 路由器 -> 乙

未明确说明，不考虑排队时延和处理时延，又因为题中说明不考虑传播时延，所以只考虑发送时延

-  报文交换

   发送两次，第一次是甲，第二次是路由器，第一次全部发送完成第二次才开始进行，所以计算一次之后 $\times 2$ 即可

   每次都是 $8Mb / (10Mb/s) = 0.8s$ ，所以一共 $1600ms$

-  分组交换

   同样是发送两次，但是前面的分组发送完成就可以到下一个节点了，所以甲的最后一个分组发送完成到达路由器时，前面的都已经走光了，最后一个分组可以直接再前往乙，而无需等待

   所以，一共应该是 $800$ 个分组在甲的总发送时延，再加上最后一个分组在路由器的发送时延，共 $801$ 个分组的发送时延，通过计算很容易得到 $801ms$

:::

### 2.4 数据编码技术

-  调制 数据变换为模拟信号
   -  数字数据 -> 调制器 -> 模拟信号
   -  模拟数据 -> 放大器调制器 -> 模拟信号
-  编码 数据变换为数字信号
   -  数字数据 -> 数字发送器 -> 数字信号
   -  模拟数据 -> PCM 编码器 -> 数字信号

#### 2.4.1 数字数据调制为模拟信号

![CN17](../Images/CN17.png)

-  幅移键控 (ASK) 容易实现，但抗干扰能力差
-  频移键控 (FSK) 容易实现，且抗干扰能力强，采用广泛
-  相移键控 (PSK)
-  正交振幅调制 (QAM)

#### 2.4.2 模拟数据调制为模拟信号

提高传输的效率，使用较高的频率，并使用频分复用技术，充分利用带宽资源

#### 2.4.3 数字数据编码为数字信号

![CN18](../Images/CN18.png)

-  非归零码（NRZ）
   -  无检错功能
   -  难以同步
-  曼彻斯特编码 前一个间隔为高电平后一个间隔为低电平表示码元 1 ，反之为 0
   -  优点
      -  本身携带时钟周期
      -  消除直流分量
   -  缺点
      -  频率增加一倍，导致失真会严重，需要降低信道容量，原理参见 2.4.2
-  差分曼彻斯特编码 前半个码元电平与上一码元电平的后半个码元电平相同，则为码元 1，反之为 0
   -  优缺点同上，它的抗干扰性会稍好些
   -  常用于局域网传输
-  4B/5B 编码 4 位作为一组，按照规则转化为 5 位码， 5 位码共 32 种组合，其中 16 种为原来的 4 位码，另外 16 种作为控制码（帧的开始和结束等）

#### 2.4.4 模拟数据编码为数字信号

比如对音频信号进行的脉冲编码调制（PCM），需要进行**采样、量化、编码**三个步骤

采样定理（奈奎斯特定理）：将模拟信号转换成数字信号时，假设原始信号中的最大频率为 $f$ ，那么采样频率 $f_{sampling}$ ，必须大于等于最大频率 $f$ 的两倍，才能保证采样后的数字信号完整保留原始模拟信号的信息

### 2.5 基带传输技术

#### 2.5.1 基带传输的定义

脉冲波可以由傅里叶展开，分布在各个频率上

#### 2.5.2 信道的极限容量

-  奈奎斯特定理（奈氏准则） 理想低通（没有噪声、带宽有限）的信道中，极限码元传输速率为 $2W$ 波特，其中 $W$ 为理想低通信道的带宽

   > 理想低通信道下的极限数据传输率 = $2W \log_2 V$ 单位为 $b/s$

   -  在任何信道中，码元传输的速率是有上限的
   -  信道的频带越宽（即通过的信号高频分量越多），就可用更高的速率进行码元的有效传输
   -  但是如果不限制的增大频率，那么傅里叶展开的高频分量便增多，在信道上会被过滤掉的也更多，失真很大，很难恢复

-  香农定理 带宽受限且有高斯白噪声干扰的信道的极限数据传输率，当用此速率进行传输时，可以做到不产生误差

   > 信道的极限信息传输速率 = $W \log_2 (1+S/N)$ 单位为 $b/s$
   > 信噪比 $10 \log_{10} (S/N)$ 单位为 $dB$

   -  信道中的带宽或者信噪比越大，信息的极限传输速率越高
   -  只要信息的传输速率低于新到的极限传输速率，就能找到某种方法来实现无差错的传输

::: danger 计算中所需要注意的一些问题

-  奈氏准则 无噪声，出现码元离散电平数量 $2W \log_2 V$
-  香农定理 出现信噪比 $W \log_2 (1+S/N)$
-  采样定理 采样频率 $f_{sampling} \geq 2f$ ，其中 $f$ 为最大频率

当两者都出现时，分别计算，取较小值

-  以太网采用**曼彻斯特编码**，而曼彻斯特编码的编码效率为 50% （每个比特需要两个电平），所以波特率是数据率的两倍
-  相似地， 4B/5B 编码每 4 bit 被编码为 5 bit，编码效率为 80%

:::

### 2.6 多路复用技术

![CN19](../Images/CN19.png)

#### 2.6.1 时分复用

如果某个节点没有数据需要发送，那么信道资源会浪费

这就衍生出来统计时分多路复用，需要增加标识 ID（地址）

#### 2.6.2 频分复用

将整个带宽分为多份，用户在分配到一定的频带后，在通信过程中自始至终都占用这个频带

#### 2.6.3 波分复用

波分复用就是光的频分复用，使用一根光纤来同时传输多个光载波信号

#### 2.6.4 码分复用

每个站有一个 $m\ bit$ 的码片序列，各节点码片序列正交，1 传原码 0 传反码

代价：传输 $m$ 倍数据，只能说使得信号可以分离，但并不能说效率增高了

### 2.7 物理层设备

#### 2.7.1 中继器

又称*转发器*，主要功能是将信号整形并放大再转发出去，提高传输距离

有两个端口（一个输入，一个输出）

没有存储转发功能，不能连接两个速率不同的网段，两个网段一定要使用同一个协议

::: tip 中继器与放大器的异同

都起放大作用，但

-  放大器，放大模拟信号，是对衰减信号的放大
-  中继器，放大数字信号，是将衰减信号整形再生

:::

#### 2.7.2 集线器

集线器（Hub）实质上是一个多端口的中继器，当其有多个端口输入时，输出会发生冲突，致使这些数据都无效

每个端口连接的网络部分都是同一个网络的不同网段，只能在半双工状态下工作，不能划分冲突域，工作效率很低

## 3 数据链路层

数据链路层的功能

-  为网络层提供服务

   -  无确认的无连接服务 如以太网
   -  有确认的无连接服务 如无线通信
   -  有确认的面向连接服务

-  链路管理

   ::: tip 链路与数据链路的区别

   -  链路 无源点对点的物理线路段
   -  数据链路 物理链路+通信协议

   :::

-  帧定界、帧同步与透明传输
-  流量控制
-  差错控制

### 3.1 三个基本问题

#### 3.1.1 封装成帧

既要加首部，又要加尾部，数据部分长度需要小于 MTU

另外还需要考虑**帧定界**问题

-  字符计数法 就是用一个计数字段来标志帧内字符数
-  字符填充的首尾定界符法 用特定字符来标志帧的开始与结束，为了防止帧内出现控制字符导致帧定界出现问题，所以需要对帧内的控制字符进行转义
-  比特填充的首尾标志法 并不是按字符来定界，而是直接以比特形式定界，使用 `01111110` 来标志一个帧的开始与结束，为了防止内容中出现的 `01111110` 被当做开始与结束标识符，可在发送时将信息中每五个连续的 `1` 之后插入一个 `0` ，接收方相反，那么就不会出现上述问题了，因为，该方法很容易使用硬件来实现，所以性能更优
-  违规编码法 由于曼彻斯特编码方法将数据编码为”高-低“电平对（1）和”低-高“电平对（0），并不存在”高-高“电平对和”低-低“电平对，所以……我们就可以用这个搞事情啦，比如定界

#### 3.1.2 透明传输

就是前面所述的，为了保证数据的透明传输，在封装成帧的时候不能在数据中出现控制字符需要转义，但对发送端与接收端来说，这个过程是透明的，数据就像从来没改变过一样

#### 3.1.3 差错检测

比特差错 利用循环冗余检验(CRC)

帧的丢失、重复、失序并不能检测出来，故不是可靠传输

### 3.2 使用点对点信道的数据链路层

用于广域网

#### 3.2.1 点对点协议 PPP

-  简单
-  提供差错检测但不提供纠错
-  只支持全双工
-  面向字节

PPP 帧信息段长度范围为 $[0, 1500]$ ，因为它并不需要 CSMA/CD 协议，没有最短帧长的问题，但要小于 MTU

::: tip 为什么 PPP 帧不需要 MAC 地址就能送到

因为 PPP 协议是点到点的，而以太网是总线型且是广播帧，所以以太网发送帧需要标明发送给谁，而 PPP 帧逻辑上只有发送端和接收端在点对点通信，自然没有这个问题啦

:::

#### 3.2.2 高级数据链路控制 HDLC

-  使用编号和确认机制，能够提供可靠传输
-  面向比特

::: tip 为什么现在大多使用 PPP 而不是 HDLC

在通信线路质量较差的年代，HDLC 更加流行，因为它能提供可靠传输，但是随着通信线路质量的提高，数据链路层实现可靠传输变得没那么必要，所以可以使用将可靠传输交由上层处理，比如 TCP

:::

### 3.3 使用广播信道的数据链路层

用于局域网

#### 3.3.1 局域网的拓扑

-  星型网 中央节点出问题全网瘫痪
-  环形网 类似链表，节点插入与删除较麻烦
-  总线网 较为方便，采用较多

三种特殊的局域网拓扑实现：

-  以太网 逻辑拓扑是总线形结构，物理拓扑是星形结构
-  令牌环 逻辑拓扑是环形结构，物理拓扑是星形结构
-  FDDI 逻辑拓扑是环形结构，物理拓扑是双环结构

下面的局域网大多讨论的是以太网

#### 3.3.2 介质访问控制

因为以太网是半双工通信，需要共享信道，这就需要寻求比较好的媒体共享技术

-  静态划分信道
   前面所述的[多路复用技术](#_2-6-多路复用技术)，包含频分、时分、波分、码分，但是代价较高，不适合局域网使用
-  动态媒体接入控制
   -  随机接入 用户可随机地发送信息，但是如果两个或更多的用户同时发送的话，会发生碰撞，所以需要解决碰撞的协议，常用协议如下
      -  ALOHA 协议
         -  纯 ALOHA 协议 想发就发，冲突重发
         -  时隙 ALOHA 协议 将时间划分为一段段等长的时隙，只有在每个时隙的开始才能发送
      -  CSMA（载波侦听多路访问）协议 发送前侦听一下共用信道，根据侦听结果做不同的反应
         -  1-坚持 CSMA
            -  如果信道空闲，则发送
            -  如果信道忙，则等待，同时**继续侦听直至信道空闲**
            -  如果发生冲突，那么随机等待一段时间后，再重新开始侦听信道
         -  非坚持 CSMA
            -  如果信道空闲，则发送
            -  如果信道忙，则放弃侦听，**等待一个随机的时间后侦听**
         -  p-坚持 CSMA
            -  如果信道空闲，则以概率 $p$ 发送数据，以概率 $(1-p)$ 推迟到下一个时隙（下一个时隙需要重新侦听）
            -  如果信道忙，那么**等待下一个时隙再侦听**
            -  如果发生冲突，那么随机等待一段时间后，再重新开始侦听信道
      -  CSMA/CD 协议 **以太网**采用，在下节内详述
      -  CSMA/CA 协议 **无线局域网**采用，在无线局域网章节详述
   -  受控接入 用户不能随机发送信息，需要受到一定控制，比如**令牌环局域网**的令牌传递协议，拿到令牌才能发送数据

#### 3.3.3 以太网与 IEEE 802.3

-  数据链路层的两个子层

   -  逻辑链路控制 LLC （作用基本消失，大多网卡已不装该协议）
   -  媒体接入控制 MAC

-  以太网的传输介质

| 参数         | 10BASE5              | 10BASE2              | 10BASE-T                   | 10BASE-FL       |
| ------------ | -------------------- | -------------------- | -------------------------- | --------------- |
| 传输媒体     | 基带同轴电缆（粗缆） | 基带同轴电缆（细缆） | 非屏蔽双绞线               | 光线对（850nm） |
| 编码         | 曼彻斯特编码         | 曼彻斯特编码         | 曼彻斯特编码               | 曼彻斯特编码    |
| 拓扑结构     | 总线形               | 总线形               | 星形（逻辑拓扑仍为总线网） | 点对点          |
| 最大段长     | 500m                 | 185m                 | 100m                       | 2000m           |
| 最多结点数目 | 100                  | 30                   | 2                          | 2               |

-  网络适配器
   又称网络接口卡，是局域网中连接计算机和传输介质的接口，每块网卡出厂时都有唯一的代码，称为 MAC 地址

   -  作用
      -  串并转换
      -  数据进行缓存
      -  需要驱动程序
      -  实现以太网协议

-  CSMA/CD 协议（载波侦听多路访问/碰撞检测协议）

   先听后发，**边听边发**，冲突停发，随机重发

   -  如果信道空闲，则开始发送，并同时侦听信道
      -  如果在传输过程中检测到了来自其他适配器的信号能量，则需停止该帧的传输，取而代之传输一个 48bit 的拥塞信号以**强化碰撞**
         -  在中止后，适配器采用截断二进制指数退避算法等待一段随机时间后重新侦听
   -  如果信道忙，则持续侦听直到信道上没有信号能量

   ***

   -  由于 CSMA/CD 的站不可能同时进行发送和接收，所以采用 CSMA/CD 的以太网不可能使用全双工，只能使用**半双工**
   -  由于一个站在发送数据后最多经过 $2\tau$ （两倍的总线端到端传播时延）就可以知道自己的数据是否发送成功，所以可以将其称为**争用期**，经过 $2\tau$ 如果没检测到碰撞，那么就可以确定帧已经到达目的站了
   -  因为一个站发送最多发送 64B （以太网争用期为 $51.2 \mu s$ ，10Mb/s 的以太网）就能知道是否冲突，所以如果发生冲突，发送的帧一定小于 64B ，那么便可以将其作为**最短帧长**，小于该长度的帧直接丢弃即可
   -  为了能够更大程度地降低冲突的概率，**截断二进制指数退避算法**使用争用期的 $r$ （$r \leq 2^k - 1$ 且为整数，从中随机选一个）倍作为冲突重传的退避时间
   -  另外以太网还规定了**帧间最小间隔**，为了使刚刚收到数据帧的站有清理缓存的时间

-  以太网的 MAC 层

   适配器检查源地址和目的地址，如果是发往本站的帧则收下，否则丢弃

   数据部分长度范围为 $[46, 1500]$ B，下限 46B 是因为最小帧长为 64B ，除去 MAC 首部和尾部的 18B ，最少为 46B，而上限 1500B 是规定的 MTU

   ::: tip 没特别做透明传输机制的原因

   -  曼彻斯特编码，可识别有无信号
   -  帧间有间隔

   :::

-  如何提高以太网的信道利用率

   -  减小 $\tau$
   -  增大帧长，但不能超过 MTU

-  高速以太网

   速率达到或超过 100Mb/s 的以太网

   -  100BASE-T 以太网 双绞线，星形拓扑，既支持半双工又支持全双工
   -  吉比特以太网 既支持半双工又支持全双工
   -  10 吉比特以太网 光纤，全双工

#### 3.3.4 无线局域网与 IEEE 802.11

-  分类

   -  有固定基础设施无线局域网

      比如蜂窝移动电话

      -  组成
         -  基本服务集 BSS
         -  接入点 AP
         -  扩展的服务集 ESS
      -  与接入点 AP 建立关联
         -  被动扫描
         -  主动扫描

   -  无固定基础设施无线局域网自组织网络

      临时自组的，每个结点都有路由功能

*  CSMA/CA 协议（载波侦听多路访问/碰撞避免协议）

   因为无法检测碰撞，故使用**退避算法**以降低碰撞几率
   只有第一帧且信道空闲不执行退避算法，此外全部需要使用退避算法

   ---

   -  三种碰撞避免机制：
      -  预约信道
      -  ACK 帧 CRC 校验，并返回确认帧（ACK 帧），若未收到则重传
      -  RTS/CTS 帧（可选，用于解决隐蔽站问题）
   -  解决隐蔽站和暴露站问题
      -  虚拟载波监听
      -  想发送数据前先发送 RTS（包含时间），接受站发送 CTS（包含时间）
      -  短数据帧代价有点大，不使用也可

*  802.11 局域网的 MAC 帧

   -  数据帧
      -  要有序号，以配合确认机制
      -  除去传输帧站点 MAC 和接收帧站点 MAC，还需要一个真正的源地址或者目的地址（emmmm，也不一定，有路由器的话就不是真正的咯）
      -  没有冲突检测，故数据部分不需要够 46 字节
      -  分片机制，不限制 MTU 可以增加灵活性，在信道质量好的时候可以传输长一些，而质量差的时候进行分片传输短的数据帧；整个帧的占用时间是所有分片占用时间的加和
   -  控制帧
   -  管理帧

   ::: tip CSMA/CD 和 CSMA/CA 的主要区别

   -  CSMA/CD 基本思想是发送前侦听，发送时也侦听，如果**发现碰撞马上停止发送**
   -  CSMA/CA 基本思想是发送前先广播告知其他节点，让其他节点在某段时间内不要发送数据，**以免出现碰撞**

   :::

#### 3.3.5 令牌环网的基本原理

令牌（Token）在令牌环网中传递，拿到令牌才能发送数据

物理上采用星形拓扑，但逻辑上仍是环形拓扑

### 3.4 数据链路层设备

如果在物理层使用集线器扩展以太网的话，会使得碰撞域更大，吞吐量并未提高，而且需要各碰撞域使用相同数据率

所以，**网桥**出现了，可以使用它在数据链路层扩展以太网，且不会扩展碰撞域

-  什么是网桥？
   **网桥的接口就是节点**
   没有扩展碰撞域，用户独占带宽
   -  功能 连接网络 1 和网络 2 后，网桥接收网络 1 发送的数据帧，检查数据帧中的地址，如果是网络 2 的地址，那么就转发给网络 2 ，否则就将其丢弃，因为源站和目的站处在同一个网段，目的站能够直接收到这个帧而不需要借助网桥转发
   -  优点
      -  用户独占带宽
      -  网桥两端可以使用不同数据率
   -  缺点
      -  存储转发时延
      -  无流量控制
      -  广播风暴
-  透明网桥（选择的不是最佳路由）
   -  利用**自学习算法**，可以根据帧的源地址和来源接口建立表，同时记录一个有效时间，以保证各节点变化时可以继续正常工作
   -  使用生成树算法避免兜圈子
-  源路由网桥（选择的是最佳路由）

   路由选择是由发送数据帧的源站负责的，为了找到最佳路由，源站以广播的方式发送一个发现帧，该帧将会通过多个路径到达目的站，目的站一一应答，源站便可从应答帧中得出最佳路由

-  以太网交换机

   -  就是**多接口的网桥**，每个接口都直接与主机相连，一般是全双工
   -  星型拓扑，不需要 CSMA/CD，不需要竞争资源，效率更高
   -  自学习功能 建立一张交换表，通过接收的帧来建立表，这样如果之后来的一个帧目的地址能查到，则按照表内项转发，如果**查不到**，则**向除来源端口的所有端口广播该帧**

   ::: tip 以太网交换机能划分广播域吗？

   以太网交换机只能划分冲突域，不能划分广播域，但是可以借助交换机方便地实现 VLAN ，VLAN 是可以划分广播域的

   :::

## 4 网络层

### 4.1 网络层的功能

#### 4.1.1 网络层提供的两种服务

数据报或者虚电路

#### 4.1.2 虚拟互联网络

因为各个网络间有着各种各样的协议等等问题，而要做到各个网络标准完全一致又是不可能的，因此网络之间的互连就成了一个问题

一般来说，各层间的中间设备分别是：

-  物理层： 转发器
-  数据链路层： 网桥
-  网络层： 路由器
-  网络层以上： 网关

由于我们讨论的是网络层，所以在该层上看，转发器与网桥对网络的互连其实仅仅是将一个网络扩大了，还是在一个网络上；所以我们讨论网络的互连一般指路由器对网络的互连

#### 4.1.3 路由与转发

-  路由选择 根据路由选择算法，生成路由表
-  分组转发 转发（forwarding）是将分组从一个输入链路接口转移到正确的输出链路端口，需要根据路由表，生成转发表，并进行转发

### 4.2 网际协议 IP

#### 4.2.1 IPv4 分组

-  IPv4 分组的格式

   -  版本 IP 的版本，当前广泛使用 4
   -  首部长度 占 4bit ，==以 4B 为单位==
   -  总长度 占 16bit ，==以 1B 为单位==
      > 由于低于 46 字节的填充是在网络层完成而不是数据链路层，可由总长度区分数据与填充部分
   -  标识（identification） 占 16bit ，计数器
   -  标志（flag） 占 3bit ，标志分片信息
   -  片偏移 占 13bit ，==以 8B 为单位== ，分片后的相对位置
      > 标识、标志、片偏移三个字段的存在可以保证分片可以正常组装，标识位区分是否是同一个帧的分片、标志标明是否使用分片和分片是否到了最后一片、片偏移标志了顺序（字节为单位）
   -  首部校验和 占 16bit
   -  生存时间 TTL 占 8bit
   -  协议 占 8bit ，决定交由上层哪个协议（如 TCP、UDP）
   -  源地址字段 占 4B
   -  目的地址字段 占 4B

-  IP 数据报分片

   ![DS21{copyright:Wangdao}](../Images/CN21.png)

   需要注意各个长度的最小单位，比如这里片偏移以 8B 为单位，所以，除最后一个片外，其它所有片中的有效数据载荷都是 8 的倍数

-  网络层转发分组的流程

   得到目的主机 IP 和网络地址后，需要经过以下四次匹配

   -  与直接相连各网络地址匹配（如果匹配上则为直接交付，否则就是间接交付）
   -  特定主机路由匹配
   -  网络匹配
   -  默认路由查询
      > 默认路由是将所有未知网络聚合成一个表项

   若最终也没找到，则抛出错误，具体流程如下

   > 如果多项匹配，应按照**最长前缀匹配**转发，这样转发是最优的路径

@flowstart
op1=>operation: N = D & Netmask
cond2=>condition: N in Adjacent?
end3=>end: Direct delivery
cond5=>condition: D in Specific route?
end6=>end: send to NAR
cond7=>condition: N in route?
end8=>end: send to NAR
cond9=>condition: has default route?
end10=>end: send to default route
end11=>end: throw error!
e=>end: End

op1->cond2
cond2(yes)->end3
cond2(no)->cond5
cond5(yes)->end6
cond5(no)->cond7
cond7(yes)->end8
cond7(no)->cond9
cond9(yes)->end10
cond9(no)->end11
@flowend

::: tip

得到下一跳路由器的 IP 地址后并不是直接将该地址填入待发送的数据报，而是将该 IP 地址转换成 MAC 地址（通过 ARP），将其放到 MAC 帧的首部中，然后根据这个 MAC 地址找到下一跳路由器

在不同网络中传送时，MAC 帧中的源地址和目的地址要发生变化，但是在网桥转发帧时，不改变帧的源地址，比如下面这两个例子

-  AB 经网桥相连（`A -> bridge -> B`）
   |源 IP|目的 IP|源 MAC|目的 MAC|
   |---|---|---|---|
   |A|B|A|B|
   |A|B|A|B|
-  AB 经路由器相连（`A -> router -> B`）
   |源 IP|目的 IP|源 MAC|目的 MAC|
   |---|---|---|---|
   |A|B|A|router|
   |A|B|router|B|

:::

#### 4.2.2 IPv4 地址和 NAT

-  结构

   网络号+主机号，可加快转发效率（先只匹配网络号）

   一个网络号在整个网络范围内是唯一的，一个主机号在该网络内也是唯一的，所以一个 IP 地址在整个互联网范围内是唯一的

   > 可是专用网是可以的？因为专用网 IP 并不出现在网络上呀，只会在机构内部出现

-  分类

   根据前几位可分为以下 5 类

   -  A 类 `0` （1Byte 网络号，3Bytes 主机号）
   -  B 类 `10` （2Bytes 网络号，2Bytes 主机号）
   -  C 类 `110` （3Byte 网络号，1Byte 主机号）
   -  D 类 `1110` 多播
   -  E 类 `1111` 保留

   ::: tip 一些具有特殊用途的 IP 地址

   -  **主机号全为 0** 表示网络本身
   -  **主机号全为 1** 表示本网络的广播地址，又称*直接广播地址*
   -  **32 位全为 0**，即 `0.0.0.0` 表示本网络上的本主机
   -  **32 位全为 1**，即 `255.255.255.255` 表示整个 TCP/IP 网络的广播地址，又称*受限广播地址*
   -  **127.x.x.x** 即网络号为 127，主机号为除全 0 或全 1 的任意地址，保留为**环路自检地址**，此地址表示任意主机本身
      > 大多数主机（Hosts 文件）默认把 localhost 指向 `127.0.0.1`

   :::

-  网络接口与 IP 地址的关系

   当一台主机同时连接到多个网络时，该主机就必须同时具有多个相应的 IP 地址，每个 IP 地址的网络号必须与所在网络的网络号相同，所以每个网络接口都对应着一个 IP 地址

-  网络地址转换（NAT）

   > 专用 IP 地址仅仅在机构内部使用，是不可能出现在网络上的

   -  三个专用 IP 地址块（RFC 保留的地址）：

      -  10.0.0.0 - 10.255.255.255
      -  172.16.0.0 - 172.31.255.255
      -  192.168.0.0 - 192.168.255.255

   -  虚拟专用网 VPN

      利用公用的互联网作为本机构各专用网之间的通信载体，由于通过公用的互联网，所以数据必须加密

      利用隧道技术（通过公用网的时候，将专用网内 IP 数据报封装入数据部分，首部写入公网 IP 等信息）

      ![CN02](../Images/CN02.png)

   -  路由器上有一个 IP 的转换表，在传输层有对**端口号**的管理，从而确定路由器发送到哪个内部节点

   > 普通路由器在转发 IP 数据报时，并不会改变源 IP 地址和目的 IP 地址，而 NAT 路由器在转发 IP 数据报时，一定要更换其 IP 地址

-  IP 地址的一些重要特点

   -  是一种分等级的地址结构
   -  每个接口都有一个 IP，所以，有多个接口接入网络的主机会是多归属主机
   -  用转发器或者网桥互连是在同一个网络（同一个广播域），路由器才能连接不同网络
   -  同一网络号所有 IP 是平等的

#### 4.2.3 子网和超网的基本概念

传统的分配方法会造成 IP 地址的浪费

-  子网 将大的网络分成几个较小的网络 IP = 网络号 + 子网号 + 主机号
   -  由于从 IP 数据报中无法知道该主机所连接的网络是否进行子网划分，所以使用子网掩码对 IP 地址的子网部分进行标记
   -  网络号与子网号均置 1，主机号置 0
   -  判断两主机是否在同一子网，只需要 IP 与子网掩码与运算就好啦，但是两个节点的子网掩码不同可能导致判断不同的，所以可能会出现 A 认为 B 和自己在同一子网，而 B 认为 A 和自己不在同一子网的情况
-  超网 无分类域间路由 CIDR
   -  不进行 ABC 的分类，只需要网络前缀即可(相当于只有子网掩码)
   -  可利用斜线记法表示，对应掩码 1 的个数
   -  路由聚合（路由聚合有利于减少路由器之间的路由选择信息的交换，从而提高了整个互联网的性能）

### 4.3 Internet 的路由选择协议

#### 4.3.1 路由算法分类

-  全局性/分布式
-  静态路由选择策略（手工配置与调整）/动态路由选择策略

---

-  分层次的路由选择协议
   将整个互联网划分为一个个小的自治系统 AS，AS 内使用内部网关协议，AS 间使用外部网关协议
   -  内部网关协议 IGP
      -  RIP
      -  OSPF
   -  外部网关协议 EGP
      -  BGP

#### 4.3.2 路由信息协议 RIP

-  基本特点
   -  分布式
   -  **距离向量算法**
-  路由表的建立
   -  开始只知道相邻的路由信息（距离为 1）
   -  每个路由器只和相邻路由器交换并更新路由信息
   -  若干次更新后……该自制系统的路由信息就都知道了
   -  RIP 协议收敛过程比较慢
-  RIP 的工作过程
   -  收到相邻路由器的路由表，将*该路由表*的下一跳更新，距离加一，该更新是无条件的（因为这不是最终的路由表，更新保证了时效性）
   -  与自己的路由表比较，小则替换，大则 pass
   -  若 3min 收不到该路由器的路由表，则判断该路由器宕掉了
-  三个要点
   -  相邻路由器交换
   -  交换的信息是当前路由器所知道的*全部信息*
   -  按固定的时间间隔交换路由信息（30s）
-  优缺点
   -  坏消息传的慢：某个路由器的故障信息传播较慢
   -  实现简单，开销较小
   -  限制了网络的规模使用的最大距离为 15
   -  路由器之间交换的路由信息是完整的路由表，随着网络规模增大，开销将会增加

#### 4.3.3 最短路径优先协议 OSPF

开放分布式、**链路状态路由算法**

-  基本特点
   -  开放
   -  最短路径优先 （ Dijkstra 算法）
   -  分布式的链路状态协议
-  三个要点
   -  向本自治系统所有路由器发送信息
   -  发送与本路由器相邻所有路由器的链路状态（与谁相连与链路的度量（就是权重，比如带宽、时延等））
   -  **只有链路状态变化时才需要更新**
-  链路状态数据库
   -  就是储存的**拓扑结构**信息
-  OSPF 的区域
   -  如果自治系统很大，那么需要**对自治系统划分为一个个区域（area）**
   -  每个区域有一个 32 位标志符（点分十进制）
   -  区域不能太大，最好一个区域不超过 200 个路由器
   -  两种区域：主干区域、其它
-  OSPF 直接用 IP 数据报传送
   -  不用 UDP，直接用 IP 数据报，而 RIP 是需要先封装成 UDP 协议的
   -  数据报很短，可减少路由信息的通信量
   -  不需要分片
   -  但分片传送的数据包只要丢失一个就无法组装成原来的数据报，整个数据报要重传
-  其他特点
   -  可以根据不同链路的类型计算不同的路由
   -  多路径间的负载平衡
   -  所有在 OSPF 路由器之间交换的分组都具有鉴别的功能
   -  支持可变长度的子网划分和五分类编址 CIDR
   -  每个链路状态都带上一个 32 位的序号
   -  OSPF 每隔一段时间要刷新链路状态
-  OSPF 的五种分组类型
   -  问候
   -  数据库描述
   -  链路状态请求
   -  链路状态更新
   -  链路状态确认
-  OSPF 的基本操作
   ![CN01](../Images/CN01.png)
   另外， OSPF 使用的是**可靠的洪泛法**发送更新分组
-  优缺点
   -  当互联网规模很大时，OSPF 协议要比 RIP 协议好得多
   -  OSPF 没有坏消息传得慢的问题，收敛比较快

#### 4.3.3 边界网关协议 BGP

-  使用环境

   不同 AS 间的路由选择协议

   > 为什么不能使用内部网关协议（RIP/OSPF）？
   >
   > -  互联网规模太大，使得自治系统 AS 之间的路由选择非常困难（交换完整信息需要庞大数据库，计算最短路径需花费大量时间），因此 BGP 协议使用交换“可达性”信息
   > -  自治系统 AS 之间的路由选择必须考虑有关策略（考虑到政治、安全、经济等因素）
   >
   > 综合上述理由， BGP 只能是力求寻找一条**能够到达目的网络且比较好的路由**（不能兜圈子），而**并非要寻找一条最佳路由**

-  BGP 发言人

   每个 AS 至少有一个 BGP 发言人（BGP speaker）

-  交换路由信息

   BGP 发言人之间建立 TCP 连接，从而交换路由信息

-  BGP 协议的特点

   -  BGP 协议交换路由信息的节点数量级是自治系统数的量级，这要比这些自治系统中的网络数少很多
   -  每一个自治系统中 BGP 发言人（或边界路由器）的数目是很少的，这样就使得自治系统之间的路由选择不致过分复杂
   -  BGP 支持 CIDR
   -  在 BGP 刚刚运行时，BGP 的邻站是交换整个的 BGP 路由表。但以后**只需要在发生变化时更新有变化的部分**，这样做对节省网络带宽和减少路由器的处理开销都有好处

-  BGP-4 的四种报文
   -  OPEN
   -  UPDATE
   -  KEEPALIVE
   -  NOTIFICATION

### 4.4 地址解析协议 ARP

用于解决**同一个局域网**上的主机或路由器的 IP 地址和硬件地址的映射问题

::: tip 为什么要解析？

-  直接使用 MAC 地址通讯不可以嘛？
-  因为网络发展初期，硬件地址格式并不统一

---

-  IP 数据报里只能看到 IP 地址，在实际链路上传输还是需要使用硬件地址，所以在 IP 数据报封装成帧之前，需要知道目的节点的硬件地址，这是需要解析的
-  IP 数据报在被路由器转发时，其数据链路层封装所使用的 MAC 地址是不断改变的

:::

#### 4.4.1 工作原理

源节点喊（请求，广播帧）一下 IPxxx 的是谁，目的节点把他的 Mac 地址反馈（应答，单播即可）过去

同时每台主机都有一个 ARP 高速缓存，称为 ARP 表，需要使用 ARP 来动态维护该表

#### 4.4.2 工作层次

ARP 是为网络层服务的，但是 ARP 只经过链路层，不经过网络层封装

### 4.5 网际控制报文协议 ICMP

用来提高交付成功的机会，它允许主机或路由器报告差错情况和提供有关异常情况的报告

#### 4.5.1 ICMP 的种类

-  ICMP 差错报告报文 收到有问题的报文的主机或路由器向源主机或路由器发送

   -  终点不可达
   -  源点抑制
   -  时间超过
   -  参数问题
   -  改变路由（重定向）

   ::: tip 不应发送 ICMP 差错报告报文的几种情况

   -  对 ICMP 差错报告报文不应再发送 ICMP 差错报告报文
   -  对第一个分片的数据报片的所有后续数据报片都不发送 ICMP 差错报告报文
   -  对具有组播地址的数据报都不应发送 ICMP 差错报告报文
   -  对具有特殊地质的数据报不发送 ICMP 差错报告报文

   :::

-  ICMP 询问报文
   -  回送请求和回答
   -  时间戳请求和回答

#### 4.5.2 ICMP 应用举例

-  `ping` 用来测试两台主机之间的连通性
-  `traceroute`(UNIX) 、 `tracert`(Windows) 用来跟踪分组经过的路由

### 4.6 IPv6

IPv4 的 32 位地址空间已经不足，IPv6 的 128 位地址空间在可预见的未来是用不尽的

#### 4.6.1 IPv6 的主要特点

仍支持无连接的传送

主要变化：

-  更大的地址空间（`32bit -> 128bit`）
-  扩展的地址层次结构
-  灵活的首部格式
-  改进的选项
-  允许协议继续扩充
-  支持即插即用（即自动配置）
-  支持资源的预分配
-  IPv6 首部改为 8 字节对齐

#### 4.6.2 IPv6 的地址

-  IPv6 的数据报的目的地址可以是以下三种基本类型地址之一

   -  单播
   -  多播
   -  任播

-  IPv6 的记法（冒号十六进制记法）：

   -  零压缩（只能进行一次）
   -  点分十进制法的后缀

#### 4.6.3 IPv4 向 IPv6 的过渡

逐步演进

-  双协议栈 部分主机（或路由器）同时装有两个协议栈（IPv4、IPv6）
-  隧道技术 当 IPv6 数据报进入 IPv4 网络时，将数据报封装成 IPv4 数据报

#### 4.6.4 ICMPv6

相当于 IPv4 中的 ICMP、IGMP、ARP 的合并版，其为面向报文的协议，利用报文来报告差错、获取信息

### 4.7 IP 多播

IP 多播，也称 IP 组播，可以更好地支持一对多通信（向 90 个主机发送数据需要 90 次单播，如果多播只需要一次）

由于 TCP 是一对一的，所以多播一定是应用于 UDP 的

#### 4.7.1 网际组管理协议 IGMP

使路由器知道多播组成员的信息

-  加入多播组

   主机向多播组的多播地址发送 IGMP 报文

-  探询组成员变化情况

   多播路由器周期探询本地局域网上的主机，以便知道他们是否还活跃

#### 4.7.2 多播路由选择协议

使路由器和互联网上的其他多播路由器协同工作，以便多播数据报用最小代价传送给所有的组成员

多播路由选择实际上就是要找出以源主机为根节点的多播转发树

-  洪泛与剪除
-  隧道技术 在不支持多播的网络上加上首部重新封装后传输
-  基于核心的发现技术

### 4.8 移动 IP

#### 4.8.1 移动 IP 的概念

支持移动性的因特网体系结构与协议共称为移动 IP，使用移动 IP ，一个移动结点可以在不改变其 IP 地址的情况下改变其驻留位置

三种功能实体

-  移动结点
-  本地代理 移动结点永久“居所”（归属网络）中代表移动结点执行移动管理功能的实体
-  外部代理 外部网络帮助移动结点完成管理功能的实体

::: tip 移动 IP 与动态 IP 的区别

动态 IP 是指局域网中的计算机可通过 DHCP 服务器动态的获得 IP

:::

#### 4.8.2 移动 IP 通信过程

-  移动结点在本地网时，按传统的 TCP/IP 方式通信
-  移动结点**漫游**到一个外地网络时，仍然使用固定的 IP 地址进行通信，移动结点会在本地代理那里**注册**一个当前位置的地址，称为**转交地址**
-  移动结点**收取**信息需要通过**本地代理**向转交地址通过隧道封装转发
-  移动结点**发送**信息需要通过**外部代理**发送
-  移动结点**更换**外网时，只需要向本地代理**更新**转交地址即可
-  移动结点**回到**本地网时，需要向本地代理**注销**转交地址

### 4.9 多协议标记交换 MPLS <Badge text="~" type="tip"/>

#### 4.9.1 MPLS 的工作原理

由于每次分组到达一个路由器后都需要抽取目的地址、查路由表后转发，所以当网络流量很大时会花费很多时间，故在 MPLS 域入口处给每个数据报打上一定长度的“标记”，之后**对打上标记的 IP 数据报使用硬件进行转发**，离开 MPLS 域时去掉标记

#### 4.9.2 MPLS 首部的位置与格式

位置在网络层与数据链路层之间，从层次的角度看，MPLS 在第二层和第三层之间

### 4.10 网络层设备

#### 4.10.1 路由器的结构

-  路由选择部分
   -  路由选择处理机
-  分组转发部分
   -  交换结构
   -  一组输出端口
   -  一组输出端口

#### 4.10.2 输入到输出

打碎，重构网络层首部；相对的，网桥并不打碎链路层首位部

-  分组丢弃问题
   -  当输入侧带宽较高时，路由器处理速率较低，将会导致输入侧缓存满，无法继续存入分组，只能丢弃
   -  当采用一定的加速比时，输出侧处理速度无法与输出侧处理速度相匹配，输出侧缓存满，也会导致分组被丢弃

#### 4.10.3 路由选择

根据路由选择算法得出路由表，标准路由表含以下四个字段

-  目的网络 IP 地址
-  子网掩码
-  下一跳 IP 地址
-  接口

#### 4.10.3 交换结构

将分组从一个输入端口转移到正确的输出端口

-  内存读写 需要解决内存读写速度
-  总线结构 需要解决总线的竞争
-  互联网络 crossbar 可多个端口同时输出

## 5 运输层

-  运输层为相互通信的 ==应用进程== 提供逻辑通信
-  TCP 面向连接， UDP 无连接
-  差错检测

### 5.1 运输层协议概述

#### 5.1.1 进程之间的通信

![CN03](../Images/CN03.png)

运输层向它上面的应用层提供通信服务，它属于**面向通信部分的最高层，同时也是用户功能的最底层**

值得注意的是，只有网络边缘的主机的协议栈才有运输层，网络核心部分的路由器只到网络层，所以在运输层来看，就像主机与主机之间直接的通讯，但是……

端到端的通信其实是是应用进程之间的通信，并不是主机之间的

#### 5.1.2 基于端口的复用与分用

![CN04](../Images/CN04.png)

-  发送方不同的应用进程的数据可以封装在同一个运输层协议中，此称为**复用**
-  接收方的运输层在剥去报文的首部后能够将这些数据正确交付给目的应用进程，此称为**分用**

::: tip 与网络层复用分用的区别

-  网络层的复用指发送方不同的数据都可以封装成 IP 数据报发送出去
-  分用是指接收方的网络层在剥去首部后把数据交付给相应的协议

:::

#### 5.1.3 两个主要协议

-  传输控制协议 TCP
   -  面向连接
   -  全双工可靠信道
   -  适用于可靠性更重要的场合
   -  传输单位： TCP 报文段
-  用户数据报协议 UDP
   -  无连接
   -  不可靠信道
   -  执行速度较快、实时性好
   -  传输单位： UDP 用户数据报

> 一些网络层协议与运输层协议的对应关系
> ![CN05](../Images/CN05.png)

#### 5.1.4 运输层的端口

> 这里的端口指的是软件端口

由于我们在运输层完成的是进程之间的通信，那么应用层所完成的主机之间的通信就显得不够了，这就需要我们在运输层协议首部加上各个进程的一个代号，这个任务就由端口号（软件端口）来完成了，当然，头部里源端口号和目的端口号都要写上，具体关系可参考 5.1.2 下的图

用 16 位端口号来标志一个端口，也就是每台主机有 65535 个端口，当然这对一台计算机来说是够用的

-  端口号的分类
   -  服务器使用的端口号
      -  熟知端口号 0~1023
      -  系统端口号 1024~49151
   -  客户端使用的端口号
      又称**短暂端口号**，客户端程序以某端口号向服务器发送消息，服务器收到消息后向该端口号返回响应，通信结束后该端口便不再占用，可由其他进程使用

### 5.2 用户数据报协议 UDP

#### 5.2.1 UDP 概述

只在 IP 数据报服务的基础上增加了很少的功能

-  增加的功能

   -  复用和分用（上节说了）
   -  差错检测（我们前几层都只做了很基本的差错检测，所以还是很不可靠的）

-  UDP 的特点
   -  无连接
   -  尽最大努力交付（不保证可靠）
   -  面向报文（每个应用层报文加个首部就可以作为网络层的数据了，不对应用层报文拆分和合并，每个应用层报文对应一个 UDP 用户数据报）
   -  没有拥塞控制（不会因为网络的拥塞而降低源主机的发送速率，很适合实时应用）
   -  支持一对一、一对多、多对一和多对多的交互通信
   -  UDP 的首部开销小

当然，既然不可靠就一定会有对策，这就需要应用进程本身增加些提高可靠性的措施（应该就是应用层的事了，也就是我们需要考虑的问题了）

#### 5.2.2 UDP 的首部格式

![CN06](../Images/CN06.png)

**伪首部只在计算检验和的时候使用，既不向上递交，也不向下传送**

UDP 中计算检验和的时候**首部和数据部分**都检验，IP 数据报只检验其首部

### 5.3 传输控制协议 TCP 概述

#### 5.3.1 TCP 最主要的特点

-  面向连接
-  **点对点**（每一条 TCP 连接只能有两个端点）
-  可靠交付（无差错、不丢失、不重复）
-  全双工（两端都有**缓存**，两端应用程序只需要向各自缓存内读写数据即可，其他由 TCP 完成）
-  面向字节流（TCP 将数据看作一连串无结构的字节流）

#### 5.3.2 TCP 的连接

TCP 连接的端点是套接字 Socket

Socket = `IP : port`

如 106.14.169.129:1017

#### 5.3.3 TCP 报文段的首部格式

![CN08](../Images/CN08.png)

-  源端口
-  目的端口
-  序号（以字节编码，比如某个分组序号为 301 ，长度 100 bytes，那么下一个分组序号就是 401）
-  确认号（期待的下一个分组序号，比如接收到了 301 分组，长度 100 bytes，那么期待 401）
   > 若确认号 = N，则表明：到序号 N-1 位置的所有数据都已正确收到
-  数据偏移
-  保留
-  紧急 URG
-  确认 ACK
-  推送 PSH
-  复位 RST
-  同步 SYN
-  终止 FIN
-  窗口
-  检验和
-  紧急指针
-  选项

### 5.4 可靠传输的工作原理

理想传输：

-  传输信道不产生差错
-  不管发送方以多快的速度发送数据，接收方总是来得及处理收到的数据

但是理想是不可能的，所以我们就需要采取一些措施：

-  出现差错时让发送方重传出现差错的数据
-  在接收方来不及处理收到的数据时，及时告诉发送方适当降低发送数据的速度

> 如果在协议中，发送方在准备下一个数据项目之前先等待一个肯定的确认，则这样的协议称为 PAR（Positive Acknowledgement with Retransmission，支持重传的肯定确认协议）或者 ARQ（Automatic Repeat Request，自动重复请求协议）
> —— 百度百科

-  滑动窗口的重要特性
   -  只有接收窗口向前滑动，发送窗口才有可能向前滑动
   -  三种协议的窗口大小对比
      -  停止-等待协议： 发送窗口大小 = 1，接收窗口大小 = 1
      -  后退 N 帧协议： 发送窗口大小 > 1，接收窗口大小 = 1
      -  选择重传协议： 发送窗口大小 > 1，接收窗口大小 > 1
   -  接收窗口的大小为 1 时，可保证帧的有序接收
   -  数据链路层的滑动窗口协议中，窗口的大小在传输过程中是固定的（区别于传输层）

#### 5.4.1 停止等待 ARQ 协议

发送方每发送一个分组就停止发送，等待接收方返回确认，收到确认后才传下一个分组

发送方对每个分组有一个超时计时器，若**计时时间内未收到分组则重传**

-  确认丢失
   接收方向发送方发送的确认丢失了，那么发送方必然会重传，然后接收方又收到重复的分组，则丢弃，然后再次发送确认

-  确认迟到
   接收方向发送方发送的确认迟到了，发送方当然也会重传啦，然后接收方又收到重复的分组，然后丢弃，发送方也会因此收到两个确认，其中一个就不管啦，反正已经确认过啦

很明显，这种方法信道利用率很低，每个分组都要等待返回确认才能继续下一组的发送，因此可利用流水线运输来提高信道利用率

-  特点
   -  停止等待
   -  编号
   -  自动重传请求
   -  简单，但信道利用率太低

#### 5.4.2 连续 ARQ 协议

![CN07](../Images/CN07.png)

窗口内的可以发送，每收到确认，窗口向前滑动

-  累计确认
   每次确认收到的最后一个分组即可

   -  优点

      容易实现

   -  缺点

      可能出现回退的情况（Go-Back-N，简称 GBN ）

-  发送方接收方分别设有发送窗口和接收窗口

#### 5.4.3 选择重传 ARQ 协议

只重传差错的数据帧或计时器超时的数据帧，但此时必须加大接收窗口，以存储那些已经接收到但是不连续的数据

### 5.5 TCP 可靠传输的实现

#### 5.5.1 以字节为单位的滑动窗口

![CN09](../Images/CN09.png)

发送方窗口由接收方所发来的确认报文段所构建（确认号 + 窗口）

要有累积确认能力，故确认有一定的推迟时间

#### 5.5.2 超时重传时间的选择

根据报文段的往返时间 RTT 来计算，这里使用滑动平均值

$RTT_S = (1 - \alpha) \times RTT_S + \alpha \times RTT$

（这里直接使用 $C$ 语言的赋值语句了，用旧值替换新值，不是恒等式）

另外设置超时重传时间 $RTO = RTT_S + 4 \times RTT_D$

这里 $RTT_D$ 是偏差的滑动平均值……

另外，值得注意的是当出现出现重传的情况下可能出现一个问题就是，收到的确认到底是对哪次发送的确认，如果认为是第一次，$RTT_S$ 会偏大，那么之后重传时间会变大，如果发生此情况比较多， $RTT_S$ 就会持续增大，反之， $RTT_S$ 减小，会导致重传次数增加，$RTT_S$ 持续减小

一种比较好的算法是，当出现重传的时候，$RTO$ 都变大些（通常取两倍）

#### 5.5.3 选择确认 SACK

收到的字节块不连续，确认的时候增加该字段可防止发送方把某些已经收到的字节块重传

### 5.6 TCP 的流量控制

#### 5.6.1 利用滑动窗口实现流量控制

![CN10](../Images/CN10.png)

利用滑动窗口可以很容易的实现流量控制

另外要注意的就是死锁（接收端有了新的空间，提出新的可接受窗口，但不幸的是此消息丢失，两端都傻等着），可利用持续计时器解决

#### 5.6.2 TCP 的传输效率

-  当发送数据较少，数据部分就占得较少，利用率较低
-  接收方刚空出来缓存空间就让接收方扩大窗口，可能扩大的量并不多，发送方只能发很少的数据

前者可用 $Nagle$ 优化，后者可让接收方等待一段时间再确认（养肥了再……）

### 5.7 TCP 的拥塞控制

流量控制是针对接收端缓存满的情况，而拥塞控制是针对整个网络上的主机和路由器缓存满的情况

#### 5.7.1 拥塞控制的一般原理

出现拥塞的原因： $\sum$ 对资源的需求 > 可用资源

> 值得注意的是，增加资源并不能解决拥塞

发送方需要维护以下两个窗口

-  接收窗口 rwnd
-  拥塞窗口 cwnd

而发送窗口应取两者中较小值，即 $min(rwnd, cwnd)$

#### 5.7.2 TCP 的拥塞控制方法

-  慢开始和拥塞避免
   ![CN22{copyright:Wangdao}](../Images/CN22.png)

   -  慢开始

      起初 cwnd 成指数增长，直至其大小达到慢开始门限 ssthresh ，改用拥塞避免算法

   -  拥塞避免

      cwnd 成线性增长，如果出现超时，则 ssthresh 变为当前 cwnd 的一半，cwnd 重新置为 1

-  快重传和快恢复
   ![CN23{copyright:Wangdao}](../Images/CN23.png)

   -  快重传

      发送方只要一连收到三个重复确认，就知道接收方确实没有收到报文段，因而应当立即进行重传，这样就不会出现超时，发送方也不就会误认为出现了网络拥塞

   -  快恢复

      当发送端收到连续三个重复的确认时，由于发送方现在认为网络很可能没有发生拥塞，因此现在不执行慢开始算法，而是执行快恢复算法

#### 5.7.3 主动队列管理 AQM <Badge text="~" type="tip"/>

如果路由器队列满了会将后来的丢失，而这些分组可能来自不同的 TCP 连接，这就使得网络上同时进入慢开始状态，之后又会同时增大通信量（全局同步）

所以，应当在路由器队列尚未满的时候提早将部分分组丢失，其中一种实现方法是随机早期检测 RED

### 5.8 TCP 的运输连接管理

-  连接建立
-  数据传送
-  连接释放

#### 5.8.1 TCP 的连接建立

三报文握手

![CN12](../Images/CN12.png)

-  客户端向服务器请求连接
-  服务器发送同意连接
-  客户端发送确认

#### 5.8.2 TCP 的连接释放

四报文握手

![CN13](../Images/CN13.png)

-  客户端向服务器发送请求释放，进入**半关闭**状态
-  服务器发送确认，并继续发送剩余数据
-  服务器将剩余数据传输完后向客户端发送请求释放
-  客户端发送确认

#### 5.8.3 TCP 的有限状态机 <Badge text="~" type="tip"/>

![CN14](../Images/CN14.png)

## 6 应用层

每个应用层协议都是为了解决某一类应用问题，而问题的解决又往往是通过位于不同主机中的多个应用进程之间的通信和协同工作来完成的

应用层的具体内容就是规定应用进程在通信时所遵循的协议

### 6.1 域名系统 DNS

#### 6.1.1 域名系统概述

用于解析域名与其对应的 IP 地址

采用分布式的域名系统 DNS

需要若干的域名服务器，DNS 解析报文使用 UDP 以减小开销

#### 6.1.2 互联网的域名结构

树状结构： n 级域名.$\cdots$.三级域名.二级域名.顶级域名

-  顶级域名分类
   -  国家顶级域名 nTLD
      -  us
      -  jp
      -  cn
      -  uk
      -  $\cdots$
   -  通用顶级域名 gTLD
      -  com
      -  net
      -  org
      -  $\cdots$
   -  基础结构顶级域名 用于反向域名解析
      -  arpa

#### 6.1.3 域名服务器

将域划分为区，每个区内一个域名服务器

每个域名服务器都应建立缓存以提高查询效率

-  本地域名服务器

   客户端缓存如果没有对应域名，则向本地域名服务器查询（递归查询），本地服务器若没有对应缓存，则代为查询（迭代查询）

-  根域名服务器

   本地域名服务器无法解析时首先求助于根域名服务器，当根域名服务器无法解析时，会告诉本地服务器应该向哪个顶级域名服务器查询

   使用任播技术

-  顶级域名服务器（TLD 服务器）

   当顶级域名服务器仍无法解析该域名的时候，会告诉本地服务器应该向哪个权限域名服务器查询，依此迭代

-  权限域名服务器

   就是各个区的域名服务器

具体查询过程可参加下图

![CN15](../Images/CN15.png)

### 6.2 文件传送协议

#### 6.2.1 FTP 概述

存取、修改都需要先从服务器下载其副本，操作后重传

#### 6.2.2 FTP 的基本工作原理

使用两个 TCP 连接（控制连接和数据连接）

#### 6.2.3 简单文件传送协议 TFTP

使用 UDP ，简单

### 6.3 远程终端协议 TELNET <Badge text="~" type="tip"/>

利用 TCP ，用户好像直接连接到远程主机上，可以直接通过该协议操作远程主机（仅限命令）

为了适应各系统的差异，所以命令需预先编码成 NVT 格式，然后在服务器解码后执行

### 6.4 万维网 WWW

#### 6.4.1 万维网概述

万维网 WWW（World Wide Web）
统一资源定位符 URL（Uniform Resource Locator）
超文本传输协议 HTTP（HyperText Transfer Protocol）

#### 6.4.2 统一资源定位符 URL

`<协议> :// <主机>:<端口>/<路径>`

（HTTP 默认 80 端口）

#### 6.4.3 超文本传输协议 HTTP

-  HTTP 的操作过程

   使用面向连接的 TCP 连接，但其本身是无连接的，并不建立 HTTP 连接

   -  无连接 HTTP 本身无连接
   -  无状态 每次访问和第一次访问相同

   但这样就有一个问题，每个 Request 都需要建立一次 TCP 连接，这就需要三握手，花费 $RTT \times 2$ 的时间

   HTTP1.1 针对该问题进行优化，使用持续连接 - 非流水线方式 - 流水线方式

-  代理服务器

   代理服务器上建立缓存，以提高访问速度

-  HTTP 的报文结构

   -  请求报文

      -  METHOD URL VERSION
      -  之后一系列字段的 KEY : VALUE
         > e.g.
         >
         > GET http://www.xyz.edu.cn/dir/index.htm HTTP/1.1
         > Host: www.xyz.edu.cn
         > Connection: close
         > User-Agent: Mozilla/5.0
         > Accept-Language: cn

   -  响应报文
      -  VERSION STATUS_CODE 短语
      -  之后一系列字段的 KEY : VALUE
         > e.g.
         >
         > HTTP/1.1 301 Moved Permanently
         > Location: http://www.xyz.edu/ee/index.html

-  在服务器上存放用户的信息

   解决某些应用场景下无状态无法满足需求的问题，使用 Cookie

#### 6.4.4 万维网的文档

-  超文本标记语言 HTML

   -  HTML（HyperText Markup Language）
   -  XML（Extensible Markup Language） 可扩展标记语言 用来传输数据的，正在被 JSON 所取代
   -  XHTML （Extensible HTML） 可扩展超文本标记语言 用来扩展 HTML ，现在也不见踪影了
   -  CSS （Cascading Style Sheets） 层叠样式表

-  动态万维网文档

   服务器上动态生成（本文档的编译版就是静态文档，有后端服务器进行数据交互的就是动态文档）

-  活动万维网文档

   文档内嵌入脚本（现在主流 JS）

#### 6.4.5 万维网的信息检索系统

-  全文检索搜索 比如百度
-  分类目录搜索 比如新浪网

#### 6.4.6 社交网站

SNS（Social Networking Site）

### 6.5 电子邮件

#### 6.5.1 电子邮件概述

使用 TCP

#### 6.5.2 简单邮件传送协议 SMTP

#### 6.5.3 电子邮件的信息格式

首部

-  To
-  Subject
-  Cc
-  From
-  Date
-  Reply-To

#### 6.5.4 邮件读取协议 POP3 和 IMAP

-  邮局协议 POP （当前第三个版本 POP3）
-  网际报文存取谐音 IMAP （当前第四个版本 IMAP4，但通常直接称为 IMAP）

#### 6.5.5 基于万维网的电子邮件

用户使用 HTTP 协议与邮件服务器传送邮件，但邮件服务器之间仍使用 SMTP 传送

#### 6.5.6 通用互联网邮件扩充 MIME

因为 SMTP 只能传输 ASCII 码（每个 7bit）的数据，所以传输其它数据需要经过编码，转换成 ASCII 码再传输

比如针对二进制数据的 base64 编码（每 6bit 转换成一个 ASCII 码）

### 6.6 动态主机配置协议 DHCP

为了免去为需要连接网络的设备逐个配置 IP 、子网掩码等信息的麻烦，DHCP 应运而生

-  即插即用，非常适合经常变换网络的设备
-  使用 UDP，通过广播与 DHCP 服务器交互，因为这时候连 IP 都没有，无法建立 TCP 连接
-  每个网络使用一个 DHCP 中继代理，以降低 DHCP 服务器的数量
-  IP 是有租用期的，当租用期过了一半需请求更新租用期

### 6.7 简单网络管理协议 SNMP <Badge text="~" type="tip"/>

网络管理包裹对硬件、软件和人力的使用、综合与协调，以便对网络自言进行监视、测试、配置、分析、评价和控制，这样就能以合理的价格满足网络的一些需求，如实时运行性能、服务质量等

其包含了

-  SNMP 本身
-  管理信息结构 SMI
-  管理信息库 MIB

### 6.8 应用进程跨越网络的通信 <Badge text="~" type="tip"/>

系统调用 （system call）
应用编程接口 API （Application Programming Interface）

![CN16](../Images/CN16.png)

当然，UDP 服务器由于只提供无连接服务，因此不适用 listen 和 accept 系统调用

### 6.9 P2P 应用

资源并不存储在服务器上，服务器上只存储资源的索引，资源存储在用户主机上

## 7 网络安全 <Badge text="~" type="tip"/>

### 7.1 网络安全问题概述

#### 7.1.1 计算机网络面临的安全性威胁

-  被动攻击
   -  截获
-  主动攻击
   -  篡改
   -  恶意程序
      -  计算机病毒
      -  计算机蠕虫
      -  特洛伊木马
      -  逻辑炸弹
      -  后门入侵
      -  流氓软件
   -  拒绝服务

#### 7.1.2 安全的计算机网络

-  保密性
-  端点鉴别
-  信息的完整性
-  运行的安全性

#### 7.1.3 数据加密模型

-  密钥 K
-  加密 E
-  解密 D
-  $Y = E_K(X)$
-  $D_K(Y) = D_K(E_K(X)) = X$

### 7.2 两类密码机制

#### 7.2.1 对称密钥密码机制

-  数据加密标准 DES
-  高级加密标准 AES

通信双方都要有该密钥，是一对一的双向保密通信

#### 7.2.2 公钥密码机制

RSA 体制

-  公钥 PK 利用公钥加密数据，只有拥有私钥的用户才能解密
-  私钥 SK

先利用公钥加密（E），后利用私钥解密（D）和先利用私钥 D 操作，再利用公钥 E 操作得到的结果都是一样的，都是原数据

$E_{PK_B}(D_{SK_B}(X)) = D_{SK_B}(E_{PK_B}(X)) = X$

公钥是公开的，是多对一的单向保密通信

### 7.3 数字签名

用于保证这个消息确实是这个发送方发的

只需要发送方事先用私钥 D 一下数据，这样接收方试下用公钥 E 能不能获得明文数据就知道数据到底是不是该发送方发的了，因为只有发送方有私钥

### 7.4 鉴别

鉴别是要验证通信的对方的确是自己要所通信的对象，而不是其他的冒充者，并且所传送的报文是完整的，没有被他人篡改过

#### 7.4.1 报文鉴别

-  密码散列函数
-  使用的密码散列函数 MD5 和 SHA-1
-  报文鉴别码

   计算报文的 MD5 并加密，将其添加在报文后，由于第三方并不知道密钥，就无法在改变数据后重新计算 MD5 的加密值

#### 7.4.2 实体鉴别

在系统接入的全部持续时间内只鉴别一次

**重放攻击** ：直接把数据原封不动的传给目的地，可用不重数解决
**中间人攻击** ：向 B 发送数据时冒充 A，向 A 发送数据时冒充 B ，这使得 A 和 B 以为他们在直接通信，但是所有数据都被备份了一份

### 7.5 密钥分配

1. 对称密钥的分配

密钥分配中心 KDC

2. 公钥的分配

认证中心 CA

### 7.6 互联网所使用的安全协议

#### 7.6.1 网络层安全协议

IPsec

#### 7.6.2 运输层安全协议

-  安全套接字层 SSL
   -  使用 SSL 的 HTTPS 端口号是 443 ，而不是 HTTP 的 80
-  运输层安全 TLS

#### 7.6.3 应用层安全协议

这里以电子邮件为例

PGP 协议，基于 MD5 和 RSA

### 7.7 系统安全：防火墙与入侵检测

#### 7.7.1 防火墙

防火墙是特殊编程的路由器，实施访问控制策略

-  分组过滤路由器
-  应用网关，又称代理服务器

#### 7.7.2 入侵检测系统 IDS

用于检测多种网络攻击，并进行告警或阻断操作

### 7.8 展望

-  椭圆曲线密码 ECC
-  移动安全
-  量子密码

## 8 互联网上的音频/视频服务 <Badge text="~" type="tip"/>

### 8.1 概述

多媒体信息在互联网上传输的一些问题

-  多媒体的信息的信息量往往很大
-  在传输多媒体数据时，对时延和时延抖动均有较高的要求 （这就需要用到缓存）

三种类型

-  流式存储音频/视频 资源存储在服务器上
-  流式实况音频/视频 资源是边录制边发送的
-  交互式音频/视频 实时交互

> 这里的流（streaming）与 flow 不同

### 8.2 流式存储音频/视频

-  使用元文件
-  使用媒体服务器，以专门发送媒体数据
-  实时流式协议 RTSP ， 与 HTTP 相类似，但是是有状态的，使用 TCP 或 UDP

### 8.3 交互式音频/视频

-  IP 电话
-  实时运输协议 RTP
-  实时运输控制协议 RTCP
-  H.323
-  会话发起协议 SIP

### 8.4 改进“尽最大努力交付”的服务

-  使互联网提供服务质量
-  调度和管制机制
   -  调度机制 公平排队、加权公平排队
   -  管制机制 漏桶管制器
-  综合服务 IntServ 与资源预留协议 RSVP
-  区分服务 DiffServ

# Extends

1. wireshark 抓包工具
2. [QQ 是基于 UDP 还是 TCP](https://zhidao.baidu.com/question/136592671.html)

# Reference

1. 申彦明老师课程
2. [《计算机网络》及其配套课件 谢希仁](http://yx.51zhy.cn/net.jsp)
3. 2020 年计算机网络考研复习指导 - 王道
