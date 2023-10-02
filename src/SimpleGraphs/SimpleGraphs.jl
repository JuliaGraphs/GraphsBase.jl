module SimpleGraphs

using DocStringExtensions
using GraphsBase

export SimpleEdge
export SimpleGraph
export SimpleDiGraph

include("simpleedge.jl")
include("simplegraph.jl")
include("simpledigraph.jl")

end
