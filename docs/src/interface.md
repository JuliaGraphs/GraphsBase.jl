# Interface

## Edge

```@docs
AbstractEdge
src
dst
weight
Base.reverse
```

## Graph (required)

```@docs
AbstractGraph
is_directed
vertices
out_edges
in_edges
```

## Graph (optional)

```@docs
nv
ne
has_vertex
has_edge
has_self_loops
edges
out_neighbors
in_neighbors
create_vertex_container
create_edge_container
```

## Graph (modification)

```@docs
add_vertex!
rm_vertex!
add_edge!
rm_edge!
```

## Element types

```@docs
Base.eltype
edgetype
weighttype
```

## Checks

```@docs
GraphsBase.check_comparable_interface
GraphsBase.check_edge_interface
GraphsBase.check_graph_interface
```

## Index

```@index
```
