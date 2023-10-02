"""
$(TYPEDEF)

A type representing an undirected graph with unweighted, non-multiple edges.

# Fields

$(TYPEDFIELDS)
"""
mutable struct SimpleGraph{T<:Integer} <: AbstractGraph{T,SimpleEdge{T}}
    """Number of edges"""
    ne::Int
    "Adjacency list such that `L[v]` contains the neighbors of vertex `v`"
    adjlist::Vector{Vector{T}}
end

GraphsBase.is_directed(::Type{<:SimpleGraph}) = false

GraphsBase.vertices(g::SimpleGraph{T}) where {T} = one(T):T(length(g.adjlist))

function GraphsBase.out_edges(g::SimpleGraph{T}, u) where {T}
    return (SimpleEdge{T}(u, v) for v in g.adjlist[u])
end

GraphsBase.in_edges(g::SimpleGraph, v) = out_edges(g, v)
