setwd("~/Desktop/Tick Research")
install.packages("ggplot2")
library("ggplot2")

catana <- read.csv("catana.csv")

catana$logcopyn <- log10(catana$copyn)

print(catana)

std <- catana[1:6,]
print (std)

ggplot(std, aes(std$ctstd,std$logcopyn)) + geom_point() + geom_smooth(method=lm)

lm1 <- lm(catana$ctstd~catana$logcopyn)

summary(lm1)
print(lm1)

lm2 <- lm(catana$logcopyn~catana$ctstd)
summary(lm2)

catana$logpredict <- predict.lm(lm2,catana)

print(catana)

catana$copynpred <- 10^(catana$logpredict)

print(catana)


