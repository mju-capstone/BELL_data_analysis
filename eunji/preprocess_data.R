# 미세먼지 데이터 전처리
# 우리나라 미세먼지 시도별 군집 분석 및 시각화

library(dplyr)

# 지도에 그릴 미먼 데이터
sido_nm <- c("서울특별시", "부산광역시", "대구광역시", "인천광역시",
             "광주광역시", "대전광역시", "울산광역시", "세종특별자치시",
             "경기도", "강원도", "충청북도", "충청남도", "전라북도",
             "전라남도", "경상북도", "경상남도",
             "제주특별자치도")
aqi2020 <- c() # 2020 미세먼지 데이터
aqi2019 <- c() # 2019 미세먼지 데이터


# preprocess seoul
seoul_aqi = read.csv("./aqidata/seoul.csv")

seoul_aqi2020 = seoul_aqi[grep("2020/", seoul_aqi$date),]
seoul2020 = mean(seoul_aqi2020$pm25, na.rm = TRUE)
aqi2020<-append(aqi2020, seoul2020)

seoul_aqi2019 = seoul_aqi[grep("2019/", seoul_aqi$date),]
seoul2019 = mean(seoul_aqi2019$pm25, na.rm = TRUE)
aqi2019<-append(aqi2019, seoul2019)


# preprocess busan
busan_aqi = read.csv("./aqidata/busan.csv")

busan_aqi2020 = busan_aqi[grep("2020/", busan_aqi$date),]
busan2020 = mean(busan_aqi2020$pm25, na.rm = TRUE)
aqi2020<-append(aqi2020, busan2020)

busan_aqi2019 = busan_aqi[grep("2019/", busan_aqi$date),]
busan2019 = mean(busan_aqi2019$pm25, na.rm = TRUE)
aqi2019<-append(aqi2019, busan2019)


# preprocess daegu
daegu_aqi = read.csv("./aqidata/daegu.csv")

daegu_aqi2020 = daegu_aqi[grep("2020/", daegu_aqi$date),]
daegu2020 = mean(daegu_aqi2020$pm25, na.rm = TRUE)
aqi2020<-append(aqi2020, daegu2020)

daegu_aqi2019 = daegu_aqi[grep("2019/", daegu_aqi$date),]
daegu2019 = mean(daegu_aqi2019$pm25, na.rm = TRUE)
aqi2019<-append(aqi2019, daegu2019)


# preprocess incheon
incheon_aqi = read.csv("./aqidata/incheon.csv")

incheon_aqi2020 = incheon_aqi[grep("2020/", incheon_aqi$date),]
incheon2020 = mean(incheon_aqi2020$pm25, na.rm = TRUE)
aqi2020<-append(aqi2020, incheon2020)

incheon_aqi2019 = incheon_aqi[grep("2019/", incheon_aqi$date),]
incheon2019 = mean(incheon_aqi2019$pm25, na.rm = TRUE)
aqi2019<-append(aqi2019, incheon2019)


# preprocess gwangju



# preprocess daejeon




# preprocess ulsan



# preprocess sejong




# preprocess gyungi



# preprocess gangwon




# preprocess chungbuk




# preprocess chungnam




# preprocess jeonbuk




# preprocess jeonnam



# preprocess kyungbuk




# preeprocess kyungnam




# preprocess jeju
























