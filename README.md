# Extremal Volume Ellipsoids - Matlab

This repository include the function maxve that solves a semi-definite programming optimization problem in order to compute the ellipsoid of maximum volume inscribed within a given polytopic set. The full mathematical derivation can be found within the book [Convex Optimization](https://web.stanford.edu/~boyd/cvxbook/bv_cvxbook.pdf), the function has been coded in Matlab using the toolboxes [Yalmip](https://yalmip.github.io) and [MPT](https://www.mpt3.org) respectively for the optimization problem and to generate the plots in 2D and 3D. The optimization relies on the solver [SeDuMi](http://sedumi.ie.lehigh.edu). Note that installing [MPT](https://www.mpt3.org) will prompt for the installation of [Yalmip](https://yalmip.github.io) and [SeDuMi](http://sedumi.ie.lehigh.edu).

## Maximum volume ellipsoid in a polytope

The polytope is defined using one of the two following ways:

<a href="https://www.codecogs.com/eqnedit.php?latex=\large&space;\mathcal{P}&space;=&space;\left\{&space;x&space;|&space;Ax&space;\leq&space;b,&space;A_{eq}x&space;=&space;b_{eq}\right\}" target="_blank"><img src="https://latex.codecogs.com/svg.latex?\large&space;\mathcal{P}&space;=&space;\left\{&space;x&space;|&space;Ax&space;\leq&space;b,&space;A_{eq}x&space;=&space;b_{eq}\right\}" title="\large \mathcal{P} = \left\{ x | Ax \leq b, A_{eq}x = b_{eq}\right\}" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=\large&space;\mathcal{P}&space;=&space;\left\{&space;x&space;|&space;x&space;=&space;V'\lambda&plus;R'\gamma,&space;(\lambda,&space;\gamma)&space;\in&space;\mathbb{R}_{&plus;}^{2},&space;1^{T}\lambda&space;=&space;1\}" target="_blank"><img src="https://latex.codecogs.com/svg.latex?\large&space;\mathcal{P}&space;=&space;\left\{&space;x&space;|&space;x&space;=&space;V'\lambda&plus;R'\gamma,&space;(\lambda,&space;\gamma)&space;\in&space;\mathbb{R}_{&plus;}^{2},&space;1^{T}\lambda&space;=&space;1\}" title="\large \mathcal{P} = \left\{ x | x = V'\lambda+R'\gamma, (\lambda, \gamma) \in \mathbb{R}_{+}^{2}, 1^{T}\lambda = 1\}" /></a>


