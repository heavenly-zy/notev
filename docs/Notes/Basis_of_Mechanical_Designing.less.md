<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.9.0/katex.min.css">

# Basis of Mechanical Designing (less) <Badge text="alpha" type="warn"/> <Badge text="5.0.0"/>

## 1 平面机构的自由度和速度分析

1. 自由度计算公式：  
   $ F = 3n - 2P_L - P_H $  
   $ F $：自由度  
   $ n $：活动构件个数  
   $ P_L $：低副个数  
   $ P_H $：高副个数

::: tip

1. 复合铰链
2. 局部自由度
3. 虚约束

:::

## 2 平面连杆机构

1. 概念
   1. 各种杆杆
      - 连架杆 顾名思义，连着机架的俩杆杆
      - 连杆 就是没连着机架的那个杆杆
   2. 如果按转法分的话
      - 曲柄 有整转副
      - 摇杆 转不了一圈的杆杆，只会来回摇啊摇
   3. 杆杆的各种组合
      - 双摇杆机构
      - 曲柄摇杆机构
      - 双曲柄机构
2. 计算
   1. 判断机构中是否有整转副  
      $ l_1 + l_4 \leq l_2 + l_3 $(其中$ l_1 $和$ l_4 $分别为最短杆和最长杆)
   2. 如果没有整转副，自然没有曲柄，故为双摇杆机构
   3. 如果有整转副，那么判断最短杆在哪，因为最短杆两侧为整转副
      1. 如果最短杆杆是机架，那么俩连架杆都有整转副，所以双曲柄柄
      2. 如果最短杆杆是连架杆，那么相邻那个连架杆有整转副，所以曲柄摇杆
      3. 如果最短杆杆是连杆，那么俩连架杆都有整转副？所以？哦，他们相对于机架都是摇杆，唔双摇杆
3. 特性
   - 急回 曲柄为原动件：摇杆的回程和去程时间不等
   - 死点 摇杆为原动件：曲柄和连杆重合时压力角为 90

::: tip

1. 滑块相当于一个无限长的杆杆
2. 压力角为速度与力的夹角，越小越好，传动角为其余角

:::

## 3 凸轮机构

1. 概念
   - 推程运动角
   - 远休止角
   - 回程运动角
   - 近休止角
2. 设计
   1. 有滚子时最后要整体去除滚子半径长度
   2. 偏心时只需在轴心画个圆，然后利用该圆的切线画即可

## 4 齿轮机构

1. 概念

   - 节圆 瞬心（节点）所在的圆，两齿轮啮合时才有，此时相当于两节圆发生纯滚动
   - 分度圆 齿顶高与齿根高分界的圆，齿轮的很多属性均为该圆的属性，比如压力角，该处压力角的标准值为 20 度

   ***

   - 齿距$ p $
   - 齿数$ z $
   - 分度圆直径$ d = \frac{p}{\pi} z $
   - 模数$ m = \frac{p}{\pi} $

   ***

   - 齿顶高$ h_a = h_a^* m $，标准齿制下，$ h_a^* = 1.0 $
   - 齿顶圆直径$ d_a = d + 2h_a $
   - 齿根高$ h_f = (h_a^* + c^*)m $，标准齿制下，$ c^* = 0.25 $
   - 齿根圆直径$ d_f = d - 2h_f $

2. 变位齿轮

   - 标准齿轮的话，$ z_{min} $=17，再少就会发生根切
   - 变位齿轮的话，可以改善这一现象
     - 正变位，刀具远离轮坯中心，x>0
     - 负变位，与之相反

3. 斜齿轮
   - 当量齿数 $ z_v = \frac{z}{cos^3\beta} $
   - 端面模数 $ m_t = \frac{m_n}{cos\beta} $
   - 优点：重合度大、运转平稳、最小齿数更小（不易根切）

## 5 轮系

1. 定轴轮系
   - $ i_{ab} = \frac{\omega_a}{\omega_b} = \frac{z_2}{z_1} $ 外啮要加负号，内啮为正
2. 周转轮系
   - 组成：行星轮（轴线位置可变）、转臂、中心轮（轴线位置固定，$ \leq 2 $）
   - 计算：
     - 周转轮系转臂转速$ n_H $，整个轮系施加$ -n_H $，则转化为定轴轮系
     - 真实$ i_{13}=\frac{n_1}{n_3} $
     - 转化$ i_{13}^H=\frac{n_1^H}{n_3^H}=\frac{n_1-n_H}{n3_-n_H}=(-1)^1\frac{z_2z_3}{z_1z_2}=-\frac{z_3}{z_1} $
     - $ i_{GK}^H=\frac{n_G^H}{n_K^H}=\frac{n_G-n_H}{n_K-n_H}=(-1)^m\frac{z_c}{z_z} $ 最后的分母是 GK 间所有主动轮齿数乘积，分子是 GK 间所有从动件齿数乘积
3. 复合轮系
   > 单独算每一个轮系

::: tip

1. 右旋蜗杆用右手定则
   - 四指：蜗杆转动方向
   - 拇指（结果）：蜗杆相对蜗轮的运动方向，可知蜗轮在啮合点是向相反方向转动的
   - 左旋记得用左手

:::

## 9 机械零件设计概论
1. 概念
   - 变应力循环特性 $ r = \frac{\sigma_{min}}{\sigma_{max}} $
   - 疲劳曲线 应力（$ \sigma $）~ 循环次数（$ N $）
2. 影响疲劳强度的主要因素
   1. 应力集中的影响 （降低疲劳强度）
   2. 零件尺寸的影响 （尺寸越大，疲劳强度越低）
   3. 表面状态的影响 （光滑的表面可以提升疲劳强度）

## 10 连接
1. 自锁 斜面倾角（螺纹升角）$ \psi $ 小于 摩擦角（当量摩擦角）$ \rho $
2. 公称直径 指大径$ d $，而设计时计算所得为小径$ d_1 $，需查表获得大径$ d $
3. 预紧力 $ F_a $
4. 防松措施
   * 摩擦防松
      * 弹簧垫圈
      * 对顶螺母（双螺母）
      * 尼龙圈锁紧螺母
   * 机械防松
      * 槽型螺母和开口销
      * 圆螺母用带翅垫片
      * 止动垫片
   * 破坏性防松
      * 冲点法防松
      * 粘合法防松
      * 焊接法防松
5. 强度计算
   * 松螺栓联接
      $$
      \sigma = \frac{F_a}{\pi d_1^2/4} \leq [\sigma]
      $$
   * 紧螺栓联接（含拧紧力矩）
      $$
      \sigma = \frac{1.3F_a}{\pi d_1^2/4} \leq [\sigma]
      $$
      * 受横向工作载荷的螺栓强度（相对滑动时便失效）
         $$
         F_a = F_0 \geq \frac{CF}{mf}
         $$
         > * $ F_a $ 轴向压紧力
         > * $ F_0 $ 预紧力
         > * $ m $ 接合面数目
         > * $ f $ 接合面摩擦系数
         > 仅靠摩擦力支持横向载荷需极大地预紧力，也就需要比较大的尺寸，故可使用键、套筒、销承担横向载荷，或直接用铰制孔螺栓代替普通螺栓，此时仅需校核该零件强度即可
      * 受轴向工作载荷的螺栓强度
         $$
         F_a = F_E + F_R
         $$
         > * $ F_a $ 总拉伸载荷
         > * $ F_E $ 残余预紧力
         > * $ F_R $ 工作载荷
      
         $$
         F_a = F_0 + F_E \frac{k_b}{k_b + k_c}
         $$
         > * $ k_b $ 螺栓刚度
         > * $ k_c $ 被连接件刚度

6. 提高强度措施
   1. 降低螺栓刚度 & 提高被连接件刚度
   2. 改善螺纹牙间的载荷分布
   3. 减小应力集中
   4. 避免或减小附加应力

## 10 齿轮传动

      

# Amendant Record

181210 #1 #2 #3 #4 Finished  
181211 #5 Finished  
181212 #9 Finished  
181213 #10 Finished  

# Reference

1. 杨光辉老师课程
2. 《机械设计基础》 杨可桢 程光蕴 李仲生 钱瑞明