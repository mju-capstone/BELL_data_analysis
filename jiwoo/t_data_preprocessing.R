install.packages('reshape2')
install.packages('ggplot2')
install.packages("dygraphs")
install.packages("highcharter")
install.packages("dplyr")

# for graph
library(dygraphs)
library(highcharter)
library(dplyr)
library(ggplot2)
library(reshape2)

#data
data <- read.csv("data/2018_seoul_traffic.csv", header=T, na.strings=c("."))
data2 <- read.csv("data/seoul_air_quality.csv", header=T, na.strings=c("."))
data3 <- read.csv("data/Trafficvolume_byday.csv", header=T, na.strings=c("."))
data4 <- read.csv("data/2019_2020_seoul_traffic.csv", header=T, na.strings=c("."))




################### data - 2018 seoul traffic volume ############################

traffic <- data.frame(data$X0시, data$X1시, data$X2시, data$X3시, data$X4시, data$X5시, data$X6시, data$X7시, data$X8시, data$X9시,
                      data$X10시, data$X11시, data$X12시, data$X13시, data$X14시, data$X15시, data$X16시, data$X17시, data$X18시, data$X19시,
                      data$X20시, data$X21시, data$X22시, data$X23시)


#시간대별 결측값 평균치로 대체 
mean_0 <- mean(traffic[,1], na.rm=TRUE)
mean_1 <- mean(traffic[,2], na.rm=TRUE)
mean_2 <- mean(traffic[,3], na.rm=TRUE)
mean_3 <- mean(traffic[,4], na.rm=TRUE)
mean_4 <- mean(traffic[,5], na.rm=TRUE)
mean_5 <- mean(traffic[,6], na.rm=TRUE)
mean_6 <- mean(traffic[,7], na.rm=TRUE)
mean_7 <- mean(traffic[,8], na.rm=TRUE)
mean_8 <- mean(traffic[,9], na.rm=TRUE)
mean_9 <- mean(traffic[,10], na.rm=TRUE)
mean_10 <- mean(traffic[,11], na.rm=TRUE)
mean_11 <- mean(traffic[,12], na.rm=TRUE)
mean_12 <- mean(traffic[,13], na.rm=TRUE)
mean_13 <- mean(traffic[,14], na.rm=TRUE)
mean_14 <- mean(traffic[,15], na.rm=TRUE)
mean_15 <- mean(traffic[,16], na.rm=TRUE)
mean_16 <- mean(traffic[,17], na.rm=TRUE)
mean_17 <- mean(traffic[,18], na.rm=TRUE)
mean_18 <- mean(traffic[,19], na.rm=TRUE)
mean_19 <- mean(traffic[,20], na.rm=TRUE)
mean_20 <- mean(traffic[,21], na.rm=TRUE)
mean_21 <- mean(traffic[,22], na.rm=TRUE)
mean_22 <- mean(traffic[,23], na.rm=TRUE)
mean_23 <- mean(traffic[,24], na.rm=TRUE)


traffic$data.X0시[is.na(traffic$data.X0시)] <- mean_0
traffic$data.X1시[is.na(traffic$data.X1시)] <- mean_1
traffic$data.X2시[is.na(traffic$data.X2시)] <- mean_2
traffic$data.X3시[is.na(traffic$data.X3시)] <- mean_3
traffic$data.X4시[is.na(traffic$data.X4시)] <- mean_4
traffic$data.X5시[is.na(traffic$data.X5시)] <- mean_5
traffic$data.X6시[is.na(traffic$data.X6시)] <- mean_6
traffic$data.X7시[is.na(traffic$data.X7시)] <- mean_7
traffic$data.X8시[is.na(traffic$data.X8시)] <- mean_8
traffic$data.X9시[is.na(traffic$data.X9시)] <- mean_9
traffic$data.X10시[is.na(traffic$data.X10시)] <- mean_10
traffic$data.X11시[is.na(traffic$data.X11시)] <- mean_11
traffic$data.X12시[is.na(traffic$data.X12시)] <- mean_12
traffic$data.X13시[is.na(traffic$data.X13시)] <- mean_13
traffic$data.X14시[is.na(traffic$data.X14시)] <- mean_14
traffic$data.X15시[is.na(traffic$data.X15시)] <- mean_15
traffic$data.X16시[is.na(traffic$data.X16시)] <- mean_16
traffic$data.X17시[is.na(traffic$data.X17시)] <- mean_17
traffic$data.X18시[is.na(traffic$data.X18시)] <- mean_18
traffic$data.X19시[is.na(traffic$data.X19시)] <- mean_19
traffic$data.X20시[is.na(traffic$data.X20시)] <- mean_20
traffic$data.X21시[is.na(traffic$data.X21시)] <- mean_21
traffic$data.X22시[is.na(traffic$data.X22시)] <- mean_22
traffic$data.X23시[is.na(traffic$data.X23시)] <- mean_23



#각 날짜별로 시간대별 교통량정보를 합산
x <- apply(traffic,1,sum)
xx <- data.frame(x)

yy<- data.frame(data$일자)
traffic_1<- cbind(traffic,xx)
traffic_2<- cbind(traffic_1,yy)
traffic_2

daily_traffic<- dcast(traffic_2, data.일자 ~ ., value.var="x", sum, na.rm = TRUE )
daily_traffic


write.csv(daily_traffic, file="2018_daily_traffic.csv", row.names=TRUE) 



#데이터에 요일 추가 
day1 <- data.frame(rep( c("월", "화","수","목","금","토","일"), 52))
day <- rbind(day1,"월")
daily_traffic1 <- cbind(daily_traffic, day)
names(daily_traffic1) <- c("일자","교통량합계","요일")
daily_traffic1

#월 단위로 분석하기 위해 '월' 행 추가
month <-substr(daily_traffic1$일자, 1, 6)
daily_traffic2 <- cbind(daily_traffic1, month)
names(daily_traffic2) <- c("일자","교통량합계","요일","월")
daily_traffic2

#요일에 lavel매긴 후 순서대로 정렬 
daily_traffic2$요일 <- factor(daily_traffic2$요일, levels=c("월","화","수","목","금","토","일"))
levels(daily_traffic2$요일)
daily_traffic3 <- data.frame(summarise(group_by(daily_traffic2, 월, 요일), sum=sum(교통량합계)))
daily_traffic3

traffic1 <- data.frame(daily_traffic3$sum)
traffic1


#daily_traffic4 - 날짜+요일 합해준 행 생성 
p<-paste(daily_traffic3$월, daily_traffic3$요일, sep="(")
pp<-paste(p,")")
label <- gsub(pattern = "\\s", replacement = "", x = pp)
daily_traffic4 <- cbind(daily_traffic3, label)
daily_traffic4

write.csv(daily_traffic4, file="2018_traffic_by_day.csv", row.names=TRUE) 


#year_traffic - 1년의 총 요일별 교통량 통계
#year_traffic<- dcast(daily_traffic4, 요일 ~ ., value.var="sum", sum, na.rm = TRUE )
#names(year_traffic) <- c("요일","교통량합계")
#year_traffic
#str(year_traffic)

################### data - 2019 2020 seoul traffic volume ############################

traffic2 <- data.frame(data4$X0시, data4$X1시, data4$X2시, data4$X3시, data4$X4시, data4$X5시, data4$X6시, data4$X7시, data4$X8시, data4$X9시,
                      data4$X10시, data4$X11시, data4$X12시, data4$X13시, data4$X14시, data4$X15시, data4$X16시, data4$X17시, data4$X18시, data4$X19시,
                      data4$X20시, data4$X21시, data4$X22시, data4$X23시)

traffic2
#시간대별 결측값 평균치로 대체 
mean_0_ <- mean(traffic2[,1], na.rm=TRUE)
mean_1_ <- mean(traffic2[,2], na.rm=TRUE)
mean_2_ <- mean(traffic2[,3], na.rm=TRUE)
mean_3_ <- mean(traffic2[,4], na.rm=TRUE)
mean_4_ <- mean(traffic2[,5], na.rm=TRUE)
mean_5_ <- mean(traffic2[,6], na.rm=TRUE)
mean_6_ <- mean(traffic2[,7], na.rm=TRUE)
mean_7_ <- mean(traffic2[,8], na.rm=TRUE)
mean_8_ <- mean(traffic2[,9], na.rm=TRUE)
mean_9_ <- mean(traffic2[,10], na.rm=TRUE)
mean_10_ <- mean(traffic2[,11], na.rm=TRUE)
mean_11_ <- mean(traffic2[,12], na.rm=TRUE)
mean_12_ <- mean(traffic2[,13], na.rm=TRUE)
mean_13_ <- mean(traffic2[,14], na.rm=TRUE)
mean_14_ <- mean(traffic2[,15], na.rm=TRUE)
mean_15_ <- mean(traffic2[,16], na.rm=TRUE)
mean_16_ <- mean(traffic2[,17], na.rm=TRUE)
mean_17_ <- mean(traffic2[,18], na.rm=TRUE)
mean_18_ <- mean(traffic2[,19], na.rm=TRUE)
mean_19_ <- mean(traffic2[,20], na.rm=TRUE)
mean_20_ <- mean(traffic2[,21], na.rm=TRUE)
mean_21_ <- mean(traffic2[,22], na.rm=TRUE)
mean_22_ <- mean(traffic2[,23], na.rm=TRUE)
mean_23_ <- mean(traffic2[,24], na.rm=TRUE)


traffic2$data4.X0시[is.na(traffic2$data4.X0시)] <- mean_0_
traffic2$data4.X1시[is.na(traffic2$data4.X1시)] <- mean_1_
traffic2$data4.X2시[is.na(traffic2$data4.X2시)] <- mean_2_
traffic2$data4.X3시[is.na(traffic2$data4.X3시)] <- mean_3_
traffic2$data4.X4시[is.na(traffic2$data4.X4시)] <- mean_4_
traffic2$data4.X5시[is.na(traffic2$data4.X5시)] <- mean_5_
traffic2$data4.X6시[is.na(traffic2$data4.X6시)] <- mean_6_
traffic2$data4.X7시[is.na(traffic2$data4.X7시)] <- mean_7_
traffic2$data4.X8시[is.na(traffic2$data4.X8시)] <- mean_8_
traffic2$data4.X9시[is.na(traffic2$data4.X9시)] <- mean_9_
traffic2$data4.X10시[is.na(traffic2$data4.X10시)] <- mean_10_
traffic2$data4.X11시[is.na(traffic2$data4.X11시)] <- mean_11_
traffic2$data4.X12시[is.na(traffic2$data4.X12시)] <- mean_12_
traffic2$data4.X13시[is.na(traffic2$data4.X13시)] <- mean_13_
traffic2$data4.X14시[is.na(traffic2$data4.X14시)] <- mean_14_
traffic2$data4.X15시[is.na(traffic2$data4.X15시)] <- mean_15_
traffic2$data4.X16시[is.na(traffic2$data4.X16시)] <- mean_16_
traffic2$data4.X17시[is.na(traffic2$data4.X17시)] <- mean_17_
traffic2$data4.X18시[is.na(traffic2$data4.X18시)] <- mean_18_
traffic2$data4.X19시[is.na(traffic2$data4.X19시)] <- mean_19_
traffic2$data4.X20시[is.na(traffic2$data4.X20시)] <- mean_20_
traffic2$data4.X21시[is.na(traffic2$data4.X21시)] <- mean_21_
traffic2$data4.X22시[is.na(traffic2$data4.X22시)] <- mean_22_
traffic2$data4.X23시[is.na(traffic2$data4.X23시)] <- mean_23_



#각 날짜별로 시간대별 교통량정보를 합산
b <- apply(traffic2,1,sum)
b2 <- data.frame(b)

b3 <- data.frame(data4$일자)
traffic_b1<- cbind(traffic2,b2)
traffic_b2<- cbind(traffic_b1,b3)
traffic_b2

daily_traffic_b1<- dcast(traffic_b2, data4.일자 ~ ., value.var="b", sum, na.rm = TRUE )
daily_traffic_b1 

# 2019 일별 교통량 
traffic_19 <- daily_traffic_b1[c(1:365),]
names(traffic_19) <- c("일자","교통량")
traffic_19

write.csv(traffic_19, file="2019_daily_traffic.csv", row.names=TRUE) 

# 2020 일별 교통량 
traffic_20 <- daily_traffic_b1[c(366:456),]
traffic_20

write.csv(traffic_20, file="2020_daily_traffic.csv", row.names=TRUE) 


#데이터에 요일 추가 
day_b1 <- data.frame(rep( c("화","수","목","금","토","일","월"), 65))
day_b1 <- rbind(day_b1,"화")
daily_traffic_b3 <- cbind(daily_traffic_b1, day_b1)
names(daily_traffic_b3) <- c("일자","교통량합계","요일")
daily_traffic_b3

#월 단위로 분석하기 위해 '월' 행 추가
month_b1 <-substr(daily_traffic_b3$일자, 1, 6)
daily_traffic_b4 <- cbind(daily_traffic_b3, month_b1)
names(daily_traffic_b4) <- c("일자","교통량합계","요일","월")
daily_traffic_b4

#요일에 lavel매긴 후 순서대로 정렬 
daily_traffic_b4$요일 <- factor(daily_traffic_b4$요일, levels=c("월","화","수","목","금","토","일"))
levels(daily_traffic_b4$요일)
daily_traffic_b4 <- data.frame(summarise(group_by(daily_traffic_b4, 월, 요일), sum=sum(교통량합계)))

daily_traffic_b4



#날짜+요일 합해준 행 생성 
b6 <-paste(daily_traffic_b4$월, daily_traffic_b4$요일, sep="(")
b7<-paste(b6,")")
d_label <- gsub(pattern = "\\s", replacement = "", x = b7)
daily_traffic_b5 <- cbind(daily_traffic_b4, d_label)
daily_traffic_b5

#2019년 요일별 합산 데이터 
t_2019 <- subset(daily_traffic_b5, "201901"==월 |"201902" ==월|"201903" ==월|"201904" ==월|"201905" ==월|"201906" ==월|"201907"==월|
                 "201908"==월|"201909" ==월|"201910" ==월|"201911" ==월| "201912" ==월)
t_2019


write.csv(t_2019, file="2019_traffic_day_of_the_week.csv", row.names=TRUE) 


#2020년 요일별 합산 데이터 
t_2020 <- subset(daily_traffic_b5, "202001"==월 | "202002"==월 | "202003" ==월)
t_2020
write.csv(t_2020, file="2020_traffic_day_of_the_week.csv", row.names=TRUE) 


#year_traffic - 1년의 총 요일별 교통량 통계
tt_2020<- dcast(t_2020, 요일 ~ ., value.var="sum", sum, na.rm = TRUE )
names(tt_2020) <- c("요일","교통량합계")

tt_2020<- tt_2020 %>% mutate(x = 교통량합계*0.0000004) 
tt_2020


################### data2 - seoul air quality ############################ 


#필요한 행 추출 
air <- data.frame(data2$date, data2$pm10)
names(air) <- c("일자", "pm10")
air

air$일자 <- as.Date(air$일자)
air2018 <- subset(air, 일자>="2018-01-01" & 일자<"2019-01-01" )
daily_air <-data.frame(arrange(air2018, 일자))



#결측값 평균치로 대체 
air_mean_0 <- mean(daily_air[,2], na.rm=TRUE)
daily_air$pm10[is.na(daily_air$pm10)] <- air_mean_0
daily_air
write.csv(daily_air, file="2018_daily_air_quality.csv", row.names=TRUE) 


#데이터에 요일 추가 
h1 <- data.frame(rep( c("주중", "주중","주중","주중","주중","주말","주말"), 52))
air_day2 <- rbind(h1,"주중")
daily_air2 <- cbind(daily_air, air_day2)
names(daily_air2) <- c("일자", "pm10", "요일")
daily_air2

#데이터에 요일 추가 
air_day1 <- data.frame(rep( c("월", "화","수","목","금","토","일"), 52))
air_day2 <- rbind(air_day1,"월")
daily_air2 <- cbind(daily_air, air_day2)
names(daily_air2) <- c("일자", "pm10", "요일")
daily_air2



#월별 평균을 위한 '월' 행 추가 
month2 <-substr(daily_air2$일자, 1, 7)
daily_air3 <- cbind(daily_air2, month2)
names(daily_air3) <- c("일자","pm10","요일","월")
daily_air3

#요일에 lavel매긴 후 순서대로 정렬 
daily_air3$요일 <- factor(daily_air3$요일, levels=c("월","화","수","목","금","토","일"))
levels(daily_air3$요일)
daily_air3 <- data.frame(summarise(group_by(daily_air3, 월, 요일), mean=mean(pm10)))
daily_air3
write.csv(daily_air3, file="2018_air_quality_by_day.csv", row.names=TRUE) 

#air_2018 - 1년의 총 요일별 미세먼지농도 통계
air_y2018<- dcast(daily_air3, 요일 ~ ., value.var="mean",mean, na.rm = TRUE )
names(air_y2018) <- c("day","pm10")
air_y2018

air_yy2018<- air_y2018 %>% mutate(x100 = pm10*100) 

###################################################################

air1920 <- subset(air, 일자>="2019-01-01" & 일자<"2020-04-01" )
daily_air_b1 <-data.frame(arrange(air1920, 일자))
daily_air_b1 <- rbind(daily_air_b1, list("2019-12-30",NA))


daily_air_b1$일자 <- as.Date(daily_air_b1$일자)
daily_air_b1 <-data.frame(arrange(daily_air_b1, 일자))
daily_air_b1



#결측값 평균치로 대체 
air_mean_b0 <- mean(daily_air_b1[,2], na.rm=TRUE)
daily_air_b1$pm10[is.na(daily_air_b1$pm10)] <- air_mean_b0
daily_air_b1
write.csv(daily_air_b1, file="2019_2020_daily_air_quality.csv", row.names=TRUE) 

#데이터에 요일 추가 
air_dayb1 <- data.frame(rep( c("화","수","목","금","토","일","월"), 65))
daily_air_b2 <- cbind(daily_air_b1, air_dayb1)
names(daily_air_b2) <- c("일자", "pm10", "요일")
daily_air_b2


#월별 평균을 위한 '월' 행 추가 
month_b2 <-substr(daily_air_b2$일자, 1, 7)
daily_air_b3 <- cbind(daily_air_b2, month_b2)
names(daily_air_b3) <- c("일자","pm10","요일","월")

#일별 미세먼지 
daily_air_b3
air19 <- daily_air_b3[c(1:365),]
air19
air20 <- subset(daily_air_b3, 일자>="2020-01-01" & 일자<"2020-04-01" )
air20

#요일에 lavel매긴 후 순서대로 정렬 
daily_air_b3$요일 <- factor(daily_air_b3$요일, levels=c("월","화","수","목","금","토","일"))
levels(daily_air_b3$요일)
daily_air_b4 <- data.frame(summarise(group_by(daily_air_b3, 월, 요일), mean=mean(pm10)))
daily_air_b4


write.csv(daily_air_b4, file="2019_2020_air_quality_by_day.csv", row.names=TRUE) 

#요일별 미세먼지 
daily_air_b4

air19_b <- subset(daily_air_b4, "2019-01"==월 |"2019-02" ==월|"2019-03" ==월|"2019-04" ==월|"2019-05" ==월|"2019-06" ==월|"2019-07"==월|
                    "2019-08"==월|"2019-09" ==월|"2019-10" ==월|"2019-11" ==월| "2019-12" ==월 )
air19_b
air20_b <- subset(daily_air_b4, "2020-01"==월 | "2020-02"==월 | "2020-03" ==월 )
air20_b

# 2019 - 1년의 총 요일별 미세먼지농도 통계
air19_b2<- dcast(daily_air_b4, 요일 ~ ., value.var="mean",mean, na.rm = TRUE )
names(air19_b2) <- c("day","pm10")
air19_b2
air19_b2<- air %>% mutate(x100 = pm10*100) 
air19_b2

# 2020 - 1년의 총 요일별 미세먼지농도 통계
air20_b1<- dcast(air20_b, 요일 ~ ., value.var="mean",mean, na.rm = TRUE )
names(air20_b1) <- c("day","pm10")
air20_b1




################### data3 - Traffic in Seoul by day  ############################

data3
t_2018 <- subset(data3, year=="2018")
t_2018

tt_2019 <- subset(data3, year=="2019")
tt_2019


air_yy20182<- t_2018  %>% mutate(traffic_0.01 = traffic*0.01) 
a_2018 <- cbind(air_yy2018,air_yy20182$traffic_0.01, t_2018$traffic) 
names(a_2018) <- c("day","pm10","x100","t_0.01","traffic")
a_2018

tt2019<- tt_2019  %>% mutate(traffic_0.01 = traffic*0.01) 
tt_2019 <- cbind(tt_2019,tt2019$traffic_0.01) 
names(tt_2019) <- c("year","day","traffic","t_0.01")
tt_2019







