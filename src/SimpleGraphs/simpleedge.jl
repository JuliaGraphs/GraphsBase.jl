"""
$(TYPEDEF)

A type representing an unweighted directed edge.

# Fields

$(TYPEDFIELDS)
"""
struct SimpleEdge{T<:Integer} <: AbstractEdge{T,Int}
    "Source of the edge"
    src::T
    "Destination of the edge"
    dst::T
end

Base.Tuple(e::SimpleEdge) = (e.src, e.dst)
Base.isless(e1::SimpleEdge, e2::SimpleEdge) = isless(Tuple(e1), Tuple(e2))
Base.:(==)(e1::SimpleEdge, e2::SimpleEdge) = Tuple(e1) == Tuple(e2)

GraphsBase.src(e::SimpleEdge) = e.src
GraphsBase.dst(e::SimpleEdge) = e.dst
GraphsBase.weight(e::SimpleEdge) = 1
Base.reverse(e::SimpleEdge) = SimpleEdge(e.dst, e.src)
