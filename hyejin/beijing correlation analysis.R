# merge beijing finedust with seoul finedust
beijing_seoul_finedust <- beijing_aqi
beijing_seoul_finedust <- merge(x = beijing_seoul_finedust, y = seoul_aqi, by = "date", all=TRUE)
sum(is.na(beijing_seoul_finedust)) # 56
beijing_seoul_finedust <- na.omit(beijing_seoul_finedust)

# correlation values over 7years between beijing and seoul 0.2159572
cor(beijing_seoul_finedust$beijing_pm10, beijing_seoul_finedust$seoul_pm10, method=c("pearson"))

# find outlier
plot(beijing_seoul_finedust$beijing_pm10, beijing_seoul_finedust$seoul_pm10)

# remove outlier / scatter graph for shandong and seoul
boxplot(beijing_seoul_finedust$beijing_pm10, beijing_seoul_finedust$seoul_pm10)
boxplot(beijing_seoul_finedust$beijing_pm10, beijing_seoul_finedust$seoul_pm10)$stats # return statistic on boxplot
beijing_seoul_finedust$beijing_pm10 <- r_outlier <- ifelse(beijing_seoul_finedust$beijing_pm10 < 2 | beijing_seoul_finedust$beijing_pm10 > 152, NA, beijing_seoul_finedust$beijing_pm10)
beijing_seoul_finedust$seoul_pm10 <- ifelse(beijing_seoul_finedust$seoul_pm10 < 5 | beijing_seoul_finedust$seoul_pm10 > 98, NA, beijing_seoul_finedust$seoul_pm10)
boxplot(beijing_seoul_finedust$beijing_pm10, beijing_seoul_finedust$seoul_pm10)
plot(beijing_seoul_finedust$beijing_pm10, beijing_seoul_finedust$seoul_pm10)

gg5 <- ggplot(beijing_seoul_finedust, aes(x=seoul_pm10, y=beijing_pm10)) + geom_point(shape=19, size=2, color='pink') + xlab("Seoul") + ylab("Beijing") + ggtitle("Correlation analysis between Seoul findeust and Beijing finedust") + theme(plot.title = element_text(size=15, hjust=0.5))
gg5

# visualization annually
beijing_seoul_finedust$date <- as.Date(beijing_seoul_finedust$date, format="%Y/%m/%d") # change string to date 

library('lubridate')
beijing_seoul_finedust$year <- year(beijing_seoul_finedust$date)
beijing_seoul_finedust$month <- month(beijing_seoul_finedust$date)


  # 2014
beijing_seoul_finedust2014 <- subset(beijing_seoul_finedust, year=="2014")
    # correlation value = 0.08084403
cor(beijing_seoul_finedust2014$beijing_pm10, beijing_seoul_finedust2014$seoul_pm10, use=("complete.obs"))
plot(beijing_seoul_finedust2014$beijing_pm10, beijing_seoul_finedust2014$seoul_pm10)

    # beijing & seoul finedus in 2014
library('dplyr')
beijing_seoul_finedust2014 <- na.omit(beijing_seoul_finedust2014)
beijing_seoul_finedust2014 <- beijing_seoul_finedust2014 %>%
  group_by(month) %>%
  summarize(beijing_pm10 = mean(beijing_pm10), seoul_pm10 = mean(seoul_pm10))

library('ggplot2')
bgg1 <- ggplot(beijing_seoul_finedust2014, aes(month, beijing_pm10, group = 1)) + geom_line(color = 'pink', size=1) + scale_x_continuous(breaks=seq(1, 12, 1)) + ggtitle("Finedust between Beijing and Seoul 2014") + ylab('finedust') + theme(plot.title = element_text(size = 12, hjust=0.5))
bgg1 <- bgg1+geom_line(aes(month, seoul_pm10), color = 'skyblue', size=1)
bgg1


  # 2015
beijing_seoul_finedust2015 <- subset(beijing_seoul_finedust, year=="2015")
# correlation value = 0.2140469
cor(beijing_seoul_finedust2015$beijing_pm10, beijing_seoul_finedust2015$seoul_pm10, use=("complete.obs"))
plot(beijing_seoul_finedust2015$beijing_pm10, beijing_seoul_finedust2015$seoul_pm10)

    # beijing & seoul finedus in 2015
library('dplyr')
beijing_seoul_finedust2015 <- na.omit(beijing_seoul_finedust2015)
beijing_seoul_finedust2015 <- beijing_seoul_finedust2015 %>%
  group_by(month) %>%
  summarize(beijing_pm10 = mean(beijing_pm10), seoul_pm10 = mean(seoul_pm10))

library('ggplot2')
bgg2 <- ggplot(beijing_seoul_finedust2015, aes(month, beijing_pm10, group = 1)) + geom_line(color = 'pink', size=1) + scale_x_continuous(breaks=seq(1, 12, 1)) + ggtitle("Finedust between Beijing and Seoul 2015") + ylab('finedust') + theme(plot.title = element_text(size = 12, hjust=0.5))
bgg2 <- bgg2+geom_line(aes(month, seoul_pm10), color = 'skyblue', size=1)
bgg2


  # 2016
beijing_seoul_finedust2016 <- subset(beijing_seoul_finedust, year=="2016")
    # correlation value = 0.1921699
cor(beijing_seoul_finedust2016$beijing_pm10, beijing_seoul_finedust2016$seoul_pm10, use=("complete.obs"))
plot(beijing_seoul_finedust2016$beijing_pm10, beijing_seoul_finedust2016$seoul_pm10)

    # beijing & seoul finedus in 2016
library('dplyr')
beijing_seoul_finedust2016 <- na.omit(beijing_seoul_finedust2016)
beijing_seoul_finedust2016 <- beijing_seoul_finedust2016 %>%
  group_by(month) %>%
  summarize(beijing_pm10 = mean(beijing_pm10), seoul_pm10 = mean(seoul_pm10))

library('ggplot2')
bgg3 <- ggplot(beijing_seoul_finedust2016, aes(month, beijing_pm10, group = 1)) + geom_line(color = 'pink', size=1) + scale_x_continuous(breaks=seq(1, 12, 1)) + ggtitle("Finedust between Beijing and Seoul 2016") + ylab('finedust') + theme(plot.title = element_text(size = 12, hjust=0.5))
bgg3 <- bgg3+geom_line(aes(month, seoul_pm10), color = 'skyblue', size=1)
bgg3


  # 2017
beijing_seoul_finedust2017 <- subset(beijing_seoul_finedust, year=="2017")
    # correlation value = 0.244406
cor(beijing_seoul_finedust2017$beijing_pm10, beijing_seoul_finedust2017$seoul_pm10, use=("complete.obs"))
plot(beijing_seoul_finedust2017$beijing_pm10, beijing_seoul_finedust2017$seoul_pm10)

    # beijing & seoul finedus in 2017
library('dplyr')
beijing_seoul_finedust2017 <- na.omit(beijing_seoul_finedust2017)
beijing_seoul_finedust2017 <- beijing_seoul_finedust2017 %>%
  group_by(month) %>%
  summarize(beijing_pm10 = mean(beijing_pm10), seoul_pm10 = mean(seoul_pm10))

library('ggplot2')
bgg4 <- ggplot(beijing_seoul_finedust2017, aes(month, beijing_pm10, group = 1)) + geom_line(color = 'pink', size=1) + scale_x_continuous(breaks=seq(1, 12, 1)) + ggtitle("Finedust between Beijing and Seoul 2017") + ylab('finedust') + theme(plot.title = element_text(size = 12, hjust=0.5))
bgg4 <- bgg4+geom_line(aes(month, seoul_pm10), color = 'skyblue', size=1)
bgg4


  # 2018
beijing_seoul_finedust2018 <- subset(beijing_seoul_finedust, year=="2018")
    # correlation value = 0.4192114
cor(beijing_seoul_finedust2018$beijing_pm10, beijing_seoul_finedust2018$seoul_pm10, use=("complete.obs"))
plot(beijing_seoul_finedust2018$beijing_pm10, beijing_seoul_finedust2018$seoul_pm10)

    # beijing & seoul finedus in 2018
library('dplyr')
beijing_seoul_finedust2018 <- na.omit(beijing_seoul_finedust2018)
beijing_seoul_finedust2018 <- beijing_seoul_finedust2018 %>%
  group_by(month) %>%
  summarize(beijing_pm10 = mean(beijing_pm10), seoul_pm10 = mean(seoul_pm10))

library('ggplot2')
bgg5 <- ggplot(beijing_seoul_finedust2018, aes(month, beijing_pm10, group = 1)) + geom_line(color = 'pink', size=1) + scale_x_continuous(breaks=seq(1, 12, 1)) + ggtitle("Finedust between Beijing and Seoul 2018") + ylab('finedust') + theme(plot.title = element_text(size = 12, hjust=0.5))
bgg5 <- bgg5+geom_line(aes(month, seoul_pm10), color = 'skyblue', size=1)
bgg5


  # 2019
beijing_seoul_finedust2019 <- subset(beijing_seoul_finedust, year=="2019")
    # correlation value = 0.2962889
cor(beijing_seoul_finedust2019$beijing_pm10, beijing_seoul_finedust2019$seoul_pm10, use=("complete.obs"))
plot(beijing_seoul_finedust2019$beijing_pm10, beijing_seoul_finedust2019$seoul_pm10)

    # beijing & seoul finedus in 2019
library('dplyr')
beijing_seoul_finedust2019 <- na.omit(beijing_seoul_finedust2019)
beijing_seoul_finedust2019 <- beijing_seoul_finedust2019 %>%
  group_by(month) %>%
  summarize(beijing_pm10 = mean(beijing_pm10), seoul_pm10 = mean(seoul_pm10))

library('ggplot2')
bgg6 <- ggplot(beijing_seoul_finedust2019, aes(month, beijing_pm10, group = 1)) + geom_line(color = 'pink', size=1) + scale_x_continuous(breaks=seq(1, 12, 1)) + ggtitle("Finedust between Beijing and Seoul 2019") + ylab('finedust') + theme(plot.title = element_text(size = 12, hjust=0.5))
bgg6 <- bgg6+geom_line(aes(month, seoul_pm10), color = 'skyblue', size=1)
bgg6


  # 2020
beijing_seoul_finedust2020 <- subset(beijing_seoul_finedust, year=="2020")
    # correlation value = 0.1010425
cor(beijing_seoul_finedust2020$beijing_pm10, beijing_seoul_finedust2020$seoul_pm10, use=("complete.obs"))
plot(beijing_seoul_finedust2020$beijing_pm10, beijing_seoul_finedust2020$seoul_pm10)

    # beijing & seoul finedus in 2020
library('dplyr')
beijing_seoul_finedust2020 <- na.omit(beijing_seoul_finedust2020)
beijing_seoul_finedust2020 <- beijing_seoul_finedust2020 %>%
  group_by(month) %>%
  summarize(beijing_pm10 = mean(beijing_pm10), seoul_pm10 = mean(seoul_pm10))

library('ggplot2')
bgg7 <- ggplot(beijing_seoul_finedust2020, aes(month, beijing_pm10, group = 1)) + geom_line(color = 'pink', size=1) + scale_x_continuous(breaks=seq(1, 12, 1)) + ggtitle("Finedust between Beijing and Seoul 2020") + ylab('finedust') + theme(plot.title = element_text(size = 12, hjust=0.5))
bgg7 <- bgg7+geom_line(aes(month, seoul_pm10), color = 'skyblue', size=1)
bgg7


library('gridExtra')
grid.arrange(bgg1, bgg2, bgg3, bgg4, bgg5, bgg6, bgg7, ncol=3)


# visualization from Jan to Apr
  # 2014
beijing_seoul_finedust201414 <- beijing_seoul_finedust2014
beijing_seoul_finedust201414 <- beijing_seoul_finedust201414[-grep("5", beijing_seoul_finedust201414$month),]
beijing_seoul_finedust201414 <- beijing_seoul_finedust201414[-grep("6", beijing_seoul_finedust201414$month),]
beijing_seoul_finedust201414 <- beijing_seoul_finedust201414[-grep("7", beijing_seoul_finedust201414$month),]
beijing_seoul_finedust201414 <- beijing_seoul_finedust201414[-grep("8", beijing_seoul_finedust201414$month),]
beijing_seoul_finedust201414 <- beijing_seoul_finedust201414[-grep("9", beijing_seoul_finedust201414$month),]
beijing_seoul_finedust201414 <- beijing_seoul_finedust201414[-grep("10", beijing_seoul_finedust201414$month),]
beijing_seoul_finedust201414 <- beijing_seoul_finedust201414[-grep("11", beijing_seoul_finedust201414$month),]
beijing_seoul_finedust201414 <- beijing_seoul_finedust201414[-grep("12", beijing_seoul_finedust201414$month),]

    # correlation value = 0.8501294
cor(beijing_seoul_finedust201414$beijing_pm10, beijing_seoul_finedust201414$seoul_pm10, use=("complete.obs"))
plot(beijing_seoul_finedust201414$beijing_pm10, beijing_seoul_finedust201414$seoul_pm10)

bgg201414 <- ggplot(beijing_seoul_finedust201414, aes(month, beijing_pm10, group = 1)) + geom_line(color = 'pink', size=1) + ggtitle("Finedust between Beijing and Seoul from Jan to Apr in 2014") + ylab('finedust') + theme(plot.title = element_text(size = 9.5, hjust=0.5))
bgg201414 <- bgg201414+geom_line(aes(month, seoul_pm10), color = 'skyblue', size=1)
bgg201414


  # 2015
beijing_seoul_finedust201514 <- beijing_seoul_finedust2015
beijing_seoul_finedust201514 <- beijing_seoul_finedust201514[-grep("5", beijing_seoul_finedust201514$month),]
beijing_seoul_finedust201514 <- beijing_seoul_finedust201514[-grep("6", beijing_seoul_finedust201514$month),]
beijing_seoul_finedust201514 <- beijing_seoul_finedust201514[-grep("7", beijing_seoul_finedust201514$month),]
beijing_seoul_finedust201514 <- beijing_seoul_finedust201514[-grep("8", beijing_seoul_finedust201514$month),]
beijing_seoul_finedust201514 <- beijing_seoul_finedust201514[-grep("9", beijing_seoul_finedust201514$month),]
beijing_seoul_finedust201514 <- beijing_seoul_finedust201514[-grep("10", beijing_seoul_finedust201514$month),]
beijing_seoul_finedust201514 <- beijing_seoul_finedust201514[-grep("11", beijing_seoul_finedust201514$month),]
beijing_seoul_finedust201514 <- beijing_seoul_finedust201514[-grep("12", beijing_seoul_finedust201514$month),]

    # correlation value = -0.4927243
cor(beijing_seoul_finedust201514$beijing_pm10, beijing_seoul_finedust201514$seoul_pm10, use=("complete.obs"))
plot(beijing_seoul_finedust201514$beijing_pm10, beijing_seoul_finedust201514$seoul_pm10)

bgg201514 <- ggplot(beijing_seoul_finedust201514, aes(month, beijing_pm10, group = 1)) + geom_line(color = 'pink', size=1) + ggtitle("Finedust between Beijing and Seoul from Jan to Apr in 2015") + ylab('finedust') + theme(plot.title = element_text(size = 9.5, hjust=0.5))
bgg201514 <- bgg201514+geom_line(aes(month, seoul_pm10), color = 'skyblue', size=1)
bgg201514


  # 2016
beijing_seoul_finedust201614 <- beijing_seoul_finedust2016
beijing_seoul_finedust201614 <- beijing_seoul_finedust201614[-grep("5", beijing_seoul_finedust201614$month),]
beijing_seoul_finedust201614 <- beijing_seoul_finedust201614[-grep("6", beijing_seoul_finedust201614$month),]
beijing_seoul_finedust201614 <- beijing_seoul_finedust201614[-grep("7", beijing_seoul_finedust201614$month),]
beijing_seoul_finedust201614 <- beijing_seoul_finedust201614[-grep("8", beijing_seoul_finedust201614$month),]
beijing_seoul_finedust201614 <- beijing_seoul_finedust201614[-grep("9", beijing_seoul_finedust201614$month),]
beijing_seoul_finedust201614 <- beijing_seoul_finedust201614[-grep("10", beijing_seoul_finedust201614$month),]
beijing_seoul_finedust201614 <- beijing_seoul_finedust201614[-grep("11", beijing_seoul_finedust201614$month),]
beijing_seoul_finedust201614 <- beijing_seoul_finedust201614[-grep("12", beijing_seoul_finedust201614$month),]

    # correlation value = 0.9964439
cor(beijing_seoul_finedust201614$beijing_pm10, beijing_seoul_finedust201614$seoul_pm10, use=("complete.obs"))
plot(beijing_seoul_finedust201614$beijing_pm10, beijing_seoul_finedust201614$seoul_pm10)

bgg201614 <- ggplot(beijing_seoul_finedust201614, aes(month, beijing_pm10, group = 1)) + geom_line(color = 'pink', size=1) + ggtitle("Finedust between Beijing and Seoul from Jan to Apr in 2016") + ylab('finedust') + theme(plot.title = element_text(size = 9.5, hjust=0.5))
bgg201614 <- bgg201614+geom_line(aes(month, seoul_pm10), color = 'skyblue', size=1)
bgg201614



  # 2017
beijing_seoul_finedust201714 <- beijing_seoul_finedust2017
beijing_seoul_finedust201714 <- beijing_seoul_finedust201714[-grep("5", beijing_seoul_finedust201714$month),]
beijing_seoul_finedust201714 <- beijing_seoul_finedust201714[-grep("6", beijing_seoul_finedust201714$month),]
beijing_seoul_finedust201714 <- beijing_seoul_finedust201714[-grep("7", beijing_seoul_finedust201714$month),]
beijing_seoul_finedust201714 <- beijing_seoul_finedust201714[-grep("8", beijing_seoul_finedust201714$month),]
beijing_seoul_finedust201714 <- beijing_seoul_finedust201714[-grep("9", beijing_seoul_finedust201714$month),]
beijing_seoul_finedust201714 <- beijing_seoul_finedust201714[-grep("10", beijing_seoul_finedust201714$month),]
beijing_seoul_finedust201714 <- beijing_seoul_finedust201714[-grep("11", beijing_seoul_finedust201714$month),]
beijing_seoul_finedust201714 <- beijing_seoul_finedust201714[-grep("12", beijing_seoul_finedust201714$month),]

    # correlation value = 0.5738404
cor(beijing_seoul_finedust201714$beijing_pm10, beijing_seoul_finedust201714$seoul_pm10, use=("complete.obs"))
plot(beijing_seoul_finedust201714$beijing_pm10, beijing_seoul_finedust201714$seoul_pm10)

bgg201714 <- ggplot(beijing_seoul_finedust201714, aes(month, beijing_pm10, group = 1)) + geom_line(color = 'pink', size=1) + ggtitle("Finedust between Beijing and Seoul from Jan to Apr in 2017") + ylab('finedust') + theme(plot.title = element_text(size = 9.5, hjust=0.5))
bgg201714 <- bgg201714+geom_line(aes(month, seoul_pm10), color = 'skyblue', size=1)
bgg201714


  # 2018
beijing_seoul_finedust201814 <- beijing_seoul_finedust2018
beijing_seoul_finedust201814 <- beijing_seoul_finedust201814[-grep("5", beijing_seoul_finedust201814$month),]
beijing_seoul_finedust201814 <- beijing_seoul_finedust201814[-grep("6", beijing_seoul_finedust201814$month),]
beijing_seoul_finedust201814 <- beijing_seoul_finedust201814[-grep("7", beijing_seoul_finedust201814$month),]
beijing_seoul_finedust201814 <- beijing_seoul_finedust201814[-grep("8", beijing_seoul_finedust201814$month),]
beijing_seoul_finedust201814 <- beijing_seoul_finedust201814[-grep("9", beijing_seoul_finedust201814$month),]
beijing_seoul_finedust201814 <- beijing_seoul_finedust201814[-grep("10", beijing_seoul_finedust201814$month),]
beijing_seoul_finedust201814 <- beijing_seoul_finedust201814[-grep("11", beijing_seoul_finedust201814$month),]
beijing_seoul_finedust201814 <- beijing_seoul_finedust201814[-grep("12", beijing_seoul_finedust201814$month),]

    # correlation value = -0.2134356
cor(beijing_seoul_finedust201814$beijing_pm10, beijing_seoul_finedust201814$seoul_pm10, use=("complete.obs"))
plot(beijing_seoul_finedust201814$beijing_pm10, beijing_seoul_finedust201814$seoul_pm10)

bgg201814 <- ggplot(beijing_seoul_finedust201814, aes(month, beijing_pm10, group = 1)) + geom_line(color = 'pink', size=1) + ggtitle("Finedust between Beijing and Seoul from Jan to Apr in 2018") + ylab('finedust') + theme(plot.title = element_text(size = 9.5, hjust=0.5))
bgg201814 <- bgg201814+geom_line(aes(month, seoul_pm10), color = 'skyblue', size=1)
bgg201814


  # 2019
beijing_seoul_finedust201914 <- beijing_seoul_finedust2019
beijing_seoul_finedust201914 <- beijing_seoul_finedust201914[-grep("5", beijing_seoul_finedust201914$month),]
beijing_seoul_finedust201914 <- beijing_seoul_finedust201914[-grep("6", beijing_seoul_finedust201914$month),]
beijing_seoul_finedust201914 <- beijing_seoul_finedust201914[-grep("7", beijing_seoul_finedust201914$month),]
beijing_seoul_finedust201914 <- beijing_seoul_finedust201914[-grep("8", beijing_seoul_finedust201914$month),]
beijing_seoul_finedust201914 <- beijing_seoul_finedust201914[-grep("9", beijing_seoul_finedust201914$month),]
beijing_seoul_finedust201914 <- beijing_seoul_finedust201914[-grep("10", beijing_seoul_finedust201914$month),]
beijing_seoul_finedust201914 <- beijing_seoul_finedust201914[-grep("11", beijing_seoul_finedust201914$month),]
beijing_seoul_finedust201914 <- beijing_seoul_finedust201914[-grep("12", beijing_seoul_finedust201914$month),]

    # correlation value = -0.9974315
cor(beijing_seoul_finedust201914$beijing_pm10, beijing_seoul_finedust201914$seoul_pm10, use=("complete.obs"))
plot(beijing_seoul_finedust201914$beijing_pm10, beijing_seoul_finedust201914$seoul_pm10)

bgg201914 <- ggplot(beijing_seoul_finedust201914, aes(month, beijing_pm10, group = 1)) + geom_line(color = 'pink', size=1) + ggtitle("Finedust between Beijing and Seoul from Jan to Apr in 2019") + ylab('finedust') + theme(plot.title = element_text(size = 9.5, hjust=0.5))
bgg201914 <- bgg201914+geom_line(aes(month, seoul_pm10), color = 'skyblue', size=1)
bgg201914


  # 2020
beijing_seoul_finedust202014 <- beijing_seoul_finedust2020

  # correlation value = 0.681181
cor(beijing_seoul_finedust202014$beijing_pm10, beijing_seoul_finedust202014$seoul_pm10, use=("complete.obs"))
plot(beijing_seoul_finedust202014$beijing_pm10, beijing_seoul_finedust202014$seoul_pm10)

bgg202014 <- ggplot(beijing_seoul_finedust202014, aes(month, beijing_pm10, group = 1)) + geom_line(color = 'pink', size=1) + ggtitle("Finedust between Beijing and Seoul from Jan to Apr in 2020") + ylab('finedust') + theme(plot.title = element_text(size = 9.5, hjust=0.5))
bgg202014 <- bgg202014+geom_line(aes(month, seoul_pm10), color = 'skyblue', size=1)
bgg202014

grid.arrange(bgg201414, bgg201514, bgg201614, bgg201714, bgg201814, bgg201914, bgg202014, ncol=3)


# write csv
write.csv(beijing_seoul_finedust2014, file="beijing_seoul_finedust2014.csv", row.names=TRUE)
write.csv(beijing_seoul_finedust2015, file="beijing_seoul_finedust2015.csv", row.names=TRUE)
write.csv(beijing_seoul_finedust2016, file="beijing_seoul_finedust2016.csv", row.names=TRUE)
write.csv(beijing_seoul_finedust2017, file="beijing_seoul_finedust2017.csv", row.names=TRUE)
write.csv(beijing_seoul_finedust2018, file="beijing_seoul_finedust2018.csv", row.names=TRUE)
write.csv(beijing_seoul_finedust2019, file="beijing_seoul_finedust2019.csv", row.names=TRUE)
write.csv(beijing_seoul_finedust2020, file="beijing_seoul_finedust2020.csv", row.names=TRUE)
write.csv(beijing_seoul_finedust201414, file="beijing_seoul_finedust201414.csv", row.names=TRUE)
write.csv(beijing_seoul_finedust201514, file="beijing_seoul_finedust201514.csv", row.names=TRUE)
write.csv(beijing_seoul_finedust201614, file="beijing_seoul_finedust201614.csv", row.names=TRUE)
write.csv(beijing_seoul_finedust201714, file="beijing_seoul_finedust201714.csv", row.names=TRUE)
write.csv(beijing_seoul_finedust201814, file="beijing_seoul_finedust201814.csv", row.names=TRUE)
write.csv(beijing_seoul_finedust201914, file="beijing_seoul_finedust201914.csv", row.names=TRUE)
write.csv(beijing_seoul_finedust202014, file="beijing_seoul_finedust202014.csv", row.names=TRUE)

