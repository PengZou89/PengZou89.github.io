---
title: 如何用Java画五角星
date: 2017-10-09 19:24:30
tags: Java
categories: CS
---

>来源：[java中如何画五角星](http://www.notelee.com/java%E4%B8%AD%E5%A6%82%E4%BD%95%E7%94%BB%E4%BA%94%E8%A7%92%E6%98%9F%EF%BC%88%E4%B8%80%EF%BC%89.html)

前些天有人让我帮忙几道作业题，其中一道非常有意思——画一个五角星。熟悉Java的同学，可能会立马想到，先确定五角星其中一个定点，然后算出五个外顶点和内顶点，再顺序`fillPolygon`就行了，但有没有更好的思路呢？二话不错先谷歌，在此分享[非苔笔记](http://www.notelee.com/java%E4%B8%AD%E5%A6%82%E4%BD%95%E7%94%BB%E4%BA%94%E8%A7%92%E6%98%9F%EF%BC%88%E4%B8%80%EF%BC%89.html)的思路。

<!-- more -->

设五角星定点为中心点(x0, y0)，外接圆半径为r，如下图:  
![](/images/wjx1.png)

将五角星分为两个多边形，红色线段构成的三角形`A2_B0_A5`，绿色线段构成的四边形`A1_A4_A3_B0`，分开画即可。代码如下：
```java
public void fivePointedStar(Graphics g,int x0,int y0,int r, String f)
{
    double cr = 72*Math.PI/180; //center radian
    int x1 = x0,
        x2 = (int)(x0-Math.sin(ch)*r),
        x3 = (int)(x0+Math.sin(ch)*r),
        x4 = (int)(x0-Math.sin(ch/2)*r),
        x5 = (int)(x0+Math.sin(ch/2)*r);
    int y1 = y0-r,
        y2 = (int)(y0-Math.cos(ch)*r),
        y3 = y2,
        y4 = (int)(y0+Math.cos(ch/2)*r),
        y5 = y4;
    int bx = (int)(x0+Math.cos(ch)*Math.tan(ch/2)*r);
    int by = y2;

    Polygon a = new Polygon();
    Polygon b = new Polygon();
    a.addPoint(x2,y2);
    a.addPoint(x5,y5);
    a.addPoint(bx,by);
    b.addPoint(x1,y1);
    b.addPoint(bx,by);
    b.addPoint(x3,y3);
    b.addPoint(x4,y4); 
 
    if(f.equals("fill")) {
        g.drawPolygon(a);
        g.drawPolygon(b);
    }
    if(f.equals("draw")) {
        g.fillPolygon(a);
        g.fillPolygon(b);
    } 
}
```

效果图如下：  
![这里是id](/images/wjx2.png)

等我这做完了第一个题目，第二个要求又来了，要画一个歪了的五角星，又怎么画呢？  
[且听下回分解](http://pengzou.me/2017/10/09/%E5%A6%82%E4%BD%95%E7%94%A8Java%E7%94%BB%E4%BA%94%E8%A7%92%E6%98%9F%EF%BC%88%E4%BA%8C%EF%BC%89%E2%80%94%E2%80%94%E5%8A%A0%E5%85%A5%E6%97%8B%E8%BD%AC%E8%A7%92/)

---