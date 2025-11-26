library(tidyverse)
library(wooldridge)
data(mroz)
mydata<-mroz %>% filter(!is.na(lwage))
summary(m1<-lm(lwage~educ, data=mydata))

summary(m2<-lm(educ~fatheduc, data=mydata))

summary(m3<-lm(lwage~m2$fitted.values, data=mydata))
