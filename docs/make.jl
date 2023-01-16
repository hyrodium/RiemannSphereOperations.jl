using RiemannSphereOperations
using Documenter

DocMeta.setdocmeta!(RiemannSphereOperations, :DocTestSetup, :(using RiemannSphereOperations); recursive=true)

makedocs(;
    modules=[RiemannSphereOperations],
    repo="https://github.com/hyrodium/RiemannSphereOperations.jl/blob/{commit}{path}#{line}",
    sitename="RiemannSphereOperations.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://hyrodium.github.io/RiemannSphereOperations.jl",
        assets = ["assets/custom.css", "assets/favicon.ico"],
    ),
    pages=[
        "Home" => "index.md",
        "API" => "api.md",
    ],
)

deploydocs(;
    repo="github.com/hyrodium/RiemannSphereOperations.jl", devbranch="main",
)
