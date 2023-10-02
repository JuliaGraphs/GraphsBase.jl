using GraphsBase
using GraphsBase.SimpleGraphs
using Test

@test check_edge_interface(SimpleEdge{Int})
@test !check_edge_interface(Tuple{Int,Int})
