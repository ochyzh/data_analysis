hprice<-read.csv("hprice.csv")
hprice<-hprice[hprice$dist<10000,]

hprice$nearinc<- NA
hprice$nearinc[hprice$dist<8000]<-1
hprice$nearinc[hprice$dist>=8000]<-0

table(hprice$nearinc)

#A different way to create nearinc:
hprice$nearinc1<-ifelse(hprice$dist<8000,1,0)
table(hprice$nearinc1)

table(hprice$year)
table(hprice$nearinc1,hprice$year)

meanT_before<-mean(hprice$price[hprice$nearinc==1 & hprice$year==1978])
meanC_before<-mean(hprice$price[hprice$nearinc==0& hprice$year==1978])

meanT_after<-mean(hprice$price[hprice$nearinc==1 & hprice$year==1981])
meanC_after<-mean(hprice$price[hprice$nearinc==0& hprice$year==1981])

temp<-meanT_after-meanT_before
cs<-meanC_after-meanT_after


diff_in_diff=(meanT_after-meanT_before)-(meanC_after-meanC_before)
