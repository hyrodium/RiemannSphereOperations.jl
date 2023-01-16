var documenterSearchIndex = {"docs":
[{"location":"api/#API","page":"API","title":"API","text":"","category":"section"},{"location":"api/","page":"API","title":"API","text":"Modules = [RiemannSphereOperations]","category":"page"},{"location":"api/#RiemannSphereOperations.:==′-Tuple{Any, Any}","page":"API","title":"RiemannSphereOperations.:==′","text":"==′(z1::Number, z2::Number)\n\nModified version of == for Riemann sphere.\n\nExamples\n\njulia> 1 == 1.0, 1 ==′ 1.0\n(true, true)\n\njulia> 0.0 == -0.0, 0.0 ==′ -0.0\n(true, true)\n\njulia> Inf == -Inf, Inf ==′ -Inf\n(false, true)\n\njulia> NaN == NaN, NaN ==′ NaN\n(false, false)\n\njulia> complex(Inf,1) ==′ complex(-Inf,8) ==′ complex(1,Inf) ==′ complex(-Inf,-Inf)\ntrue\n\n\n\n\n\n","category":"method"},{"location":"api/#RiemannSphereOperations.isinf′-Tuple{Complex}","page":"API","title":"RiemannSphereOperations.isinf′","text":"isinf′(z::Number)\n\nModified version of isinf for Riemann sphere.\n\nExamples\n\njulia> isinf′(42)\nfalse\n\njulia> isinf′(Inf)\ntrue\n\njulia> isinf′(complex(Inf,4))\ntrue\n\njulia> isinf′(complex(Inf,NaN))\nfalse\n\n\n\n\n\n","category":"method"},{"location":"#RiemannSphereOperations","page":"Home","title":"RiemannSphereOperations","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"(Image: Stable) (Image: Dev) (Image: Build Status) (Image: codecov) (Image: Aqua QA)","category":"page"},{"location":"#Maths","page":"Home","title":"Maths","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"This package provides some operations on the Riemann sphere hatmathbbC = mathbbC cup infty.","category":"page"},{"location":"","page":"Home","title":"Home","text":"The following are the calculation rules with the point at infinity infty.","category":"page"},{"location":"","page":"Home","title":"Home","text":"a + infty = infty quad (ainmathbbC)\na cdot infty = infty quad (ainmathbbCsetminus0)\ninfty cdot infty = infty\n10 = infty\n1infty = 0","category":"page"},{"location":"","page":"Home","title":"Home","text":"Note that the following cannot be defined.","category":"page"},{"location":"","page":"Home","title":"Home","text":"0  0\n0 cdot infty\ninfty  infty\ninfty + infty\ninfty - infty","category":"page"},{"location":"#Package-implementation","page":"Home","title":"Package implementation","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"In this package, a value z which satisfies isinf(z) and !isnan(z) is used to represent the infinity infty. Thus, all of complex(Inf,2.0), complex(Inf,-Inf), complex(1//0,1//1) are treated as the same point infty in this package.","category":"page"},{"location":"","page":"Home","title":"Home","text":"All of the exported functions from this package has ′ (\\prime<tab>) suffix which represents a modified version of the function on the Riemann sphere.","category":"page"},{"location":"","page":"Home","title":"Home","text":"using RiemannSphereOperations\ninv(complex(0,0))  # 1/0 should be ∞\ninv′(complex(0,0))  # correct 😎\ncomplex(1) * Complex(Inf,-Inf)  # 1⋅∞ should be ∞\ncomplex(1) *′ Complex(Inf,-Inf)  # correct 😎\nInf + Inf  # ∞+∞ cannot be defined\nInf +′ Inf  # correct 😎","category":"page"},{"location":"","page":"Home","title":"Home","text":"This package has more functions such as isinfty′, +′, /′ etc. See the documentation page for more information.","category":"page"},{"location":"#Related-information","page":"Home","title":"Related information","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"My post on Julia discourse\nThis explains why I made this package.\nRiemannComplexNumbers.jl\nThis package has the same motivation, but its implementation is different.\nRiemannComplexNumbers.jl defines original type RC <: Number which is used for the complex numbers on the Riemann sphere.\nOriginal issue on inv(0+0im)\nThis issue explains why inv(0+0im)  should return NaN + NaN*im\nRelated issue on NaN vs DomainError\nThis related issue is still open.","category":"page"}]
}