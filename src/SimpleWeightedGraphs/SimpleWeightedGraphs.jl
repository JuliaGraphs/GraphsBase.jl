module SimpleWeightedGraphs

using DocStringExtensions
using SparseArrays
using GraphsBase

export SimpleWeightedEdge
export SimpleWeightedGraph
export SimpleWeightedDiGraph

include("simpleweightededge.jl")
include("simpleweightedgraph.jl")
include("simpleweighteddigraph.jl")

end
