---
title: Manjaro-Grub引导界面美化指南
categories: CS
date: 2018-03-31 16:43:21
tags:
    - Linux
    - Manjaro
    - Grub
---

## 概述

看腻了默认的Grub引导界面？那就来折腾一下，给它换件衣裳。

<!-- more -->

## 美化指南

我们可以通过更改Grub配置文件`/etc/default/grub`，来定制自己的引导界面。

### 背景图片修改

1. 准备好背景图片（最好选择适合显示器分辨率的图），移入`/usr/share/grub`文件夹，此文件夹存放grub主题等资源文件

    ```shell
    $ sudo mv YourImg.* /usr/share/grub
    ```

2. 更改Grub配置文件
    
    ```shell
    $ sudo vi /etc/default/grub
    ```

    结果如下图：

    {% asset_img Manjaro-grub-0.png [Manjaro-grub-0] %}

    更改其中`GRUB_BACKGROUND`行

    ```
    GRUB_BACKGROUND="/usr/share/grub/YourImg.*"
    ```

    更新Grub配置
    
    ```
    $ sudo update-grub
    ```

    重启即可看见效果啦~
    
### 主题修改

1. 准备好主题文件夹，可以在[Grub Themes](https://www.gnome-look.org/browse/cat/109/ord/latest/)挑选下载

2. 将主题文件夹移至`/boot/grub/themes/`下

    ```
    $ sudo mv -r YourTheme /boot/grub/themes
    ```

3. 更改Grub配置文件

    注释掉`GRUB_BACKGROUND`行

    ```
    #GRUB_BACKGROUND="/usr/share/grub/YourImg.*"
    ```

    更改`GRUB_THEME`行

    ```
    GRUB_THEME="/usr/share/grub/themes/YourTheme/theme.txt"
    ```

    更新Grub配置

    ```
    $ sudo update-grub
    ```

    重启即可看见效果啦~

4. 如果对主题字体、排版等一些细节不满意，可以通过编辑主题`theme.txt`文件，进行调整

注：在`Grub Themes`下载的主题压缩包，其中一部分有安装脚本`install.sh`，解压后，进入主题文件夹，执行`sudo ./install.sh`即可配置成功，等效于上述的步骤。

### 主题推荐

- [Blur](https://www.gnome-look.org/p/1220920/)

    {% asset_img Manjaro-grub-1.png [Manjaro-grub-1] %}

- [Vimix](https://www.gnome-look.org/p/1009236/)

    {% asset_img Manjaro-grub-2.jpg [Manjaro-grub-2] %}

- [Stylishdark](https://www.gnome-look.org/p/1009237/)

    {% asset_img Manjaro-grub-3.jpg [Manjaro-grub-3] %}

### Grub-Customizer

其实还有一个更方便的软件`Grub-Customizer`，可以直接修改Grub启动项和外观等配置，而且是GUI程序哦，界面如下图：

{% asset_img Manjaro-grub-4.png [Manjaro-grub-4] %}

可通过以下命令安装：

```
yaourt -S grub-customizer
```

： 这么方便的软件为什么你不早说呢？

： 我也是配完了主题想去掉`Manjaro的高级选项`这个启动项才找到的，至于为什么不早说？ 哈哈哈哈～

---