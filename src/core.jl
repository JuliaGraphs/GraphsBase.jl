"""
    AbstractPathState

An abstract type that provides information from shortest paths calculations.
"""
abstract type AbstractPathState end

"""
    is_ordered(e)

Return true if the source vertex of edge `e` is less than or equal to
the destination vertex.

# Examples
```jldoctest
julia> using Graphs

julia> g = DiGraph(2);

julia> add_edge!(g, 2, 1);

julia> is_ordered(first(edges(g)))
false
```
"""
is_ordered(e::AbstractEdge) = src(e) <= dst(e)


"""
    neighbors(g, v)

Return a list of all neighbors reachable from vertex `v` in `g`.
For directed graphs, the default is equivalent to [`outneighbors`](@ref);
use [`all_neighbors`](@ref) to list inbound and outbound neighbors.

### Implementation Notes
Returns a reference to the current graph's internal structures, not a copy.
Do not modify result. If the graph is modified, the behavior is undefined:
the array behind this reference may be modified too, but this is not guaranteed.

# Examples
```jldoctest
julia> using Graphs

julia> g = DiGraph(3);

julia> add_edge!(g, 2, 3);

julia> add_edge!(g, 3, 1);

julia> neighbors(g, 1)
0-element Array{Int64,1}

julia> neighbors(g, 2)
1-element Array{Int64,1}:
 3

julia> neighbors(g, 3)
1-element Array{Int64,1}:
 1
```
"""
neighbors(g::AbstractGraph, v::Integer) = outneighbors(g, v)

"""
    all_neighbors(g, v)

Return a list of all inbound and outbound neighbors of `v` in `g`.
For undirected graphs, this is equivalent to both [`outneighbors`](@ref)
and [`inneighbors`](@ref).

### Implementation Notes
Returns a reference to the current graph's internal structures, not a copy.
Do not modify result. If the graph is modified, the behavior is undefined:
the array behind this reference may be modified too, but this is not guaranteed.

# Examples
```jldoctest
julia> using Graphs

julia> g = DiGraph(3);

julia> add_edge!(g, 2, 3);

julia> add_edge!(g, 3, 1);

julia> all_neighbors(g, 1)
1-element Array{Int64,1}:
 3

julia> all_neighbors(g, 2)
1-element Array{Int64,1}:
 3

julia> all_neighbors(g, 3)
2-element Array{Int64,1}:
 1
 2
 ```
"""
function all_neighbors end
@traitfn all_neighbors(g::::IsDirected, v::Integer) =
    union(outneighbors(g, v), inneighbors(g, v))
@traitfn all_neighbors(g::::(!IsDirected), v::Integer) =
    neighbors(g, v)

"""
    indegree(g[, v])

Return a vector corresponding to the number of edges which end at each vertex in
graph `g`. If `v` is specified, only return degrees for vertices in `v`.

# Examples
```jldoctest
julia> using Graphs

julia> g = DiGraph(3);

julia> add_edge!(g, 2, 3);

julia> add_edge!(g, 3, 1);

julia> indegree(g)
3-element Array{Int64,1}:
 1
 0
 1
```
"""
indegree(g::AbstractGraph, v::Integer) = length(inneighbors(g, v))
indegree(g::AbstractGraph, v::AbstractVector = vertices(g)) = [indegree(g, x) for x in v]

"""
    outdegree(g[, v])

Return a vector corresponding to the number of edges which start at each vertex in
graph `g`. If `v` is specified, only return degrees for vertices in `v`.

# Examples
```jldoctest
julia> using Graphs

julia> g = DiGraph(3);

julia> add_edge!(g, 2, 3);

julia> add_edge!(g, 3, 1);

julia> outdegree(g)
3-element Array{Int64,1}:
 0
 1
 1
```
"""
outdegree(g::AbstractGraph, v::Integer) = length(outneighbors(g, v))
outdegree(g::AbstractGraph, v::AbstractVector = vertices(g)) = [outdegree(g, x) for x in v]

"""
    degree(g[, v])

Return a vector corresponding to the number of edges which start or end at each
vertex in graph `g`. If `v` is specified, only return degrees for vertices in `v`.
For directed graphs, this value equals the incoming plus outgoing edges.
For undirected graphs, it equals the connected edges.

# Examples
```jldoctest
julia> using Graphs

julia> g = DiGraph(3);

julia> add_edge!(g, 2, 3);

julia> add_edge!(g, 3, 1);

julia> degree(g)
3-element Array{Int64,1}:
 1
 1
 2
```
"""
function degree end
@traitfn degree(g::AbstractGraph::(!IsDirected), v::Integer) = indegree(g, v)
@traitfn degree(g::AbstractGraph::IsDirected, v::Integer) = indegree(g, v) + outdegree(g, v)

degree(g::AbstractGraph, v::AbstractVector = vertices(g)) = [degree(g, x) for x in v]

"""
    has_self_loops(g)

Return true if `g` has any self loops.

# Examples
```jldoctest
julia> using Graphs

julia> g = SimpleGraph(2);

julia> add_edge!(g, 1, 2);

julia> has_self_loops(g)
false

julia> add_edge!(g, 1, 1);

julia> has_self_loops(g)
true
```
"""
has_self_loops(g::AbstractGraph) = nv(g) == 0 ? false : any(v -> has_edge(g, v, v), vertices(g))

"""
    add_vertices!(g, n)

Add `n` new vertices to the graph `g`.
Return the number of vertices that were added successfully.

# Examples
```jldoctest
julia> using Graphs

julia> g = SimpleGraph()
{0, 0} undirected simple Int64 graph

julia> add_vertices!(g, 2)
2
```
"""
@traitfn add_vertices!(g::AbstractGraph::IsSimplyMutable, n::Integer) = sum([add_vertex!(g) for i = 1:n])

"""
    weights(g)

Return the weights of the edges of a graph `g` as a matrix. Defaults
to [`Graphs.DefaultDistance`](@ref).

### Implementation Notes
In general, referencing the weight of a nonexistent edge is undefined behavior. Do not rely on the `weights` matrix
as a substitute for the graph's [`adjacency_matrix`](@ref).
"""
weights(g::AbstractGraph) = DefaultDistance(nv(g))