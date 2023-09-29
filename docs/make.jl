using GraphsBase
using Documenter

DocMeta.setdocmeta!(GraphsBase, :DocTestSetup, :(using GraphsBase); recursive=true)

makedocs(;
    modules=[GraphsBase],
    authors="JuliaGraphs contributors",
    sitename="GraphsBase.jl",
    format=Documenter.HTML(;
        repolink="https://github.com/JuliaGraphs/GraphsBase.jl",
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://JuliaGraphs.github.io/GraphsBase.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=["Home" => "index.md"],
)

deploydocs(;
    repo="github.com/JuliaGraphs/GraphsBase.jl", devbranch="main", push_preview=true
)
