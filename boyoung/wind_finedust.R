# 2014년도 풍향별 평균 미세먼지 수치
wind14 <- read.csv(file="C:/Users/82102/Documents/capstone/1418wind/SURFACE_ASOS_108_HR_2014_2014_2018.csv", header = T, encoding = "EUC-KR")
wind14
finedust14 <- read.csv(file="C:/Users/82102/Documents/capstone/1418pm10/ENV_YDST_108_HR_2014_2014_2017.csv", header = T, encoding = "EUC-KR")
finedust14

names(wind14)[6] <- c("풍향")
names(finedust14)[2] <- c("일시")
names(finedust14)[3] <- c("pm10")


data14 <- merge(wind14, finedust14, by="일시")[, c("일시", "풍향", "pm10")]
head(data14)

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
head(wind15)
names(wind15)[6] <- c("풍향")
names(wind15)[2] <- c("일시")
head(wind15)
finedust15 <- read.csv(file="C:/Users/82102/Documents/capstone/1418pm10/ENV_YDST_108_HR_2015_2015_2017.csv", header = T, encoding = "EUC-KR")
names(finedust15)[3] <- c("pm10")
names(finedust15)[2] <- c("일시")
head(finedust15)

data15 <- merge(wind15, finedust15, by="일시")[, c("일시", "풍향", "pm10")]
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
head(wind16)
names(wind16)[6] <- c("풍향")
head(wind16)
finedust16 <- read.csv(file="C:/Users/82102/Documents/capstone/1418pm10/ENV_YDST_108_HR_2016_2016_2017.csv", header = T, encoding = "EUC-KR")
head(finedust16)
names(finedust16)[3] <- c("pm10")
names(finedust16)[2] <- c("일시")
head(finedust16)

data16 <- merge(wind16, finedust16, by="일시")[, c("일시", "풍향", "pm10")]
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
head(wind17)
names(wind17)[6] <- c("풍향")
head(wind17)
finedust17 <- read.csv(file="C:/Users/82102/Documents/capstone/1418pm10/ENV_YDST_108_HR_2017_2017_2018.csv", header = T, encoding = "EUC-KR")
head(finedust17)
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
head(wind18)
names(wind18)[6] <- c("풍향")
head(wind18)
finedust18 <- read.csv(file="C:/Users/82102/Documents/capstone/1418pm10/ENV_YDST_108_HR_2018_2018_2019.csv", header = T, encoding = "EUC-KR")
head(finedust18)
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

# 2019년도 풍향별 평균 미세먼지 수치
wind19 <- read.csv(file="C:/Users/82102/Documents/capstone/1418wind/ASOS_2019.csv", header = T, encoding = "EUC-KR")
head(wind19)
names(wind19)[4] <- c("풍향")
head(wind19)
finedust19 <- read.csv(file="C:/Users/82102/Documents/capstone/1418pm10/pm10_2019.csv", header = T, encoding = "EUC-KR")
head(finedust19)
names(finedust19)[4] <- c("pm10")
head(finedust19)

data19 <- merge(wind19, finedust19, by="일시")[, c("일시", "풍향", "pm10")]
head(data19)

data19 <- within(data19, {
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
head(data19)
aggregate(pm10~풍향2, data19, mean)

# 2020년도 풍향별 평균 미세먼지 수치
wind20 <- read.csv(file="C:/Users/82102/Documents/capstone/1418wind/ASOS_2020.csv", header = T, encoding = "EUC-KR")
head(wind20)
names(wind20)[4] <- c("풍향")
head(wind20)
finedust20 <- read.csv(file="C:/Users/82102/Documents/capstone/1418pm10/pm10_2020.csv", header = T, encoding = "EUC-KR")
head(finedust20)
names(finedust20)[4] <- c("pm10")
head(finedust20)

data20 <- merge(wind20, finedust20, by="일시")[, c("일시", "풍향", "pm10")]
head(data20)

data20 <- within(data20, {
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
head(data20)
aggregate(pm10~풍향2, data20, mean)

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
agg_data19 <- aggregate(pm10~풍향2, data19, mean)
agg_data19$풍향2 <- factor(agg_data19$풍향2, levels=c("N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"))
agg_data20 <- aggregate(pm10~풍향2, data20, mean)
agg_data20$풍향2 <- factor(agg_data20$풍향2, levels=c("N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"))


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

f = ggplot(agg_data19, aes(x=풍향2, y=pm10, fill=pm10))+
  geom_bar(stat='identity')+theme_light()+
  scale_fill_gradient(low='white', high='red', limits=c(30, 50))
f + coord_polar()

g = ggplot(agg_data20, aes(x=풍향2, y=pm10, fill=pm10))+
  geom_bar(stat='identity')+theme_light()+
  scale_fill_gradient(low='white', high='red', limits=c(35, 55))
g + coord_polar()


# 계절별 데이터프레임 만들기
names(data19)[1] <- c("일시")

data14$일시 <- as.Date(data14$일시)
data15$일시 <- as.Date(data15$일시)
data16$일시 <- as.Date(data16$일시)
data17$일시 <- as.Date(data17$일시)
data18$일시 <- as.Date(data18$일시)
data19$일시 <- as.Date(data19$일시)
data20$일시 <- as.Date(data20$일시)


spring <- subset(data14, 일시>="2014-03-01 00:00" & 일시<="2014-05-31 23:00")
spring <- rbind(spring, subset(data15, 일시>="2015-03-01 00:00" & 일시<="2015-05-31 23:00"))
spring <- rbind(spring, subset(data16, 일시>="2016-03-01 00:00" & 일시<="2016-05-31 23:00"))
spring <- rbind(spring, subset(data17, 일시>="2017-03-01 00:00" & 일시<="2017-05-31 23:00"))
spring <- rbind(spring, subset(data18, 일시>="2018-03-01 00:00" & 일시<="2018-05-31 23:00"))
spring <- rbind(spring, subset(data19, 일시>="2019-03-01 00:00" & 일시<="2019-05-31 23:00"))

summer <- subset(data14, 일시>="2014-06-01 00:00" & 일시<="2014-08-31 23:00")
summer <- rbind(summer, subset(data15, 일시>="2015-06-01 00:00" & 일시<="2015-08-31 23:00"))
summer <- rbind(summer, subset(data16, 일시>="2016-06-01 00:00" & 일시<="2016-08-31 23:00"))
summer <- rbind(summer, subset(data17, 일시>="2017-06-01 00:00" & 일시<="2017-08-31 23:00"))
summer <- rbind(summer, subset(data18, 일시>="2018-06-01 00:00" & 일시<="2018-08-31 23:00"))
summer <- rbind(summer, subset(data19, 일시>="2019-06-01 00:00" & 일시<="2019-08-31 23:00"))

fall <- subset(data14, 일시>="2014-09-01 00:00" & 일시<="2014-11-30 23:00")
fall <- rbind(fall, subset(data15, 일시>="2015-09-01 00:00" & 일시<="2015-11-30 23:00"))
fall <- rbind(fall, subset(data16, 일시>="2016-09-01 00:00" & 일시<="2016-11-30 23:00"))
fall <- rbind(fall, subset(data17, 일시>="2017-09-01 00:00" & 일시<="2017-11-30 23:00"))
fall <- rbind(fall, subset(data18, 일시>="2018-09-01 00:00" & 일시<="2018-11-30 23:00"))
fall <- rbind(fall, subset(data19, 일시>="2019-09-01 00:00" & 일시<="2019-11-30 23:00"))

winter <- subset(data14, 일시>="2014-12-01 00:00" & 일시<="2014-12-31 23:00")
winter <- rbind(winter, subset(data14, 일시>="2014-01-01 00:00" & 일시<="2014-02-28 23:00"))
winter <- rbind(winter, subset(data15, 일시>="2015-12-01 00:00" & 일시<="2015-12-31 23:00"))
winter <- rbind(winter, subset(data15, 일시>="2015-01-01 00:00" & 일시<="2015-02-28 23:00"))
winter <- rbind(winter, subset(data16, 일시>="2016-12-01 00:00" & 일시<="2016-12-31 23:00"))
winter <- rbind(winter, subset(data16, 일시>="2016-01-01 00:00" & 일시<="2016-02-29 23:00"))
winter <- rbind(winter, subset(data17, 일시>="2017-12-01 00:00" & 일시<="2017-12-31 23:00"))
winter <- rbind(winter, subset(data17, 일시>="2017-01-01 00:00" & 일시<="2017-02-28 23:00"))
winter <- rbind(winter, subset(data18, 일시>="2018-12-01 00:00" & 일시<="2018-12-31 23:00"))
winter <- rbind(winter, subset(data18, 일시>="2018-01-01 00:00" & 일시<="2018-02-28 23:00"))
winter <- rbind(winter, subset(data19, 일시>="2019-12-01 00:00" & 일시<="2019-12-31 23:00"))
winter <- rbind(winter, subset(data19, 일시>="2019-01-01 00:00" & 일시<="2019-02-28 23:00"))


# 계절별로 어떤 방향의 바람이 많이 부는지 집계
install.packages("dplyr")
library(dplyr)
count1 <- count(spring, 풍향2)
count2 <- count(summer, 풍향2)
count3 <- count(fall, 풍향2)
count4 <- count(winter, 풍향2)
names(count4)[2] <- c("count")



# 계절별 / 풍향별 평균 미세먼지량 집계
agg_spr <- aggregate(pm10~풍향2, spring, mean)
agg_spr <- merge(count1, agg_spr, by='풍향2')
agg_spr$풍향2 <- factor(agg_spr$풍향2, levels=c("N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"))

agg_sum <- aggregate(pm10~풍향2, summer, mean)
agg_sum <- merge(count2, agg_sum, by='풍향2')
agg_sum$풍향2 <- factor(agg_sum$풍향2, levels=c("N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"))

agg_fal <- aggregate(pm10~풍향2, fall, mean)
agg_fal <- merge(count3, agg_fal, by='풍향2')
agg_fal$풍향2 <- factor(agg_fal$풍향2, levels=c("N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"))

agg_win <- aggregate(pm10~풍향2, winter, mean)
agg_win <- merge(count4, agg_win, by='풍향2')
agg_win$풍향2 <- factor(agg_win$풍향2, levels=c("N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"))


# 봄 그래프
library(grid)

x <- ggplot(agg_spr, aes(x=풍향2))
x <- x + geom_bar(aes(y=count), stat="identity")
x <- x + geom_line(aes(y=pm10*30), colour="skyblue", size=2, group=1)
x <- x + scale_y_continuous(sec.axis = sec_axis(~./30, name="pm10"))

x <- x + annotate("text", x="S", y=900, colour="black", label="풍향별 count")
x <- x + annotate("text", x="S", y=2000, colour="black", label="pm10")
x <- x + annotate("segment", x="S", y=800, colour="black", xend="SSW", yend=700, arrow=arrow())
x <- x + annotate("segment", x="S", y=1900, colour="skyblue", xend="SSW", yend=1850, arrow=arrow())
x

# 여름 그래프
y <- ggplot(agg_sum, aes(x=풍향2))
y <- y + geom_bar(aes(y=count), stat="identity") + coord_cartesian(ylim = c(0, 2500))
y <- y + geom_line(aes(y=pm10*30), colour="skyblue", size=2, group=1)
y <- y + scale_y_continuous(sec.axis = sec_axis(~./30, name="pm10"))
y

# 가을 그래프
z <- ggplot(agg_fal, aes(x=풍향2))
z <- z + geom_bar(aes(y=count), stat="identity") + coord_cartesian(ylim = c(0, 2500))
z <- z + geom_line(aes(y=pm10*30), colour="skyblue", size=2, group=1)
z <- z + scale_y_continuous(sec.axis = sec_axis(~./30, name="pm10"))
z

# 겨울 그래프
w <- ggplot(agg_win, aes(x=풍향2))
w <- w + geom_bar(aes(y=count), stat="identity") + coord_cartesian(ylim = c(0, 2500))
w <- w + geom_line(aes(y=pm10*30), colour="skyblue", size=2, group=1)
w <- w + scale_y_continuous(sec.axis = sec_axis(~./30, name="pm10"))
w

# 풍향 라벨 추가
data20 <- within(data20, {
  풍향3 = integer(0)
  풍향3[풍향2 == "N"] = 0
  풍향3[풍향2 == "NNE"] = 0
  풍향3[풍향2 == "NE"] = 0
  풍향3[풍향2 == "ENE"] = 0
  풍향3[풍향2 == "E"] = 0
  풍향3[풍향2 == "ESE"] = 0
  풍향3[풍향2 == "SE"] = 0
  풍향3[풍향2 == "SSE"] = 0
  풍향3[풍향2 == "S"] = 0
  풍향3[풍향2 == "SSW"] = 1
  풍향3[풍향2 == "SW"] = 1
  풍향3[풍향2 == "WSW"] = 1
  풍향3[풍향2 == "W"] = 1
  풍향3[풍향2 == "WNW"] = 1
  풍향3[풍향2 == "NW"] = 1
  풍향3[풍향2 == "NNW"] = 1
})

install.packages("reshape2")
library(reshape2)

test14 <- dcast(data14, 일시 ~ ., value.var="풍향3", sum)
test14_2 <- dcast(data14, 일시 ~ ., value.var="pm10", mean)
test14 <- merge(x = test14, y = test14_2, by = '일시')
str(test14)
names(test14)[2] <- c("풍향count")
names(test14)[3] <- c("평균미세먼지")
str(test14)
test14 <- test14[, -1]
test <- test14
head(test)

test15 <- dcast(data15, 일시 ~ ., value.var="풍향3", sum)
test15_2 <- dcast(data15, 일시 ~ ., value.var="pm10", mean)
test15 <- merge(x = test15, y = test15_2, by = '일시')
str(test15)
names(test15)[2] <- c("풍향count")
names(test15)[3] <- c("평균미세먼지")
test15 <- test15[, -1]
str(test15)
test <- rbind(test, test15)
tail(test)


test16 <- dcast(data16, 일시 ~ ., value.var="풍향3", sum)
test16_2 <- dcast(data16, 일시 ~ ., value.var="pm10", mean)
test16 <- merge(x = test16, y = test16_2, by = '일시')
str(test16)
names(test16)[2] <- c("풍향count")
names(test16)[3] <- c("평균미세먼지")
str(test16)
test16 <- test16[, -1]
str(test16)
test <- rbind(test, test16)
tail(test)

test17 <- dcast(data17, 일시 ~ ., value.var="풍향3", sum)
test17_2 <- dcast(data17, 일시 ~ ., value.var="pm10", mean)
test17 <- merge(x = test17, y = test17_2, by = '일시')
str(test17)
names(test17)[2] <- c("풍향count")
names(test17)[3] <- c("평균미세먼지")
str(test17)
test17 <- test17[, -1]
str(test17)
test <- rbind(test, test17)
tail(test)

test18 <- dcast(data18, 일시 ~ ., value.var="풍향3", sum)
test18_2 <- dcast(data18, 일시 ~ ., value.var="pm10", mean)
test18 <- merge(x = test18, y = test18_2, by = '일시')
str(test18)
names(test18)[2] <- c("풍향count")
names(test18)[3] <- c("평균미세먼지")
str(test18)
test18 <- test18[, -1]
str(test18)
test <- rbind(test, test18)
tail(test)

test19 <- dcast(data19, 일시 ~ ., value.var="풍향3", sum)
test19_2 <- dcast(data19, 일시 ~ ., value.var="pm10", mean)
test19 <- merge(x = test19, y = test19_2, by = '일시')
str(test19)
names(test19)[2] <- c("풍향count")
names(test19)[3] <- c("평균미세먼지")
str(test19)
test19 <- test19[, -1]
str(test19)
test <- rbind(test, test19)
tail(test)

colSums(is.na(test))
test <- na.omit(test)

cor(test19)
plot(test19)

