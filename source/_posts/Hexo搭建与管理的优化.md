---
title: Hexo搭建与管理的优化
date: 2018-03-18 10:50
tags: 
  - Hexo
  - Blog
  - Github
categories: CS
---

概述
---
按一般方式，即hexo-deployer-git，部署到Github上的文件是source文件夹中.md博文转化的.html静态网页。作品是备份了，但是如果你换了台电脑，或者本地Hexo环境丢失后，就需要再搭建Hexo环境了。因此，以下通过一种简洁的方式实现了博文与本地环境的双备份。

<!-- more -->

搭建流程
---
核心思路是：建立两个分支，一个master分支用来存放.md博文，另一个hexo分支用来存放Hexo环境文件。
1. Github创建Github Pages仓库：Yourusername.github.io
2. 本地建好博客文件夹，并cd到此文件夹下，如：
```bash
$ mkdir Blog && cd Blog
```    
3. 克隆远程仓库，备份好.git文件夹后，清空当前目录。
```bash
$ git clone git@github.com:Yourusername/Yourusername.github.io.git
```
4. 在本地仓库建站：
```
cd Yourusername.github.io
npm install hexo-cli -g
npm install hexo-deployer-git
hexo init Yourusername.github.io.git
```
    注：第3步的清空目录为此步服务，`hexo init <folder>` folder必须为空文件夹。   
5. 修改`Yourusername.github.io`文件夹下的`_config.yml`。
```
deploy:
  type: git
  repo: https://github.com/Yourusername/yourusername.github.io.git
  branch: master
```
6. 将第3步备份好的.git文件夹复制到`Yourusername.github.io`文件夹下，覆盖其原有.git文件夹。
7. 将hexo环境文件推送到远程库hexo分支：
```
$ git add .
$ git commit -m "Hexo"
$ git push origin hexo
```
8. 生成网站并将博文等文件推送到远程库master分支：
```
$ hexo g -d
```
9. 大功告成，开始欣赏你的博客吧。

管理流程
---
- ### 日常修改流程
在本地对博客进行修改（添加博文、修改样式等）后，可通过以下方式进行推送：
1. 将hexo环境文件推送到远程库hexo分支：
```
$ git add .
$ git commit -m "Hexo"
$ git push origin hexo
```
2. 生成网站并将博文等文件推送到远程库master分支：
```
$ hexo g -d
```

- ### 本地环境丢失
本地环境丢失或想在其他电脑上写博客，可通过以下方式部署环境：
1. 本地建好博客文件夹，并cd到此文件夹下，如：
```
$ mkdir Blog && cd Blog
```
2. 克隆远程库（默认分支为hexo）：
```
$ git clone git@github.com:Yourusername/Yourusername.github.io.git
```
3. 建站：
```
cd Yourusername.github.io
npm install hexo-cli -g
npm install hexo-deployer-git
```

结尾
---
**Think more, code less.**

---

参考来源：[GitHub Pages + Hexo搭建博客](http://crazymilk.github.io/2015/12/28/GitHub-Pages-Hexo%E6%90%AD%E5%BB%BA%E5%8D%9A%E5%AE%A2/#more)



