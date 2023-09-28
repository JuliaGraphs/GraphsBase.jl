module GraphsBase

using SimpleTraits

# import Base: adjoint, write, ==, <, *, ≈, convert, isless, issubset,
#             reverse, reverse!, isassigned, getindex, setindex!, show,
#             print, copy, in, sum, size, eltype, length, ndims, transpose,
#             iterate, eltype, get, Pair, Tuple, zero

export
    # Interface
    AbstractVertex,
    is_vertex,
    AbstractEdge,
    AbstractEdgeIter,
    AbstractGraph,
    vertices,
    edges,
    edgetype,
    nv,
    ne,
    src,
    dst,
    is_directed,
    IsDirected,
    is_range_based,
    IsRangeBased,
    is_simply_mutable,
    IsSimplyMutable,
    is_mutable,
    IsMutable,
    is_weight_mutable,
    IsWeightMutable,
    is_vertex_stable,
    IsVertexStable,
    has_vertex,
    has_edge,
    inneighbors,
    outneighbors,
    outedges,
    inedges,
    weight,
    get_vertex_container,
    get_edge_container,
    Edge,
    Graph,
    SimpleGraph,
    SimpleGraphFromIterator,
    DiGraph,
    SimpleDiGraphFromIterator,
    SimpleDiGraph,

    # core
    is_ordered,
    add_vertices!,
    indegree,
    outdegree,
    degree,
    neighbors,
    all_neighbors,
    has_self_loops,
    weights,

    # simplegraphs
    add_edge!,
    add_vertex!,
    add_vertices!,
    rem_edge!,
    rem_vertex!,
    rem_vertices!

"""
    GraphsBase

The API for the Graphs ecosystem.

Simple graphs (not multi- or hypergraphs) are represented in a memory- and
time-efficient manner with adjacency lists and edge sets. Both directed and
undirected graphs are supported via separate types, and conversion is available
from directed to undirected.

The project goal is to mirror the functionality of robust network and graph
analysis libraries such as NetworkX while being simpler to use and more
efficient than existing Julian graph libraries such as Graphs.jl. It is an
explicit design decision that any data not required for graph manipulation
(attributes and other information, for example) is expected to be stored
outside of the graph structure itself. Such data lends itself to storage in
more traditional and better-optimized mechanisms.

[Full documentation](http://codecov.io/github/JuliaGraphs/Graphs.jl) is available,
and tutorials are available at the
[JuliaGraphsTutorials repository](https://github.com/JuliaGraphs/JuliaGraphsTutorials).
"""
GraphsBase
include("interface.jl")
include("utils.jl")
include("core.jl")
include("SimpleGraphs/SimpleGraphs.jl")

using .SimpleGraphs
"""
    Graph

A datastruture representing an undirected graph.
"""
const Graph = GraphsBase.SimpleGraphs.SimpleGraph
"""
    DiGraph

A datastruture representing a directed graph.
"""
const DiGraph = GraphsBase.SimpleGraphs.SimpleDiGraph
"""
    Edge

A datastruture representing an edge between two vertices in
a `Graph` or `DiGraph`.
"""
const Edge = GraphsBase.SimpleGraphs.SimpleEdge

end # module
