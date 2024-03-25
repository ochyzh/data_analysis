library(sna)
data(coleman)
coleman[1,1:10,1:10]

library(igraph)
ggraph<-graph_from_adjacency_matrix(coleman[1,,],
                                    mode="undirected", diag=FALSE)
plot(ggraph, vertex.color="black", vertex.size=5, vertex.label=NA)


degree.cent <- igraph::degree(ggraph)
degree.cent


V(ggraph)$color <- ifelse(V(ggraph)$name == 21, "red", "grey")
plot(ggraph,vertex.color=V(ggraph)$color,  vertex.label=NA)

neighbors(ggraph,21)

V(ggraph)$color <- ifelse(V(ggraph)$name %in% neighbors(ggraph,21), "pink", "grey")
V(ggraph)$color[V(ggraph)$name == 21]<- "red"
plot(ggraph, vertex.label=NA)


mynet<-as.matrix(igraph::as_adj(ggraph))
mynet2<-mynet%*%mynet
diag(mynet2)<-0 #a node cannot be connected to itself
neighbors2<-names(mynet2[21,][mynet2[21,]>0])
neighbors2


V(ggraph)$color <- ifelse(V(ggraph)$name %in% neighbors2, "mistyrose", "grey")
V(ggraph)$color[V(ggraph)$name %in% neighbors(ggraph,21)]<- "pink"
V(ggraph)$color[V(ggraph)$name == 21]<- "red"
plot(ggraph, vertex.label=NA)
