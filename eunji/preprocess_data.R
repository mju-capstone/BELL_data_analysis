# 미세먼지 데이터 전처리
# 우리나라 미세먼지 시도별 군집 분석 및 시각화

library(dplyr)

# preprocess seoul
seoul_aqi = read.csv("./aqidata/seoul.csv")

# 미세먼지 + 초미세먼지
seoul_aqi2020 = seoul_aqi[grep("2020/", seoul_aqi$date),]
seoul2020 = mean(seoul_aqi2020$pm10, na.rm = TRUE) # 미세
seoul2020_2 = mean(seoul_aqi2020$pm25, na.rm = TRUE) # 초미세 

seoul_aqi2019 = seoul_aqi[grep("2019/", seoul_aqi$date),]
seoul2019 = mean(seoul_aqi2019$pm10, na.rm = TRUE)
seoul2019_2 = mean(seoul_aqi2019$pm25, na.rm = TRUE)

seoul_aqi2018 = seoul_aqi[grep("2018/", seoul_aqi$date),]
seoul2018 = mean(seoul_aqi2018$pm10, na.rm = TRUE)
seoul2018_2 = mean(seoul_aqi2018$pm25, na.rm = TRUE)


# preprocess busan
busan_aqi = read.csv("./aqidata/busan.csv")

busan_aqi2020 = busan_aqi[grep("2020/", busan_aqi$date),]
busan2020 = mean(busan_aqi2020$pm10, na.rm = TRUE)
busan2020_2 = mean(busan_aqi2020$pm25, na.rm = TRUE)

busan_aqi2019 = busan_aqi[grep("2019/", busan_aqi$date),]
busan2019 = mean(busan_aqi2019$pm10, na.rm = TRUE)
busan2019_2 = mean(busan_aqi2019$pm25, na.rm = TRUE)

busan_aqi2018 = busan_aqi[grep("2018/", busan_aqi$date),]
busan2018 = mean(busan_aqi2018$pm10, na.rm = TRUE)
busan2018_2 = mean(busan_aqi2018$pm25, na.rm = TRUE)


# preprocess daegu
daegu_aqi = read.csv("./aqidata/daegu.csv")

daegu_aqi2020 = daegu_aqi[grep("2020/", daegu_aqi$date),]
daegu2020 = mean(daegu_aqi2020$pm10, na.rm = TRUE)
daegu2020_2 = mean(daegu_aqi2020$pm25, na.rm = TRUE)

daegu_aqi2019 = daegu_aqi[grep("2019/", daegu_aqi$date),]
daegu2019 = mean(daegu_aqi2019$pm10, na.rm = TRUE)
daegu2019_2 = mean(daegu_aqi2019$pm25, na.rm = TRUE)

daegu_aqi2018 = daegu_aqi[grep("2018/", daegu_aqi$date),]
daegu2018 = mean(daegu_aqi2018$pm10, na.rm = TRUE)
daegu2018_2 = mean(daegu_aqi2018$pm25, na.rm = TRUE)


# preprocess incheon
incheon_aqi = read.csv("./aqidata/incheon.csv")

incheon_aqi2020 = incheon_aqi[grep("2020/", incheon_aqi$date),]
incheon2020 = mean(incheon_aqi2020$pm10, na.rm = TRUE)
incheon2020_2 = mean(incheon_aqi2020$pm25, na.rm = TRUE)

incheon_aqi2019 = incheon_aqi[grep("2019/", incheon_aqi$date),]
incheon2019 = mean(incheon_aqi2019$pm10, na.rm = TRUE)
incheon2019_2 = mean(incheon_aqi2019$pm25, na.rm = TRUE)

incheon_aqi2018 = incheon_aqi[grep("2018/", incheon_aqi$date),]
incheon2018 = mean(incheon_aqi2018$pm10, na.rm = TRUE)
incheon2018_2 = mean(incheon_aqi2018$pm25, na.rm = TRUE)


# preprocess gwangju
gwangju_aqi = read.csv("./aqidata/gwangju.csv")

gwangju_aqi2020 = gwangju_aqi[grep("2020/", gwangju_aqi$date),]
gwangju2020 = mean(gwangju_aqi2020$pm10, na.rm = TRUE)
gwangju2020_2 = mean(gwangju_aqi2020$pm25, na.rm = TRUE)

gwangju_aqi2019 = gwangju_aqi[grep("2019/", gwangju_aqi$date),]
gwangju2019 = mean(gwangju_aqi2019$pm10, na.rm = TRUE)
gwangju2019_2 = mean(gwangju_aqi2019$pm25, na.rm = TRUE)

gwangju_aqi2018 = gwangju_aqi[grep("2018/", gwangju_aqi$date),]
gwangju2018 = mean(gwangju_aqi2018$pm10, na.rm = TRUE)
gwangju2018_2 = mean(gwangju_aqi2018$pm25, na.rm = TRUE)

# preprocess daejeon
daejeon_aqi = read.csv("./aqidata/daejeon.csv")

daejeon_aqi2020 = daejeon_aqi[grep("2020/", daejeon_aqi$date),]
daejeon2020 = mean(daejeon_aqi2020$pm10, na.rm = TRUE)
daejeon2020_2 = mean(daejeon_aqi2020$pm25, na.rm = TRUE)

daejeon_aqi2019 = daejeon_aqi[grep("2019/", daejeon_aqi$date),]
daejeon2019 = mean(daejeon_aqi2019$pm10, na.rm = TRUE)
daejeon2019_2 = mean(daejeon_aqi2019$pm25, na.rm = TRUE)

daejeon_aqi2018 = daejeon_aqi[grep("2018/", daejeon_aqi$date),]
daejeon2018 = mean(daejeon_aqi2018$pm10, na.rm = TRUE)
daejeon2018_2 = mean(daejeon_aqi2018$pm25, na.rm = TRUE)

# preprocess ulsan
ulsan_aqi = read.csv("./aqidata/ulsan.csv")

ulsan_aqi2020 = ulsan_aqi[grep("2020/", ulsan_aqi$date),]
ulsan2020 = mean(ulsan_aqi2020$pm10, na.rm = TRUE)
ulsan2020_2 = mean(ulsan_aqi2020$pm25, na.rm = TRUE)

ulsan_aqi2019 = ulsan_aqi[grep("2019/", ulsan_aqi$date),]
ulsan2019 = mean(ulsan_aqi2019$pm10, na.rm = TRUE)
ulsan2019_2 = mean(ulsan_aqi2019$pm25, na.rm = TRUE)

ulsan_aqi2018 = ulsan_aqi[grep("2018/", ulsan_aqi$date),]
ulsan2018 = mean(ulsan_aqi2018$pm10, na.rm = TRUE)
ulsan2018_2 = mean(ulsan_aqi2018$pm25, na.rm = TRUE)


# preprocess sejong
sejong_aqi = read.csv("./aqidata/sejong.csv")

sejong_aqi2020 = sejong_aqi[grep("2020/", sejong_aqi$date),]
sejong2020 = mean(sejong_aqi2020$pm10, na.rm = TRUE)
sejong2020_2 = mean(sejong_aqi2020$pm25, na.rm = TRUE)

sejong_aqi2019 = sejong_aqi[grep("2019/", sejong_aqi$date),]
sejong2019 = mean(sejong_aqi2019$pm10, na.rm = TRUE)
sejong2019_2 = mean(sejong_aqi2019$pm25, na.rm = TRUE)

sejong_aqi2018 = sejong_aqi[grep("2018/", sejong_aqi$date),]
sejong2018 = mean(sejong_aqi2018$pm10, na.rm = TRUE)
sejong2018_2 = mean(sejong_aqi2018$pm25, na.rm = TRUE)


# preprocess gyeongi
# 고양, 수원, 용인, 부천, 성남
goyang_aqi = read.csv("./aqidata/gyeongi/goyang.csv")
suwon_aqi = read.csv("./aqidata/gyeongi/suwon.csv")
yongin_aqi = read.csv("./aqidata/gyeongi/yongin.csv")
bucheon_aqi = read.csv("./aqidata/gyeongi/bucheon.csv")
seongnam_aqi = read.csv("./aqidata/gyeongi/seongnam.csv")

# 모든 경기 데이터 합침
gyeongi_aqi <- rbind(goyang_aqi, suwon_aqi, yongin_aqi, bucheon_aqi, seongnam_aqi)

gyeongi_aqi2020 = gyeongi_aqi[grep("2020/", gyeongi_aqi$date),]
gyeongi2020 = mean(gyeongi_aqi2020$pm10, na.rm = TRUE)
gyeongi2020_2 = mean(gyeongi_aqi2020$pm25, na.rm = TRUE)

gyeongi_aqi2019 = gyeongi_aqi[grep("2019/", gyeongi_aqi$date),]
gyeongi2019 = mean(gyeongi_aqi2019$pm10, na.rm = TRUE)
gyeongi2019_2 = mean(gyeongi_aqi2019$pm25, na.rm = TRUE)

gyeongi_aqi2018 = gyeongi_aqi[grep("2018/", gyeongi_aqi$date),]
gyeongi2018 = mean(gyeongi_aqi2018$pm10, na.rm = TRUE)
gyeongi2018_2 = mean(gyeongi_aqi2018$pm25, na.rm = TRUE)


# preprocess gangwon
# 춘천, 동해, 강릉, 속초, 원주
chuncheon_aqi = read.csv("./aqidata/gangwon/chuncheon.csv")
donghae_aqi = read.csv("./aqidata/gangwon/donghae.csv")
gangneung_aqi = read.csv("./aqidata/gangwon/gangneung.csv")
sokcho_aqi = read.csv("./aqidata/gangwon/sokcho.csv")
wonju_aqi = read.csv("./aqidata/gangwon/wonju.csv")

gangwon_aqi<-rbind(chuncheon_aqi, donghae_aqi, gangneung_aqi, sokcho_aqi, wonju_aqi)

gangwon_aqi2020 = gangwon_aqi[grep("2020/", gangwon_aqi$date),]
gangwon2020 = mean(gangwon_aqi2020$pm10, na.rm = TRUE)
gangwon2020_2 = mean(gangwon_aqi2020$pm25, na.rm = TRUE)

gangwon_aqi2019 = gangwon_aqi[grep("2019/", gangwon_aqi$date),]
gangwon2019 = mean(gangwon_aqi2019$pm10, na.rm = TRUE)
gangwon2019_2 = mean(gangwon_aqi2019$pm25, na.rm = TRUE)

gangwon_aqi2018 = gangwon_aqi[grep("2018/", gangwon_aqi$date),]
gangwon2018 = mean(gangwon_aqi2018$pm10, na.rm = TRUE)
gangwon2018_2 = mean(gangwon_aqi2018$pm25, na.rm = TRUE)


# preprocess chungbuk
# 청주, 음성, 제천, 진천, 청주
chungju_aqi=read.csv("./aqidata/chungbuk/chungju.csv")
eumseong_aqi=read.csv("./aqidata/chungbuk/eumseong.csv")
jecheon_aqi=read.csv("./aqidata/chungbuk/jecheon.csv")
jincheon_aqi=read.csv("./aqidata/chungbuk/jincheon.csv")
cheongju_aqi=read.csv("./aqidata/chungbuk/cheongju.csv")

chungbuk_aqi<-rbind(chungju_aqi, eumseong_aqi, jecheon_aqi, jincheon_aqi, cheongju_aqi)

chungbuk_aqi2020 = chungbuk_aqi[grep("2020/", chungbuk_aqi$date),]
chungbuk2020 = mean(chungbuk_aqi2020$pm10, na.rm = TRUE)
chungbuk2020_2 = mean(chungbuk_aqi2020$pm25, na.rm = TRUE)

chungbuk_aqi2019 = chungbuk_aqi[grep("2019/", chungbuk_aqi$date),]
chungbuk2019 = mean(chungbuk_aqi2019$pm10, na.rm = TRUE)
chungbuk2019_2 = mean(chungbuk_aqi2019$pm25, na.rm = TRUE)

chungbuk_aqi2018 = chungbuk_aqi[grep("2018/", chungbuk_aqi$date),]
chungbuk2018 = mean(chungbuk_aqi2018$pm10, na.rm = TRUE)
chungbuk2018_2 = mean(chungbuk_aqi2018$pm25, na.rm = TRUE)


# preprocess chungnam
# 아산, 천안, 당진, 논산, 서산 
asan_aqi=read.csv("./aqidata/chungnam/asan.csv")
cheonan_aqi=read.csv("./aqidata/chungnam/cheonan.csv")
dangjin_aqi=read.csv("./aqidata/chungnam/dangjin.csv")
nonsan_aqi=read.csv("./aqidata/chungnam/nonsan.csv")
seosan_aqi=read.csv("./aqidata/chungnam/seosan.csv")

chungnam_aqi<-rbind(asan_aqi, cheonan_aqi, dangjin_aqi, nonsan_aqi, seosan_aqi)

chungnam_aqi2020 = chungnam_aqi[grep("2020/", chungnam_aqi$date),]
chungnam2020 = mean(chungnam_aqi2020$pm10, na.rm = TRUE)
chungnam2020_2 = mean(chungnam_aqi2020$pm25, na.rm = TRUE)

chungnam_aqi2019 = chungnam_aqi[grep("2019/", chungnam_aqi$date),]
chungnam2019 = mean(chungnam_aqi2019$pm10, na.rm = TRUE)
chungnam2019_2 = mean(chungnam_aqi2019$pm25, na.rm = TRUE)

chungnam_aqi2018 = chungnam_aqi[grep("2018/", chungnam_aqi$date),]
chungnam2018 = mean(chungnam_aqi2018$pm10, na.rm = TRUE)
chungnam2018_2 = mean(chungnam_aqi2018$pm25, na.rm = TRUE)


# preprocess jeonbuk
# 김제, 군산, 익산, 정읍, 전주
gimje_aqi=read.csv("./aqidata/jeonbuk/gimje.csv")
gunsan_aqi=read.csv("./aqidata/jeonbuk/gunsan.csv")
iksan_aqi=read.csv("./aqidata/jeonbuk/iksan.csv")
jeongeup_aqi=read.csv("./aqidata/jeonbuk/jeongeup.csv")
jeonju_aqi=read.csv("./aqidata/jeonbuk/jeonju.csv")

jeonbuk_aqi<-rbind(gimje_aqi, gunsan_aqi, iksan_aqi, jeongeup_aqi, jeonju_aqi)

jeonbuk_aqi2020 = jeonbuk_aqi[grep("2020/", jeonbuk_aqi$date),]
jeonbuk2020 = mean(jeonbuk_aqi2020$pm10, na.rm = TRUE)
jeonbuk2020_2 = mean(jeonbuk_aqi2020$pm25, na.rm = TRUE)

jeonbuk_aqi2019 = jeonbuk_aqi[grep("2019/", jeonbuk_aqi$date),]
jeonbuk2019 = mean(jeonbuk_aqi2019$pm10, na.rm = TRUE)
jeonbuk2019_2 = mean(jeonbuk_aqi2019$pm25, na.rm = TRUE)

jeonbuk_aqi2018 = jeonbuk_aqi[grep("2018/", jeonbuk_aqi$date),]
jeonbuk2018 = mean(jeonbuk_aqi2018$pm10, na.rm = TRUE)
jeonbuk2018_2 = mean(jeonbuk_aqi2018$pm25, na.rm = TRUE)


# preprocess jeonnam
# 광양, 목포, 무안, 순천, 여수
gwangyang_aqi=read.csv("./aqidata/jeonnam/gwangyang.csv")
mokpo_aqi=read.csv("./aqidata/jeonnam/mokpo.csv")
muan_aqi=read.csv("./aqidata/jeonnam/muan.csv")
suncheon_aqi=read.csv("./aqidata/jeonnam/suncheon.csv")
yeosu_aqi=read.csv("./aqidata/jeonnam/yeosu.csv")

jeonnam_aqi<-rbind(gwangyang_aqi, mokpo_aqi, muan_aqi, suncheon_aqi, yeosu_aqi)

jeonnam_aqi2020 = jeonnam_aqi[grep("2020/", jeonnam_aqi$date),]
jeonnam2020 = mean(jeonnam_aqi2020$pm10, na.rm = TRUE)
jeonnam2020_2 = mean(jeonnam_aqi2020$pm25, na.rm = TRUE)

jeonnam_aqi2019 = jeonnam_aqi[grep("2019/", jeonnam_aqi$date),]
jeonnam2019 = mean(jeonnam_aqi2019$pm10, na.rm = TRUE)
jeonnam2019_2 = mean(jeonnam_aqi2019$pm25, na.rm = TRUE)

jeonnam_aqi2018 = jeonnam_aqi[grep("2018/", jeonnam_aqi$date),]
jeonnam2018 = mean(jeonnam_aqi2018$pm10, na.rm = TRUE)
jeonnam2018_2 = mean(jeonnam_aqi2018$pm25, na.rm = TRUE)



# preprocess kyungbuk
# 안동, 경주, 김천, 구미, 포항 
andong_aqi=read.csv("./aqidata/gyeongbuk/andong.csv")
gyeongju_aqi=read.csv("./aqidata/gyeongbuk/gyeongju.csv")
gimcheon_aqi=read.csv("./aqidata/gyeongbuk/gimcheon.csv")
gumi_aqi=read.csv("./aqidata/gyeongbuk/gumi.csv")
pohang_aqi=read.csv("./aqidata/gyeongbuk/pohang.csv")

gyeongbuk_aqi<-rbind(andong_aqi, gyeongju_aqi, gimcheon_aqi, gumi_aqi, pohang_aqi)

gyeongbuk_aqi2020 = gyeongbuk_aqi[grep("2020/", gyeongbuk_aqi$date),]
gyeongbuk2020 = mean(gyeongbuk_aqi2020$pm10, na.rm = TRUE)
gyeongbuk2020_2 = mean(gyeongbuk_aqi2020$pm25, na.rm = TRUE)

gyeongbuk_aqi2019 = gyeongbuk_aqi[grep("2019/", gyeongbuk_aqi$date),]
gyeongbuk2019 = mean(gyeongbuk_aqi2019$pm10, na.rm = TRUE)
gyeongbuk2019_2 = mean(gyeongbuk_aqi2019$pm25, na.rm = TRUE)

gyeongbuk_aqi2018 = gyeongbuk_aqi[grep("2018/", gyeongbuk_aqi$date),]
gyeongbuk2018 = mean(gyeongbuk_aqi2018$pm10, na.rm = TRUE)
gyeongbuk2018_2 = mean(gyeongbuk_aqi2018$pm25, na.rm = TRUE)


# preeprocess kyungnam
# 창원, 거제, 김해, 진주, 양산 

changwon_aqi=read.csv("./aqidata/gyeongnam/changwon.csv")
geoje_aqi=read.csv("./aqidata/gyeongnam/geoje.csv")
gimhae_aqi=read.csv("./aqidata/gyeongnam/gimhae.csv")
jinju_aqi=read.csv("./aqidata/gyeongnam/jinju.csv")
yangsan_aqi=read.csv("./aqidata/gyeongnam/yangsan.csv")

gyeongnam_aqi=rbind(changwon_aqi, geoje_aqi, gimhae_aqi, jinju_aqi, yangsan_aqi)

gyeongnam_aqi2020 = gyeongnam_aqi[grep("2020/", gyeongnam_aqi$date),]
gyeongnam2020 = mean(gyeongnam_aqi2020$pm10, na.rm = TRUE)
gyeongnam2020_2 = mean(gyeongnam_aqi2020$pm25, na.rm = TRUE)

gyeongnam_aqi2019 = gyeongnam_aqi[grep("2019/", gyeongnam_aqi$date),]
gyeongnam2019 = mean(gyeongnam_aqi2019$pm10, na.rm = TRUE)
gyeongnam2019_2 = mean(gyeongnam_aqi2019$pm25, na.rm = TRUE)

gyeongnam_aqi2018 = gyeongnam_aqi[grep("2018/", gyeongnam_aqi$date),]
gyeongnam2018 = mean(gyeongnam_aqi2018$pm10, na.rm = TRUE)
gyeongnam2018_2 = mean(gyeongnam_aqi2018$pm25, na.rm = TRUE)



# preprocess jeju
jeju_aqi = read.csv("./aqidata/jeju.csv")

jeju_aqi2020 = jeju_aqi[grep("2020/", jeju_aqi$date),]
jeju2020 = mean(jeju_aqi2020$pm10, na.rm = TRUE)
jeju2020_2 = mean(jeju_aqi2020$pm25, na.rm = TRUE)

jeju_aqi2019 = jeju_aqi[grep("2019/", jeju_aqi$date),]
jeju2019 = mean(jeju_aqi2019$pm10, na.rm = TRUE)
jeju2019_2 = mean(jeju_aqi2019$pm25, na.rm = TRUE)

jeju_aqi2018 = jeju_aqi[grep("2018/", jeju_aqi$date),]
jeju2018 = mean(jeju_aqi2018$pm10, na.rm = TRUE)
jeju2018_2 = mean(jeju_aqi2018$pm25, na.rm = TRUE)



# 지도에 그릴 미먼 데이터
sido_nm <- c("서울특별시", "부산광역시", "대구광역시", "인천광역시",
             "광주광역시", "대전광역시", "울산광역시", "세종특별자치시",
             "경기도", "강원도", "충청북도", "충청남도", "전라북도",
             "전라남도", "경상북도", "경상남도",
             "제주특별자치도")

# 미세먼지 데이터
aqi2020<-c(seoul2020, busan2020, daegu2020, incheon2020,
           gwangju2020, daejeon2020, ulsan2020, sejong2020,
           gyeongi2020, gangwon2020, chungbuk2020, chungnam2020, jeonbuk2020,
           jeonnam2020, gyeongbuk2020, gyeongnam2020, jeju2020)

aqi2019<-c(seoul2019, busan2019, daegu2019, incheon2019,
           gwangju2019, daejeon2019, ulsan2019, sejong2019,
           gyeongi2019, gangwon2019, chungbuk2019, chungnam2019, jeonbuk2019,
           jeonnam2019, gyeongbuk2019, gyeongnam2019, jeju2019)

aqi2018<-c(seoul2018, busan2018, daegu2018, incheon2018,
           gwangju2018, daejeon2018, ulsan2018, sejong2018,
           gyeongi2018, gangwon2018, chungbuk2018, chungnam2018, jeonbuk2018,
           jeonnam2018, gyeongbuk2018, gyeongnam2018, jeju2018)


# 초미세먼지 데이터
aqi2020_2<-c(seoul2020_2, busan2020_2, daegu2020_2, incheon2020_2,
           gwangju2020_2, daejeon2020_2, ulsan2020_2, sejong2020_2,
           gyeongi2020_2, gangwon2020_2, chungbuk2020_2, chungnam2020_2, jeonbuk2020_2,
           jeonnam2020_2, gyeongbuk2020_2, gyeongnam2020_2, jeju2020_2)

aqi2019_2 <-c(seoul2019_2, busan2019_2, daegu2019_2, incheon2019_2,
           gwangju2019_2, daejeon2019_2, ulsan2019_2, sejong2019_2,
           gyeongi2019_2, gangwon2019_2, chungbuk2019_2, chungnam2019_2, jeonbuk2019_2,
           jeonnam2019_2, gyeongbuk2019_2, gyeongnam2019_2, jeju2019_2)

aqi2018_2<-c(seoul2018_2, busan2018_2, daegu2018_2, incheon2018_2,
           gwangju2018_2, daejeon2018_2, ulsan2018_2, sejong2018_2,
           gyeongi2018_2, gangwon2018_2, chungbuk2018_2, chungnam2018_2, jeonbuk2018_2,
           jeonnam2018_2, gyeongbuk2018_2, gyeongnam2018_2, jeju2018_2)


# 미세먼지 DF
aqidata2020 = data.frame(sido_nm=sido_nm, aqi=aqi2020)
aqidata2019 = data.frame(sido_nm=sido_nm, aqi=aqi2019)
aqidata2018 = data.frame(sido_nm=sido_nm, aqi=aqi2018)


# 초미세먼지 DF
aqidata2020_2 = data.frame(sido_nm=sido_nm, aqi=aqi2020_2)
aqidata2019_2 = data.frame(sido_nm=sido_nm, aqi=aqi2019_2)
aqidata2018_2 = data.frame(sido_nm=sido_nm, aqi=aqi2018_2)




