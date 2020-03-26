# Extremal Volume Ellipsoids - Matlab

This repository includes the functions `maxve` and `minve` that solve semi-definite programming optimization problems respectively to compute the ellipsoid of maximum volume inscribed within a polytopic set and the ellipsoid of minimum volume covering a polytopic set. The full mathematical derivation can be found within the book [Convex Optimization](https://web.stanford.edu/~boyd/cvxbook/bv_cvxbook.pdf), the functions have been coded in Matlab using the toolboxes [Yalmip](https://yalmip.github.io) and [MPT](https://www.mpt3.org) respectively for the optimization problem and to generate the plots in 2D and 3D. The optimization relies on the solver [SeDuMi](http://sedumi.ie.lehigh.edu). Note that installing [MPT](https://www.mpt3.org) toolbox will prompt for the installation of [Yalmip](https://yalmip.github.io) and [SeDuMi](http://sedumi.ie.lehigh.edu).

## Maximum volume inscribed ellipsoid

The polytope in dimension <a href="https://www.codecogs.com/eqnedit.php?latex=n" target="_blank"><img src="https://latex.codecogs.com/svg.latex?n" title="n" /></a> is defined using a set of linear inequalities in the following way,

<a href="https://www.codecogs.com/eqnedit.php?latex=\large&space;\mathcal{P}&space;=&space;\left\{&space;x&space;|&space;Ax&space;\leq&space;b&space;\right\}" target="_blank"><img src="https://latex.codecogs.com/svg.latex?\large&space;\mathcal{P}&space;=&space;\left\{&space;x&space;|&space;Ax&space;\leq&space;b&space;\right\}" title="\large \mathcal{P} = \left\{ x \in \mathbb{R}^{n} | Ax \leq b \right\}," /></a>

where <a href="https://www.codecogs.com/eqnedit.php?latex=A&space;\in&space;\mathbb{R}^{m&space;\times&space;n}" target="_blank"><img src="https://latex.codecogs.com/svg.latex?A&space;\in&space;\mathbb{R}^{m&space;\times&space;n}" title="A \in \mathbb{R}^{m \times n}" /></a> and <a href="https://www.codecogs.com/eqnedit.php?latex=b&space;\in&space;\mathbb{R}^{m}" target="_blank"><img src="https://latex.codecogs.com/svg.latex?b&space;\in&space;\mathbb{R}^{m}" title="b \in \mathbb{R}^{m}" /></a>. The inscribed ellipsoid <a href="https://www.codecogs.com/eqnedit.php?latex=\mathcal{E}" target="_blank"><img src="https://latex.codecogs.com/svg.latex?\mathcal{E}" title="\mathcal{E}" /></a> is parametrized as follows,

<a href="https://www.codecogs.com/eqnedit.php?latex=\large&space;\mathcal{E}&space;=&space;\left\{&space;Bu&space;&plus;&space;d&space;|&space;\left\lVert&space;u&space;\right\rVert_{2}&space;\leq&space;1&space;\right\}" target="_blank"><img src="https://latex.codecogs.com/svg.latex?\large&space;\mathcal{E}&space;=&space;\left\{&space;Bu&space;&plus;&space;d&space;|&space;\left\lVert&space;u&space;\right\rVert_{2}&space;\leq&space;1&space;\right\}" title="\large \mathcal{E} = \left\{ Bu + d | \left\lVert u \right\rVert_{2} \leq 1 \right\}," /></a>

where <a href="https://www.codecogs.com/eqnedit.php?latex=B" target="_blank"><img src="https://latex.codecogs.com/svg.latex?B" title="B" /></a> is a positive definite matrix. The optimization problem that maximizes the inscribed ellipsoid volume is formulated such that,

<a href="https://www.codecogs.com/eqnedit.php?latex=\large&space;\begin{align}&space;\underset{B,d}{\operatorname{minimize}}&space;\quad&space;&&space;\operatorname{log}\operatorname{det&space;\:&space;B^{-1}}&space;\nonumber&space;\\&space;\text{subject&space;to}&space;\quad&space;&&space;\forall&space;i&space;\in&space;\left\{1,&space;\ldots,&space;m\right\},&space;&&space;\nonumber&space;\\&space;&&space;\left\lVert&space;Ba_{i}&space;\right\rVert_{2}&plus;&space;a_{i}^{T}d&space;\leq&space;b_{i}&space;&&space;\nonumber&space;\end{align}" target="_blank"><img src="https://latex.codecogs.com/svg.latex?\large&space;\begin{align}&space;\underset{B,d}{\operatorname{minimize}}&space;\quad&space;&&space;\operatorname{log}\operatorname{det&space;\:&space;B^{-1}}&space;\nonumber&space;\\&space;\text{subject&space;to}&space;\quad&space;&&space;\forall&space;i&space;\in&space;\left\{1,&space;\ldots,&space;m\right\},&space;&&space;\nonumber&space;\\&space;&&space;\left\lVert&space;Ba_{i}&space;\right\rVert_{2}&plus;&space;a_{i}^{T}d&space;\leq&space;b_{i}&space;&&space;\nonumber&space;\end{align}" title="\large \begin{align} \underset{B,d}{\operatorname{minimize}} \quad & \operatorname{log}\operatorname{det \: B^{-1}} \nonumber \\ \text{subject to} \quad & \forall i \in \left\{1, \ldots, m\right\}, & \nonumber \\ & \left\lVert Ba_{i} \right\rVert_{2}+ a_{i}^{T}d \leq b_{i} & \nonumber \end{align}" /></a>

<img src="./Images/MaxVE.png" height="50%" width="50%">

## Minimum volume covering ellipsoid

The polytopic set in dimension <a href="https://www.codecogs.com/eqnedit.php?latex=n" target="_blank"><img src="https://latex.codecogs.com/svg.latex?n" title="n" /></a> is defined based on a set of <a href="https://www.codecogs.com/eqnedit.php?latex=m" target="_blank"><img src="https://latex.codecogs.com/svg.latex?m" title="m" /></a> vertices. The ellipsoid covering the polytopic set covers the convex hull defined as follows

<a href="https://www.codecogs.com/eqnedit.php?latex=\large&space;\mathcal{P}&space;=&space;\operatorname{conv}\left\{x_{1},&space;\ldots,&space;x_{m}\right\}" target="_blank"><img src="https://latex.codecogs.com/svg.latex?\large&space;\mathcal{P}&space;=&space;\operatorname{conv}\left\{x_{1},&space;\ldots,&space;x_{m}\right\}" title="\large \mathcal{P} = \operatorname{conv}\left\{x_{1}, \ldots, x_{m}\right\}" /></a>.

The covering ellipsoid <a href="https://www.codecogs.com/eqnedit.php?latex=\mathcal{E}" target="_blank"><img src="https://latex.codecogs.com/svg.latex?\mathcal{E}" title="\mathcal{E}" /></a> is parametrized as follows,

<a href="https://www.codecogs.com/eqnedit.php?latex=\large&space;\mathcal{E}&space;=&space;\left\{&space;x&space;|&space;(x-x_{e})^{T}&space;X^{-1}&space;(x-x_{e})&space;\leq&space;1&space;\right\}" target="_blank"><img src="https://latex.codecogs.com/svg.latex?\large&space;\mathcal{E}&space;=&space;\left\{&space;x&space;|&space;(x-x_{e})^{T}&space;X^{-1}&space;(x-x_{e})&space;\leq&space;1&space;\right\}" title="\large \mathcal{E} = \left\{ x | (x-x_{e})^{T} X^{-1} (x-x_{e}) \leq 1 \right\}" /></a>

where <a href="https://www.codecogs.com/eqnedit.php?latex=X" target="_blank"><img src="https://latex.codecogs.com/svg.latex?X" title="X" /></a> is a positive definite matrix defining the ellipsoid semi-axes and <a href="https://www.codecogs.com/eqnedit.php?latex=x_{e}" target="_blank"><img src="https://latex.codecogs.com/svg.latex?x_{e}" title="x_{e}" /></a> defines the ellipsoid center. The optimization problem that minimizes the volume of the covering ellipsoid is formulated such that,

<a href="https://www.codecogs.com/eqnedit.php?latex=\large&space;\begin{align}&space;\underset{X,x_{e}}{\operatorname{minimize}}&space;\quad&space;&&space;\operatorname{trace}(X)&space;\nonumber&space;\\&space;\text{subject&space;to}&space;\quad&space;&&space;\forall&space;i&space;\in&space;\left\{1,&space;\ldots,&space;m\right\},&space;&&space;\nonumber&space;\\&space;&&space;\begin{bmatrix}&space;1&space;&&space;(x_{i}&space;-&space;x_{e})^{T}&space;\\&space;x_{i}&space;-&space;x_{e}&space;&&space;X&space;\end{bmatrix}&space;\succeq&space;0&space;&&space;\nonumber&space;\end{align}" target="_blank"><img src="https://latex.codecogs.com/svg.latex?\large&space;\begin{align}&space;\underset{X,x_{e}}{\operatorname{minimize}}&space;\quad&space;&&space;\operatorname{trace}(X)&space;\nonumber&space;\\&space;\text{subject&space;to}&space;\quad&space;&&space;\forall&space;i&space;\in&space;\left\{1,&space;\ldots,&space;m\right\},&space;&&space;\nonumber&space;\\&space;&&space;\begin{bmatrix}&space;1&space;&&space;(x_{i}&space;-&space;x_{e})^{T}&space;\\&space;x_{i}&space;-&space;x_{e}&space;&&space;X&space;\end{bmatrix}&space;\succeq&space;0&space;&&space;\nonumber&space;\end{align}" title="\large \begin{align} \underset{X,x_{e}}{\operatorname{minimize}} \quad & \operatorname{trace}(X) \nonumber \\ \text{subject to} \quad & \forall i \in \left\{1, \ldots, m\right\}, & \nonumber \\ & \begin{bmatrix} 1 & (x_{i} - x_{e})^{T} \\ x_{i} - x_{e} & X \end{bmatrix} \succeq 0 & \nonumber \end{align}" /></a>

<img src="./Images/MinVE.png" height="50%" width="50%">
