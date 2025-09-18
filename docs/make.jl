using MyFirstPackage
using Documenter

DocMeta.setdocmeta!(MyFirstPackage, :DocTestSetup, :(using MyFirstPackage); recursive=true)

makedocs(;
    modules=[MyFirstPackage],
    authors="zhc1212",
    sitename="MyFirstPackage.jl",
    format=Documenter.HTML(;
        canonical="https://zhc1212.github.io/MyFirstPackage.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/zhc1212/MyFirstPackage.jl",
    devbranch="main",
)
