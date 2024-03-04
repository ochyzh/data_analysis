install.packages("stylo")
library(stylo)
myanalysis<-stylo()

mydata<-read.table("./table_with_frequencies.txt", header=TRUE)
mydata
mean(as.numeric(mydata['the',1:9])) #Bush
mean(as.numeric(mydata['the',10:19])) #Obama

mean(as.numeric(mydata['economy',1:9])) #Bush
mean(as.numeric(mydata['economy',10:19])) #Obama

mean(as.numeric(mydata['security',1:9])) #Bush
mean(as.numeric(mydata['security',10:19])) #Obama


genesis<-classify()
summary(genesis)
genesis$distance.table
