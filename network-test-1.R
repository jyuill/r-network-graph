## Network graph test

library(igraph)
library(ggraph)
library(tidyverse)

## set up team list ####
team_members <- tribble(
  ~id, ~name,
  1, "John Y",
  2, "Bret L",
  3, "Iskar Kat",
  4, "Kartum Shankar",
  5, "Sam Nagli",
  6, "Tim Fork",
  7, "Vivian Nelson"
)

## identify relationships ####
relns <- tribble(
  ~from, ~to, ~weight,
  1, 2, 4,
  1, 3, 4,
  1, 4, 4,
  1, 5, 4,
  1, 6, 4,
  1, 7, 4,
  2, 3, 1,
  2, 4, 1,
  2, 5, 1,
  2, 6, 1,
  2, 7, 1,
  3, 4, 1,
  3, 5, 1,
  3, 6, 1,
  3, 7, 1,
  4, 5, 1,
  4, 6, 1,
  4, 7, 1,
  5, 6, 1,
  5, 7, 1,
  6, 7, 1
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

ggraph(net1, layout='in_circle')+
  geom_edge_link(aes(alpha=weight), color='lightblue')+
  geom_node_point(size=12, color='lightblue')+
  geom_node_text(aes(label=name), color='blue', repel=TRUE)+theme_classic()+
  coord_flip()+
  theme(legend.position = 'none')

ggraph(net1, layout='in_circle')+
  geom_edge_bend(aes(alpha=weight))+
  geom_node_point(size=12, color='lightblue')+
  geom_node_text(aes(label=name), color='blue', repel=TRUE)+theme_classic()+
  coord_flip()+
  theme(legend.position = 'none')

ggraph(net1, layout='in_circle')+
  geom_edge_fan(aes(alpha=weight))+
  geom_node_point(size=12, color='lightblue')+
  geom_node_text(aes(label=name), color='blue', repel=TRUE)+theme_classic()+
  coord_flip()+
  theme(legend.position = 'none')

ggraph(net1, layout='in_circle')+
  geom_edge_hive(aes(alpha=weight))+
  geom_node_point(size=12, color='lightblue')+
  geom_node_text(aes(label=name), color='blue', repel=TRUE)+theme_classic()+
  coord_flip()+
  theme(legend.position = 'none')

ggraph(net1, layout='on_grid')+
  geom_edge_link(aes(alpha=weight))+
  geom_node_point()+
  geom_node_text(aes(label=name), repel=TRUE)
