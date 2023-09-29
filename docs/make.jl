using GraphsBase
using Documenter

DocMeta.setdocmeta!(GraphsBase, :DocTestSetup, :(using GraphsBase); recursive=true)

makedocs(;
    modules=[GraphsBase],
    authors="JuliaGraphs contributors",
    sitename="GraphsBase.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://juliagraphs.org/GraphsBase.jl",
        assets=String[],
    ),
    pages=["Home" => "index.md"],
)

deploydocs(;
    repo="github.com/JuliaGraphs/GraphsBase.jl", devbranch="main", push_preview=true
)
