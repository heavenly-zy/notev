---
title: Mathematical Modeling
date: 2018-11-21
category: 墨
tags:
   - Basic Subject
   - Math
---

::: warning

《数学建模》慕课笔记

:::

<!-- more -->

## Part 1 案例部分

## 1 马尔萨斯人口论

1. 已知当前或过去某个时刻的人口数量，预测未来某个时刻的人口？
2. 遥远未来的趋势（$t$ 趋于无穷）？

### 1.1 马尔萨斯人口模型

#### 1.1.1 高尔斯模型

人口可以表示为一组数对 $(t, P(t))$，即某一时刻 $t$ 的人口规模为 $P(t)$ ，如果用 $b$ 和 $d$ ，分别表示出生率和死亡率，那么**次年**人口总数将是

$$
p + bp -dp = (1 + b - d)p = (1 + r)p
$$

这里用自然增长率 $r$ 表示 $b - d$

#### 1.1.2 马尔萨斯人口模型

当然，上面那是一个离散的模型，但它可以给我们带来这样的启发：

人口在一段时间的变化量应当是正比于自然增长率 $r$、人口基数 $P(t)$、这段时间 $\Delta t$，也就是说：

$$
P(t + \Delta t) - P(t) = r P(t) \Delta t
$$

如果我们令 $t$ 趋于无穷小，很明显：

$$
\frac{d P(t)}{dt} = r P(t)
$$

嗯，就是一个微分方程，如果我们令 $P_0 = P(t_0)$，那么：

$$
P(t) = P_0 e^{r(t-t_0)}
$$

这说明，人口是**指数增长**的

当时马尔萨斯也利用某些地区的人口数据对模型进行了论证，结果表明他的模型比较好，但是那是 200 年前，**数学模型只是现实世界的数学简化**，所以它很可能只满足于某个特定情况，200 年后？

#### 1.1.3 数模基本流程

![MM01](../Images/MM01.png?raw=true)

### 1.2 Logistic 模型

#### 1.2.1 马尔萨斯模型“错”在哪里？

$$
P(t + \Delta t) - P(t) = r P(t) \Delta t
$$

我们认为一段时间人口的增长正比于这三项应当是没有问题的，但是有一个关键的问题就是，我们不应该将自然增长率 $r$ 当做一个常数来看，因为很明显，我们地球上的资源是有限的，所以当人口增长到一定程度后将受限于资源，故增长率将会降低

#### 1.2.2 怎么校正模型？

那就是说，我们可以让原来的 $r$ 变成时间的函数，它直接相关于人口数量 $P(t)$：

$$
r(t) = r(P(t)) = r \cdot \left(1 - \frac{P(t)}{K}\right)
$$

这里的 $K$，是新引进的一个参数，表征了地球所能容纳人口的上限，很明显，当人口达到这个上限自然增长率将会是 0，人口不再增长，这应当是合理的

我们新的模型引入了新的参数，使得模型变得复杂了，但也使得模型可以描述的问题变得复杂了，比如这里就考虑到了资源的问题，可是这并不能说明马尔萨斯当年的模型是错的，从历史上看当年确实并不需要考虑太多资源问题，从模型上看，我们可以看到当 $P(t)$足够小的时候，$r(t) = r$，所以说马尔萨斯当年得出的模型也是有道理的

> 增加一个参数会引发更多的争议

#### 1.2.3 求解新模型

$$
\begin{aligned}
\frac{dN(t)}{dt} & = r \left(1 - \frac{N(t)}{K} \right) N(t) \\
N(t_0) & = N_0
\end{aligned}
$$

解得

$$
\begin{aligned}
N(t) & = \frac{K}{1 + C e^{-r(t-t_0)}} \\
C & = \frac{K - P_0}{P_0}
\end{aligned}
$$

趋势：

![MM02](../Images/MM02.png?raw=true)

无论大于 $K$，还是小于 $K$，都会渐进于 $K$

#### 1.2.4 离散化？

我们将微分方程

$$
\frac{dN(t)}{dt} = r \left(1 - \frac{N(t)}{K} \right) N(t)
$$

离散化为差分方程

$$
\begin{aligned}
\frac{\Delta N(t)}{\Delta t} & = r \left(1 - \frac{N(t)}{K} \right) N(t) \\
\Delta N & = N_{t+1} - N_t \\
\Delta t & = 1
\end{aligned}
$$

则

$$
\begin{aligned}
N_{t+1} - N_t & = rN_t \left(1 - \frac{N_t}{K}\right) \\
N_{t+1} & = (1 + r) N_t - \frac{r}{K} N_t^2
\end{aligned}
$$

我们取定参数 $K$，考虑不同的参数 $r$（计算机模拟下）

1. 首先，$r$ 取 1.9 试试

![MM03](../Images/MM03.png?raw=true)

（左面是相图，和右面表示的其实是同样的）

很明显，最终我们能得到一个稳态解 $K$，或者说收敛于 $K$

2. 然后增大点，取 2.2 试试

![MM04](../Images/MM04.png?raw=true)

咦？居然不收敛了，最终会有一个 2 周期的解

3. 2.5

![MM05](../Images/MM05.png?raw=true)

4 周期的解，越来越复杂了

4. 2.55

![MM06](../Images/MM06.png?raw=true)

5. 我们将各个 $r$ 及其对应的“解” plot 出来，可以看到

![MM07](../Images/MM07.png?raw=true)

很明显，我们在 $r=2$ 之后开始有了 2 周期的解， $r=2.45$ 附近就有了 4 周期的解，很快地， $r=2.55$ 之前便有了 8 周期的解，模型越来越复杂

6. 我们再看下 $r=3.0$ 时，这时模型已经非常复杂了，这个时候我们可以看到**混沌**的现象，就是，对初值做一个小的扰动，之后整个的曲线的变化会非常大，即**对初值的敏感的依赖**

![MM08](../Images/MM08.png?raw=true)

![MM09](../Images/MM09.png?raw=true)

### 1.3 Leslie 模型

#### 1.3.1 考虑下人口分布

我们的 Logistic 模型只关注于人口总量，但是事实上我们人口分布也是非常重要的，比如说年龄分布，一个全是青年的分布与一个全是老年的分布的趋势肯定是不一样的，那么怎么建立新的模型呢？

### 1.3.2 重新建模

比如我们现在按每 1 年将人口进行切分，比如说不到一岁的人就叫 $n_0$，不到两岁就叫 $n_1$ ……很明显，我们现在将某一时刻的人口切分成了一个矩阵

$$
\mathbf{N}_t =  \begin{pmatrix}
n_0\\
n_1\\
\vdots\\
n_s
\end{pmatrix}_t
$$

我们分别考虑下各年龄人口的数量

1. 新生儿，他们来源于各个年龄段的贡献，故每个年龄都会有这么一个出生率 $F_i$

$$
n_{0,t+1} = F_0 n_{0,t} + F_1 n_{1,t} + \cdots + F_s n_{s,t}
$$

2. 非新生儿，这个时候需要考虑他们的死亡率 $(1 - p_s)$，$p_i$ 也就是他们的存活率

$$
\begin{aligned}
n_{1,t+1} & = p_0 n_{0,t} \\
\cdots & \cdots\\
n_{s,t+1} & = p_{s-1} n_{s-1,t}
\end{aligned}
$$

所以说，我们现在就会有好多好多的参数，这取决于我们切分的份数 $s$，参数将会有 $(s+1) + s = (2s + 1)$ 个

如果把 Leslie 模型写成矩阵形式

$$
N_{t+1} = L N_t
$$

其中

$$
\mathbf{L}_t =  \begin{pmatrix}
F_0 & F_1 & F_2 & \cdots & F_s \\
p_0 & 0 & 0 & \cdots & 0 \\
0 & p_1 & 0 & \cdots & 0 \\
\vdots & \vdots & \ddots & \ddots & \vdots \\
0 & 0 & \cdots & p_{s-1} & 0
\end{pmatrix}
$$

> 模型变难了，参数变多了，我们虽然能估计出来某些参数的值，但是难免带有主观因素，所以我们只有在“迫不得已”的情况下才会选用更复杂的模型，比如说我们就是要考虑各年龄的分布问题时

#### 1.3.3 继续求解

任意时刻的还是比较简单，我们只需要在 $N_t$ 基础上乘上 $L$，就很容易地得出 $N_{t+1}$，但是我们如何得到它的渐进性质呢？

首先假设 $L$ 的特征值 $\lambda_0, \lambda_1, \cdots ,\lambda_s$ 及其相应的特征向量 $\nu_0, \nu_1, \cdots ,\nu_s$ ，如果说所有的特征值都是不一样的，那么初始值 $N_0$ 一定可以表示为

$$
N_0 = c_0\nu_0 + \sum_{i=1}^s c_i \nu_i
$$

之后某一时刻的人口数量只需要乘 $L$，也就是

$$
N_t = c_0 (\lambda_0)^t \nu_0 + \sum_{i=1}^s c_i(\lambda_i)^t \nu_i
$$

不妨假设 $\lambda_0$ 是所有特征值里模最大的那个，则有

$$
\lim_{t\to\infty} N_t \propto c_0(\lambda_0)^t \nu_0
$$

也就是说，它的渐进状态是由**首特征值的大小**决定的

-  $|\lambda_0| > 1$ 无限增长下去
-  $|\lambda_0| < 1$ 最终灭亡
-  $|\lambda_0| = 1$ 收敛在一个稳定值

渐进状态由首特征值大小决定，而首特征值大小又是由各个参数决定的，这使得问题变得很是复杂，任何一个参数估计有所偏差会使得最终的预估有很大偏差

> 所有的模型都是错的，但有些是有用的
> 每个模型都不能将现实世界的全貌描述出来，但是有很多模型是可以很好地拟合某个条件下的一个问题，这就可以说是有用的，只要是有用的，便是好的

### 1.4 更复杂的模型

#### 1.4.1 又是什么需求？

我们知道，只有在有更好的需求的时候才需要更复杂的模型，在能解决问题的情况下，模型是越简单越好的，但是我们现在又有什么样的需求呢？

我们刚刚的 Leslie 模型是一个**离散化**的模型，就像从高尔斯模型到马尔萨斯模型一样，我们可以将这个离散化的模型变成连续的，并不按几年进行分割，或者说这个“几年”取个极小的极限，我们有可能是对这种模型是有需求的，因为这种模型描述的会更加准确，但是参数也会更加的多

由于原来出生率存活率都是依赖于分割的时间段的，如今时间段趋于无穷小，那么出生率存活率自然是无穷多的参数了，或者说会是一个函数，这使得模型复杂得多，但如果我们能得到比较准确的函数，那么这个模型也会更加的准确

![MM10](../Images/MM10.png?raw=true)

#### 1.4.2 还有呐？

之前我们是考虑了年龄的分布，但是地域分布呐？移民的影响呐？

…… （所有的模型都是错的） ……

> 有些时候有些参数很难估计出来，也许我们会选择随机模型，使得模型有着一定的不确定性，反映问题本身可能有的不确定性

## 2 全球定位系统

如何获得我们所在位置的一个精确坐标？

### 2.1 基本模型

#### 2.1.1 模型构建

我们知道我们日常所用的全球定位系统是通过卫星实现的，我们可以假设我们现在处在坐标为 $(x, y, z)$ 的位置，那么如果在时刻 $t$ 我们接收到了一系列的卫星发送的包 $(x_n, y_n, z_n, t_n)$ ，便可根据位置以及时间列出方程 $\sqrt{(x-x_n)^2 + (y-y_n)^2 + (z-z_n)^2} = c \cdot (t-t_n)$ ，当然，这只是我们从卫星 $n$ 获得的信息，我们可是有好多好多卫星的，能列好多好多方程……比如说下面这六颗卫星

-  $(x-3)^2 + (y-2)^2 + (z-3)^2 - [(10010.00692286 - t) \cdot c]^2 = 0$
-  $(x-1)^2 + (y-3)^2 + (z-1)^2 - [(10013.34256381 - t) \cdot c]^2 = 0$
-  $(x-5)^2 + (y-7)^2 + (z-4)^2 - [(10016.67820476 - t) \cdot c]^2 = 0$
-  $(x-1)^2 + (y-7)^2 + (z-3)^2 - [(10020.01384571 - t) \cdot c]^2 = 0$
-  $(x-7)^2 + (y-6)^2 + (z-7)^2 - [(10023.34948666 - t) \cdot c]^2 = 0$
-  $(x-1)^2 + (y-4)^2 + (z-9)^2 - [(10030.02076857 - t) \cdot c]^2 = 0$

这里没有把接收到的时刻 $t$ 用已知的数据来表示，因为我们无法做到和卫星的时间同步，所以我们不如直接将它作为一个变量，因为我们有着足够多的卫星，也就有着足够多的方程

#### 2.1.2 模型求解

那么，这是一个四元方程组，虽然是一个二次的，但是我们的二次项只有 $x^2, y^2, z^2, t^2$ 拿其中一个方程就可以将其它所有方程中的二次项都消掉，因为我们有着足够多的方程，比如利用最后一个式子进行消二次项可以得到

-  $4x -4y -12z +3.59751t = 35971.1$
-  $0x -2y -16z +2.99792t = 29957.2$
-  $8x +6y -10z +2.39834t = 24031.4$
-  $0x +6y -12z +1.79875t = 17993.5$
-  $12x +4y -4z +1.19917t = 12059.7$

写成矩阵就是

$$
\begin{bmatrix}
4 & -4 & -12 & 3.59751 \\
0 & -2 & -16 & 2.99792 \\
8 & 6 & -10 & 2.39834 \\
0 & 6 & -12 & 1.79875 \\
12 & 4 & -4 & 1.19917
\end{bmatrix}
\begin{bmatrix}
\mathbf{x} \\
\mathbf{y} \\
\mathbf{z} \\
\mathbf{t}
\end{bmatrix}
= \begin{bmatrix}
35971.1 \\
2.99792 \\
2.39834 \\
1.79875 \\
1.19917
\end{bmatrix}
$$

这是一个超定方程，我们通常用最小二乘的方式来求解它

#### 2.1.3 可解决的问题

我们可以通过这个方程求解出来 $(x, y, z, t)$ ，不过我们**这样求解出来的位置 $(x, y, z)$ 并不够准确**，误差大概能有几十米，当然这是不能满足我们的要求的，但是我们**求解出来的时间 $t$ 确实相当精准的一个数值**，因为前面有一个很大的常数光速 $c$ ，稍稍改变一点 $t$ ，对于整个方程来说影响是非常大的，所以我们用它来校时是没有问题的

### 2.2 模型分析

#### 2.2.1 实际应用的某些问题

很明显，经过我们头顶上的卫星信号会更好些，而处于地平线方向的卫星需要经过好多重的楼啦、污染的空气啦的阻碍，所以中间信号会有一定的误差，所以我们会倾向于去掉这一部分的数据

另外，我们知道，还有很多误差的来源，比如

-  卫星时钟（一定要准确，因为乘光速会放大很多倍）
-  轨道误差（$(x, y, z)$ 的误差）
-  电离层延迟
-  对流层延迟
-  接收机噪声
-  等等

这些问题都会对结果产生影响

#### 2.2.2 考虑误差的影响

首先考虑一个方程的简单情况

$f_1 \equiv (x-3)^2 - [(T_1 + t_1) \cdot c]^2 = 0$

我们很容易将 $x$ 表示为 $t$ 的函数，求个导就可以知道 $x$ 与 $t$ 的误差之间的关系了，相应地，我们这样来考虑 4 个方程的情况

-  $f_1 \equiv (x-3)^2 + (y-2)^2 + (z-3)^2 -[(T_1 + t_1 - t) \cdot c^2] = 0$
-  $f_2 \equiv (x-1)^2 + (y-3)^2 + (z-1)^2 -[(T_2 + t_2 - t) \cdot c^2] = 0$
-  $f_3 \equiv (x-5)^2 + (y-7)^2 + (z-4)^2 -[(T_3 + t_3 - t) \cdot c^2] = 0$
-  $f_4 \equiv (x-1)^2 + (y-7)^2 + (z-3)^2 -[(T_4 + t_4 - t) \cdot c^2] = 0$

然后我们就可以算出来， $(x, y, z)$ 误差的这样的量级

#### 2.2.3 建模的过程

![MM11](../Images/MM11.png?raw=true)

建模的过程是需要按照以上一步一步操作的，**并不是说可以一步就走到实用化或工程化**的

### 2.3 问题解决

#### 2.3.1 如何解决

比如说卫星以高频持续发出信号包，那么卫星发出的信号包可以看做一个连续的函数，而不是离散的一系列点，运用复杂的数学方法来解决

再比如地面有一个比较准确的信号发射器辅助校准位置

#### 2.3.2 科学到工程

从**科学可行性**到**工程可行性**，需要**技术**的支持

## 3 火箭为什么是三级？

### 3.1 问题的提出

火箭的发射过程：

1. 首先点燃最下面的一级火箭，火箭垂直于地面发射
2. 待一级火箭燃料燃尽，丢弃一级火箭并点燃二级火箭
3. 待二级火箭燃料燃尽，丢弃二级火箭并点燃三级火箭
4. 火箭加速到一定速度，将卫星送入轨道

由于火箭的级数越多，设计难度越大，但为了达到预定速度，级数也不能太少，所以级数的多少成了一个问题，至于如何解决这个问题，可以使用牛顿第二定律 $F=ma$ 来考虑

### 3.2 卫星的速度

首先，卫星需要多大的速度才能保持不掉下来？

$$
\begin{cases}
G \frac{Mm}{r^2} = mg' = m \frac{v^2}{r} \\
G \frac{Mm}{R^2} = mg
\end{cases}
$$

易解得 $v = R \sqrt{\frac{g}{r}}$

如果取 $r \approx R = 6371 km$ ，那么 $v = \sqrt{Rg} \approx 7.9 km/s$ ，也就是第一宇宙速度

### 3.3 火箭的推力

在 $t$ 到 $t + \Delta t$ 运用动量守恒定律

首先考虑 $t$ 时刻：

$$
p(t) = m(t)v(t)
$$

> 其中 $m(t)$ 是 $t$ 时刻火箭的质量， $v(t)$ 是 $t$ 时刻火箭的速度

然后考虑 $t + \Delta t$ 时刻：

-  火箭系统的动量 $m(t + \Delta t) v(t + \Delta)$
-  喷射出去的气体的动量 $(m(t) - m(t + \Delta t))(v(t) - u)$

> 其中 $u$ 是气体相对于火箭的速度，$v(t)$ 是火箭相对于地球速度

故$p(t + \Delta t) = m(t + \Delta t) v(t + \Delta) - (m(t) - m(t + \Delta t))(v(t) - u)$

利用动量守恒定律得

-  $m(t)v(t) = m(t + \Delta t) v(t + \Delta) - (m(t) - m(t + \Delta t))(v(t) - u)$
-  $m(t + \Delta t) v(t + \Delta t) - m(t)v(t) = (m(t + \Delta t) - m(t))(v(t) - u)$
-  $\frac{m(t + \Delta t) v(t + \Delta t) - m(t) v(t)}{\Delta t} = \frac{(m(t + \Delta t) - m(t))(v(t) - u)}{\Delta t}$
-  $\lim_{\Delta t \to 0}\frac{m(t + \Delta t) v(t + \Delta t) - m(t) v(t)}{\Delta t} = \lim_{\Delta t \to 0}\frac{(m(t + \Delta t) - m(t))(v(t) - u)}{\Delta t}$
-  $\frac{d(m(t)v(t))}{dt} = \frac{dm(t)}{dt} (v(t) - u)$
-  $\frac{dm(t)}{dt} v(t) + \frac{dv(t)}{dt} m(t) = \frac{dm(t)}{dt} (v(t) - u)$
-  $m(t)\frac{dv(t)}{dt} = -u \frac{dm(t)}{dt}$
-  $v(t) = v_0 + u ln \frac{m_0}{m(t)}$

经过上面一系列变换后，得到 $v(t) = v_0 + u ln \frac{m_0}{m(t)}$

> 其中 $v_0$ 是初始时刻火箭的速度， $m_0$ 是初始时刻火箭系统的质量（如果初始火箭静止，那么 $v_0 = 0$）

### 3.4 火箭系统的质量

$$
m_0 = m_p + m_s + m_f
$$

> 其中 $m_p$ 是火箭的有效载荷， $m_s$ 是火箭的结构质量， $m_f$ 是火箭所装载的燃料的质量

火箭最终速度 $v = u ln \frac{m_0}{m_p + m_s}$

令结构比 $\lambda = \frac{m_s}{m_s + m_f}$，即结构质量在结构和燃料总质量中所占的比例，从而我们得到

$$
\begin{aligned}
v = & u ln \frac{m_0}{m_p + m_s} \\
= & u ln \frac{m_0}{\lambda m_0 + (1 - \lambda) m_p} \\
\leq & u ln \frac{1}{\lambda}
\end{aligned}
$$

也就是说，火箭喷气速度 $u$ 越大，结构比越小，火箭最终速度越大，当然我们现在只考虑一级火箭

我们现在能达到的 $u = 3 km/s$， $\lambda = 0.1$ ，代入上式计算可得 $v \leq u ln \frac{1}{\lambda} = 3 ln 10 \approx 7(km/s)$ ，也就是说在现有的技术条件下是无法达到第一宇宙速度的

### 3.5 多级火箭的速度公式

首先，确定以下参数：

-  $n$ —— 火箭级数
-  $m_i$ —— 第 $i$ 级火箭的结构和燃料的总质量
-  $\lambda$ —— 结构比
-  $m_p$ —— 有效载荷

则第 $i$ 级火箭的结构质量： $\lambda m_i$，第 $i$ 级火箭的燃料质量： $(1 - \lambda) m_i$ ，火箭的初始质量： $m_0 = m_p + m_1 + m_2 + \cdots + m_n$

1. 第一级火箭的燃料消耗完毕时

   -  火箭的质量： $m_p + \lambda m_1 + m_2 + \cdots + m_n$
   -  初始速度： $v_0 = 0$
   -  火箭的速度：$v_1 = v_0 + u ln \frac{m_0}{m_p + \lambda m_1 + m_2 + \cdots + m_n}$

2. 第二级火箭的燃料消耗完毕时

   -  火箭的质量： $m_p + \lambda m_2 +m_3 + \cdots + m_n$
   -  火箭的速度： $v_2 = v_1 + u ln \frac{m_p + m_2 + \cdots + m_n}{m_p + \lambda m_2 + \cdots + m_n}$

3. 第 n 级火箭的燃料消耗完毕时

   -  火箭的速度： $v_n = v_{n-1} + u ln \frac{m_p + m_n}{m_p + \lambda m_n}$

将前面的速度代入即可得

$v = u ln \left(\frac{m_0}{m_p + \lambda m_1 + m_2 + \cdots + m_n} \cdot \frac{m_p + m_2 + \cdots + m_n}{m_p + \lambda m_2 + \cdots + m_n} \cdot \cdots \cdot \frac{m_p + m_n}{m_p + \lambda m_n} \right)$

### 3.6 三级火箭的最优性

已知 $v, u, \lambda, m_p$，在约束条件

-  $m_0 = m_p + m_1 + m_2 + \cdots + m_n$
-  $\frac{v}{u} = ln \left(\frac{m_0}{m_p + \lambda m_1 + m_2 + \cdots + m_n} \cdot \frac{m_p + m_2 + \cdots + m_n}{m_p + \lambda m_2 + \cdots + m_n} \cdot \cdots \cdot \frac{m_p + m_n}{m_p + \lambda m_n} \right)$

下，求 $m_0$ 的最小值或 $\frac{m_0}{m_p}$ 的最小值

然后经过一系列操作……可以知道三级火箭最优:joy:

## 4 投资优化策略

### 4.1 背景

马科维兹均值-方差模型诞生前夜，占据主导地位的理论是净现值决策与投资分散化理论，但是这两种理论其实是相互矛盾的

-  净现值理论

   针对单一投资品种，将多期收益转化到当前收益的定量模型，并没有考虑风险

   假设某资产未来第 $t$ 年的预期收益为 $d_i$ ，其投资收益的净现值为

   $$
   V_0 = \sum_{t=1}^\infty d_t (\frac{1}{1+i})^t
   $$

   其中 $i$ —— 年利率， $\frac{1}{1+i}$ —— 贴现率

-  投资分散化理论

   针对多个投资品种，“定性地”知道通过分散投资来规避风险

### 4.2 马科维兹均值-方差模型

将投资组合的收益当做随机变量来看，用其期望值衡量投资组合的预期收益，用其方差衡量投资组合的风险

我们可以尝试用该模型来推演下投资分散化理论

假设有两种资产的收益率分别为 $X$ 与 $Y$，其方差分别为 $Var(X)$ 和 $Var(Y)$ ，投资比例为 $x$ 和 $1-x$ ，投资组合的收益为 $Z = xX + (1-x)Y$，那么其风险就是 $Var(Z) = x^2 Var(X) + (1-x)^2 Var(Y) + 2x(1-x)\rho_{XY}(Var(X)Var(Y))^{1/2}$ ，可以证明该值比 $Var(X)$ 和 $Var(Y)$ 都低

如果我们有最近 $T$ 年的 $A,B,C$ 三种股票的收益数据，我们预期年收益率至少达到 15%
要如何投资呢？

我们将三种股票的收益率分别表示为 $R_1,R_2, R_3$ 分别投资比例为 $x_i, x_2, x_3$ ，那么投资组合的收益率就是 $R=x_1 R_1 + x_2 R_2 + x_3 R_3$

决策目标为 $min Var(R)$

约束条件为

-  $ER \geq 15\%$
-  $x_1+x_2+x_3 = 1$
-  $x_1,x_2,x_3 \geq 0$

我们令 $\mu_i = ER_i, \sigma_{ij} = cov(R_i, R_j)$

则 $ER = \mu_1 x_1 + \mu_2 x_2 + \mu_3 x_3$

$Var(R) = \cdots = \sum_{i=1}^3 \sum_{j=1}^3 \sigma_{ij}x_i x_j = \mathbf{x^T}(\mathbf{COV})\mathbf{x}$

$$
\begin{aligned}
min & \sum_{i=1}^3 \sum_{j=1}^3 \sigma_{ij}x_i x_j \\
s.t. & \mu_1 x_1 + \mu_2 x_2 + \mu_3 x_3 \geq 0.15 \\
 & x_1 + x_2 + x_3 = 1 \\
 & x_1, x_2, x_3 \geq 0
\end{aligned}
$$

这就变成了一个可求解的参数估计问题

# Change Log

1. 190101 #1 Finished
2. 190117 #2 Finished
3. 190130 #3 Finished

# Reference

1. [走近数学——数学建模篇 - 全国大学生数学建模竞赛组织委员会 - 中国大学 MOOC](https://www.icourse163.org/course/cumcm-1001674011?tid=1003045001)
2. 《数学建模算法与应用（第二版）》 司守奎 孙兆亮
