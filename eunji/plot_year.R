# 연도별 미세먼지 데이터 plot

# seoul plot
seoulyearaqi<-c(seoul2018, seoul2019, seoul2020)

plot(seoulyearaqi, ylim=c(60,100), axes=FALSE, xlab="", ylab="")
axis(side=1, at=c(2018,2019,2020))
axis(side=2)
box()
lines(seoulyearaqi, col="black")
par(new=TRUE)

# busan plot
busanyearaqi<-c(busan2018, busan2019, busan2020)

plot(busanyearaqi, ylim=c(60,100), axes=FALSE, xlab="", ylab="")
lines(busanyearaqi, col="blue")

