---
title: 如何用Java画五角星（二）——加入旋转角
date: 2017-10-09 19:37:50
tags: Java
categories: CS
---
[来源：Java中如何画五角星（二）倾斜五角星](http://www.notelee.com/java%E4%B8%AD%E5%A6%82%E4%BD%95%E7%94%BB%E4%BA%94%E8%A7%92%E6%98%9F%EF%BC%88%E4%BA%8C%EF%BC%89%E5%80%BE%E6%96%9C%E4%BA%94%E8%A7%92%E6%98%9F.html)

上回说到，第二个要求就是要画一个歪的五角星。我们当然可以直接给定一个歪五角星的顶点参数，可是如果又要画一个更歪一点的五角星呢？那也很好办，无非是再定一个旋转角罢。

<!-- more -->

如图所示：
![](/images/wjx3.jpg)  
其中`α`为旋转角，范围为0-72°，代码如下：
```java
/**
     * create five-pointed star
     * @param x0    coordinate of center point
     * @param y0    coordinate of center point
     * @param r     radius of excircle
     * @param degree    rotation degree of star
     */
private void createFPS(Graphics g, int x0, int y0, int r, int degree) {
    double cr = 72*Math.PI/180;  //center radian
    double rr = Math.abs(degree%72)*Math.PI/180; //rotation radian
    int x[]={(int)(x0+Math.sin(rr)*r),
            (int)(x0-r*Math.sin(cr-rr)),
            (int)(x0+r*Math.cos(rr-cr/4)),
            (int)(x0-r*Math.sin(cr/2+rr)),
            (int)(x0+r*Math.sin(cr/2-rr)),
    };
    int y[]={(int)(y0-r*Math.cos(rr)),
            (int)(y0-r*Math.cos(cr-rr)),
            (int)(y0+r*Math.sin(rr-cr/4)),
            (int)(y0+r*Math.cos(cr/2+rr)),
            (int)(y0+r*Math.cos(cr/2-rr)),
    };
    int bx=(int)(x0+r*Math.sin(cr/2+rr)*Math.cos(cr)/Math.cos(cr/2));
    int by=(int)(y0-r*Math.cos(cr/2+rr)*Math.cos(cr)/Math.cos(cr/2));

    Polygon a = new Polygon();
    Polygon b = new Polygon();

    a.addPoint(x[0], y[0]);
    a.addPoint(bx, by);
    a.addPoint(x[2], y[2]);
    a.addPoint(x[3], y[3]);

    b.addPoint(x[1], y[1]);
    b.addPoint(x[4], y[4]);
    b.addPoint(bx, by);

    g.fillPolygon(a);
    g.fillPolygon(b);
}
```
效果如下：
![](/images/wjx4.png)

---