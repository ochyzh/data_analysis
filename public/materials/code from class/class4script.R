social <- read.csv("social.csv")
social$messages<-as.factor(social$messages)
levels(social$messages) # 

fit <- lm(primary2008 ~ messages, data = social)
coef(fit)
round(coef(fit),3)

#Recode messages as a series of binary variables
social$control<-ifelse(social$messages=="Control",1,0)
social$civic_duty<-ifelse(social$messages=="Civic Duty",1,0)
social$neighbors<-ifelse(social$messages=="Neighbors",1,0)
social$hawthorne<-ifelse(social$messages=="Hawthorne",1,0)

fit <- lm(primary2008 ~ civic_duty+ neighbors+hawthorne, data = social)
coef(fit)
round(coef(fit),3)

social$age<-2008-social$yearofbirth
fit2<-lm(primary2008 ~ civic_duty+neighbors+ hawthorne+age, 
         data=social)
round(coef(fit2),3)

#18 and 40-year olds:

newdata<-data.frame(civic_duty=c(0,0,0,1),neighbors=c(0,0,1,0),
                                hawthorne=c(0,1,0,0))
newdata18<-cbind(newdata, age=18)
newdata40<-cbind(newdata, age=40)

pred<-predict(fit2, 
        newdata =  rbind(newdata18,newdata40))

cbind(rbind(newdata18,newdata40),pred)
mean(social$age)

