# emacs使用


# 配置

## 原则

以常用功能为中心，绝不增加无用的配置，宁缺毋滥。

## 搜索

要求：高速，界面显示友好，便于检索。

### 全局搜索

ivy使用

[ag 搜索与替换](https://zhuanlan.zhihu.com/p/22687261)


### 单个文件内搜索


### 以搜索作为大范围光标移动的方式


## 补全

要做到抽象语法树的解析功能，正则补全太低级了。

### 代码补全

### 文件路径补全


## 代码检查

### 拼写检查

### lint的设置

## 常用编辑功能

### 文件操作

`C-x C-f` 打开文件或新建文件

#### dired

`C-x d`打开dried。

[Emacs文件管理神器--dired常用操作说明](http://blog.lujun9972.win/blog/2016/12/10/emacs%E6%96%87%E4%BB%B6%E7%AE%A1%E7%90%86%E7%A5%9E%E5%99%A8--dired%E5%B8%B8%E7%94%A8%E6%93%8D%E4%BD%9C%E8%AF%B4%E6%98%8E/)

### 光标移动


### 代码段

### 格式化

### 翻译

# 问题

## 无法使用中文输入法

简单无副作用的办法： 命令行使用`LC_CTYPE=zh_CN.UTF-8 emacs`启动即可。设置别名`alias emacs="LC_CTYPE=zh_CN.UTF-8 emacs"`

点击图标启动emacs，则需要替换emacs的启动文件。在/usr/share/applications/下面`emacs.desktop`文件。

启动文件中添加 `Exec=env LC_CTYPE=zh_CN.UTF-8 /usr/bin/emacs25 %F`，其中`env LC_CTYPE=zh_CN.UTF-8 `是新增内容。

其他修改系统配置的办法，非常麻烦，而且不一定生效。


# 额外依赖包

[ag](https://github.com/ggreer/the_silver_searcher)

[rg](https://github.com/BurntSushi/ripgrep)

[YaHei-Consolas-Hybrid](https://github.com/yakumioto/YaHei-Consolas-Hybrid-1.12)

## 参考资料

[Lisp之根源](http://daiyuwen.freeshell.org/gb/rol/roots_of_lisp.html)



## change log

- 2019//8/24 创建新版本
- 2019//8/24 深夜，完成emacs的字体，evil，和输入法配置
