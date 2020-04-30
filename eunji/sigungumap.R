# 필요한 library 가져오기
library(maps)
library(ggplot2)
library(sp)
library(rgdal)
library(magrittr)

# 경로 확인
list.files(path = './sigungusensus')

# shp 파일 불러오기
# bnd_sigungu_00_2019_2019_2Q
sigungu <- readOGR(dsn = './sigunguseusus/bnd_sigungu_00_2019_2019_2Q.shp', layer = 'bnd_sigungu_00_2019_2019_2Q', encoding = 'CP949')

# sigungu to DF
sigunguDF <- fortify(model=sigungu)

# 행번호를 id column 으로 만듦
sigungu@data$id <- rownames(x=sigungu@data)

# id 기준으로 merge
sigunguDF <- merge(x=sigunguDF, 
                   y=sigungu@data[,c('id', 'base_date', 'sigungu_cd', 'sigungu_nm')], 
                   by='id', 
                   all.x=TRUE)

# 오름차순 정렬
sigunguDF <- sigunguDF[order(sigunguDF$id, sigunguDF$order)]

# 데이터 양 줄이기
sigunguDF <- sigunguDF[sigunguDF$order %% 100 == 1,]

# 부속지역 제외하기
sigunguDF <- subset(x=sigunguDF, subset = sigunguDF$piece == 1)

# 데이터 지도에 그려보기

sigungumap <- ggplot(data = sigunguDF, mapping = aes(x=long, y=lat, group=group)) + geom_polygon(fill='white', color='black')

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
changedCoords <- convertCoords(lon = sigunguDF$long, lat = sigunguDF$lat)

# 변환한 좌표를 열에 추가
sigunguDF <- cbind(sigunguDF, changedCoords)

sigungumap2 <- ggplot(data=sigunguDF, mapping = aes(x=lonWGS84, y=latWGS84, group=group)) + geom_polygon(fill='white', color='black')




