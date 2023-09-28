"""
$(TYPEDEF)

A type representing an undirected graph with weighted, non-multiple edges.

# Fields

$(TYPEDFIELDS)
"""
struct SimpleWeightedGraph{T<:Integer,W} <: AbstractGraph{T,SimpleWeightedEdge{T,W}}
    "Symmetric weighted adjacency matrix: `weights[u, v]` and `weights[v, u]` both contain the weight of edge `{u, v}`"
    weights::SparseMatrixCSC{W,T}
end

GraphsBase.is_directed(::Type{<:SimpleWeightedGraph}) = false
GraphsBase.vertices(g::SimpleWeightedGraph{T}) where {T} = one(T):T(size(g.weights, 1))

function GraphsBase.out_edges(g::SimpleWeightedGraph{T}, u) where {T}
    A = g.weights
    return (SimpleWeightedEdge{T}(u, A.rowval[i], A.nzval[i]) for i in nzrange(A, u))
end

GraphsBase.in_edges(g::SimpleWeightedGraph, v) = out_edges(g, v)
