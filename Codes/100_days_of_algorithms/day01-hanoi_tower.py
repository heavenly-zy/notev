'''
# Day 1：汉诺塔
汉诺塔问题是一个经典的问题。汉诺塔（Hanoi Tower），又称河内塔，源于印度一个古老传
说。大梵天创造世界的时候做了三根金刚石柱子，在一根柱子上从下往上按照大小顺序摞着
N片黄金圆盘。大梵天命令婆罗门把圆盘从下面开始按大小顺序重新摆放在另一根柱子上。
并且规定，任何时候，在小圆盘上都不能放大圆盘，且在三根柱子之间一次只能移动一个圆
盘。问应该如何操作？

试想一下，如果我们要将最大的圆盘移动到最右边的柱子上。我们需要把除此圆盘的其他圆
盘先移动到中间的柱子上。因此这个问题就变成了如何将 N-1 个圆盘移动到中间的柱子上。
很容易我们就想到了递归的方法。

将 N 个圆盘从左边柱子移动到右边柱子：

* [递归的]将 N-1 个圆盘从左边柱子移动到中间柱子。
* 将最大的圆盘从左边柱子移动到右边柱子。
* [递归的]将 N-1 个圆盘从中间柱子移动到右边柱子。
'''

'''
要把最大的拿过去嘛，首先就是把最大的上面那些的拿走，那要咋拿呢，哦，拿的方法就是，
上面那些里面的最大的上面那些拿走……
参数名字不应该取左中右的，origin end temp就很好理解了
'''

tower = {'left':[], 'middle':[], 'right':[]}

def hanoi(height, origin = 'left', end = 'right', temp = 'middle'):
    if height:
        hanoi(height - 1, origin, temp, end)# 现在的任务是把原来的位置的搬到临时位置
        # print(origin + ' => ' + end)
        print(tower)
        tower[end].insert(0, tower[origin][0])
        tower[origin] = tower[origin][1:]
        hanoi(height - 1, temp, end, origin)# 然后再把临时位置的搬到目标

N = 3
tower['left'] = list(range(N))
hanoi(N)
print(tower)# 完工！
