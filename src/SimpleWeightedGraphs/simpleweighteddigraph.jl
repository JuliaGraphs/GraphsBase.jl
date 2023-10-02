"""
$(TYPEDEF)

A type representing a directed graph with weighted, non-multiple edges.

# Fields

$(TYPEDFIELDS)
"""
struct SimpleWeightedDiGraph{T<:Integer,W} <: AbstractGraph{T,SimpleWeightedEdge{T,W}}
    "Transposed weighted adjacency matrix: `weights[v, u]` contains the weight of edge `(u, v)`"
    weights::SparseMatrixCSC{W,T}
end

GraphsBase.is_directed(::Type{<:SimpleWeightedDiGraph}) = true
GraphsBase.vertices(g::SimpleWeightedDiGraph{T}) where {T} = one(T):T(size(g.weights, 1))

function GraphsBase.out_edges(g::SimpleWeightedDiGraph{T}, u) where {T}
    A = g.weights
    return (SimpleWeightedEdge{T}(u, A.rowval[i], A.nzval[i]) for i in nzrange(A, u))
end

function GraphsBase.in_edges(g::SimpleWeightedDiGraph, v)
    A = g.weights
    a = A[v, :]
    return (SimpleWeightedEdge{T}(u, v, a[u]) for u in a.nzind)
end
