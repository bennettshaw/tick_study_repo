setwd("~/Desktop/Tick Research")
install.packages("ggplot2")
library("ggplot2")

babsherlock <- read.csv("BabSherlockStd.csv")

babsherlock$logcopyn <- log10(babsherlock$copyn)

print(babsherlock)

std <- babsherlock[1:7,]
print(std)

ggplot(std, aes(std$ct, std$logcopyn)) + geom_point() + geom_smooth(method=lm)

bablm1 <- lm(babsherlock$ct~babsherlock$logcopyn)
summary(bablm1)

bablm2 <- lm(babsherlock$logcopyn~babsherlock$ct)
summary(bablm2)

babsherlock$logpredict <- predict.lm(bablm2, babsherlock)

babsherlock$copynpredict <- 10^(babsherlock$logpredict)
print(babsherlock)

babcopynparasit <- read.csv("Bab_copyn_parasit.csv")
print(babcopynparasit)

ggplot(babcopynparasit, aes(babcopynparasit$copynumber, babcopynparasit$parasitemia)) + geom_point() + geom_smooth(method=lm)


