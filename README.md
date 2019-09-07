# ginkgo emacs

![ginkgo](./logo.png)

- [ginkgo](#ginkgo)
    - [原则](#原则)
    - [搜索](#搜索)
        - [全局搜索](#全局搜索)
            - [swiper-isearch](#swiper-isearch)
            - [rg](#rg)
            - [ag](#ag)
            - [搜索之后批量修改Multi-editing](#搜索之后批量修改Multi-editing)
        - [单个文件内搜索](#单个文件内搜索)
            - [avy](#avy)
        - [以搜索作为大范围光标移动的方式](#以搜索作为大范围光标移动的方式)
    - [补全](#补全)
        - [代码补全](#代码补全)
        - [company](#company)
        - [yasnippet](#yasnippet)
        - [文件路径补全](#文件路径补全)
    - [代码检查](#代码检查)
        - [拼写检查](#拼写检查)
        - [lint的设置](#lint的设置)
    - [常用编辑功能](#常用编辑功能)
        - [buffer](#buffer)
          - [ibuffer](#ibuffer)
        - [局部替换或编辑](#局部替换或编辑)
        - [文件操作](#文件操作)
        - [dired](#dired)
        - [光标移动](#光标移动)
        - [代码段](#代码段)
        - [格式化](#格式化)
        - [翻译](#翻译)
        - [shell](#shell)
        - [bookmark](#bookmark)
    - [插件的使用](#插件的使用)
        - [pretty-hydra](#pretty-hydra)
        - [yasnippet](#yasnippet)
        - [magit](#magit)
        - [use-package](#use-package)
    - [web](#web)
    - [常用操作](#常用操作)
    - [问题](#问题)
        - [在终端中运行](#在终端中运行)
        - [无法使用中文输入法](#无法使用中文输入法)
        - [Ubunut的emacs版本老旧](#Ubunut的emacs版本老旧)
        - [subword-mode](#subword-mode)
        - [fill-column](#fill-column)
    - [todo](#todo)
    - [额外依赖包](#额外依赖包)
    - [参考资料](#参考资料)
    - [change log](#change-log)

<!-- markdown-toc end -->

## 原则

以常用功能为中心，绝不增加无用的配置，宁缺毋滥。

## 搜索

要求：高速，界面显示友好，便于检索。

### 全局搜索

#### rg

快捷键：`C-c r`或者evil的leader的键：

``` emacs-lisp
(evil-leader/set-key
          "r" 'counsel-rg
          "a" 'avy-goto-char-2
          )

```


#### ag


[ag 搜索与替换](https://zhuanlan.zhihu.com/p/22687261)

#### 搜索之后批量修改Multi-editing

- `counsel-ag`或者`cuonsel-rg`搜索需要替换的字符串
- `ivy-occur`(`C-c C-o`)打开ivy-occur的buffer
- `ivy-wgrep-change-to-wgrep-mode`(C-x C-q)，evil替换`:%s/pattern/replace/g`
- `wgrep-finish-edit`保持使用`C-x C-s`，取消使用`C-c C-k`


### 单个文件内搜索

#### `swiper-isearch`

快捷键：`C-s`

优点：有mini buffer支持预览，查看搜索结果非常方便。适用于当前文件搜索。


### 以搜索作为大范围光标移动的方式

#### avy

``` emacs-lisp
(("C-:" . avy-goto-char)
         ("C-'" . avy-goto-char-2)
         ("M-g f" . avy-goto-line)
         ("M-g w" . avy-goto-word-1)
         ("M-g e" . avy-goto-word-0))
```




## 补全

要做到抽象语法树的解析功能，正则补全太低级了。

### 代码补全

#### company

#### yasnippet

[emacs yasnippet自定义模版配置与使用](http://www.fidding.me/article/18)

### 文件路径补全


## 代码检查

### 拼写检查

### lint的设置

## 常用编辑功能

### buffer

#### ibuffer

`C-x C-b`或者evil的leader的键`b`

管理buffer列表：

- Run M-x ibuffer (built-in command).
- On each line with a buffer you want to delete press 'd'.
- When finished press 'x' to commit changes.

### 局部替换或编辑

选择需要替换或编辑的区域，执行`narrow-to-region`，把文件截取了局部，然后可以在局部进行替换或编辑，不
会影响整体文件，把影响限制在局部。编辑好之后，执行`widen`，回到整体文件。

### 文件操作

`C-x C-f` 打开文件或新建文件

#### dired

- `C-x d`打开dried。
- `^`跳转到上层目录。


常用操作

| 操作             | 按键            | 备注   |
| ---------------- | :-------------: | -----: |
| 删除文件         | D               |        |
| 删除被flag的文件 | x               |        |
| 重命名文件       | R               |        |
| 复制文件         | C               |        |
| mark复制文件     | c               |        |
| 创建子目录       | `+`             |        |
| mark文件         | m               |        |
| unmark文件       | u               |        |
| unmark所有文件   | U               |        |
| mark删除文件     | d               |        |


[Emacs文件管理神器--dired常用操作说明](http://blog.lujun9972.win/blog/2016/12/10/emacs%E6%96%87%E4%BB%B6%E7%AE%A1%E7%90%86%E7%A5%9E%E5%99%A8--dired%E5%B8%B8%E7%94%A8%E6%93%8D%E4%BD%9C%E8%AF%B4%E6%98%8E/)

### 光标移动

#### 快捷键emacs

- 向下向上：`C-n/C-p`
- 向下向上翻页：`C-v/M-v`
- 跳转到buffer最开始或最后：`C-M-p/C-M-n`


### 代码段

### 格式化

### 翻译

### shell

`C-x k`可以用终止缓冲区的方式退出shell。

### bookmark

#### bookmarking commands

`C-x r m` – set a bookmark at the current location (e.g. in a file)
`C-x r b` – jump to a bookmark
`C-x r l` – list your bookmarks
`M-x bookmark-delete` – delete a bookmark by name

#### counsel-bookmark

快捷键`C-x r b`，或者evil的leader的键：

## 插件的使用

### pretty-hydra

#### 功能

简化按键的操作。

#### 快捷键：`F6`

### yasnippet

#### 功能

代码片段。

#### 快捷键

无。输入关键字即可触发自动补全。

#### 新建snippet

`M-x yas-new-snippet`

### magit

#### 简单操作

- 开启magit：`M-x magit-status`
- 关闭magit：`q`
- Tab键，显示折叠的信息
- stage文件，光标移动到此文件，`s`
- unstage，`u`
- commit，`c`。再次按下`c`，会显示commit信息输入窗口，输入完毕按`C-c C-c`，完成commit
- push，`p`
- merge，`m`
- checkout branch，`magit-branch-checkout`

#### blame

显示每一行的作者和提交信息，修改blame显示的风格，默认是插入代码中的，可以修改为在左侧显示信息`M-x magit-blame-cycle-style`。

- `M-x magit-blame`
- `b`

退出blame

- `M-x magit-blame-quit`或者`C-c C-q`

### use-package

#### 优点

- 延迟加载包，对emacs性能友好
- 提供包的各种hook，有了配置包的统一的代码编写规范

#### 使用

- `:init' 加载前准备
- `:config' 加载后配置
- `:commands` 自动加载命令
- `:bind` 键绑定
- `:bind-keymap`
- `:map` 局部键绑定
- `:disable`
- `:load-path` 扩展加载路径
- `:ensure` 自动安装
- `:mode :interpreter` 模式和解释器
- `hook` 钩子
- `:defer` 延迟加载
- `:after`
- `:require`
- `:custom` 自定义变量

[use-package](https://9r0k.com/use-package.html)


## web

虽然配置中强制自动格式化有缺陷，总体来说还行。只是不习惯不能按照自己要求修改格式，这个比较坑。

### prettier-emacs

## 常用操作

### 不重启emacs，执行新配置

在配置代码之后执行`C-x C-e`即可。


# 问题

## 在终端中运行

`emacs -nw`

## 无法使用中文输入法

简单无副作用的办法： 命令行使用`LC_CTYPE=zh_CN.UTF-8 emacs`启动即可。设置别名`alias emacs="LC_CTYPE=zh_CN.UTF-8 emacs"`

点击图标启动emacs，则需要替换emacs的启动文件。在/usr/share/applications/下面`emacs.desktop`文件。

启动文件中添加 `Exec=env LC_CTYPE=zh_CN.UTF-8 /usr/bin/emacs25 %F`，其中`env LC_CTYPE=zh_CN.UTF-8 `是新增内容。

其他修改系统配置的办法，非常麻烦，而且不一定生效。

## Ubunut的emacs版本老旧

2019年默认是emacs 25，最新版本是26。

emacs 25会自动在init.el中添加`(package-initialize)`，会影响启动速度。

### 安装最新版本

``` shell
sudo add-apt-repository ppa:ubuntu-elisp/ppa
sudo apt-get update
sudo apt install emacs-snapshot
```

### 安装指定版本

有时候没有最新版本，2019年8月份就没有emacs27，实际上此时27已经发布了。

``` shell
sudo apt remove --autoremove emacs25 emacs25-nox
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt update
sudo apt install emacs26
```

## subword-mode

在`subword-mode`模式下，someFunction，evil中搜索和移动，会变为 some Function。不知道是好是坏，之前用vim太多，不习惯。先习惯一下试试。修改命名的时候，应该比较方便些，搜索就麻烦一些。

## fill-column

编写markdown的时候，总是被自动折行。自动折行当然有好处，只是如果要以后生成html或者预览markdown，文字无法自适应屏幕。这种人为强制的格式化，非常不友好。

直观的思路就是把`fill-column`设置为无限大的值，非常愚蠢。后面才了解到这与`auto-fill-mode`是相关的，关闭这个mode即可。

一步一步来吧，初学都有愚笨的时候。只是要知其所以然，才有进步。

> you can have a gigantic fill-column. Or yes, you can turn off auto-fill-mode (use (auto-fill-mode -1) or set auto-fill-function to nil).

> "That sort of line wrapping" is useful if you want text that has lines of limited length. (Duh.)

> See also visual-line-mode, which can give you a similar visual effect but without the insertion of hard newlines.


## todo

- elisp
- flycheck
- highlight
- lsp
- org
- prog



## 额外依赖包

[ag](https://github.com/ggreer/the_silver_searcher)

[rg](https://github.com/BurntSushi/ripgrep)

[YaHei-Consolas-Hybrid](https://github.com/yakumioto/YaHei-Consolas-Hybrid-1.12)

## todo

[从doom emacs中学习快速启动](https://emacs-china.org/t/doom-emacs/10354)

[技术人怎么领导一个开源社区？](https://manateelazycat.github.io/opensource/2019/08/03/how-open-source-works.html)

## 参考资料

[emacs document](http://blog.lujun9972.win/emacs-document/)

[Centaur Emacs](https://github.com/seagle0128/.emacs.d)

[Doom Emacs](https://github.com/hlissner/doom-emacs)

[Lisp之根源](http://daiyuwen.freeshell.org/gb/rol/roots_of_lisp.html)

[Ivy, Counsel and Swiper](https://writequit.org/denver-emacs/presentations/2017-04-11-ivy.html)


## change log

- 2019/8/24 创建新版本
- 2019/8/24 深夜，完成emacs的字体，evil，和输入法配置
- 2019/8/25 下午，新增emacs插件，待研究日常使用方式，不合适则删除
- 2019/8/25 下午，更新readme，记录日后要细究的内容。一步登天太难，虽然我vim和emacs都可以玩
- 2019/8/31 下午，更新evil配置，补全搜索文档
- 2019/8/31 下午，补全搜索的文档和snippet文档
- 2019/9/4 晚上，shell与eshell
- 2019/9/4 晚上，添加bookmark文档
- 2019/9/5 凌晨，添加magit文档
- 2019/9/5 晚上，dired操作文档
