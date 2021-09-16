## Network graph test

library(igraph)
library(ggraph)
library(tidyverse)

## set up team list ####
team_members <- tribble(
  ~id, ~name,
  1, "John Yuill",
  2, "Brent Langton",
  3, "Isha Kataria",
  4, "Karthik Sankaran",
  5, "Syed Naqvi",
  6, "Tom Funk",
  7, "Vaishali Nirwan"
)

## identify relationships ####
relns <- tribble(
  ~from, ~to, ~weight,
  1, 2, 3,
  1, 3, 3,
  1, 4, 3,
  1, 5, 3,
  1, 6, 3,
  1, 7, 3,
  2, 3, 1,
  2, 4, 1,
  2, 5, 1,
  2, 6, 1,
  2, 7, 1,
  3, 2, 1,
  3, 4, 1,
  3, 5, 1,
  3, 6, 1,
  3, 7, 1,
  4, 2, 1,
  5, 2, 1,
  6, 2, 1,
  7, 2, 1
)

## create network
net1 <- graph_from_data_frame(relns, directed=TRUE, vertices=team_members)

## explore
V(net1)
vcount(net1)
E(net1)
ecount(net1)

## visualize

ggraph(net1, layout='with_kk')+
  geom_edge_link(aes(alpha=weight))+
  geom_node_point()+
  geom_node_text(aes(label=name), repel=TRUE)