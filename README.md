# RiemannSphereOperations

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://hyrodium.github.io/RiemannSphereOperations.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://hyrodium.github.io/RiemannSphereOperations.jl/dev)
[![Build Status](https://github.com/hyrodium/RiemannSphereOperations.jl/workflows/CI/badge.svg)](https://github.com/hyrodium/RiemannSphereOperations.jl/actions?query=workflow%3ACI+branch%3Amain)
[![codecov](https://codecov.io/gh/hyrodium/RiemannSphereOperations.jl/branch/main/graph/badge.svg?token=dJBiR91dCD)](https://codecov.io/gh/hyrodium/RiemannSphereOperations.jl)
[![Aqua QA](https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg)](https://github.com/JuliaTesting/Aqua.jl)

This package provides some operations on the Riemann sphere $\hat{\mathbb{C}} = \mathbb{C} \cup \\{\infty\\}$.

The following are the calculation rules with the point at infinity $\infty$.

* $a + \infty = \infty \quad (a\in\mathbb{C})$
* $a \cdot \infty = \infty \quad (a\in\mathbb{C}\setminus\\{0\\})$
* $\infty \cdot \infty = \infty \quad (a\in\mathbb{C}\setminus\\{0\\})$
* $1/0 = \infty$
* $1/\infty = 0$

Note that the following cannot be defined.

* $0 / 0$
* $0 \cdot \infty$
* $\infty / \infty$
* $\infty + \infty$
* $\infty - \infty$

In this package, 

```julia
julia> using RiemannSphereOperations

julia> inv′(complex(0,0))
Inf - Inf*im

julia> inv′(complex(0//1, 0//1))
1//0 - 1//0*im

julia> complex(Inf,-Inf) ==′ complex(-Inf,0)
true

julia> complex(Inf,-Inf) ==′ complex(1,0)
false
```

The outputs of the Base functions without `′` (`\prime<tab>`) is not compatible with the Riemann sphere.

```julia
julia> inv(complex(0,0))
NaN + NaN*im

julia> inv(complex(0//1, 0//1))
ERROR: DivideError: integer division error

julia> complex(Inf,-Inf) == complex(-Inf,0)
false

julia> complex(Inf,-Inf) == complex(1,0)
false
```

See https://discourse.julialang.org/t/why-inv-complex-0-0-0-0-returns-complex-nan-nan/92694 for more discussion.
