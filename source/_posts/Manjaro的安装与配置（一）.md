---
title: Manjaro的安装与配置（一）
categories: CS
date: 2018-03-30 10:57:56
tags:
  - Linux
  - Manjaro
---

## 概述

我之前一直在用Ubuntu，可是Ubuntu软件有点少，而且折腾Tim、WeChat等软件太麻烦，于是就心生了换个发行版的想法。知乎上一直有人安利Arch，可是看过Arch的安装与配置教程之后，我就惊叹这个发行版是真的”定制“，可也是真的”折腾“，就萌生了退意——我只是想要个能用的工作环境而已，并不想为配置环境花费大量的精力。于是就看上了Manjaro。

Manjaro基于Arch，但不需要像Arch那样从零开始配置，而且还继承了Arch AUR软件仓和Wiki丰富的优点，可以说是对用户非常友好的发行版了。但也有缺点——国内用户还少，网上教程之类的不那么多。

我折腾了3天，从Xfce换到KDE，最后又换到Xfce，终究还是觉得这个DE简洁省心，动画效果也没有像KDE那么拖沓，最主要的是，KDE上Tim和搜狗拼音经常崩溃，所以最终还是用回了Xfce。长话短说，就在此分享一些Manjaro-Xfce安装与配置的经验。

<!-- more -->

## 安装

### 制作启动盘

1. 下载[Manjaro-Xfce镜像](https://downloads.sourceforge.net/manjarolinux/manjaro-xfce-17.1.7-stable-x86_64.iso)，若速度慢可在其官网换清华源下载

2. 下载[Rufus工具](https://rufus.akeo.ie/downloads/rufus-2.18.exe)，参考下图进行启动盘的制作：

    {% asset_img Manjaro-install-0.png [Manjaro-install-0] %}

    注：我用ISO模式没有安装成功，在安装的后期会弹出一个类似于`Installation failed:Boost.Python-Error`的窗口。

### UEFI模式安装

1. 选择闭源驱动，在`Boot：...`栏上回车，进入安装

    {% asset_img Manjaro-install-1.jpg [Manjaro-install-1] %}

2. Launch installer

    {% asset_img Manjaro-install-2.jpg [Manjaro-install-2] %}

3. `选择存储器`栏选好要装的硬盘，安装方式选择`手动分区`，进入下一步

    {% asset_img Manjaro-install-3.jpg [Manjaro-install-3] %}

4. 创建交换空间`linuxswap`，大小按照官方推荐`当前内存容量+2G`，标记为`swap`

    {% asset_img Manjaro-install-4.jpg [Manjaro-install-4] %}

5. 创建根目录分区`/`，标记为`root`，大小根据硬盘容量自定。我只给Manjaro分配了64G的空间，因此选择32G

    {% asset_img Manjaro-install-5.jpg [Manjaro-install-5] %}

6. 剩余空间给`/home`

    {% asset_img Manjaro-install-6.jpg [Manjaro-install-6] %}

7. 将硬盘原本EFI分区挂载到`/boot/efi`目录下，标记为`boot`、`esp`。** 如果原来有系统，一定要选择`保留`，否则会覆盖原有引导，导致原有系统进不去。**

    {% asset_img Manjaro-install-7.jpg [Manjaro-install-7] %}

8. 确认分区设置，确认好了点击下一步。

    {% asset_img Manjaro-install-8.jpg [Manjaro-install-8] %}

9. 最后便是等待进度条，重启后记得拔掉U盘，然后就开始享受Manjaro吧！

---
