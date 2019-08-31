# ginkgo emacs

![ginkgo](./logo.png)

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
**目录**

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
    - [插件的使用](#插件的使用)
    - [问题](#问题)
        - [无法使用中文输入法](#无法使用中文输入法)
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

### 局部替换或编辑

选择需要替换或编辑的区域，执行`narrow-to-region`，把文件截取了局部，然后可以在局部进行替换或编辑，不
会影响整体文件，把影响限制在局部。编辑好之后，执行`widen`，回到整体文件。

### 文件操作

`C-x C-f` 打开文件或新建文件

#### dired

`C-x d`打开dried。

[Emacs文件管理神器--dired常用操作说明](http://blog.lujun9972.win/blog/2016/12/10/emacs%E6%96%87%E4%BB%B6%E7%AE%A1%E7%90%86%E7%A5%9E%E5%99%A8--dired%E5%B8%B8%E7%94%A8%E6%93%8D%E4%BD%9C%E8%AF%B4%E6%98%8E/)

### 光标移动


### 代码段

### 格式化

### 翻译

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



# 问题

## 无法使用中文输入法

简单无副作用的办法： 命令行使用`LC_CTYPE=zh_CN.UTF-8 emacs`启动即可。设置别名`alias emacs="LC_CTYPE=zh_CN.UTF-8 emacs"`

点击图标启动emacs，则需要替换emacs的启动文件。在/usr/share/applications/下面`emacs.desktop`文件。

启动文件中添加 `Exec=env LC_CTYPE=zh_CN.UTF-8 /usr/bin/emacs25 %F`，其中`env LC_CTYPE=zh_CN.UTF-8 `是新增内容。

其他修改系统配置的办法，非常麻烦，而且不一定生效。

## Ubunut的emacs版本老旧(2019年默认是emacs 25，最新版本是26)

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

## todo

- magit
- elisp
- flycheck
- highlight
- lsp
- org
- prog
- utils
- vcs
- web



## 额外依赖包

[ag](https://github.com/ggreer/the_silver_searcher)

[rg](https://github.com/BurntSushi/ripgrep)

[YaHei-Consolas-Hybrid](https://github.com/yakumioto/YaHei-Consolas-Hybrid-1.12)

## todo

[从doom emacs中学习快速启动](https://emacs-china.org/t/doom-emacs/10354)

[技术人怎么领导一个开源社区？](https://manateelazycat.github.io/opensource/2019/08/03/how-open-source-works.html)

## 参考资料

[Centaur Emacs](https://github.com/seagle0128/.emacs.d)

[Doom Emacs](https://github.com/hlissner/doom-emacs)

[Lisp之根源](http://daiyuwen.freeshell.org/gb/rol/roots_of_lisp.html)


## change log

- 2019//8/24 创建新版本
- 2019//8/24 深夜，完成emacs的字体，evil，和输入法配置
- 2019//8/25 下午，新增emacs插件，待研究日常使用方式，不合适则删除
- 2019//8/25 下午，更新readme，记录日后要细究的内容。一步登天太难，虽然我vim和emacs都可以玩
- 2019//8/31 下午，更新evil配置，补全搜索文档
