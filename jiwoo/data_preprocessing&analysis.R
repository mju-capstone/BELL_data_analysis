install.packages('reshape2')
install.packages('ggplot2')
install.packages("dygraphs")
install.packages("highcharter")
install.packages("dplyr")
install.packages("plyr")

library(dygraphs)
library(highcharter)
library(dplyr)
library(ggplot2)
library(reshape2)
library(plyr)

#data
data <- read.csv("data/seoul_traffic_volume.csv", header=T, na.strings=c("."))
data2 <- read.csv("data/seoul_air_quality.csv", header=T, na.strings=c("."))


#traffic volume
a3 <- as.character(data$X0시)
a4 <- as.numeric(a3)
a4 <- data.frame(a4)
names(a4) <- c("X0시")


a <- data.frame(data$일자,data$요일, a4$X0시, data$X1시, data$X2시, data$X3시, data$X4시, data$X5시, data$X6시, data$X7시, data$X8시, data$X9시,
                       data$X10시, data$X11시, data$X12시, data$X13시, data$X14시, data$X15시, data$X16시, data$X17시, data$X18시, data$X19시,
                       data$X20시, data$X21시, data$X22시, data$X23시)
a1 <- na.omit(a)
a2 <- a1[,-1:-2]
a2
a5 <- rowSums(a2)
a6 <- cbind(a1,a5)
a6
str(a6)
a9 <- a6[,1:2]
names(a9) <- c("date", "day")


a7 <- dcast(a6, data.일자 ~ ., value.var="a5", sum, na.rm = TRUE )
names(a7) <-c("date", "t_sum")

a7$date <- as.Date(a7$date)
a7$weekday <- weekdays(a7$date)
a7
names(a7) <-c("date", "t_sum","weekday")
a10 <- as.factor(a7$weekday)
a11 <- cbind(a7[,1:2], a10)
str(a11)
names(a11) <-c("date","t_sum","weekday")


a12 = revalue(a11$weekday, replace=c("월요일"="주중", "화요일"="주중","수요일"="주중", "목요일"="주중",
                             "금요일"="주중", "토요일"="주말","일요일"="주말"))
levels(a12)

a13 <- cbind(a7[,1:2], a10, a12)
a13



#air quality
b <- data.frame(data2$date, data2$pm10)
names(b) <- c("date", "pm10")
b1 <- na.omit(b)
b1$date <- as.Date(b1$date)
b2 <- subset(b1, date>="2018-01-01" & date<"2020-04-01" )
b3 <-data.frame(arrange(b2, date))
b3

# traffic volume & air quality 
c <- merge(a13,b3, by='date')

c1 <-substr(c$date, 1, 7)
c2 <- cbind(c, c1)
c2


c3 <- data.frame(summarise(group_by(c2, c1, a12), t_mean=mean(t_sum), mean=mean(pm10)))
c3
d <- c3[,3:4]

names(d)<- c("dt","da")
attach(d)
plot(dt~da)

# 2020 상관관계 분석 - 피어슨의 상관계수 이용 
cov(dt, da)
cor(dt,da, use='complete.obs', method = 'pearson')
cor.test(dt,da)




