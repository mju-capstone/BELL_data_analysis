
#2018 교통량 + 미세먼지 (일자별)
ta <- cbind(daily_air2,daily_traffic2$교통량합계)
names(ta) <- c("date","pm10","day","traffic")
ta


#2018 교통량 + 미세먼지 (주중 및 주말별)
qq1 <- data.frame(rep( c("주중", "주중","주중","주중","주중","주말","주말"), 52))
qqq <- rbind(qq1,"주중")
j2018 <- cbind(ta,qqq)
names(j2018) <- c("date","pm10","day","traffic","w")
j2018



jj2018<- dcast(j2018, w ~ ., value.var="traffic", sum, na.rm = TRUE )
names(jj2018) <- c("w","traffic")
jj2018


#str(year_traffic)





#2018 교통량 + 미세먼지 데이터만 추출 (일자별) 
nor3 <- cbind(daily_traffic$교통량합계, daily_air$pm10)
nor3 <- data.frame(nor3)
names(nor3) <- c("traffic3","pm103")
nor3

#2018 교통량 + 미세먼지 (요일별)
daily_air44 <- cbind(daily_air3, traffic1)
daily_air4 <- cbind(daily_air44, daily_traffic4$label)
daily_air4
names(daily_air4) <- c("월","요일","pm10","traffic","label")


#2019 교통량 + 미세먼지 (일자별)
c1 <- cbind(air19, traffic_19$교통량)
c2 <-data.frame(c1)
c2


#2019 교통량 + 미세먼지 (요일별)
tt_2019<- cbind(tt_2019, air19_b2$pm10)
tt_2019


############################# Normalization ########################################



#2018 표준 정규화 (미세먼지-교통량 요일별 데이터)
nor <- transform(daily_air4, z.pm10 = scale(pm10), z.traffic = scale(traffic))
nor2 <- data.frame(nor$z.pm10, nor$z.traffic)
nor2


#2018 0-1 정규화 (미세먼지-교통량 일별 데이터)
t <- transform(nor3, 
               pm10_1 = (pm103 - min(pm103))/(max(pm103) - min(pm103)),
               traffic_1 = (traffic3 - min(traffic3))/(max(traffic3) - min(traffic3)))

t <- t[,c(3:4)]
plot1 <- cbind(daily_air$일자,t)
names(plot1) <- c("date","pm10","traffic")
plot1

#2018년 1분기~4분기
t_20180103 <- plot1[c(1:90),]
t_20180406 <- plot1[c(91:181),]


#2019 표준(z) 정규화 (미세먼지-교통량 일별 데이터)
c2
d1 <- transform(c2, pm10 = scale(pm10), traffic_19.교통량 = scale(traffic_19.교통량))
d2 <- data.frame(d1$pm10, d1$traffic_19.교통량)
d2

#2019 0-1 정규화 (미세먼지-교통량 일별 데이터)
c2
t2 <- transform(c2, 
                pm10 = (pm10 - min(pm10))/(max(pm10) - min(pm10)),
                traffic_19.교통량 = (traffic_19.교통량 - min(traffic_19.교통량))/(max(traffic_19.교통량) - min(traffic_19.교통량)))

t2$일자 <- as.Date(t2$일자)
t2
t3 <- cbind(t2$pm10, t2$traffic_19.교통량)
t4 <- data.frame(t3) 
names(t4) <- c("미세먼지","교통량")
t4


#2020 0-1 정규화 (미세먼지-교통량 일별 데이터)

traffic_20
names(traffic_20) <- c("일자","교통량")
air200 <-cbind(air20,traffic_20$교통량)
air200
names(air200) <- c("일자","pm10","요일","월","교통량")
air200

t7 <- transform(air200, 
                pm10 = (pm10 - min(pm10))/(max(pm10) - min(pm10)),
                교통량 = (교통량 - min(교통량))/(max(교통량) - min(교통량)))
t7


#nor2
#attach(nor2)
#plot(nor.z.pm10~nor.z.traffic)

#nor4 <- transform(nor3, pm103 = scale(pm103), traffic3 = scale(traffic3))
#nor5 <- data.frame(nor4$pm10, nor4$traffic)
#nor5



############################# correlation analysis ########################################



#2018 상관관계 산점도 - z 정규화 
nor5
attach(nor5)
plot(nor4.traffic~nor4.pm10,main="2018-traffic volume~find dust", xlab="find dust", ylab = "traffic")

#2018 상관관계 산점도 - 정규화 거치지 않은데이터. 정규화하지않아도 양상은 같음 
nor3
attach(nor3)
plot(traffic3~pm103,main="2018-traffic volume~find dust", xlab="find dust", ylab = "traffic")


# 2018 상관관계 분석 - 피어슨의 상관계수 이용 
cov(nor4.traffic,nor4.pm10)
cor(nor4.traffic,nor4.pm10, use='complete.obs', method = 'pearson')
cor.test(nor4.traffic,nor4.pm10)


#cov(daily_air4$pm10,daily_air4$traffic)
#cor(daily_air4$pm10,daily_air4$traffic, use='complete.obs', method = 'pearson')
#cor.test(daily_air4$pm10,daily_air4$traffic)


# 2018 1분기(1월~3월) 상관관계 분석 - 피어슨의 상관계수
t_20180103
t1813<-cbind(t_20180103$pm10,t_20180103$traffic)
t1813 <- data.frame(t1813)
names(t1813) <- c("a1813","tt1813")
cor(tt1813,a1813, use='complete.obs', method = 'pearson')
cor.test(tt1813,a1813)



# 2018 2분기(1월~3월) 상관관계 산점도 
attach(t1813)
plot(a1813~tt1813,main="2018(1~3 month)-traffic volume~find dust", xlab="find dust", ylab = "traffic")
t1813

# 2018 2분기(1월~3월) 상관관계 분석 - 피어슨의 상관계수
t_20180103
t1813<-cbind(t_20180103$pm10,t_20180103$traffic)
t1813 <- data.frame(t1813)
names(t1813) <- c("a1813","tt1813")
cor(tt1813,a1813, use='complete.obs', method = 'pearson')
cor.test(tt1813,a1813)



# 2018 1분기(1월~3월) 상관관계 산점도 
attach(t1813)
plot(a1813~tt1813,main="2018(1~3 month)-traffic volume~find dust", xlab="find dust", ylab = "traffic")
t1813





#2019 상관관계 산점도 - 0-1 정규화 
t5<-t4
names(t5) <- c("t5.미세먼지","t5.교통량")
attach(t5)
plot(t5.교통량~t5.미세먼지,main="2019-traffic volume~find dust", xlab="find dust", ylab = "traffic")
t5




#2019 상관관계 산점도 - z 정규화 
#attach(d2)
#plot(d1.traffic_19.교통량~d1.pm10)




# 2019 상관관계 분석 - 피어슨의 상관계수 이용 
cov(t5.교통량,t5.미세먼지)
cor(t5.교통량,t5.미세먼지, use='complete.obs', method = 'pearson')
cor.test(t5.교통량,t5.미세먼지)



# 2019 요일별 상관관계 분석 
cor(tt_2019$traffic,tt_2019$pm10, use='complete.obs', method = 'pearson')
cor.test(tt_2019$traffic,tt_2019$pm10)
tt_2019

#2018 요일별 상관관계 분석 
ttt_2019 <- cbind(tt_2019,air_y2018$pm10)
cor(ttt_2019$traffic,ttt_2019$pm10, use='complete.obs', method = 'pearson')
cor.test(ttt_2019$traffic,ttt_2019$pm10)




#스피어만, 캔달 상관계수 
#cor(t5.교통량,t5.미세먼지, use='complete.obs', method = 'spearman')
#cor.test(t5.교통량,t5.미세먼지, method = 'kendall')


# 2019 1분기(1월~3월) 상관관계 산점도 
t4
t1913 <- t4[c(1:90),]
names(t1913) <- c("a1913","tt1913")
attach(t1913)
plot(a1913~tt1913,main="2019(1~3 month)-traffic volume~find dust", xlab="find dust", ylab = "traffic")
t1913



# 2019 1분기(1월~3월) 상관관계 분석 - 피어슨의 상관계수

cor(tt1913,a1813, use='complete.obs', method = 'pearson')
cor.test(tt1913,a1913)



# 2020 상관관계 산점도 
t7
t8<-cbind(t7$pm10,t7$교통량)
t8<-data.frame(t8)
t8
names(t8)<- c("t8.a","t8.t")
attach(t8)
plot(t8.t~t8.a,main="2018-traffic volume~find dust", xlab="find dust", ylab = "traffic")

# 2020 상관관계 분석 - 피어슨의 상관계수 이용 
cov(t8.a,t8.t)
cor(t8.a,t8.t, use='complete.obs', method = 'pearson')
cor.test(t8.a,t8.t)


t9 <- cbind(plot1$pm10,plot1$traffic)
t9<-data.frame(t9)
names(t9) <- c("미세먼지","교통량")
t10 <- t8
names(t10) <-c("미세먼지","교통량")


t11 <-rbind(t9,t4,t10)


# 전체년도 상관관계 산점도 
names(t11)<- c("t11.a","t11.t")
attach(t11)
plot(t11.t~t11.a)

# 2020 상관관계 분석 - 피어슨의 상관계수 이용 
cov(t11.a,t11.t)
cor(t11.a,t11.t, use='complete.obs', method = 'pearson')
cor.test(t11.a,t11.t)


cov(air200$pm10,air200$교통량)
cor(air200$pm10,air200$교통량, use='complete.obs', method = 'pearson')
cor.test(air200$pm10,air200$교통량)

