## Counting

"""
    nv(g)

Count the number of vertices in `g`.
"""
nv(g::AbstractGraph) = length(vertices(g))

"""
    ne(g)

Count the number of edges in `g`.
"""
ne(g::AbstractGraph) = length(edges(g))

## Has stuff

"""
    has_vertex(g, v)

Return `true` if the graph `g` contains the vertex `v`.
"""
has_vertex(g::AbstractGraph, v) = v in vertices(g)

"""
    has_edge(g, e)

Return `true` if the graph `g` contains the edge `e` (not just an edge with the same source and destination).
"""
has_edge(g::AbstractGraph, e::AbstractEdge) = e in edges(g)

"""
    has_edge(g, u, v)

Return `true` if the graph `g` contains an edge from vertex `u` to vertex `v`.
"""
has_edge(g::AbstractGraph, u, v) = v in outneighbors(g, u)

"""
    has_self_loops(g)

Return `true` if `g` has any edge from a vertex to itself.
"""
function has_self_loops(g::AbstractGraph)
    return nv(g) == 0 ? false : any(v -> has_edge(g, v, v), vertices(g))
end

## Edge iterators

"""
    edges(g)

Return an iterable containing the edges of `g`.
"""
edges(g::AbstractGraph) = (e for v in vertices(g) for e in out_edges(g, v))

"""
    edges(g, u, v)

Return an iterable containing the edges of a graph `g`
going our of `u` and into `v`.
"""
edges(g::AbstractGraph, u, v) = (e for e in outedges(g, u) if dst(e) == v)

## Neighbor iterators

"""
    in_neighbors(g, v)

Return an iterable containing all neighbors connected to vertex `v` by an incoming edge.
"""
in_neighbors(g::AbstractGraph, v) = unique(src(e) for e in inedges(g, v))

"""
    out_neighbors(g, u)

Return an iterable containing all neighbors connected to vertex `u` by an outgoing edge.
"""
out_neighbors(g::AbstractGraph, u) = unique(dst(e) for e in outedges(g, u))

## Containers

"""
    create_vertex_container(g, ::Type{K})

Return a new container with element type `K` that can be indexed by the vertices of 'g'.
"""
create_vertex_container(::AbstractGraph{V}, ::Type{K}) where {V,K} = Dict{V,K}()

"""
    create_edge_container(g, ::Type{K})

Return a new container with element type `K` that can be indexed by the edges of 'g'.
"""
create_edge_container(::AbstractGraph{V,E}, ::Type{K}) where {V,E,K} = Dict{E,K}()
