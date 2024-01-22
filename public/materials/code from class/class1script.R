rosca<-read.csv('rosca.csv', header=TRUE)
rosca$bg_female



rosca$new_var<- NA

rosca$fol2_amtinvest[rosca$bg_female==1]
##Or create a copy of the dataset that only includes women:
rosca1<- rosca[rosca$bg_female==1,]
mean(rosca$fol2_amtinvest, na.rm=TRUE)
mean(rosca$fol2_amtinvest[rosca$bg_female==1], na.rm=TRUE)
tapply(rosca$fol2_amtinvest, rosca$bg_female,mean, na.rm=TRUE)

table(rosca$bg_female)

