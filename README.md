# Extremal Volume Ellipsoids - Matlab

This repository include the function maxve that solves a semi-definite programming optimization problem in order to compute the ellipsoid of maximum volume inscribed within a given polytopic set. The full mathematical derivation can be found within the book [Convex Optimization](https://web.stanford.edu/~boyd/cvxbook/bv_cvxbook.pdf), the function has been coded in Matlab using the toolboxes [Yalmip](https://yalmip.github.io) and [MPT](https://www.mpt3.org) respectively for the optimization problem and to generate the plots in 2D and 3D. The optimization relies on the solver [SeDuMi](http://sedumi.ie.lehigh.edu). Note that installing [MPT](https://www.mpt3.org) will prompt for the installation of [Yalmip](https://yalmip.github.io) and [SeDuMi](http://sedumi.ie.lehigh.edu).

## Maximum volume ellipsoid in a polytope

The polytope is defined using one of the two following ways:

![equation](<a href="https://www.codecogs.com/eqnedit.php?latex=\mathcal{P}&space;=&space;\left\{&space;x&space;|&space;Ax&space;\leq&space;b,&space;A_{eq}x&space;=&space;b_{eq}&space;\right\}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\mathcal{P}&space;=&space;\left\{&space;x&space;|&space;Ax&space;\leq&space;b,&space;A_{eq}x&space;=&space;b_{eq}&space;\right\}" title="\mathcal{P} = \left\{ x | Ax \leq b, A_{eq}x = b_{eq} \right\}" /></a>)

![equation](<a href="https://www.codecogs.com/eqnedit.php?latex=\mathcal{P}&space;=&space;\left\{&space;x&space;|&space;Ax&space;\leq&space;b,&space;A_{eq}x&space;=&space;b_{eq}&space;\right\}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\mathcal{P}&space;=&space;\left\{&space;x&space;|&space;Ax&space;\leq&space;b,&space;A_{eq}x&space;=&space;b_{eq}&space;\right\}" title="\mathcal{P} = \left\{ x | Ax \leq b, A_{eq}x = b_{eq} \right\}" /></a>)

