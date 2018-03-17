---
title: Ubuntu16.04下一些软件的安装
date: 2017-10-09 20:00:00
tags: Ubuntu
categories: CS
---

最近需要用Linux系统来完成一些工作，于是又装起了熟悉的Ubuntu。果然又是熟悉的坑，又得再踩一遍，还是在这mark一下吧，反复google也是很累的。

<!-- more -->

## **First Of All**
- 更改root密码  
`sudo passwd root`
- 进入root用户(以下命令便可以不用输入sudo啦)  
`su root`
- 更新软件源和库  
`sudo apt-get update`  
`sudo apt-get upgrade`

## ~~安装ss客户端，设置代理~~
- 安装python包管理工具pip  
`apt-get install python-pip`  
- 更新pip  
`pip install --upgrade pip`  
- 安装~~Shadowsocks~~  
`pip install shadowsocks`
- 在/home/"YourUserName"/shadowsocks/下建立ss配置文件  
`gedit /home/"YourUserName"/shadowsocks/shadowsocks.json`
- 写入配置
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
- 安装genpac生成本地pac文件  
`pip install genpac`
- 在/home/"YourUserName"/shadowsocks/下生成pac文件
```bash
genpac -p "SOCKS5 127.0.0.1:1080" --gfwlist-proxy="SOCKS5 127.0.0.1:1080" --output="autoproxy.pac" --gfwlist-url="https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt"
```
- ~~配置系统代理模式~~  
设置->网络->网络代理->{方法：`自动` 配置URL：`file:///home/"YourUserName"/shadowsocks/autoproxy.pac`}
- 将ss加入开机启动项  
`vi /etc/rc.local`
在代码行`exit 0`之前添加：  
`sslocal -c /home/"YourUserName"/shadowsocks/shadowsocks.json --user nobody -d start`

## 安装哆点
- 校园内网下载哆点
- 安装哆点依赖包
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
- 进入到Drcom根目录下，运行privillege.sh脚本
`./privillege.sh`
- 运行DrClient  
`./DrClientLinux`
- 终于好了，等待吧= =

## 关闭客人会话
- 新建配置文件  
`sudo vi /etc/lightdm/lightdm.conf.d 50-no-guest.conf`
- 文件内写入
`allow-guest=false`
- 终端输入  
`sudo sh -c 'printf "[SeatDefaults]\nallow-guest=false\n" > /etc/lightdm/lightdm.conf.d/50-no-guest.conf'`

---