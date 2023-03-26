# *形态测量学入门*

​	形态测量学是一门定量化分析样本形状的学科，根据研究数据的不同一般将形态学分为两大类：传统形态测量 (traditional morphometrics）和几何形态测量学（geometric morphometrics, GM）[10]。其中传统形态测量学主要分析样本的形状参数，例如角度，直径，长度和宽度[11-12]。几何形态测量学则是研究曲线上的点元素或拟合曲线对得到的参数进行综合分析[13-14]。上文对形态测量学进行了简单的介绍，下面重点介绍形态测量学的研究背景。虽然几何形态测量学是研究形状差异的主要方法，但其在具体应用中还存在着不足。例如返回的参数往往维度较大，给后续分析带来了困难[15]，此外几何形态学中的参数很难直接表征样本轮廓的物理特征，基于傅里叶函数的形态测量学方法对于空间开放曲线尚不能进行拟合与分析[16]，传统的椭圆傅里叶分析在具备对称和/或近似圆形性质的轮廓时会出现缺陷[17]。因此运用新的基于几何形态测量学的方法来减少分析的参数，反应样本轮廓的几何特征，填补基于轮廓的方法在空间三维曲线的应以及改进传统方法的缺陷是必要的。当前几何形态测量学的主要研究方法有：基于标志点的几何形态测量学方法（landmarkbased GM）和基于轮廓的几何形态测量学方法（outline-based GM）[18]。基于标志点的形态测量学方法在物体轮廓上标定解剖学和生物学标志点（anatomical or/and biological loci）通过多元统计分析（multivariate statistical analysis）得到群体之间的形状差异[19]。基于轮廓的形态测量学方法则是对物体轮廓进行拟合，通过分析拟合函数的性质或拟合过程中产生的参数反映群体间的形状差异[20]。在基于轮廓的形态测量学方法中，基于傅里叶变换的相关手段应用最为广泛，信号处理，图像处理等方向的蓬勃发展也推动力基于轮廓的几何测量学方法的进展[16]。目前常用的基于轮廓的几何测量学方法主要有椭圆傅里叶分析（elliptic Fourier analysis, EFA）[21-22]。形态学的主要分析软件有：MorphoJ (Java)[23]， Morpho (R )[24]， Momocs (R)[17]，PAST[25]， TPS Series (http://life.bio.sunysb.edu/ee/rohlf/software.html)[14]等



## 数学基础

### 基本的矩阵知识



### 微分几何



### 机器学习

### 统计学分析





## 基于轮廓的形态测量学方法

首先引入傅里叶级数，其基本形式为：
$$
\begin{equation}
f(x) = \frac{a_0}{2}+\sum_{1}^{\infty}{a_n\cos(nx)+b_n\sin(nx)},\space x \in (-\pi,\pi). \tag{1.1}
\end{equation}
$$



傅里叶级数可以实现对满足一定条件函数的重构/逼近。接下来我们计算正余弦多项式中的系数。

公式1.1中的常数项为:
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

标志点是由二维或三维的笛卡尔坐标描述的解剖学或生物学的位点（loci）。Bookstein 将标志点分为三种类型：第一种标志点是不同的组织或者结构之间的交点，例如蚊虫翅膀上不同脉络的交点；第二种是轮廓上曲率最大的点；第三种则是缺乏明确定义的坐标点，例如叶片的尖端顶点[3]。图 1-2 中展示了标志点的两种最常见的基本形式
