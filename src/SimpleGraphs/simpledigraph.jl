"""
$(TYPEDEF)

A type representing a directed graph with unweighted, non-multiple edges.

# Fields

$(TYPEDFIELDS)
"""
mutable struct SimpleDiGraph{T<:Integer} <: AbstractGraph{T,SimpleEdge{T}}
    "Number of edges"
    ne::Int
    "Forward adjacency list such that `F[v]` contains the out-neighbors of vertex `v`"
    fadjlist::Vector{Vector{T}}
    "Backward adjacency list such that `B[u]` contains the in-neighbors of vertex `v`"
    badjlist::Vector{Vector{T}}
end

GraphsBase.is_directed(::Type{<:SimpleDiGraph}) = true

GraphsBase.vertices(g::SimpleDiGraph{T}) where {T} = one(T):T(length(g.fadjlist))

function GraphsBase.out_edges(g::SimpleDiGraph{T}, u) where {T}
    return (SimpleEdge{T}(u, v) for v in g.fadjlist[u])
end

function GraphsBase.in_edges(g::SimpleDiGraph{T}, v) where {T}
    return (SimpleEdge{T}(u, v) for u in g.badjlist[v])
end
