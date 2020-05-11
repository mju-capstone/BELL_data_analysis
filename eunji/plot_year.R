## 연도별 미세먼지 데이터 plot

library(ggplot2)

# 맥 한글깨짐 
theme_set(theme_grey(base_family='AppleGothic'))

# seoul
seoul_aqi = read.csv("./aqidata/seoul.csv")

seoul_aqi2020 = seoul_aqi[grep("2020/", seoul_aqi$date),]
seoul2020 = mean(seoul_aqi2020$pm10, na.rm = TRUE) # 미세

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
busan_aqi = read.csv("./aqidata/busan.csv")

busan_aqi2020 = busan_aqi[grep("2020/", busan_aqi$date),]
busan2020 = mean(busan_aqi2020$pm10, na.rm = TRUE)

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
daegu_aqi = read.csv("./aqidata/daegu.csv")

daegu_aqi2020 = daegu_aqi[grep("2020/", daegu_aqi$date),]
daegu2020 = mean(daegu_aqi2020$pm10, na.rm = TRUE)

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
incheon_aqi = read.csv("./aqidata/incheon.csv")

incheon_aqi2020 = incheon_aqi[grep("2020/", incheon_aqi$date),]
incheon2020 = mean(incheon_aqi2020$pm10, na.rm = TRUE)

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
gwangju_aqi = read.csv("./aqidata/gwangju.csv")

gwangju_aqi2020 = gwangju_aqi[grep("2020/", gwangju_aqi$date),]
gwangju2020 = mean(gwangju_aqi2020$pm10, na.rm = TRUE)

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
daejeon_aqi = read.csv("./aqidata/daejeon.csv")

daejeon_aqi2020 = daejeon_aqi[grep("2020/", daejeon_aqi$date),]
daejeon2020 = mean(daejeon_aqi2020$pm10, na.rm = TRUE)

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
ulsan_aqi = read.csv("./aqidata/ulsan.csv")

ulsan_aqi2020 = ulsan_aqi[grep("2020/", ulsan_aqi$date),]
ulsan2020 = mean(ulsan_aqi2020$pm10, na.rm = TRUE)

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
sejong_aqi = read.csv("./aqidata/sejong.csv")

sejong_aqi2020 = sejong_aqi[grep("2020/", sejong_aqi$date),]
sejong2020 = mean(sejong_aqi2020$pm10, na.rm = TRUE)

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
goyang_aqi = read.csv("./aqidata/gyeongi/goyang.csv")
suwon_aqi = read.csv("./aqidata/gyeongi/suwon.csv")
yongin_aqi = read.csv("./aqidata/gyeongi/yongin.csv")
bucheon_aqi = read.csv("./aqidata/gyeongi/bucheon.csv")
seongnam_aqi = read.csv("./aqidata/gyeongi/seongnam.csv")
gyeongi_aqi <- rbind(goyang_aqi, suwon_aqi, yongin_aqi, bucheon_aqi, seongnam_aqi)

gyeongi_aqi2020 = gyeongi_aqi[grep("2020/", gyeongi_aqi$date),]
gyeongi2020 = mean(gyeongi_aqi2020$pm10, na.rm = TRUE)


gyeongi2019_1 = gyeongi_aqi[grep("2019/1/", gyeongi_aqi$date),]
gyeongi2019_2 = gyeongi_aqi[grep("2019/2/", gyeongi_aqi$date),]
gyeongi2019_3 = gyeongi_aqi[grep("2019/3/", gyeongi_aqi$date),]
gyeongi2019_4 = gyeongi_aqi[grep("2019/4/", gyeongi_aqi$date),]

gyeongi2019_ggDF = rbind(gyeongi2019_1, gyeongi2019_2, gyeongi2019_3, gyeongi2019_4)
gyeongi2019_gg = mean(gyeongi2019_ggDF$pm10, na.rm = TRUE)

gyeongi2018_1 = gyeongi_aqi[grep("2018/1/", gyeongi_aqi$date),]
gyeongi2018_2 = gyeongi_aqi[grep("2018/2/", gyeongi_aqi$date),]
gyeongi2018_3 = gyeongi_aqi[grep("2018/3/", gyeongi_aqi$date),]
gyeongi2018_4 = gyeongi_aqi[grep("2018/4/", gyeongi_aqi$date),]

gyeongi2018_ggDF = rbind(gyeongi2018_1, gyeongi2018_2, gyeongi2018_3, gyeongi2018_4)
gyeongi2018_gg = mean(gyeongi2018_ggDF$pm10, na.rm = TRUE)


# gangwon
chuncheon_aqi = read.csv("./aqidata/gangwon/chuncheon.csv")
donghae_aqi = read.csv("./aqidata/gangwon/donghae.csv")
gangneung_aqi = read.csv("./aqidata/gangwon/gangneung.csv")
sokcho_aqi = read.csv("./aqidata/gangwon/sokcho.csv")
wonju_aqi = read.csv("./aqidata/gangwon/wonju.csv")
gangwon_aqi<-rbind(chuncheon_aqi, donghae_aqi, gangneung_aqi, sokcho_aqi, wonju_aqi)

gangwon_aqi2020 = gangwon_aqi[grep("2020/", gangwon_aqi$date),]
gangwon2020 = mean(gangwon_aqi2020$pm10, na.rm = TRUE)

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
chungju_aqi=read.csv("./aqidata/chungbuk/chungju.csv")
eumseong_aqi=read.csv("./aqidata/chungbuk/eumseong.csv")
jecheon_aqi=read.csv("./aqidata/chungbuk/jecheon.csv")
jincheon_aqi=read.csv("./aqidata/chungbuk/jincheon.csv")
cheongju_aqi=read.csv("./aqidata/chungbuk/cheongju.csv")
chungbuk_aqi<-rbind(chungju_aqi, eumseong_aqi, jecheon_aqi, jincheon_aqi, cheongju_aqi)

chungbuk_aqi2020 = chungbuk_aqi[grep("2020/", chungbuk_aqi$date),]
chungbuk2020 = mean(chungbuk_aqi2020$pm10, na.rm = TRUE)

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
asan_aqi=read.csv("./aqidata/chungnam/asan.csv")
cheonan_aqi=read.csv("./aqidata/chungnam/cheonan.csv")
dangjin_aqi=read.csv("./aqidata/chungnam/dangjin.csv")
nonsan_aqi=read.csv("./aqidata/chungnam/nonsan.csv")
seosan_aqi=read.csv("./aqidata/chungnam/seosan.csv")
chungnam_aqi<-rbind(asan_aqi, cheonan_aqi, dangjin_aqi, nonsan_aqi, seosan_aqi)

chungnam_aqi2020 = chungnam_aqi[grep("2020/", chungnam_aqi$date),]
chungnam2020 = mean(chungnam_aqi2020$pm10, na.rm = TRUE)

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
gimje_aqi=read.csv("./aqidata/jeonbuk/gimje.csv")
gunsan_aqi=read.csv("./aqidata/jeonbuk/gunsan.csv")
iksan_aqi=read.csv("./aqidata/jeonbuk/iksan.csv")
jeongeup_aqi=read.csv("./aqidata/jeonbuk/jeongeup.csv")
jeonju_aqi=read.csv("./aqidata/jeonbuk/jeonju.csv")
jeonbuk_aqi<-rbind(gimje_aqi, gunsan_aqi, iksan_aqi, jeongeup_aqi, jeonju_aqi)

jeonbuk_aqi2020 = jeonbuk_aqi[grep("2020/", jeonbuk_aqi$date),]
jeonbuk2020 = mean(jeonbuk_aqi2020$pm10, na.rm = TRUE)

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
gwangyang_aqi=read.csv("./aqidata/jeonnam/gwangyang.csv")
mokpo_aqi=read.csv("./aqidata/jeonnam/mokpo.csv")
muan_aqi=read.csv("./aqidata/jeonnam/muan.csv")
suncheon_aqi=read.csv("./aqidata/jeonnam/suncheon.csv")
yeosu_aqi=read.csv("./aqidata/jeonnam/yeosu.csv")
jeonnam_aqi<-rbind(gwangyang_aqi, mokpo_aqi, muan_aqi, suncheon_aqi, yeosu_aqi)

jeonnam_aqi2020 = jeonnam_aqi[grep("2020/", jeonnam_aqi$date),]
jeonnam2020 = mean(jeonnam_aqi2020$pm10, na.rm = TRUE)

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
andong_aqi=read.csv("./aqidata/gyeongbuk/andong.csv")
gyeongju_aqi=read.csv("./aqidata/gyeongbuk/gyeongju.csv")
gimcheon_aqi=read.csv("./aqidata/gyeongbuk/gimcheon.csv")
gumi_aqi=read.csv("./aqidata/gyeongbuk/gumi.csv")
pohang_aqi=read.csv("./aqidata/gyeongbuk/pohang.csv")
gyeongbuk_aqi<-rbind(andong_aqi, gyeongju_aqi, gimcheon_aqi, gumi_aqi, pohang_aqi)

gyeongbuk_aqi2020 = gyeongbuk_aqi[grep("2020/", gyeongbuk_aqi$date),]
gyeongbuk2020 = mean(gyeongbuk_aqi2020$pm10, na.rm = TRUE)

gyeongbuk2019_1 = gyeongbuk_aqi[grep("2019/1/", gyeongbuk_aqi$date),]
gyeongbuk2019_2 = gyeongbuk_aqi[grep("2019/2/", gyeongbuk_aqi$date),]
gyeongbuk2019_3 = gyeongbuk_aqi[grep("2019/3/", gyeongbuk_aqi$date),]
gyeongbuk2019_4 = gyeongbuk_aqi[grep("2019/4/", gyeongbuk_aqi$date),]

gyeongbuk2019_ggDF = rbind(gyeongbuk2019_1, gyeongbuk2019_2, gyeongbuk2019_3, gyeongbuk2019_4)
gyeongbuk2019_gg = mean(gyeongbuk2019_ggDF$pm10, na.rm = TRUE)

gyeongbuk2018_1 = gyeongbuk_aqi[grep("2018/1/", gyeongbuk_aqi$date),]
gyeongbuk2018_2 = gyeongbuk_aqi[grep("2018/2/", gyeongbuk_aqi$date),]
gyeongbuk2018_3 = gyeongbuk_aqi[grep("2018/3/", gyeongbuk_aqi$date),]
gyeongbuk2018_4 = gyeongbuk_aqi[grep("2018/4/", gyeongbuk_aqi$date),]

gyeongbuk2018_ggDF = rbind(gyeongbuk2018_1, gyeongbuk2018_2, gyeongbuk2018_3, gyeongbuk2018_4)
gyeongbuk2018_gg = mean(gyeongbuk2018_ggDF$pm10, na.rm = TRUE)


# gyeongnam
changwon_aqi=read.csv("./aqidata/gyeongnam/changwon.csv")
geoje_aqi=read.csv("./aqidata/gyeongnam/geoje.csv")
gimhae_aqi=read.csv("./aqidata/gyeongnam/gimhae.csv")
jinju_aqi=read.csv("./aqidata/gyeongnam/jinju.csv")
yangsan_aqi=read.csv("./aqidata/gyeongnam/yangsan.csv")
gyeongnam_aqi=rbind(changwon_aqi, geoje_aqi, gimhae_aqi, jinju_aqi, yangsan_aqi)

gyeongnam_aqi2020 = gyeongnam_aqi[grep("2020/", gyeongnam_aqi$date),]
gyeongnam2020 = mean(gyeongnam_aqi2020$pm10, na.rm = TRUE)

gyeongnam2019_1 = gyeongnam_aqi[grep("2019/1/", gyeongnam_aqi$date),]
gyeongnam2019_2 = gyeongnam_aqi[grep("2019/2/", gyeongnam_aqi$date),]
gyeongnam2019_3 = gyeongnam_aqi[grep("2019/3/", gyeongnam_aqi$date),]
gyeongnam2019_4 = gyeongnam_aqi[grep("2019/4/", gyeongnam_aqi$date),]

gyeongnam2019_ggDF = rbind(gyeongnam2019_1, gyeongnam2019_2, gyeongnam2019_3, gyeongnam2019_4)
gyeongnam2019_gg = mean(gyeongnam2019_ggDF$pm10, na.rm = TRUE)

gyeongnam2018_1 = gyeongnam_aqi[grep("2018/1/", gyeongnam_aqi$date),]
gyeongnam2018_2 = gyeongnam_aqi[grep("2018/2/", gyeongnam_aqi$date),]
gyeongnam2018_3 = gyeongnam_aqi[grep("2018/3/", gyeongnam_aqi$date),]
gyeongnam2018_4 = gyeongnam_aqi[grep("2018/4/", gyeongnam_aqi$date),]

gyeongnam2018_ggDF = rbind(gyeongnam2018_1, gyeongnam2018_2, gyeongnam2018_3, gyeongnam2018_4)
gyeongnam2018_gg = mean(gyeongnam2018_ggDF$pm10, na.rm = TRUE)


# jeju

jeju_aqi = read.csv("./aqidata/jeju.csv")

jeju_aqi2020 = jeju_aqi[grep("2020/", jeju_aqi$date),]
jeju2020 = mean(jeju_aqi2020$pm10, na.rm = TRUE)

jeju2019_1 = jeju_aqi[grep("2019/1/", jeju_aqi$date),]
jeju2019_2 = jeju_aqi[grep("2019/2/", jeju_aqi$date),]
jeju2019_3 = jeju_aqi[grep("2019/3/", jeju_aqi$date),]
jeju2019_4 = jeju_aqi[grep("2019/4/", jeju_aqi$date),]

jeju2019_ggDF = rbind(jeju2019_1, jeju2019_2, jeju2019_3, jeju2019_4)
jeju2019_gg = mean(jeju2019_ggDF$pm10, na.rm = TRUE)

jeju2018_1 = jeju_aqi[grep("2018/1/", jeju_aqi$date),]
jeju2018_2 = jeju_aqi[grep("2018/2/", jeju_aqi$date),]
jeju2018_3 = jeju_aqi[grep("2018/3/", jeju_aqi$date),]
jeju2018_4 = jeju_aqi[grep("2018/4/", jeju_aqi$date),]

jeju2018_ggDF = rbind(jeju2018_1, jeju2018_2, jeju2018_3, jeju2018_4)
jeju2018_gg = mean(jeju2018_ggDF$pm10, na.rm = TRUE)


## plot year~!

sido_nm2 <- c("서울", "부산", "대구", "인천",
             "광주", "대전", "울산", "세종",
             "경기", "강원", "충북", "충남", "전북",
             "전남", "경북", "경남",
             "제주")

aqi2020plot<-c(seoul2020, busan2020, daegu2020, incheon2020,
           gwangju2020, daejeon2020, ulsan2020, sejong2020,
           gyeongi2020, gangwon2020, chungbuk2020, chungnam2020, jeonbuk2020,
           jeonnam2020, gyeongbuk2020, gyeongnam2020, jeju2020)

aqi2019plot<-c(seoul2019_gg, busan2019_gg, daegu2019_gg, incheon2019_gg,
           gwangju2019_gg, daejeon2019_gg, ulsan2019_gg, sejong2019_gg,
           gyeongi2019_gg, gangwon2019_gg, chungbuk2019_gg, chungnam2019_gg, jeonbuk2019_gg,
           jeonnam2019_gg, gyeongbuk2019_gg, gyeongnam2019_gg, jeju2019_gg)

aqi2018plot<-c(seoul2018_gg, busan2018_gg, daegu2018_gg, incheon2018_gg,
           gwangju2018_gg, daejeon2018_gg, ulsan2018_gg, sejong2018_gg,
           gyeongi2018_gg, gangwon2018_gg, chungbuk2018_gg, chungnam2018_gg, jeonbuk2018_gg,
           jeonnam2018_gg, gyeongbuk2018_gg, gyeongnam2018_gg, jeju2018_gg)



aqidata2020_ggdf = data.frame(sido_nm=sido_nm2, aqi=aqi2020plot)
aqidata2019_ggdf = data.frame(sido_nm=sido_nm2, aqi=aqi2019plot)
aqidata2018_ggdf = data.frame(sido_nm=sido_nm2, aqi=aqi2018plot)

# 연도별 plot

ggplot(data=aqidata2020_ggdf, aes(x=sido_nm, y=aqi)) + geom_bar(stat="identity", fill="steelblue", width = 0.5) + coord_cartesian(ylim=c(20,70))

ggplot(data=aqidata2019_ggdf, aes(x=sido_nm, y=aqi)) + geom_bar(stat="identity", fill="steelblue", width = 0.5) + coord_cartesian(ylim=c(20,70))

ggplot(data=aqidata2018_ggdf, aes(x=sido_nm, y=aqi)) + geom_bar(stat="identity", fill="steelblue", width = 0.5) + coord_cartesian(ylim=c(20,70))



# new plot (한 번에)

aqidata2020df = data.frame(sido_nm=sido_nm2, aqi=aqi2020plot, year=c(2020))
aqidata2019df = data.frame(sido_nm=sido_nm2, aqi=aqi2019plot, year=c(2019))
aqidata2018df = data.frame(sido_nm=sido_nm2, aqi=aqi2018plot, year=c(2018))

aqiallDF = rbind(aqidata2020df, aqidata2019df, aqidata2018df)

str(aqiallDF)

aqiallDF$year <- factor(aqiallDF$year, levels = c(2018,2019,2020), labels = c(2018,2019,2020))

ggplot(aqiallDF, aes(x=sido_nm, y=aqi, fill=year)) + geom_bar(stat="identity", position="dodge")






