---
title: 本 Repo 规范
date: 2019-10-19
category: 喃
tags:
   - Vuepress
---

::: tip

本篇主要介绍本 Repo 的使用规范，当然，是给自己看的

:::

<!-- more -->

## 为什么需要规范？

任何事物都有着规范，本规范的存在是让自己在日常就养成按照规范行事的习惯，当然，随着学习的不断深入，本规范也会随之不断更新

## 这个 Repo 到底是个什么存在？

18 年 9 月，开始正式学习数据结构等 CS 专业课，为了方便记录与留存笔记，我使用有道云笔记使用 Markdown （不熟，边写边学）对课程笔记进行记录，开了本 Repo 作为代码和笔记图片存储库，但是使用了半个月，我发现有道云笔记经常会吞掉我的笔记，不过所幸能够在后台恢复，即便如此，日常体验实在不佳，不久后我就弃坑了

之后我萌生了使用 Git 存储笔记的想法，但是并没能找到比较友好的前端（那时候我也不咋会搭建静态博客，随手按教程弄了个，但是没试过 Hexo）

偶然间发现了 Vuepress ，不过该框架是在当年 4 月刚刚诞生（搜尤大微博就能看到啦），此时 1.0.0 还仅仅是 alpha 阶段，我试着按照文档搭建了一个，效果非常满意，虽然只是文档格式，但是其实我根本就没想过搭建博客啦，我只想写写笔记什么的

不过新也挺好的啊，我能和它一起成长嘛（学会了查阅技术文档，也认识到了项目文档的重要性）\~ 之后就是各种折腾咯\~

## 从文档开始

本 Repo 的 Markdown 等语法基于 [Vuepress 文档](https://vuepress.vuejs.org/)，查文档是一种最基础的能力

## 如何书写文章

### 关于时间与版本

使用 Git 管理的最大好处就是有着鲜明的时间线与易于操作的版本管理机制，但是作为一个博客来说，每篇文章都应该有它自己的时间，但是由于现阶段写的大多是课程笔记类，所以时间到底是写创建时间还是更新时间值得商榷，这里就暂定一个规范

一篇长期更新的文章应当以创建时间作为文章时间，在基本结构未完成的阶段应使用黄色概览（`warning`）而不是绿色（`tip`）

另外，重构文章应将重构时间作为文章时间，而不是初版创建时间，长期重构文章内部应当注明新旧版本分界线

### 内容规范

表述能力是一种很重要的能力，一个好的文字描述可以使得用户更快地抓住重点，如果有必要，可以加上 `==`（高亮） 或者 `**`（加粗），尽量使用加粗而不是高亮，因为高亮并非 Markdown 原生语法

在一些需要图形描述时，可以添加图片，图片等二进制文件默认以 LFS 形式存储，如果没有加入 LFS 不得提交，图片应尽量少

### 来源声明

在任何文章底部应注明参考链接，即便参考内容作者没有做出声明或者使用比较宽松的协议（比如 CC 中的 CC0、开源协议中的 MIT），也应尊重人家的知识产权

类似地，有参考的代码应当在代码顶部写明参考链接，如果在文章中引用了非参考链接中来源的图片，应当在图片的 `alt` 属性中注明来源

另外，有些资源并非来源于网络或者没有直接的网络链接，也应一一注明，比如某某书籍的启蒙指导、某某老师的授课之恩

## 代码规范

### 格式规范

每种语言都有自己的格式规范，掌握一种语言的规范可以先从它的缩进开始，然后逐步了解一些语法特性，当熟悉了每种语言之后，应当逐渐写出对应语言风格的代码，而不是使用自己的一套代码风格保留在各种语言内，这样对读代码的人会很不友好，而且很可能会降低运行效率（比如用 C 的方法在 Python 里写代码）

### 风格规范

不仅代码的格式有规范，在写代码的时候应该时刻考虑代码的运行效率等问题（就是算法问题），在比较“高级“的语言中如果有可以调用的函数尽量不要使用该语言自己的方法进行实现，应尽量使用内置函数，任何在堆内申请的内存（包括”高级“语言申请的对象），应注重内存回收，不应将无用内存保留到最后

## 在本 Repo 中使用 Markdown 语法

Vuepress 集成了很多易用的 Markdown 语法，配合一些其他插件写笔记会非常方便，这里简单介绍下几个常用且容易忘记的

### 引用代码

-  导入代码块

   ```md
   <<< @/Codes/<noteName>/.../<codename>{<hightlight_line1>,<hightlight_line2>}
   ```

-  代码高亮

   Vuepress 使用[prismjs](https://prismjs.com/#languages-list)进行代码高亮

### 数学公式($\KaTeX$)

我们可以渲染公式例如：$x_i + y_i = z_i$和$\sum_{i=1}^n a_i=0$
我们也可以单行渲染

$$
\begin{aligned}
\sum_{i=1}^n a_i & = 0 \\
\sum_{j=1}^n b_j & = 1000
\end{aligned}
$$

具体可参照[$\KaTeX$ 支持的公式](https://katex.org/docs/supported.html)以及[$\LaTeX$ 支持的公式](https://math.meta.stackexchange.com/questions/5020/mathjax-basic-tutorial-and-quick-reference)

::: tip

过长的公式请不要使用单行渲染！否则在手机浏览器会产生部分空屏的效果！

:::

### Emoji:smiley:

使用 emoji 使文档更加生动~

比如在哪里需要提到 bug，不妨在两边加上:，就像`:bug:`这样，然后就成了:bug:这样子~

当然，我们还可以使用 Emoji 作为 git 的 commit 说明，可以参考[Gitmoji](./Discovery/05_Git_Commit.md)

更多请查看[Gitmoji 官网](http://gitmoji.carloscuesta.me/)和[Emoji 官网](https://emojipedia.org/)

### Badge <Badge text="beta" type="warn"/> <Badge text="0.10.1+"/>

这是 Vuepress 中的内置组件，可以通过这种方式使用：

```md
### Badge <Badge text="beta" type="warn"/> <Badge text="0.10.1+"/>
```

渲染出来的效果当然就是标题这种啦~

更多选项参考[Vuepress 文档](https://vuepress.vuejs.org/zh/guide/using-vue.html)

::: tip 部分笔记使用该方式来标注重点

-  了解即可 <Badge text="~" type="tip"/>
-  比较重要 <Badge text="*" type="warn"/>
-  非常重要 <Badge text="!" type="error"/>

:::

### Matplotlib

使用 `Python` 库 `matplotlib` 可以更加方便快捷地生成函数等图像！

基于`VS Code` 插件 [Markdown Preview Enhanced](https://shd101wyy.github.io/markdown-preview-enhanced/#/zh-cn/code-chunk) ，首先打开 `VS Code` 设置中的 `enableScriptExecution` ，之后便可以通过快捷键 `shift-enter` 运行当前代码块、快捷键 `ctrl-shift-enter` 运行全部代码块

使用 `plt.show()` 可在预览文档中快速预览生成的图片，但无法保存到云端文档，故可配合 `plt.savefig('../Images/filename.png')` 将图片保存至 `Images` 文件夹内，之后添加`![filename](../Images/filename.png)` 即可

示例：

```python {cmd=true matplotlib=true hide=true}
import matplotlib.pyplot as plt
plt.plot([1, 2, 3, 4])
plt.show()
plt.savefig("../Images/example.png")
```

![example](../Images/example.png)

## Git 规范

### Git Commit 规范

当前使用规范如下

```
<gitmoji> <header>(<scope>) subject

body

footer
```

header 仅可使用英文，由于当前英文还不好， body 中应使用中文进行详细的描述（正常来说 header 应尽可能描述完全，但现在达不到那水平，而且本 Repo 一般操作比较杂）

其中详情见 [Git Commit](05_Git_Handbook.md)

### 对大文件的管理

在源码存在的情况下，不应当提交编译后的文件，编译后的结果一般并非可读的，而且文件也较大，本 Repo 是一个长期项目，其中不应当存在二进制文件，如果一定要提交二进制文件，需要使用 LFS 进行管理
