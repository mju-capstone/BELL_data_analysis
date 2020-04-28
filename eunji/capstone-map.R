# 필요한 library 가져오기
library(maps)
library(ggplot2)
library(sp)
library(rgdal)
library(magrittr)

# 경로 확인
list.files(path = './data')

# shp 파일 불러오기
sido <- readOGR(dsn = './data/bnd_sido_00_2019_2019_2Q.shp', layer = 'bnd_sido_00_2019_2019_2Q', encoding = 'CP949')

# sido to df
sidoDF <- fortify(model=sido)

# data process
# sido 행번호를 id column 으로 만듦
sido@data$id <- rownames(x=sido@data)

# merge
sidoDF <- merge(x=sidoDF, y=sido@data[,c('id', 'base_date', 'sido_cd', 'sido_nm')], by='id', all.x=TRUE)

# 오름차순 정렬
sidoDF <- sidoDF[order(sidoDF$id, sidoDF$order),]

# 데이터 1/40로 줄이기
sidoDF1 <- sidoDF[sidoDF1$order %% 40 == 1,]

# 부속지역 제외하기
sidoDF2 <- subset(x=sidoDF1, subset = sidoDF1$piece == 1)

sidoMap2 <- ggplot(data = sidoDF2, mapping = aes(x=long, y=lat, group=group)) + geom_polygon(fill='white', color='black')
sidoMap2 # 확인

# 좀 더 예쁘게 지도 그려보기 (위도, 경도에 맞게)

convertCoords <- function(lon, lat) {
  
  xy <- data.frame(lon= lon, lat=lat)
  coordinates(obj=xy) <- ~lon + lat
  
  fmCRS <- CRS('+proj=tmerc +lat_0=38 +lon_0=127.5 +k=0.9996 +x_0=1000000 +y_0=2000000 +ellps=GRS80 +units=m +no_defs')
  toCRS <- CRS('+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs')
  
  xy %>% 
    SpatialPoints(proj4string = fmCRS) %>% 
    spTransform(CRSobj = toCRS) %>% 
    SpatialPoints() %>% 
    as.data.frame() %>% 
    set_colnames(c('lonWGS84', 'latWGS84')) %>% 
    return()
}

# 좌표 변환
changedCoords <- convertCoords(lon = sidoDF2$long, lat = sidoDF2$lat)

# 변환한 좌표를 열에 추가
sidoDF2 <- cbind(sidoDF2, changedCoords)

sidoMap3 <- ggplot(data=sidoDF2, mapping = aes(x=lonWGS84, y=latWGS84, group=group)) + geom_polygon(fill='white', color='black')


# 임의의 미세먼지 데이터 추가
sido_nm <- c("서울특별시", "부산광역시", "대구광역시", "인천광역시", 
          "광주광역시", "대전광역시", "울산광역시", "세종특별자치시",
          "경기도", "강원도", "충청북도", "충청남도", "전라북도",
          "전라남도", "경상북도", "경상남도",
          "제주특별자치도")
aqi <- c(30.0, 10.0, 12.0, 13.0, 17.0, 20.0, 23.0, 18.0, 25.0, 15.0, 11.0, 5.0, 13.0, 14.0, 18.0, 23.0, 17.0)
aqidata = data.frame(sido_nm=sido_nm, aqi=aqi)


# sido_nm 기준으로 병합
sidoDF2 <- merge(x=sidoDF2, y=aqidata[,], by='sido_nm', all.x=TRUE)

# 색칠하기
library(RColorBrewer)

myPal <- brewer.pal(n=9, name='YlOrRd')

ggplot(data=sidoDF2, mapping = aes(x=lonWGS84, y=latWGS84, group=group, fill=aqi)) + geom_polygon(color='gray30') + coord_map() + scale_fill_gradient(low=myPal[3], high = myPal[7])





