## load the data and subset them into two parties
MPs <- read.csv("MPs.csv")
MPs.labour <- subset(MPs, subset = (party == "labour"))
MPs.tory <- subset(MPs, subset = (party == "tory"))
## two regressions for Labour: negative and positive margin
labour.fit1 <- lm(ln.net ~ margin,
                  data = MPs.labour[MPs.labour$margin < 0, ])
labour.fit2 <- lm(ln.net ~ margin,
                  data = MPs.labour[MPs.labour$margin > 0, ])
## two regressions for Tory: negative and positive margin
tory.fit1 <- lm(ln.net ~ margin, data = MPs.tory[MPs.tory$margin < 0, ])
tory.fit2 <- lm(ln.net ~ margin, data = MPs.tory[MPs.tory$margin > 0, ])

## Scatterplot with regression lines for tory
plot(MPs.tory$margin, MPs.tory$ln.net, main = "Tory", xlim = c(-0.5, 0.5),
     ylim = c(6, 18), xlab = "Margin of victory",
     ylab = "log net wealth at death")
abline(v = 0, lty = "dashed")
## add regression lines
## Tory: range of predictions
y1t.range <- c(min(MPs.tory$margin), 0) # min to 0
y2t.range <- c(0, max(MPs.tory$margin)) # 0 to max
## predict outcome
y1.tory <- predict(tory.fit1, newdata = data.frame(margin = y1t.range))
y2.tory <- predict(tory.fit2, newdata = data.frame(margin = y2t.range))
lines(y1t.range, y1.tory, col = "blue")
lines(y2t.range, y2.tory, col = "blue")


## load data
data <- read.csv("transfer.csv")
mid1 <- 10188 + (13584 - 10188) / 2
mid2 <- 13584 + (16980 - 13584) / 2
## Create normalized percent score variable
data$pscore <-
  ifelse(data$pop82 <= mid1, (data$pop82 - 10188)/10188,
         ifelse(data$pop82 <= mid2, (data$pop82 - 13584)/13584,
                (data$pop82 - 16980)/16980))*100



dta.below <- subset(data, (data$pscore >= -3) & (data$pscore < 0))
dta.above <- subset(data, (data$pscore >= 0) & (data$pscore <= 3))
## effect on literacy rate
lm(literate91 ~ pscore, data = dta.below)
lm(literate91 ~ pscore, data = dta.above)


lm(poverty91 ~ pscore, data = dta.below)
lm(poverty91 ~ pscore, data = dta.above)

library(ggplot2)

ggplot()+geom_point(aes(x=pscore, y=poverty91),
                    data=subset(data, (data$pscore >= -3) & 
                                  (data$pscore <= 3)))+
  geom_smooth(aes(x=pscore, y=poverty91), 
              data=dta.below, method=lm, se=FALSE)+
  geom_smooth(aes(x=pscore, y=poverty91), 
              data=dta.above, method=lm, se=FALSE)


ggplot()+geom_point(aes(x=pscore, y=poverty80),
                    data=subset(data, (data$pscore >= -3) & 
                                  (data$pscore <= 3)))+
  geom_smooth(aes(x=pscore, y=poverty80), 
              data=dta.below, method=lm, se=FALSE)+
  geom_smooth(aes(x=pscore, y=poverty80), 
              data=dta.above, method=lm, se=FALSE)
lm(poverty80 ~ pscore, data = dta.below)
lm(poverty80 ~ pscore, data = dta.above)
