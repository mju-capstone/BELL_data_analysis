library(dygraphs)
library(highcharter)
library(dplyr)
library(ggplot2)
library(reshape2)

########################### 2018 data #####################################

# 1. 월별 요일 그룹화 그래프 (미세먼지)
bar2<-ggplot(daily_air3, aes(x=월, y=mean, fill=요일))
f2<-bar2+geom_bar(stat="identity", position = "dodge") + ggtitle("2018년 요일별 서울시 미세먼지(pm10) 농도")+theme(plot.title = element_text(family = "serif", face = "bold", hjust = 0.5, size = 15, color = "gray30"))
f2

# 2. 월별 요일 그룹화 그래프 (교통량)
bar<-ggplot(daily_traffic3, aes(x=월, y=sum, fill=요일))
f1<-bar+geom_bar(stat="identity", position = "dodge") + ggtitle("2018년 요일별 서울시 교통량")+theme(plot.title = element_text(family = "serif", face = "bold", hjust = 0.5, size = 15, color = "gray30"))
f1


#3. 일별 교통량-미세먼지 추이 비교 

#gg<-ggplot(plot1, aes(x=date, y=traffic, group=1)) +geom_line()
#gg_1<- gg+geom_line(color="steelblue")+geom_line(aes(x=date, y=pm10, group=1), color="#ff3366") + ggtitle("2018 일별 서울시 교통량 미세먼지 농도 추이 비교")+theme(plot.title = element_text(family = "serif", face = "bold", hjust = 0.5, size = 15, color = "darkblue")) 
#gg_1


gg_2  <-ggplot()+
  geom_line(data=plot1,aes(y=traffic,x= date,colour="darkblue"),size=0.7 )+
  geom_line(data=plot1,aes(y=pm10,x= date,colour="red"),size=0.7) +
  scale_color_discrete(name = "data", labels = c("교통량", "미세먼지"))+ 
  ggtitle("2018 일별 서울시 교통량 미세먼지 농도 추이 비교")+theme(plot.title = element_text(family = "serif", face = "bold", hjust = 0.5, size = 15, color = "gray10")) 
  
gg_2

#4. 요일별 교통량-미세먼지 추이 비교 
gg2<-ggplot(a_2018, aes(x=day, y=t_0.01, group=1)) +geom_bar(stat = "identity",width=0.7, fill="steelblue")
gg2+geom_bar(aes(x=day, y=pm10, group=1), stat = "identity",width=0.7, fill="#ff3366") + ggtitle("2018 요일별 서울시 교통량과 미세먼지")+theme(plot.title = element_text(family = "serif", face = "bold", hjust = 0.5, size = 15, color = "gray30"))



########################### 2019 data #####################################

# 1. 월별 요일 그룹화 그래프 (미세먼지)
bar3<-ggplot(air19_b, aes(x=월, y=mean, fill=요일))
f3<-bar3+geom_bar(stat="identity", position = "dodge") + ggtitle("2019년 요일별 서울시 미세먼지(pm10) 농도")+theme(plot.title = element_text(family = "serif", face = "bold", hjust = 0.5, size = 15, color = "gray30"))
f3

# 2. 월별 요일 그룹화 그래프 (교통량)
bar4<-ggplot(t_2019, aes(x=월, y=sum, fill=요일))
f4<-bar4+geom_bar(stat="identity", position = "dodge") + ggtitle("2019년 요일별 서울시 교통량")+theme(plot.title = element_text(family = "serif", face = "bold", hjust = 0.5, size = 15, color = "gray30"))
f4



#3. 일별 교통량-미세먼지 추이 비교 
gg_3  <-ggplot()+
  geom_line(data=t2,aes(y=traffic_19.교통량,x= 일자,colour="darkblue"),size=0.7 )+
  geom_line(data=t2,aes(y=pm10,x= 일자,colour="red"),size=0.7) +
  scale_color_discrete(name = "data", labels = c("교통량", "미세먼지"))+ 
  ggtitle("2019 일별 서울시 교통량 미세먼지 농도 추이 비교")+theme(plot.title = element_text(family = "serif", face = "bold", hjust = 0.5, size = 15, color = "gray10")) 

gg_3

#4. 요일별 교통량-미세먼지 추이 비교 

names(tt_2019) <-c("year","day","traffic","t001","pm10")
gg_4<-ggplot(tt_2019, aes(x=day, y=t001, group=1)) +geom_bar(stat = "identity",width=0.7, fill="steelblue")
gg_4+geom_bar(aes(x=day, y=pm10, group=1), stat = "identity",width=0.7, fill="#ff3366") + ggtitle("2019 요일별 서울시 교통량과 미세먼지")+theme(plot.title = element_text(family = "serif", face = "bold", hjust = 0.5, size = 15, color = "gray30"))


########################### 2020 data #####################################



#3. 일별 교통량-미세먼지 추이 비교 
gg_4  <-ggplot()+
  geom_line(data=t7,aes(y=교통량,x= 일자,colour="darkblue"),size=0.7 )+
  geom_line(data=t7,aes(y=pm10,x= 일자,colour="red"),size=0.7) +
  scale_color_discrete(name = "data", labels = c("교통량", "미세먼지"))+ 
  ggtitle("2020 일별 서울시 교통량 미세먼지 농도 추이 비교")+theme(plot.title = element_text(family = "serif", face = "bold", hjust = 0.5, size = 15, color = "gray10")) 

gg_4


#4. 요일별 교통량-미세먼지 추이 비교 

t8<-cbind(air20_b1,tt_2020$x)
t8
gg_5<-ggplot(t8, aes(x=day, y=tt_2020$x, group=1)) +geom_bar(stat = "identity",width=0.7, fill="steelblue")
gg_5+geom_bar(aes(x=day, y=pm10, group=1), stat = "identity",width=0.7, fill="#ff3366") + ggtitle("2020 요일별 서울시 교통량과 미세먼지")+theme(plot.title = element_text(family = "serif", face = "bold", hjust = 0.5, size = 15, color = "gray30"))




#년도-월별-요일 그래프  
#ggplot(daily_traffic4, aes(x=label, y=sum, group=1)) +geom_line() 
#각 일자별 교통량 추이 변화 그래프
#ggplot(daily_traffic, aes(x=일자, y=교통량합계, group=1)) +geom_point() 
#요일별 미세먼지 막대 그래프 
#ggplot(air_y2018, aes(day, pm10))+geom_bar(stat="identity")
#요일별 미세먼지 추이 변화 그래프 
#ggplot(daily_traffic4, aes(x=label, y=sum, group=1)) +geom_line()
#ggplot(data=daily_traffic3, aes(x=요일, y=sum)) + geom_point()
#일별 교통량 데이터 (0-1정규화) 막대 그래프 
#ggplot(plot1, aes(x=date,y=traffic))+ 
#  geom_bar(stat="identity", width=0.7, 
#           fill="steelblue")