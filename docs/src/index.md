# RiemannSphereOperations.jl

This package provides some operations on the Riemann sphere.

```@repl
using RiemannSphereOperations
inv′(complex(0,0))
inv′(complex(0//1, 0//1))
complex(Inf,-Inf) ==′ complex(-Inf,0)
complex(Inf,-Inf) ==′ complex(1,0)
```

The outputs of the Base functions without `′` (`\prime<tab>`) is not compatible with the Riemann sphere.

```@repl
inv(complex(0,0))
inv(complex(0//1, 0//1))
complex(Inf,-Inf) == complex(-Inf,0)
complex(Inf,-Inf) == complex(1,0)
```

See https://discourse.julialang.org/t/why-inv-complex-0-0-0-0-returns-complex-nan-nan/92694 for more discussion.
