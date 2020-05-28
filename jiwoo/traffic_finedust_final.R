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
a
a1 <- na.omit(a)
a1
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
str(c2)
cc1 <- substr(c$date, 1, 4)
cc2 <- cbind(c2, cc1)
cc2

d2 <- cc2[cc2$a12=="주중",]
d3 <- cc2[cc2$a12=="주말",]
d2
d3

# month 1~3 
f2018 <- subset(d2, date>="2018-01-01" & date<"2018-04-01" )
f2019 <- subset(d2, date>="2019-01-01" & date<"2019-04-01" )
f2020 <- subset(d2, date>="2020-01-01" & date<"2020-04-01" )
names(f2018) <- c("fa1","fa2","fa3","fa4","fa5","fa6","fa7")
names(f2019) <- c("ff1","ff2","ff3","ff4","ff5","ff6","ff7")
names(f2020) <- c("fff1","fff2","fff3","fff4","fff5","fff6","fff7")
f2018
d4 <- cbind(d2$t_sum,d2$pm10)
d5 <- cbind(d3$t_sum,d3$pm10)

#weekday
d4 <- data.frame(d4)
names(d4) <- c("d_1","d_2")
#weekend
d5 <- data.frame(d5)
names(d5) <- c("d_3","d_4")
d4
d5

#year
dd1 <- aggregate(cc2$t_sum, by=list(cc2$cc1,cc2$a12), FUN=mean)
dd2 <- aggregate(cc2$pm10, by=list(cc2$cc1,cc2$a12), FUN=mean)
names(dd1) <- c("year","week","traffic")
names(dd2) <- c("year","week","air")
dd1
dd2

dd3 <-cbind(dd1, dd2$air)
dd3


#weekday -month
dw1 <- aggregate(d2$t_sum, by=list(d2$c1), FUN=mean)
dw1
dw2 <- aggregate(d2$pm10, by=list(d2$c1), FUN=mean)
dw2
dw3 <- merge(dw1,dw2, by='Group.1')
dw3

#month
c3 <- aggregate(c2$t_sum, by=list(c2$a12,c2$c1), FUN=mean)
c4 <- aggregate(c2$pm10, by=list(c2$a12,c2$c1), FUN=mean)
c5 <-cbind(c3, c4$x)
names(c5) <- c("week","month","dt","da")
c5

cc3 <- aggregate(cc2$t_sum, by=list(cc2$a12,c2$c1), FUN=mean)
cc4 <- aggregate(cc2$pm10, by=list(cc2$a12,c2$c1), FUN=mean)
cc5 <-cbind(cc3, cc4$x)
names(cc5) <- c("week","month","traffic","air")
cc5

cc52018 <- cc5[c(1:24),]
cc52019 <- cc5[c(25:48),]
cc52020 <- cc5[c(49:54),]


d6 <- c5[c5$week=="주중",]
names(d6) <- c("d6_1","d6_2","d6_t","d6_a")
d7 <- c5[c5$week=="주말",]
names(d7) <- c("d7_1","d7_2","d7_t","d7_a")
#data.frame(summarise(group_by(c2,c1,a12),sum=sum(t_sum)))
#c3 <- data.frame(summarise(group_by(c2, a12), t_mean=mean(t_sum), mean=mean(pm10)))
#c3 <- data.frame(summarise(group_by(c2, c2$c1, c2$a12), mean=mean(t_sum)))
c3


d <- c5[,3:4]
names(d)<- c("dt","da")
attach(d)
plot(dt~da)

names(c2)<- c("c_1","c_2","c_3","c_4","c_5","c_6")
attach(c2)
plot(c_2~c_5)

e <- transform(c2, z.c_2 = scale(c_2), z.c_5 = scale(c_5))
e2 <- data.frame(e$z.c_2, e$z.c_5)
attach(e2)
plot(e.z.c_2~e.z.c_5)

#2018~2020
cov(dt, da)
cor(dt,da, use='complete.obs', method = 'pearson')
cor.test(dt,da)

#daily
attach(d4)
cov(d_1, d_2)
cor(d_1, d_2, use='complete.obs', method = 'pearson')
cor.test(d_1, d_2)

attach(d5)
cov(d_3, d_4)
cor(d_3, d_4, use='complete.obs', method = 'pearson')
cor.test(d_3, d_4)

#monthly
attach(d6)
cov(d6_t, d6_a)
cor(d6_t, d6_a, use='complete.obs', method = 'pearson')
cor.test(d6_t, d6_a)
plot(d6_t~d6_a)


attach(d7)
cov(d7_t, d7_a)
cor(d7_t, d7_a, use='complete.obs', method = 'pearson')
cor.test(d7_t, d7_a)

c2018 <- c[1:362,]
c2019 <- c[363:724,]
c2020 <- c[725:815,]

cor.test(c2018$t_sum, c2018$pm10)
cor.test(c2019$t_sum, c2019$pm10)
cor.test(c2020$t_sum, c2020$pm10)




#month 1~3
attach(f2018)
cov(fa5, fa2)
cor(fa5, fa2, use='complete.obs', method = 'pearson')
cor.test(fa5, fa2)
plot(fa5, fa2)
attach(f2019)
cov(ff2, ff5)
cor(ff2, ff5, use='complete.obs', method = 'pearson')
cor.test(ff2, ff5)
attach(f2020)
cov(fff2, fff5)
cor(fff2, fff5, use='complete.obs', method = 'pearson')
cor.test(fff2, fff5)
plot(fff2, fff5)

bar1<-ggplot(dd2, aes(x=year, y=air, fill=week))+ coord_cartesian(ylim = c(30, 47))
f1<-bar1+geom_bar(stat="identity", position = "dodge")+scale_fill_brewer(palette="Pastel1") + ggtitle("주중 및 주말별 서울시 미세먼지(pm10) 농도")+theme(plot.title = element_text(family = "serif", face = "bold", hjust = 0.5, size = 15, color = "gray30"))
f1

bar2<-ggplot(dd1, aes(x=year, y=traffic, fill=week))+ coord_cartesian(ylim = c(6000000, 9500000))
f2<-bar2+geom_bar(stat="identity", position = "dodge")+scale_fill_brewer(palette="Pastel1") + ggtitle("주중 및 주말별 서울시 교통량")+theme(plot.title = element_text(family = "serif", face = "bold", hjust = 0.5, size = 15, color = "gray30"))
f2


bar3<-ggplot(cc52018, aes(x=month, y=air, fill=week))+ coord_cartesian(ylim = c(20, 70))
f3<-bar3+geom_bar(stat="identity", position = "dodge")+ ggtitle("2018 주중 및 주말 서울시 미세먼지(pm10) 농도")+theme(plot.title = element_text(family = "serif", face = "bold", hjust = 0.5, size = 15, color = "gray30"))
f3

bar4<-ggplot(cc52019, aes(x=month, y=air, fill=week))+ coord_cartesian(ylim = c(20, 70))
f4<-bar4+geom_bar(stat="identity", position = "dodge")+ ggtitle("2019 주중 및 주말 서울시 미세먼지(pm10) 농도")+theme(plot.title = element_text(family = "serif", face = "bold", hjust = 0.5, size = 15, color = "gray30"))
f4

bar5<-ggplot(cc52020, aes(x=month, y=air, fill=week))+ coord_cartesian(ylim = c(20, 50))
f5<-bar5+geom_bar(stat="identity", position = "dodge")+ ggtitle("2020 주중 및 주말 서울시 미세먼지(pm10) 농도")+theme(plot.title = element_text(family = "serif", face = "bold", hjust = 0.5, size = 15, color = "gray30"))
f5
cc52018



# finedust&traffic Correlation (weekday)

plot(d2$t_sum~d2$pm10, ylim = c(6000000, 11000000))


cov(dw3$x.x, dw3$x.y)
cor.test(dw3$x.x, dw3$x.y)
plot(dw3$x.x~dw3$x.y)


ggplot(d2, aes(x=pm10, y=t_sum)) + geom_point(shape=19, size=2, color='pink') + xlab("미세먼지 농도(pm10)") + ylab("교통량") +
  ggtitle("주중 서울시 미세먼지(pm10) 농도와 교통량의 상관관계(일 단위)") + theme(plot.title = element_text(family = "serif", face = "bold", hjust = 0.5, size = 15, color = "gray30")) +
  theme(plot.title = element_text(size=10, hjust=0.5)) +
  coord_cartesian(ylim = c(7300000, 11000000)) 


ggplot(dw3, aes(x=x.y, y=x.x)) + geom_point(shape=19, size=2, color='skyblue') + xlab("미세먼지 농도(pm10)") + ylab("교통량") +
  ggtitle("주중 서울시 미세먼지(pm10) 농도와 교통량의 상관관계(월 단위)") + theme(plot.title = element_text(family = "serif", face = "bold", hjust = 0.5, size = 15, color = "gray30")) +
  theme(plot.title = element_text(size=10, hjust=0.5)) +
  coord_cartesian(ylim = c(8000000, 10000000), xlim = c(20, 65)) 


#daily
plot(c2018$t_sum~c2018$pm10, ylim = c(6000000, 11000000))
ggplot(c2018, aes(x=pm10, y=t_sum)) + geom_point(shape=19, size=2, color='pink') + xlab("미세먼지 농도(pm10)") + ylab("교통량") + 
  ggtitle("2018 - traffic volume~fine dust") + 
  theme(plot.title = element_text(face = "bold", hjust = 0.5, size = 15, color = "gray30")) +
  coord_cartesian(ylim = c(6000000, 11000000))

plot(c2019$t_sum~c2019$pm10, ylim = c(6000000, 11000000))
ggplot(c2019, aes(x=pm10, y=t_sum)) + geom_point(shape=19, size=2, color='pink') + xlab("미세먼지 농도(pm10)") + ylab("교통량") + 
  ggtitle("2019 - traffic volume~fine dust") + 
  theme(plot.title = element_text(face = "bold", hjust = 0.5, size = 15, color = "gray30")) +
  coord_cartesian(ylim = c(6000000, 11000000))

plot(c2020$t_sum~c2020$pm10, ylim = c(6000000, 11000000))
ggplot(c2020, aes(x=pm10, y=t_sum)) + geom_point(shape=19, size=2, color='pink') + xlab("미세먼지 농도(pm10)") + ylab("교통량") + 
  ggtitle("2020 - traffic volume~fine dust") + 
  theme(plot.title = element_text(face = "bold", hjust = 0.5, size = 15, color = "gray30")) +
  coord_cartesian(ylim = c(6000000, 11000000))


# # # 
#표준 정규화
n1 <- transform(c2018, z.pm10 = scale(pm10), z.t_sum = scale(t_sum))
n2 <- transform(c2019, z.pm10 = scale(pm10), z.t_sum = scale(t_sum))
n3 <- transform(c2020, z.pm10 = scale(pm10), z.t_sum = scale(t_sum))


ggplot1  <-ggplot()+
  geom_line(data=n1,aes(y=z.t_sum,x= date,colour="darkblue"),size=0.7 )+
  geom_line(data=n1,aes(y=z.pm10,x= date,colour="#ff3366"),size=0.7) +  xlab("date") + ylab("z-score") +
  scale_color_discrete(name = "data", labels = c("미세먼지", "교통량"))+ 
  ggtitle("2018 일별 서울시 교통량 미세먼지 농도 추이 비교")+theme(plot.title = element_text(family = "serif", face = "bold", hjust = 0.5, size = 15, color = "gray10")) 
ggplot1

ggplot2  <-ggplot()+
  geom_line(data=n2,aes(y=z.t_sum,x= date,colour="darkblue"),size=0.7 )+
  geom_line(data=n2,aes(y=z.pm10,x= date,colour="#ff3366"),size=0.7) +  xlab("date") + ylab("z-score") +
  scale_color_discrete(name = "data", labels = c("미세먼지", "교통량"))+ 
  ggtitle("2019 일별 서울시 교통량 미세먼지 농도 추이 비교")+theme(plot.title = element_text(family = "serif", face = "bold", hjust = 0.5, size = 15, color = "gray10")) 
ggplot2

ggplot3  <-ggplot()+
  geom_line(data=n3,aes(y=z.t_sum,x= date,colour="darkblue"),size=0.7 )+
  geom_line(data=n3,aes(y=z.pm10,x= date,colour="#ff3366"),size=0.7) +  xlab("date") + ylab("z-score") +
  scale_color_discrete(name = "data", labels = c("미세먼지", "교통량"))+ 
  ggtitle("2020 일별 서울시 교통량 미세먼지 농도 추이 비교")+theme(plot.title = element_text(family = "serif", face = "bold", hjust = 0.5, size = 15, color = "gray10")) 
ggplot3




dw3
model <- lm(dw3$x.y ~ dw3$x.x)
model

model2 <- lm(d2$pm10 ~ d2$t_sum)
model2

cor.test(dw3$x.x, dw3$x.y)
cor.test(d2$pm10, d2$t_sum)

summary(model)
summary(model2)
