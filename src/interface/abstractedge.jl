"""
    AbstractEdge{V,W}

Abstract type for graph edges with vertices of type `V` and a weight of type `W`.

A subtype `E` satisfies this interface if both `V` and `E` can be hashed and compared, and if the following methods are implemented:

- `src(e::E)`
- `dst(e::E)`
- `weight(e::E)`
- `Base.reverse(e::E)`
"""
abstract type AbstractEdge{V,W} end

## Element types

"""
    eltype(e)
    eltype(E)

Return the type of the vertices of an edge `e` / an edge type `E`.
"""
Base.eltype(::Type{<:AbstractEdge{V}}) where {V} = V
Base.eltype(::E) where {E<:AbstractEdge} = eltype(E)

"""
    weighttype(e)
    weighttype(E)

Return the type of the weights of an edge `e` / an edge type `E`.
"""
weighttype(::Type{<:AbstractEdge{V,W}}) where {V,W} = W
weighttype(::E) where {E<:AbstractEdge} = weighttype(E)

## Interface functions

"""
    src(e)

Return the source vertex of edge `e`.
"""
function src end

"""
    dst(e)

Return the destination vertex of edge `e`.
"""
function dst end

"""
    weight(e)

Return the weight of edge `e`.
"""
function weight end

"""
    reverse(e)

Return a new edge with the same data as edge `e` but inverted source and destination.
"""
Base.reverse

## Interface test

"""
    check_edge_interface(E)

Check that objects of type `E` can be used as edges of a graph.
"""
function check_edge_interface(::Type{E}) where {E<:AbstractEdge}
    V = eltype(E)
    if !check_comparable_interface(V)
        return false
    elseif !check_comparable_interface(E)
        return false
    elseif !hasmethod(src, (E,))
        @warn "Missing method GraphsBase.src(::$E)"
        return false
    elseif !hasmethod(dst, (E,))
        @warn "Missing method GraphsBase.dst(::$E)"
        return false
    elseif !hasmethod(weight, (E,))
        @warn "Missing method GraphsBase.weight(::$E)"
        return false
    elseif !hasmethod(Base.reverse, (E,))
        @warn "Missing method Base.reverse(::$E)"
        return false
    else
        return true
    end
end

function check_edge_interface(::Type{E}) where {E}
    @warn "$E must be a subtype of AbstractEdge"
    return false
end
