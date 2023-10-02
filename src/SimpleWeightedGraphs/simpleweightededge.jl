"""
$(TYPEDEF)

A type representing a weighted directed edge.

# Fields

$(TYPEDFIELDS)
"""
struct SimpleWeightedEdge{T<:Integer,W} <: AbstractEdge{T,W}
    "Source of the edge"
    src::T
    "Destination of the edge"
    dst::T
    "Weight of the edge"
    weight::W
end

Base.Tuple(e::SimpleWeightedEdge) = (e.src, e.dst, e.weight)
Base.isless(e1::SimpleWeightedEdge, e2::SimpleWeightedEdge) = isless(Tuple(e1), Tuple(e2))
Base.:(==)(e1::SimpleWeightedEdge, e2::SimpleWeightedEdge) = Tuple(e1) == Tuple(e2)

GraphsBase.src(e::SimpleWeightedEdge) = e.src
GraphsBase.dst(e::SimpleWeightedEdge) = e.dst
GraphsBase.weight(e::SimpleWeightedEdge) = e.weight
Base.reverse(e::SimpleWeightedEdge) = SimpleEdge(e.dst, e.src, e.weight)
