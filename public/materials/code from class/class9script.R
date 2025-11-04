#install.packages("data.table")
library(data.table)
mydata<-fread("./data/GTD_data_small.csv", header=TRUE)
cor(mydata$nkill,mydata$iyear, use="complete.obs")

# Compute correlations with nkill (pairwise complete)
correlations <- cor(mydata, use = "pairwise.complete.obs")
cor_nkill <- correlations["nkill", ]

# Drop nkill itself and sort by absolute correlation
cor_nkill <- sort(abs(cor_nkill[-which(names(cor_nkill) == "nkill")]), decreasing = TRUE)

# Get names of top 7 correlated variables
top7_vars <- names(cor_nkill)[1:7]
top7_vars

m1<-lm(nkill~ nwound+nkillus+ nkillter+ nhostkid+ nreleased+ nwoundte+suicide, data=mydata)
summary(m1)


# Extract R-squared
r2 <- summary(m1)$r.squared
cat("R-squared:", r2, "\n")
