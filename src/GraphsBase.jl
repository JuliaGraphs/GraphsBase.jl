"""
    GraphsBase

The basic interface and graph types for the JuliaGraphs ecosystem.
"""
module GraphsBase

using DocStringExtensions
using SimpleTraits
using SparseArrays

export AbstractEdge, check_edge_interface
export eltype, weighttype
export src, dst, weight

export AbstractGraph, check_graph_interface
export edgetype
export is_directed
export vertices
export edges, out_edges, in_edges
export nv, ne
export has_vertex, has_edge, has_self_loops
export out_neighbors, in_neighbors
export create_vertex_container, create_edge_container
export add_vertex!, rm_vertex!, add_edge!, rm_edge!

include("interface/utils.jl")
include("interface/abstractedge.jl")
include("interface/abstractgraph.jl")
include("interface/optional.jl")
include("interface/modification.jl")

include("SimpleGraphs/SimpleGraphs.jl")

include("SimpleWeightedGraphs/SimpleWeightedGraphs.jl")

end
