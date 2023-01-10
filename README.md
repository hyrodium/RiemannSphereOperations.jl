# RiemannSphereOperations

This package provides some operations on the Riemann sphere.

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
