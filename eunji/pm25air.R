# 초미세먼지 시도별 대기오염도


sidoaqi = read.csv("./airpollution/airpollution.csv", fileEncoding = "euc-kr")

sidoaqi<-sidoaqi[-c(1)]

table(sidoaqi$측정망별.2.)

sido_name <- c("서울", "부산", "대구", "인천",
              "광주", "대전", "울산", "세종",
              "경기", "강원", "충북", "충남", "전북",
              "전남", "경북", "경남",
              "제주")


