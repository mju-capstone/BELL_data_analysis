# 미세먼지 농도가 100이상일 때 주로 어떤 바람이 부는지 분석해봄
df <- subset(data14, pm10>=100)
head(df)
df <- rbind(df, subset(data15, pm10>=100))
tail(df)
df <- rbind(df, subset(data16, pm10>=100))
tail(df)
df <- rbind(df, subset(data17, pm10>=100))
tail(df)
df <- rbind(df, subset(data18, pm10>=100))
tail(df)
df <- rbind(df, subset(data19, pm10>=100))
tail(df)
df <- rbind(df, subset(data20, pm10>=100))
tail(df)


library(dplyr)
countDf <- count(df, 풍향2)
countDf$풍향2 <- factor(countDf$풍향2, levels=c("N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"))
countDf

library(ggplot2)
library(ggrepel)
g <- ggplot(countDf, aes(x="", y=n, fill=풍향2))+
  geom_bar(width=1, stat="identity", color="white")+
  coord_polar("y")+
  geom_text_repel(aes(label=paste0(round(n/2150*100,1),"% - ",풍향2)),
            position=position_stack(vjust=0.5))+
  theme_void()
g
