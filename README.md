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
