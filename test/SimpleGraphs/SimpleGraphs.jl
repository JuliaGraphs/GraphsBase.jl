using GraphsBase
using GraphsBase.SimpleGraphs
using Test

@test check_graph_interface(SimpleGraph{Int})
@test check_graph_interface(SimpleDiGraph{Int})
