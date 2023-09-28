using GraphsBase
using Graphs
using Documenter

DocMeta.setdocmeta!(GraphsBase, :DocTestSetup, :(using GraphsBase); recursive=true)

makedocs(;
    modules=[GraphsBase],
    authors="JuliaGraphs contributors",
    repo="https://github.com/JuliaGraphs/GraphsBase.jl/blob/{commit}{path}#{line}",
    sitename="GraphsBase.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://JuliaGraphs.github.io/GraphsBase.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=["Home" => "index.md"],
)

deploydocs(; repo="github.com/JuliaGraphs/GraphsBase.jl", devbranch="main")
