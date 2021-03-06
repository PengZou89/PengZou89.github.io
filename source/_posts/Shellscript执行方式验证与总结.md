---
title: Shell script执行方式验证与总结
categories: CS
date: 2018-03-24 20:24:16
tags:
    - Linux
    - Shell script
---

## 概述

Shell script有三种执行方式，`相对/绝对路径直接执行`、`sh命令执行`、`source命令执行`，那这三种方式各有什么区别呢？在此通过`test.sh`来验证与总结。

<!-- more -->

## 验证

### 新建`test.sh`：

```shell
#! /bin/bash

# 打印"Hello, world!"
echo "Hello, world!"

# 返回111作为测试码
exit 111
```

默认权限为

{% asset_img Shellscript-0.png [Shellscript-0] %}

### 验证`./test.sh`直接执行方式：

```shell
$ ./test.sh
```

执行结果为：

{% asset_img Shellscript-1.png [Shellscript-1] %}

添加`x权限`，再执行：

```shell
$ chmod u+x test.sh
$ ./test.sh
```

执行结果为：

{% asset_img Shellscript-2.png [Shellscript-2] %}

查看命令执行状态:

```shell
echo $?
```

执行结果为：

{% asset_img Shellscript-3.png [Shellscript-3] %}

可以看出返回码为测试码111，因此：

**验证了`./test.sh`执行方式为打开一个subshell读取再执行，需要`x权限`**

### 验证`sh ./test.sh`执行方式：

去除`x权限`，再执行：

```shell
$ chmod u-x test.sh
$ sh ./test.sh
```

执行结果为：

{% asset_img Shellscript-4.png [Shellscript-4] %}

查看命令执行状态：

```shell
echo $?
```

执行结果为：

{% asset_img Shellscript-5.png [Shellscript-5] %}

文件没有`x权限`依然执行成功，同时可以看出返回码为测试码111，因此：

**验证了`sh ./test.sh`执行方式亦为打开一个subshell读取Shell script再执行，但不需要`x权限`**

### 验证`source ./test.sh`执行方式：

注：`source`命令即为`.`命令

```shell
source ./test.sh
```

执行结果为：

```
当前shell窗口终止退出
```

删除`test.sh`中`exit 111`语句，再执行：

执行结果为：

{% asset_img Shellscript-6.png [Shellscript-6] %}

文件没有`x权限`，且需删除`exit`语句才正常输出`Hello, world!`，因此：

**验证了`sh ./test.sh`执行方式为在当前shell上读取执行，不需要`x权限`**

## 总结

| 执行方式          | subshell？ | x权限？  |
| :---:            | :---:      | :---:   |
| ./test.sh        | &radic;    | &radic; |
| sh ./test.sh     | &radic;    | &nbsp;  |
| source ./test.sh | &nbsp;     | &nbsp;  |

---
