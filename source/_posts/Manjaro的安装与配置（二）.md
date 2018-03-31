---
title: Manjaro的安装与配置（二）
categories: CS
date: 2018-03-30 18:13:58
tags:
  - Linux
  - Manjaro
---

# 概述

[上篇博文](http://pengzou.me/2018/03/30/Manjaro%E7%9A%84%E5%AE%89%E8%A3%85%E4%B8%8E%E9%85%8D%E7%BD%AE%EF%BC%88%E4%B8%80%EF%BC%89/)分享了Manjaro的安装，才思泉涌（其实就是想做篇笔记），在此再分享一些我的Manjaro配置，以及遇到的一些坑和辛苦试验出来的解决方案。

<!-- more -->

# 配置

## 设置国内软件源

1. 设置官方镜像源

    ```shell
    $ sudo pacman-mirrors -i -c China -m rank
    ```

    弹出的窗口如下图，直接全选。

    {% asset_img Manjaro-config-0.png [Manjaro-config-0] %}

    更新源

    ```shell
    $ sudo pacman -Syy
    ```


2. 更新archlinux签名

    ```shell
    $ sudo pacman -S archlinux-keyring
    ```

3. 设置archlinux源

    修改`/etc/pacman.conf`，末尾添加：

    ```
    [archlinuxcn]
    SigLevel = Optional TrustedOnly
    Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch
    ```

4. 同步并安装`yaourt`

    ```shell
    $ sudo pacman -Syu yaourt
    ```

5. 设置AUR源

    修改` /etc/yaourtrc`，去掉`# AURURL`的注释，修改为：

    ```
    AURURL=”https://aur.tuna.tsinghua.edu.cn”
    ```

## 安装搜狗输入法

1. 安装`Fcitx`

    ```shell
    $ sudo pacman -S fcitx-im
    ```

    直接回车，默认安装

2. 安装`Fcitx`配置界面

    ```shell
    $ sudo pacman -S fcitx-configtool
    ```

3. 安装搜狗

    ```shell
    $ sudo pacman -S fcitx-sogoupinyin
    ```

4. 创建`~/.xprofile` 文件，添加以下语句，否则只能在一部分窗口下输入

    ```
    export GTK_IM_MODULE=fcitx
    export QT_IM_MODULE=fcitx
    export XMODIFIERS="@im=fcitx
    ```

5. 注销再登录， 就可以使用搜狗输入法了。

## 安装Chrome

```shell
$ sudo pacman -S google-chrome
```

## 安装Shadowsocks

```shell
$ sudo pacman -S shadowsocks-qt5
```

## 安装SwitchyOmega插件

1. [下载](https://github.com/FelisCatus/SwitchyOmega/releases/download/v2.5.10/SwitchyOmega_Chromium.crx)SwitchyOmega

2. 打开Chrome，在地址栏输入`chrome://extensions/`

3. 将下载好的.crx文件拖入到Chrome中，进行安装

4. auto switch模式设置如下图：

    {% asset_img Manjaro-config-1.png [Manjaro-config-1] %}

    规则列表网址为：

    ```
    https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt
    ```

5. 新建情景模式或编辑原有`proxy`情景模式，如下图：

    {% asset_img Manjaro-config-2.png [Manjaro-config-2] %}

    注：端口是根据`Shadowsocks`本地端口而定，一般默认是`1080`

6. 打开`Shadowsocks`，连接好服务器；插件状态设置为`auto switch`，就可以享受科学上网了。

## 安装Tim

有两种方式，推荐第二种，省去了安装确认的流程。

1. 命令行安装

    ```shell
    $ yaourt deepin.com.qq.office
    ```

    结果如下图，输入`1`后回车确认

    {% asset_img Manjaro-config-3.png [Manjaro-config-3] %}

    而后需要不断进行`n`和`y`的交替输入确认，如下图：

    {% asset_img Manjaro-config-4.png [Manjaro-config-4] %}

    大概有接近10轮的确认，就安装完成了。这种方式比较麻烦，因此推荐第二种。

2. 软件包管理器安装

    在开始界面进入软件包管理器，如下图：

    {% asset_img Manjaro-config-5.png [Manjaro-config-5] %}

    搜索`deepin.com.qq.office`，直接安装。

## 安装WPS

```shell
$ yaourt wps-office
```

结果如下图，两个都需要安装，前一个为WPS需要的一些特殊字体。

{% asset_img Manjaro-config-6.png [Manjaro-config-6] %}

注：此处有个坑，WPS安装的字体会对Tim字体造成影响，稍后再分享我的解决方案。

## 安装深度截图

类似于Win下的QQ截图，超级好用，在此安利一下。

```
$ yaourt deepin-screenshot
```

可以配置快捷键为`Ctrl+Alt+A`，截图就非常方便了，配置方式如下图：

{% asset_img Manjaro-config-7.png [Manjaro-config-7] %}

添加命令`deepin-screenshot`，快捷键可根据喜好设定，最好不好与其他快捷键相冲突。如果看不到按钮，就将鼠标放在右边红框上面，滚轮下拉。这里非常想吐槽一下，窗口默认这么小，而且还需要把鼠标放在滑动条上才能下滑，这一上手谁能注意到啊！

# Some tips

## 更改时间设置

安装Windows和Linux双系统一直会碰到一个问题就是两个系统采用的标准时不一样，然后系统反复将时间写入CMOS造成8小时的时间差。Manjaro解决方式如下：

```
sudo timedatectl set-local-rtc 1
```

## 关闭鼠标加速

创建`/etc/X11/xorg.conf.d/50-mouse-acceleration.conf`文件，添加：

```
Section "InputClass"
    Identifier "My Mouse"
    MatchIsPointer "yes"
    Option "AccelerationProfile" "-1"
    Option "AccelerationScheme" "none"
EndSection
```

## Xfce-teminal-dropdown 快捷键唤出失败

在设置里调大字体后，我就发现终端下拉界面通过快捷键关闭后无法再通过快捷键唤出，界面快速闪烁几次后就消失了，而且再调小字体到原来大小也无法恢复。个人猜想是Xfce的小bug，试验出了以下两种解决方式：

1. 更改下拉终端关闭习惯：

    平常都是用Guake，按`F12`打开，再按`F12`关闭。那既然不能通过快捷键关闭，就点击其他窗口，下拉终端失焦后自动收起（默认设置为失焦后自动收起）。

2. 按下`当窗口失去焦点后保持其打开`按钮：

    {% asset_img Manjaro-config-8.png [Manjaro-config-8] %}

    注：首选项里也有这项设置，但是在我的系统上无法生效，只能通过按下这一按钮实现功能。

## 安装WPS后Tim字体受到影响，变为隶书、宋体或乱码

在安装WPS后Tim字体变为隶书，网上也没搜到相关问题，突然灵机一动想到只有WPS里面才有隶书字体，在找到了WPS字体文件夹所在后，经过反复试验，发现其中4种字体会对Tim产生影响。因此可以转移这4种字体，等需要用到的时候再复制回来。

WPS字体文件夹为`/usr/share/fonts/wps-office`

4个字体文件为`FZLSK.TTF`、`FZSSK.TTF`、`FZSongS(SIP)_2010603.TTF`、`FZXBSK.TTF`

具体转移到哪就看自己喜好了。

# 总结

一天写两篇博文真的是非常累，也非常花时间，不过看着两篇博文成型，也是非常有成就感的。Manjaro在国内的用户还不多，希望我能抛砖引玉，引出更多更好的博文，同时也希望能将Manjaro这么优秀的发行版安利出去，为大家带来更好的Linux体验吧。

**最后，希望大家能多多转载，当然，如果能注明来源那是最好不过了，不胜感激。**

---
