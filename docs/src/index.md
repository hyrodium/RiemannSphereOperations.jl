# RiemannSphereOperations

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://hyrodium.github.io/RiemannSphereOperations.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://hyrodium.github.io/RiemannSphereOperations.jl/dev)
[![Build Status](https://github.com/hyrodium/RiemannSphereOperations.jl/workflows/CI/badge.svg)](https://github.com/hyrodium/RiemannSphereOperations.jl/actions?query=workflow%3ACI+branch%3Amain)
[![codecov](https://codecov.io/gh/hyrodium/RiemannSphereOperations.jl/branch/main/graph/badge.svg?token=dJBiR91dCD)](https://codecov.io/gh/hyrodium/RiemannSphereOperations.jl)
[![Aqua QA](https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg)](https://github.com/JuliaTesting/Aqua.jl)

## Maths
This package provides some operations on the Riemann sphere ``\hat{\mathbb{C}} = \mathbb{C} \cup \{\infty\}``.

The following are the calculation rules with the point at infinity ``\infty``.

* ``a + \infty = \infty \quad (a\in\mathbb{C})``
* ``a \cdot \infty = \infty \quad (a\in\mathbb{C}\setminus\{0\})``
* ``\infty \cdot \infty = \infty``
* ``1/0 = \infty``
* ``1/\infty = 0``

Note that the following cannot be defined.

* ``0 / 0``
* ``0 \cdot \infty``
* ``\infty / \infty``
* ``\infty + \infty``
* ``\infty - \infty``

## Package implementation
In this package, a value `z` which satisfies `isinf(z)` and `!isnan(z)` is used to represent the infinity ``\{\infty\}``.
Thus, all of `complex(Inf,2.0), complex(Inf,-Inf), complex(1//0,1//1)` are treated as the same point ``\infty`` in this package.

All of the exported functions from this package has `′` (`\prime<tab>`) suffix which represents a modified version of the function on the Riemann sphere.

```@repl
using RiemannSphereOperations
inv(complex(0,0))  # 1/0 should be ∞
inv′(complex(0,0))  # correct 😎
complex(1) * Complex(Inf,-Inf)  # 1⋅∞ should be ∞
complex(1) *′ Complex(Inf,-Inf)  # correct 😎
Inf + Inf  # ∞+∞ cannot be defined
Inf +′ Inf  # correct 😎
```

This package has more functions such as `isinfty′`, `+′`, `/′` etc.
See [the documentation page](https://hyrodium.github.io/RiemannSphereOperations.jl/dev/) for more information.

## Related information
* [My post on Julia discourse](https://discourse.julialang.org/t/why-inv-complex-0-0-0-0-returns-complex-nan-nan/92694)
    * This explains why I made this package.
* [RiemannComplexNumbers.jl](https://github.com/scheinerman/RiemannComplexNumbers.jl)
    * This package has the same motivation, but its implementation is different.
    * RiemannComplexNumbers.jl defines original type `RC <: Number` which is used for the complex numbers on the Riemann sphere.
* [Original issue on `inv(0+0im)`](https://github.com/JuliaLang/julia/issues/22983)
    * This issue explains why `inv(0+0im)`  should return `NaN + NaN*im`
* [Related issue on `NaN` vs `DomainError`](https://github.com/JuliaLang/julia/issues/5234)
    * This related issue is still open.
