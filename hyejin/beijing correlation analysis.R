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
