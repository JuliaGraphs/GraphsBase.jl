"""
    AbstractGraph{V,E}

An abstract type representing a graph with vertices of type `V` and edges of type `E`.

A subtype `G <: AbstractGraph` satisfies this interface if `E` satisfies the `AbstractEdge` interface, and if the following methods are implemented:

- `is_directed(::Type{G})`
- `vertices(g::G)`
- `out_edges(g::G, v)`
- `in_edges(g::G, v)`
"""
abstract type AbstractGraph{V,E<:AbstractEdge} end

## Element types

"""
    eltype(g)
    eltype(G)

Return the type of the vertices of a graph `g` / a graph type `G`.
"""
Base.eltype(::Type{<:AbstractGraph{V,E}}) where {V,E} = V
Base.eltype(::G) where {G<:AbstractGraph} = eltype(G)

"""
    edgetype(g)
    edgetype(G)

Return the type of the edges of a graph `g` / a graph type `G`.
"""
edgetype(::Type{<:AbstractGraph{V,E}}) where {V,E} = E
edgetype(::G) where {G<:AbstractGraph} = edgetype(G)

"""
    weighttype(g)
    weighttype(G)

Return the type of the edge weights of a graph `g` / a graph type `G`.
"""
weighttype(::Type{<:AbstractGraph{V,E}}) where {V,E} = weighttype(E)
weighttype(::G) where {G<:AbstractGraph} = weighttype(G)

## Interface functions

"""
    is_directed(g)
    is_directed(G)

Return `true` if the graph `g` / graph type `G` is a directed graph.
"""
function is_directed end

is_directed(::G) where {G<:AbstractGraph} = is_directed(G)

@traitdef IsDirected{G<:AbstractGraph}
@traitimpl IsDirected{G} < -is_directed(G)

"""
    vertices(g)

Return an iterable containing the vertices of `g`.
"""
function vertices end

"""
    out_edges(g, u)

Return an iterable containing the edges of a graph `g` going out of vertex `u`.
"""
function out_edges end

"""
    in_edges(g, v)

Return an iterable containing the edges of a graph `g` going into vertex `v`.
"""
function in_edges end

## Interface test

"""
    check_graph_interface(G)

Check that objects of type `G` can be used as graphs.
"""
function check_graph_interface(::Type{G}) where {G<:AbstractGraph}
    V, E = eltype(G), edgetype(G)
    if !check_edge_interface(E)
        return false
    elseif !hasmethod(vertices, (G,))
        @warn "Missing method `GraphsBase.vertices(::$E)`"
        return false
    elseif !hasmethod(out_edges, (G, V))
        @warn "Missing method `GraphsBase.out_edges(::$E, ::$V)`"
        return false
    elseif !hasmethod(in_edges, (G, V))
        @warn "Missing method `GraphsBase.in_edges(::$E, ::$V)`"
        return false
    else
        return true
    end
end

function check_graph_interface(::Type{G}) where {G}
    @warn "$G must be a subtype of AbstractGraph"
    return false
end
