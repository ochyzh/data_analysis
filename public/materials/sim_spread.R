sim_spread<-function(g, p0) {

neighbors1<-names(neighbors(g,p0))

mynet<-as.matrix(igraph::as_adj(g))
mynet2<-mynet%*%mynet
diag(mynet2)<-0 #a node cannot be connected to itself
neighbors2<-names(mynet2[p0,][mynet2[p0,]>0])
neighbors2

mynet3<-mynet2%*%mynet
diag(mynet3)<-0 #a node cannot be connected to itself
neighbors3<-names(mynet3[p0,][mynet3[p0,]>0])

V(g)$color <- ifelse(V(g)$name %in% neighbors3, "red1", "gray97")
V(g)$color[V(g)$name %in% neighbors2]<- "red2"
V(g)$color[V(g)$name %in% neighbors1]<- "red3"
V(g)$color[V(g)$name == p0]<- "red4"
set.seed(1598)
plot(g)


V(g)$color <- ifelse(V(g)$name %in% neighbors2, "red2", "grey")
V(g)$color[V(g)$name %in% neighbors1]<- "red3"
V(g)$color[V(g)$name == p0]<- "red4"
set.seed(1598)
plot(g)


V(g)$color <- ifelse(V(g)$name %in% neighbors1, "red3", "grey")
V(g)$color[V(g)$name == p0]<- "red4"
set.seed(1598)
plot(g)

V(g)$color <- ifelse(V(g)$name == p0, "red4", "grey")
set.seed(1598)
plot(g)

}
