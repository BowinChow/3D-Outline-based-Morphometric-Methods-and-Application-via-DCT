# *An Introduction of Morphometrics*

## Mathematical Fundamental

### Basic knowledge of ***MATRIX***



### Geometry Differential 



### Machine Learning /Deep Learning



### Statistical Analysis





## Outline-based geometric morphometrics (GMM)

### Fourier Series

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

## Landmark-based  geometric morphometrics (GMM)

