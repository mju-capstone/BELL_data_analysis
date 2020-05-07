## 연도별 미세먼지 데이터 plot

library(ggplot2)

# 맥 한글깨짐 
theme_set(theme_grey(base_family='AppleGothic'))
# seoul
seoul2019_1 = seoul_aqi[grep("2019/1/", seoul_aqi$date),]
seoul2019_2 = seoul_aqi[grep("2019/2/", seoul_aqi$date),]
seoul2019_3 = seoul_aqi[grep("2019/3/", seoul_aqi$date),]
seoul2019_4 = seoul_aqi[grep("2019/4/", seoul_aqi$date),]

seoul2019_ggDF = rbind(seoul2019_1, seoul2019_2, seoul2019_3, seoul2019_4)
seoul2019_gg = mean(seoul2019_ggDF$pm10, na.rm = TRUE)

seoul2018_1 = seoul_aqi[grep("2018/1/", seoul_aqi$date),]
seoul2018_2 = seoul_aqi[grep("2018/2/", seoul_aqi$date),]
seoul2018_3 = seoul_aqi[grep("2018/3/", seoul_aqi$date),]
seoul2018_4 = seoul_aqi[grep("2018/4/", seoul_aqi$date),]

seoul2018_ggDF = rbind(seoul2018_1, seoul2018_2, seoul2018_3, seoul2018_4)
seoul2018_gg = mean(seoul2018_ggDF$pm10, na.rm = TRUE)


# busan
busan2019_1 = busan_aqi[grep("2019/1/", busan_aqi$date),]
busan2019_2 = busan_aqi[grep("2019/2/", busan_aqi$date),]
busan2019_3 = busan_aqi[grep("2019/3/", busan_aqi$date),]
busan2019_4 = busan_aqi[grep("2019/4/", busan_aqi$date),]

busan2019_ggDF = rbind(busan2019_1, busan2019_2, busan2019_3, busan2019_4)
busan2019_gg = mean(busan2019_ggDF$pm10, na.rm = TRUE)

busan2018_1 = busan_aqi[grep("2018/1/", busan_aqi$date),]
busan2018_2 = busan_aqi[grep("2018/2/", busan_aqi$date),]
busan2018_3 = busan_aqi[grep("2018/3/", busan_aqi$date),]
busan2018_4 = busan_aqi[grep("2018/4/", busan_aqi$date),]

busan2018_ggDF = rbind(busan2018_1, busan2018_2, busan2018_3, busan2018_4)
busan2018_gg = mean(busan2018_ggDF$pm10, na.rm = TRUE)


# daegu
daegu2019_1 = daegu_aqi[grep("2019/1/", daegu_aqi$date),]
daegu2019_2 = daegu_aqi[grep("2019/2/", daegu_aqi$date),]
daegu2019_3 = daegu_aqi[grep("2019/3/", daegu_aqi$date),]
daegu2019_4 = daegu_aqi[grep("2019/4/", daegu_aqi$date),]

daegu2019_ggDF = rbind(daegu2019_1, daegu2019_2, daegu2019_3, daegu2019_4)
daegu2019_gg = mean(daegu2019_ggDF$pm10, na.rm = TRUE)

daegu2018_1 = daegu_aqi[grep("2018/1/", daegu_aqi$date),]
daegu2018_2 = daegu_aqi[grep("2018/2/", daegu_aqi$date),]
daegu2018_3 = daegu_aqi[grep("2018/3/", daegu_aqi$date),]
daegu2018_4 = daegu_aqi[grep("2018/4/", daegu_aqi$date),]

daegu2018_ggDF = rbind(daegu2018_1, daegu2018_2, daegu2018_3, daegu2018_4)
daegu2018_gg = mean(daegu2018_ggDF$pm10, na.rm = TRUE)


# incheon
incheon2019_1 = incheon_aqi[grep("2019/1/", incheon_aqi$date),]
incheon2019_2 = incheon_aqi[grep("2019/2/", incheon_aqi$date),]
incheon2019_3 = incheon_aqi[grep("2019/3/", incheon_aqi$date),]
incheon2019_4 = incheon_aqi[grep("2019/4/", incheon_aqi$date),]

incheon2019_ggDF = rbind(incheon2019_1, incheon2019_2, incheon2019_3, incheon2019_4)
incheon2019_gg = mean(incheon2019_ggDF$pm10, na.rm = TRUE)

incheon2018_1 = incheon_aqi[grep("2018/1/", incheon_aqi$date),]
incheon2018_2 = incheon_aqi[grep("2018/2/", incheon_aqi$date),]
incheon2018_3 = incheon_aqi[grep("2018/3/", incheon_aqi$date),]
incheon2018_4 = incheon_aqi[grep("2018/4/", incheon_aqi$date),]

incheon2018_ggDF = rbind(incheon2018_1, incheon2018_2, incheon2018_3, incheon2018_4)
incheon2018_gg = mean(incheon2018_ggDF$pm10, na.rm = TRUE)


# gwangju
gwangju2019_1 = gwangju_aqi[grep("2019/1/", gwangju_aqi$date),]
gwangju2019_2 = gwangju_aqi[grep("2019/2/", gwangju_aqi$date),]
gwangju2019_3 = gwangju_aqi[grep("2019/3/", gwangju_aqi$date),]
gwangju2019_4 = gwangju_aqi[grep("2019/4/", gwangju_aqi$date),]

gwangju2019_ggDF = rbind(gwangju2019_1, gwangju2019_2, gwangju2019_3, gwangju2019_4)
gwangju2019_gg = mean(gwangju2019_ggDF$pm10, na.rm = TRUE)

gwangju2018_1 = gwangju_aqi[grep("2018/1/", gwangju_aqi$date),]
gwangju2018_2 = gwangju_aqi[grep("2018/2/", gwangju_aqi$date),]
gwangju2018_3 = gwangju_aqi[grep("2018/3/", gwangju_aqi$date),]
gwangju2018_4 = gwangju_aqi[grep("2018/4/", gwangju_aqi$date),]

gwangju2018_ggDF = rbind(gwangju2018_1, gwangju2018_2, gwangju2018_3, gwangju2018_4)
gwangju2018_gg = mean(gwangju2018_ggDF$pm10, na.rm = TRUE)


# daejeon
daejeon2019_1 = daejeon_aqi[grep("2019/1/", daejeon_aqi$date),]
daejeon2019_2 = daejeon_aqi[grep("2019/2/", daejeon_aqi$date),]
daejeon2019_3 = daejeon_aqi[grep("2019/3/", daejeon_aqi$date),]
daejeon2019_4 = daejeon_aqi[grep("2019/4/", daejeon_aqi$date),]

daejeon2019_ggDF = rbind(daejeon2019_1, daejeon2019_2, daejeon2019_3, daejeon2019_4)
daejeon2019_gg = mean(daejeon2019_ggDF$pm10, na.rm = TRUE)

daejeon2018_1 = daejeon_aqi[grep("2018/1/", daejeon_aqi$date),]
daejeon2018_2 = daejeon_aqi[grep("2018/2/", daejeon_aqi$date),]
daejeon2018_3 = daejeon_aqi[grep("2018/3/", daejeon_aqi$date),]
daejeon2018_4 = daejeon_aqi[grep("2018/4/", daejeon_aqi$date),]

daejeon2018_ggDF = rbind(daejeon2018_1, daejeon2018_2, daejeon2018_3, daejeon2018_4)
daejeon2018_gg = mean(daejeon2018_ggDF$pm10, na.rm = TRUE)


# ulsan
ulsan2019_1 = ulsan_aqi[grep("2019/1/", ulsan_aqi$date),]
ulsan2019_2 = ulsan_aqi[grep("2019/2/", ulsan_aqi$date),]
ulsan2019_3 = ulsan_aqi[grep("2019/3/", ulsan_aqi$date),]
ulsan2019_4 = ulsan_aqi[grep("2019/4/", ulsan_aqi$date),]

ulsan2019_ggDF = rbind(ulsan2019_1, ulsan2019_2, ulsan2019_3, ulsan2019_4)
ulsan2019_gg = mean(ulsan2019_ggDF$pm10, na.rm = TRUE)

ulsan2018_1 = ulsan_aqi[grep("2018/1/", ulsan_aqi$date),]
ulsan2018_2 = ulsan_aqi[grep("2018/2/", ulsan_aqi$date),]
ulsan2018_3 = ulsan_aqi[grep("2018/3/", ulsan_aqi$date),]
ulsan2018_4 = ulsan_aqi[grep("2018/4/", ulsan_aqi$date),]

ulsan2018_ggDF = rbind(ulsan2018_1, ulsan2018_2, ulsan2018_3, ulsan2018_4)
ulsan2018_gg = mean(ulsan2018_ggDF$pm10, na.rm = TRUE)


# sejong
sejong2019_1 = sejong_aqi[grep("2019/1/", sejong_aqi$date),]
sejong2019_2 = sejong_aqi[grep("2019/2/", sejong_aqi$date),]
sejong2019_3 = sejong_aqi[grep("2019/3/", sejong_aqi$date),]
sejong2019_4 = sejong_aqi[grep("2019/4/", sejong_aqi$date),]

sejong2019_ggDF = rbind(sejong2019_1, sejong2019_2, sejong2019_3, sejong2019_4)
sejong2019_gg = mean(sejong2019_ggDF$pm10, na.rm = TRUE)

sejong2018_1 = sejong_aqi[grep("2018/1/", sejong_aqi$date),]
sejong2018_2 = sejong_aqi[grep("2018/2/", sejong_aqi$date),]
sejong2018_3 = sejong_aqi[grep("2018/3/", sejong_aqi$date),]
sejong2018_4 = sejong_aqi[grep("2018/4/", sejong_aqi$date),]

sejong2018_ggDF = rbind(sejong2018_1, sejong2018_2, sejong2018_3, sejong2018_4)
sejong2018_gg = mean(sejong2018_ggDF$pm10, na.rm = TRUE)

# gyeongi
sejong2019_1 = sejong_aqi[grep("2019/1/", sejong_aqi$date),]
sejong2019_2 = sejong_aqi[grep("2019/2/", sejong_aqi$date),]
sejong2019_3 = sejong_aqi[grep("2019/3/", sejong_aqi$date),]
sejong2019_4 = sejong_aqi[grep("2019/4/", sejong_aqi$date),]

sejong2019_ggDF = rbind(sejong2019_1, sejong2019_2, sejong2019_3, sejong2019_4)
sejong2019_gg = mean(sejong2019_ggDF$pm10, na.rm = TRUE)

sejong2018_1 = sejong_aqi[grep("2018/1/", sejong_aqi$date),]
sejong2018_2 = sejong_aqi[grep("2018/2/", sejong_aqi$date),]
sejong2018_3 = sejong_aqi[grep("2018/3/", sejong_aqi$date),]
sejong2018_4 = sejong_aqi[grep("2018/4/", sejong_aqi$date),]

sejong2018_ggDF = rbind(sejong2018_1, sejong2018_2, sejong2018_3, sejong2018_4)
sejong2018_gg = mean(sejong2018_ggDF$pm10, na.rm = TRUE)


# gangwon
gangwon2019_1 = gangwon_aqi[grep("2019/1/", gangwon_aqi$date),]
gangwon2019_2 = gangwon_aqi[grep("2019/2/", gangwon_aqi$date),]
gangwon2019_3 = gangwon_aqi[grep("2019/3/", gangwon_aqi$date),]
gangwon2019_4 = gangwon_aqi[grep("2019/4/", gangwon_aqi$date),]

gangwon2019_ggDF = rbind(gangwon2019_1, gangwon2019_2, gangwon2019_3, gangwon2019_4)
gangwon2019_gg = mean(gangwon2019_ggDF$pm10, na.rm = TRUE)

gangwon2018_1 = gangwon_aqi[grep("2018/1/", gangwon_aqi$date),]
gangwon2018_2 = gangwon_aqi[grep("2018/2/", gangwon_aqi$date),]
gangwon2018_3 = gangwon_aqi[grep("2018/3/", gangwon_aqi$date),]
gangwon2018_4 = gangwon_aqi[grep("2018/4/", gangwon_aqi$date),]

gangwon2018_ggDF = rbind(gangwon2018_1, gangwon2018_2, gangwon2018_3, gangwon2018_4)
gangwon2018_gg = mean(gangwon2018_ggDF$pm10, na.rm = TRUE)


# chungbuk
chungbuk2019_1 = chungbuk_aqi[grep("2019/1/", chungbuk_aqi$date),]
chungbuk2019_2 = chungbuk_aqi[grep("2019/2/", chungbuk_aqi$date),]
chungbuk2019_3 = chungbuk_aqi[grep("2019/3/", chungbuk_aqi$date),]
chungbuk2019_4 = chungbuk_aqi[grep("2019/4/", chungbuk_aqi$date),]

chungbuk2019_ggDF = rbind(chungbuk2019_1, chungbuk2019_2, chungbuk2019_3, chungbuk2019_4)
chungbuk2019_gg = mean(chungbuk2019_ggDF$pm10, na.rm = TRUE)

chungbuk2018_1 = chungbuk_aqi[grep("2018/1/", chungbuk_aqi$date),]
chungbuk2018_2 = chungbuk_aqi[grep("2018/2/", chungbuk_aqi$date),]
chungbuk2018_3 = chungbuk_aqi[grep("2018/3/", chungbuk_aqi$date),]
chungbuk2018_4 = chungbuk_aqi[grep("2018/4/", chungbuk_aqi$date),]

chungbuk2018_ggDF = rbind(chungbuk2018_1, chungbuk2018_2, chungbuk2018_3, chungbuk2018_4)
chungbuk2018_gg = mean(chungbuk2018_ggDF$pm10, na.rm = TRUE)

# chungnam
chungnam2019_1 = chungnam_aqi[grep("2019/1/", chungnam_aqi$date),]
chungnam2019_2 = chungnam_aqi[grep("2019/2/", chungnam_aqi$date),]
chungnam2019_3 = chungnam_aqi[grep("2019/3/", chungnam_aqi$date),]
chungnam2019_4 = chungnam_aqi[grep("2019/4/", chungnam_aqi$date),]

chungnam2019_ggDF = rbind(chungnam2019_1, chungnam2019_2, chungnam2019_3, chungnam2019_4)
chungnam2019_gg = mean(chungnam2019_ggDF$pm10, na.rm = TRUE)

chungnam2018_1 = chungnam_aqi[grep("2018/1/", chungnam_aqi$date),]
chungnam2018_2 = chungnam_aqi[grep("2018/2/", chungnam_aqi$date),]
chungnam2018_3 = chungnam_aqi[grep("2018/3/", chungnam_aqi$date),]
chungnam2018_4 = chungnam_aqi[grep("2018/4/", chungnam_aqi$date),]

chungnam2018_ggDF = rbind(chungnam2018_1, chungnam2018_2, chungnam2018_3, chungnam2018_4)
chungnam2018_gg = mean(chungnam2018_ggDF$pm10, na.rm = TRUE)


# jeonbuk
jeonbuk2019_1 = jeonbuk_aqi[grep("2019/1/", jeonbuk_aqi$date),]
jeonbuk2019_2 = jeonbuk_aqi[grep("2019/2/", jeonbuk_aqi$date),]
jeonbuk2019_3 = jeonbuk_aqi[grep("2019/3/", jeonbuk_aqi$date),]
jeonbuk2019_4 = jeonbuk_aqi[grep("2019/4/", jeonbuk_aqi$date),]

jeonbuk2019_ggDF = rbind(jeonbuk2019_1, jeonbuk2019_2, jeonbuk2019_3, jeonbuk2019_4)
jeonbuk2019_gg = mean(jeonbuk2019_ggDF$pm10, na.rm = TRUE)

jeonbuk2018_1 = jeonbuk_aqi[grep("2018/1/", jeonbuk_aqi$date),]
jeonbuk2018_2 = jeonbuk_aqi[grep("2018/2/", jeonbuk_aqi$date),]
jeonbuk2018_3 = jeonbuk_aqi[grep("2018/3/", jeonbuk_aqi$date),]
jeonbuk2018_4 = jeonbuk_aqi[grep("2018/4/", jeonbuk_aqi$date),]

jeonbuk2018_ggDF = rbind(jeonbuk2018_1, jeonbuk2018_2, jeonbuk2018_3, jeonbuk2018_4)
jeonbuk2018_gg = mean(jeonbuk2018_ggDF$pm10, na.rm = TRUE)


# jeonnam
jeonnam2019_1 = jeonnam_aqi[grep("2019/1/", jeonnam_aqi$date),]
jeonnam2019_2 = jeonnam_aqi[grep("2019/2/", jeonnam_aqi$date),]
jeonnam2019_3 = jeonnam_aqi[grep("2019/3/", jeonnam_aqi$date),]
jeonnam2019_4 = jeonnam_aqi[grep("2019/4/", jeonnam_aqi$date),]

jeonnam2019_ggDF = rbind(jeonnam2019_1, jeonnam2019_2, jeonnam2019_3, jeonnam2019_4)
jeonnam2019_gg = mean(jeonnam2019_ggDF$pm10, na.rm = TRUE)

jeonnam2018_1 = jeonnam_aqi[grep("2018/1/", jeonnam_aqi$date),]
jeonnam2018_2 = jeonnam_aqi[grep("2018/2/", jeonnam_aqi$date),]
jeonnam2018_3 = jeonnam_aqi[grep("2018/3/", jeonnam_aqi$date),]
jeonnam2018_4 = jeonnam_aqi[grep("2018/4/", jeonnam_aqi$date),]

jeonnam2018_ggDF = rbind(jeonnam2018_1, jeonnam2018_2, jeonnam2018_3, jeonnam2018_4)
jeonnam2018_gg = mean(jeonnam2018_ggDF$pm10, na.rm = TRUE)


# gyeongbuk
gyeongbuk2019_1 = gyeongbuk_aqi[grep("2019/1/", gyeongbuk_aqi$date),]
gyeongbuk2019_2 = gyeongbuk_aqi[grep("2019/2/", gyeongbuk_aqi$date),]
gyeongbuk2019_3 = gyeongbuk_aqi[grep("2019/3/", gyeongbuk_aqi$date),]
gyeongbuk2019_4 = gyeongbuk_aqi[grep("2019/4/", gyeongbuk_aqi$date),]

jeonnam2019_ggDF = rbind(jeonnam2019_1, jeonnam2019_2, jeonnam2019_3, jeonnam2019_4)
jeonnam2019_gg = mean(jeonnam2019_ggDF$pm10, na.rm = TRUE)

jeonnam2018_1 = jeonnam_aqi[grep("2018/1/", jeonnam_aqi$date),]
jeonnam2018_2 = jeonnam_aqi[grep("2018/2/", jeonnam_aqi$date),]
jeonnam2018_3 = jeonnam_aqi[grep("2018/3/", jeonnam_aqi$date),]
jeonnam2018_4 = jeonnam_aqi[grep("2018/4/", jeonnam_aqi$date),]

jeonnam2018_ggDF = rbind(jeonnam2018_1, jeonnam2018_2, jeonnam2018_3, jeonnam2018_4)
jeonnam2018_gg = mean(jeonnam2018_ggDF$pm10, na.rm = TRUE)





# gyeongnam
# jeju










sido_nm2 <- c("서울", "부산", "대구", "인천",
             "광주", "대전", "울산", "세종",
             "경기", "강원", "충북", "충남", "전북",
             "전남", "경북", "경남",
             "제주")

aqidata2020_gg = data.frame(sido_nm=sido_nm2, aqi=aqi2020)
aqidata2019_gg = data.frame(sido_nm=sido_nm2, aqi=aqi2019)



ggplot(data=aqidata2020_gg, aes(x=sido_nm, y=aqi)) + geom_bar(stat="identity", fill="steelblue", width = 0.5) + coord_cartesian(ylim=c(20,55))

ggplot(data=aqidata2019_gg, aes(x=sido_nm, y=aqi)) + geom_bar(stat="identity", fill="steelblue", width = 0.5) + coord_cartesian(ylim=c(20,55))



ggplot(data=aqidata2019, aes(x=sido_nm, y=aqi), ylim=c(30, 60)) + geom_bar(stat="identity", fill="steelblue")
ggplot(data=aqidata2018, aes(x=sido_nm, y=aqi), ylim=c(30, 60)) + geom_bar(stat="identity", fill="steelblue")










busan_aqi = read.csv("./aqidata/busan.csv")





