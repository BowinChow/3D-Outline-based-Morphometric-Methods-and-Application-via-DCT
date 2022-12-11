# *形态测量学入门*

## 数学基础

### 基本的矩阵知识



### 微分几何



### 机器学习

### 统计学分析





## 基于轮廓的形态测量学方法

### 傅里叶级数

$$
\begin{equation}
f(x) = \frac{a_0}{2}+\sum_{1}^{\infty}{a_n\cos(nx)+b_n\sin(nx)},\space x \in (-\pi,\pi). \tag{1.1}
\end{equation}
$$

Then, we calculate the coefficients:

The constant in formula 1.1:
$$
\begin{equation}
a_0 = \frac{1}{2\pi}\int_{-\pi}^{\pi}f(x)dx\space.
\tag{1.2}
\end{equation}
$$
$$a_n$$ is:
$$
\begin{equation}
a_n = \frac{1}{\pi}\int_{-\pi}^{\pi}f(x)\cos(nx)dx\space(n = 1,2,...,\infty).
\tag{1.3}
\end{equation}
$$


$$b_n$$ is:
$$
\begin{equation}
b_n = \frac{1}{\pi}\int_{-\pi}^{\pi}f(x)\sin(nx)dx\space(n = 1,2,...,\infty).
\tag{1.4}
\end{equation}
$$



通过一幅图来观察傅里叶级数是如何对曲线进行近似。图中引入的是$$[0,2\pi]$$ 区间内的矩形波函数：
$$
\begin{equation}
f(x)=\left\{
\begin{aligned}
 1 & &{t \in [0,\pi]}\\
 -1 & &{t \in (\pi,2\pi]}
\end{aligned}
\right.
\tag{1.5}
\end{equation}
$$
![image-20221211135927790](C:\Users\Bowin\AppData\Roaming\Typora\typora-user-images\image-20221211135927790.png)

## 基于标志点的形态测量学方法

