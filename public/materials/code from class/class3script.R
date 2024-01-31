vig<-read.csv("vignettes.csv")
vig_chi <- subset(vig, china == 1)
vig_mex <- subset(vig, china == 0)
# China
chi_table <- prop.table(table(vig_chi$self))
barplot(chi_table, main = "China")
# Mexico
mex_table <- prop.table(table(vig_mex$self))
barplot(mex_table, main = "Mexico")

#Compute the proportion of respondents,
#again separately for China and Mexico,
#who ranks themselves (according to the
#self-assessment question) as having
#less say in the government’s decisions
#than Moses (the last vignette).

vig_chi$less_than_moses<-ifelse(vig_chi$self<vig_chi$moses,1,0)
mean(vig_chi$less_than_moses)

vig_mex$less_than_moses<-ifelse(vig_mex$self<vig_mex$moses,1,0)
mean(vig_mex$less_than_moses)

vig_chi<-subset(vig_chi, vig_chi$alison>=vig_chi$jane &
                  vig_chi$jane>=vig_chi$moses )

vig_mex<-subset(vig_mex, vig_mex$alison>=vig_mex$jane &
                  vig_mex$jane>=vig_mex$moses )

vig_chi$rank<- NA
vig_chi$rank<-ifelse(vig_chi$self<vig_chi$moses,1,
                     vig_chi$rank)
vig_chi$rank<-ifelse(vig_chi$self==vig_chi$moses | (vig_chi$self>vig_chi$moses & vig_chi$self<vig_chi$jane), 2,vig_chi$rank)
vig_chi$rank<-ifelse(vig_chi$self==vig_chi$jane | (vig_chi$self> vig_chi$jane & vig_chi$self<vig_chi$alison),3,vig_chi$rank)
vig_chi$rank<-ifelse(vig_chi$self==vig_chi$alison |  vig_chi$self>vig_chi$alison, 4,vig_chi$rank)
chi_table <- prop.table(table(vig_chi$rank))
barplot(chi_table, main = "China")





