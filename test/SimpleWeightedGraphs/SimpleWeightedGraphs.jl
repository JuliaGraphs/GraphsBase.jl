using GraphsBase
using GraphsBase.SimpleWeightedGraphs
using Test

@test check_graph_interface(SimpleWeightedGraph{Int,Float64})
@test check_graph_interface(SimpleWeightedDiGraph{Int,Float64})
