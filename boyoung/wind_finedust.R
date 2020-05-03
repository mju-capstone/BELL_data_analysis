# 2014년도 풍향별 평균 미세먼지 수치
wind14 <- read.csv(file="C:/Users/82102/Documents/capstone/1418wind/SURFACE_ASOS_108_HR_2014_2014_2018.csv", header = T, encoding = "EUC-KR")
wind14
finedust14 <- read.csv(file="C:/Users/82102/Documents/capstone/1418pm10/ENV_YDST_108_HR_2014_2014_2017.csv", header = T, encoding = "EUC-KR")
finedust14


data14 <- merge(wind14, finedust14, by="시간")[, c("시간", "풍향", "pm10")]
data14

data14 <- within(data14, {
  풍향2 = character(0)
  풍향2[풍향 >= 0 & 풍향 < 11.25] = "N"
  풍향2[풍향 > 11.25 & 풍향 < 33.75] = "NNE"
  풍향2[풍향 > 33.75 & 풍향 < 56.25] = "NE"
  풍향2[풍향 > 56.25 & 풍향 < 78.75] = "ENE"
  풍향2[풍향 > 78.75 & 풍향 < 101.25] = "E"
  풍향2[풍향 > 101.25 & 풍향 < 123.75] = "ESE"
  풍향2[풍향 > 123.75 & 풍향 < 146.25] = "SE"
  풍향2[풍향 > 146.25 & 풍향 < 168.75] = "SSE"
  풍향2[풍향 > 168.75 & 풍향 < 191.25] = "S"
  풍향2[풍향 > 191.25 & 풍향 < 213.75] = "SSW"
  풍향2[풍향 > 213.75 & 풍향 < 236.25] = "SW"
  풍향2[풍향 > 236.25 & 풍향 < 258.75] = "WSW"
  풍향2[풍향 > 258.75 & 풍향 < 281.25] = "W"
  풍향2[풍향 > 282.25 & 풍향 < 303.75] = "WNW"
  풍향2[풍향 > 303.75 & 풍향 < 326.25] = "NW"
  풍향2[풍향 > 326.25 & 풍향 < 348.75] = "NNW"
  풍향2[풍향 > 348.75 & 풍향 <= 360 ] = "N"
  
  풍향2 = factor(풍향2, level = c("N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"))
})

aggregate(pm10~풍향2, data14, mean)


# 2015년도 풍향별 평균 미세먼지 수치
wind15 <- read.csv(file="C:/Users/82102/Documents/capstone/1418wind/SURFACE_ASOS_108_HR_2015_2015_2018.csv", header = T, encoding = "EUC-KR")
wind15
names(wind15)[6] <- c("풍향")
names(wind15)[2] <- c("시간")
head(wind15)
finedust15 <- read.csv(file="C:/Users/82102/Documents/capstone/1418pm10/ENV_YDST_108_HR_2015_2015_2017.csv", header = T, encoding = "EUC-KR")
names(finedust15)[3] <- c("pm10")
finedust15

data15 <- merge(wind15, finedust15, by="시간")[, c("시간", "풍향", "pm10")]
head(data15)

data15 <- within(data15, {
  풍향2 = character(0)
  풍향2[풍향 >= 0 & 풍향 < 11.25] = "N"
  풍향2[풍향 > 11.25 & 풍향 < 33.75] = "NNE"
  풍향2[풍향 > 33.75 & 풍향 < 56.25] = "NE"
  풍향2[풍향 > 56.25 & 풍향 < 78.75] = "ENE"
  풍향2[풍향 > 78.75 & 풍향 < 101.25] = "E"
  풍향2[풍향 > 101.25 & 풍향 < 123.75] = "ESE"
  풍향2[풍향 > 123.75 & 풍향 < 146.25] = "SE"
  풍향2[풍향 > 146.25 & 풍향 < 168.75] = "SSE"
  풍향2[풍향 > 168.75 & 풍향 < 191.25] = "S"
  풍향2[풍향 > 191.25 & 풍향 < 213.75] = "SSW"
  풍향2[풍향 > 213.75 & 풍향 < 236.25] = "SW"
  풍향2[풍향 > 236.25 & 풍향 < 258.75] = "WSW"
  풍향2[풍향 > 258.75 & 풍향 < 281.25] = "W"
  풍향2[풍향 > 282.25 & 풍향 < 303.75] = "WNW"
  풍향2[풍향 > 303.75 & 풍향 < 326.25] = "NW"
  풍향2[풍향 > 326.25 & 풍향 < 348.75] = "NNW"
  풍향2[풍향 > 348.75 & 풍향 <= 360 ] = "N"
  
  풍향2 = factor(풍향2, level = c("N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"))
})
head(data15)
aggregate(pm10~풍향2, data15, mean)

# 2016년도 풍향별 평균 미세먼지 수치
wind16 <- read.csv(file="C:/Users/82102/Documents/capstone/1418wind/SURFACE_ASOS_108_HR_2016_2016_2017.csv", header = T, encoding = "EUC-KR")
wind16
names(wind16)[6] <- c("풍향")
names(wind16)[2] <- c("시간")
head(wind16)
finedust16 <- read.csv(file="C:/Users/82102/Documents/capstone/1418pm10/ENV_YDST_108_HR_2016_2016_2017.csv", header = T, encoding = "EUC-KR")
names(finedust16)[3] <- c("pm10")
finedust16

data16 <- merge(wind16, finedust16, by="시간")[, c("시간", "풍향", "pm10")]
head(data16)

data16 <- within(data16, {
  풍향2 = character(0)
  풍향2[풍향 >= 0 & 풍향 < 11.25] = "N"
  풍향2[풍향 > 11.25 & 풍향 < 33.75] = "NNE"
  풍향2[풍향 > 33.75 & 풍향 < 56.25] = "NE"
  풍향2[풍향 > 56.25 & 풍향 < 78.75] = "ENE"
  풍향2[풍향 > 78.75 & 풍향 < 101.25] = "E"
  풍향2[풍향 > 101.25 & 풍향 < 123.75] = "ESE"
  풍향2[풍향 > 123.75 & 풍향 < 146.25] = "SE"
  풍향2[풍향 > 146.25 & 풍향 < 168.75] = "SSE"
  풍향2[풍향 > 168.75 & 풍향 < 191.25] = "S"
  풍향2[풍향 > 191.25 & 풍향 < 213.75] = "SSW"
  풍향2[풍향 > 213.75 & 풍향 < 236.25] = "SW"
  풍향2[풍향 > 236.25 & 풍향 < 258.75] = "WSW"
  풍향2[풍향 > 258.75 & 풍향 < 281.25] = "W"
  풍향2[풍향 > 282.25 & 풍향 < 303.75] = "WNW"
  풍향2[풍향 > 303.75 & 풍향 < 326.25] = "NW"
  풍향2[풍향 > 326.25 & 풍향 < 348.75] = "NNW"
  풍향2[풍향 > 348.75 & 풍향 <= 360 ] = "N"
  
  풍향2 = factor(풍향2, level = c("N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"))
})
head(data16)
aggregate(pm10~풍향2, data16, mean)

# 2017년도 풍향별 평균 미세먼지 수치
wind17 <- read.csv(file="C:/Users/82102/Documents/capstone/1418wind/SURFACE_ASOS_108_HR_2017_2017_2018.csv", header = T, encoding = "EUC-KR")
wind17
names(wind17)[6] <- c("풍향")
head(wind17)
finedust17 <- read.csv(file="C:/Users/82102/Documents/capstone/1418pm10/ENV_YDST_108_HR_2017_2017_2018.csv", header = T, encoding = "EUC-KR")
names(finedust17)[3] <- c("pm10")
head(finedust17)

data17 <- merge(wind17, finedust17, by="일시")[, c("일시", "풍향", "pm10")]
head(data17)

data17 <- within(data17, {
  풍향2 = character(0)
  풍향2[풍향 >= 0 & 풍향 < 11.25] = "N"
  풍향2[풍향 > 11.25 & 풍향 < 33.75] = "NNE"
  풍향2[풍향 > 33.75 & 풍향 < 56.25] = "NE"
  풍향2[풍향 > 56.25 & 풍향 < 78.75] = "ENE"
  풍향2[풍향 > 78.75 & 풍향 < 101.25] = "E"
  풍향2[풍향 > 101.25 & 풍향 < 123.75] = "ESE"
  풍향2[풍향 > 123.75 & 풍향 < 146.25] = "SE"
  풍향2[풍향 > 146.25 & 풍향 < 168.75] = "SSE"
  풍향2[풍향 > 168.75 & 풍향 < 191.25] = "S"
  풍향2[풍향 > 191.25 & 풍향 < 213.75] = "SSW"
  풍향2[풍향 > 213.75 & 풍향 < 236.25] = "SW"
  풍향2[풍향 > 236.25 & 풍향 < 258.75] = "WSW"
  풍향2[풍향 > 258.75 & 풍향 < 281.25] = "W"
  풍향2[풍향 > 282.25 & 풍향 < 303.75] = "WNW"
  풍향2[풍향 > 303.75 & 풍향 < 326.25] = "NW"
  풍향2[풍향 > 326.25 & 풍향 < 348.75] = "NNW"
  풍향2[풍향 > 348.75 & 풍향 <= 360 ] = "N"
  
  풍향2 = factor(풍향2, level = c("N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"))
})
head(data17)
aggregate(pm10~풍향2, data17, mean)

# 2018년도 풍향별 평균 미세먼지 수치
wind18 <- read.csv(file="C:/Users/82102/Documents/capstone/1418wind/SURFACE_ASOS_108_HR_2018_2018_2019.csv", header = T, encoding = "EUC-KR")
wind18
names(wind18)[6] <- c("풍향")
head(wind18)
finedust18 <- read.csv(file="C:/Users/82102/Documents/capstone/1418pm10/ENV_YDST_108_HR_2018_2018_2019.csv", header = T, encoding = "EUC-KR")
names(finedust18)[3] <- c("pm10")
head(finedust18)

data18 <- merge(wind18, finedust18, by="일시")[, c("일시", "풍향", "pm10")]
head(data18)

data18 <- within(data18, {
  풍향2 = character(0)
  풍향2[풍향 >= 0 & 풍향 < 11.25] = "N"
  풍향2[풍향 > 11.25 & 풍향 < 33.75] = "NNE"
  풍향2[풍향 > 33.75 & 풍향 < 56.25] = "NE"
  풍향2[풍향 > 56.25 & 풍향 < 78.75] = "ENE"
  풍향2[풍향 > 78.75 & 풍향 < 101.25] = "E"
  풍향2[풍향 > 101.25 & 풍향 < 123.75] = "ESE"
  풍향2[풍향 > 123.75 & 풍향 < 146.25] = "SE"
  풍향2[풍향 > 146.25 & 풍향 < 168.75] = "SSE"
  풍향2[풍향 > 168.75 & 풍향 < 191.25] = "S"
  풍향2[풍향 > 191.25 & 풍향 < 213.75] = "SSW"
  풍향2[풍향 > 213.75 & 풍향 < 236.25] = "SW"
  풍향2[풍향 > 236.25 & 풍향 < 258.75] = "WSW"
  풍향2[풍향 > 258.75 & 풍향 < 281.25] = "W"
  풍향2[풍향 > 282.25 & 풍향 < 303.75] = "WNW"
  풍향2[풍향 > 303.75 & 풍향 < 326.25] = "NW"
  풍향2[풍향 > 326.25 & 풍향 < 348.75] = "NNW"
  풍향2[풍향 > 348.75 & 풍향 <= 360 ] = "N"
  
  풍향2 = factor(풍향2, level = c("N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"))
})
head(data18)
aggregate(pm10~풍향2, data18, mean)


# null값 처리한 데이터로 다시 불러옴
data14 <- read.csv(file = "df14.csv", header = T, encoding = "EUC-KR")
data15 <- read.csv(file = "df15.csv", header = T, encoding = "EUC-KR")
data16 <- read.csv(file = "df16.csv", header = T, encoding = "EUC-KR")
data17 <- read.csv(file = "df17.csv", header = T, encoding = "EUC-KR")
data18 <- read.csv(file = "df18.csv", header = T, encoding = "EUC-KR")

# 풍향별 평균 미세먼지량 집계
agg_data14 <- aggregate(pm10~풍향2, data14, mean)
agg_data14$풍향2 <- factor(agg_data14$풍향2, levels=c("N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"))
agg_data15 <- aggregate(pm10~풍향2, data15, mean)
agg_data15$풍향2 <- factor(agg_data15$풍향2, levels=c("N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"))
agg_data16 <- aggregate(pm10~풍향2, data16, mean)
agg_data16$풍향2 <- factor(agg_data16$풍향2, levels=c("N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"))
agg_data17 <- aggregate(pm10~풍향2, data17, mean)
agg_data17$풍향2 <- factor(agg_data17$풍향2, levels=c("N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"))
agg_data18 <- aggregate(pm10~풍향2, data18, mean)
agg_data18$풍향2 <- factor(agg_data18$풍향2, levels=c("N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"))


# 풍향별 평균 미세먼지량 그래프 그리기
install.packages("ggplot2")
library(ggplot2)
require(ggplot2)

a = ggplot(agg_data14, aes(x=풍향2, y=pm10, fill=pm10))+
  geom_bar(stat='identity')+theme_light()+
  scale_fill_gradient(low='white', high='red', limits=c(25, 65))
a + coord_polar()

b = ggplot(agg_data15, aes(x=풍향2, y=pm10, fill=pm10))+
  geom_bar(stat='identity')+theme_light()+
  scale_fill_gradient(low='white', high='red', limits=c(20, 60))
b + coord_polar()

c = ggplot(agg_data16, aes(x=풍향2, y=pm10, fill=pm10))+
  geom_bar(stat='identity')+theme_light()+
  scale_fill_gradient(low='white', high='red', limits=c(25, 55))
c + coord_polar()

d = ggplot(agg_data17, aes(x=풍향2, y=pm10, fill=pm10))+
  geom_bar(stat='identity')+theme_light()+
  scale_fill_gradient(low='white', high='red', limits=c(20, 50))
d + coord_polar()

e = ggplot(agg_data18, aes(x=풍향2, y=pm10, fill=pm10))+
  geom_bar(stat='identity')+theme_light()+
  scale_fill_gradient(low='white', high='red', limits=c(20, 50))
e + coord_polar()
