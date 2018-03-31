---
title: Ubuntu16.04下一些软件的安装
date: 2017-10-09 20:00:00
tags: Ubuntu
categories: CS
---

最近需要用Linux系统来完成一些工作，于是又装起了熟悉的Ubuntu。果然又是熟悉的坑，又得再踩一遍，还是在这mark一下吧，反复google也是很累的。

<!-- more -->

## First Of All

1. 更改root密码

    ```shell
    $ sudo passwd root
    ```

2. 进入root用户(以下命令便可以不用输入sudo啦)

    ```shell
    $ su root
    ```

3. 更新软件源和库

    ```shell
    sudo apt-get update
    ```

    ```shell
    sudo apt-get upgrade
    ```

## ~~安装ss客户端，设置代理~~

1. 安装python包管理工具pip

    ```shell
    apt-get install python-pip
    ```

2. 更新pip

    ```shell
    pip install --upgrade pip
    ```

3. 安装~~Shadowsocks~~

    ```shell
    pip install shadowsocks
    ```

4. 在`/home/"YourUserName"/shadowsocks/`下建立ss配置文件

    ```shell
    gedit /home/"YourUserName"/shadowsocks/shadowsocks.json
    ```

5. 写入配置

    ```
    {
        "server":"your_server_ip",
        "server_port":"your_server_ss_port",
        "local_address": "127.0.0.1",
        "local_port":1080,
        "password":"your_server_ss_pw",
        "timeout":300,
        "method":"aes-256-cfb"
    }
    ```

6. 安装genpac生成本地pac文件

    ```shell
    pip install genpac
    ```

7. 在`/home/"YourUserName"/shadowsocks/`下生成pac文件

    ```bash
    genpac -p "SOCKS5 127.0.0.1:1080" --gfwlist-proxy="SOCKS5 127.0.0.1:1080" --output="autoproxy.pac" --gfwlist-url="https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt"
    ```

8. ~~配置系统代理模式~~

    设置->网络->网络代理->{方法：`自动` 配置URL：`file:///home/"YourUserName"/shadowsocks/autoproxy.pac`}

9. 将ss加入开机启动项

    ```shell
    vi /etc/rc.local
    ```

    在代码行`exit 0`之前添加：

    ```
    sslocal -c /home/"YourUserName"/shadowsocks/shadowsocks.json --user nobody -d start
    ```

## 安装哆点

1. 校园内网下载哆点

2. 安装哆点依赖包

    ```bash
    apt-get install lib32z1 lib32ncurses5 libbz2-1.0:i386 lib32stdc++6
    apt-get install libsm6
    apt-get install libsm6.
    apt-get install libsm6:i386
    apt-get install libxi6:i386
    apt-get install libxrender1:i386
    apt-get install libxrandr2:i386
    apt-get install libxcursor1:i386
    apt-get install libxinerama1:i386
    apt-get install libfreetype6:i386
    apt-get install libfontconfig1:i386
    apt-get install libstdc++6:i386
    ```
3. 进入到Drcom根目录下，运行`privillege.sh`脚本

    ```bash
    ./privillege.sh
    ```

4. 运行DrClient

    ```bash
    ./DrClientLinux
    ```

5. 终于好了，等待吧= =

## 关闭客人会话

1. 新建配置文件

    ```shell
    sudo vi /etc/lightdm/lightdm.conf.d 50-no-guest.conf
    ```

2. 文件内写入

    ```
    allow-guest=false
    ```

3. 终端输入

    ```shell
    sudo sh -c 'printf "[SeatDefaults]\nallow-guest=false\n" > /etc/lightdm/lightdm.conf.d/50-no-guest.conf'
    ```

---