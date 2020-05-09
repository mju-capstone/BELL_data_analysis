# merge beijing finedust with seoul finedust
shanghai_seoul_finedust <- shanghai_aqi
shanghai_seoul_finedust <- merge(x = shanghai_seoul_finedust, y = seoul_aqi, by = "date", all=TRUE)
sum(is.na(shanghai_seoul_finedust)) # 55
shanghai_seoul_finedust <- na.omit(shanghai_seoul_finedust)

# correlation values over 7years between beijing and seoul 0.2692177
cor(shanghai_seoul_finedust$shanghai_pm10, shanghai_seoul_finedust$seoul_pm10, method=c("pearson"))

# find outlier
plot(shanghai_seoul_finedust$shanghai_pm10, shanghai_seoul_finedust$seoul_pm10)

# remove outlier / scatter graph for shandong and seoul
boxplot(shanghai_seoul_finedust$shanghai_pm10, shanghai_seoul_finedust$seoul_pm10)
boxplot(shanghai_seoul_finedust$shanghai_pm10, shanghai_seoul_finedust$seoul_pm10)$stats # return statistic on boxplot
shanghai_seoul_finedust$shanghai_pm10 <- r_outlier <- ifelse(shanghai_seoul_finedust$shanghai_pm10 < 8 | shanghai_seoul_finedust$shanghai_pm10 > 101, NA, shanghai_seoul_finedust$shanghai_pm10)
shanghai_seoul_finedust$seoul_pm10 <- ifelse(shanghai_seoul_finedust$seoul_pm10 < 5 | shanghai_seoul_finedust$seoul_pm10 > 98, NA, shanghai_seoul_finedust$seoul_pm10)
boxplot(shanghai_seoul_finedust$shanghai_pm10, shanghai_seoul_finedust$seoul_pm10)
plot(shanghai_seoul_finedust$shanghai_pm10, shanghai_seoul_finedust$seoul_pm10)

# visualization annually
shanghai_seoul_finedust$date <- as.Date(shanghai_seoul_finedust$date, format="%Y/%m/%d") # change string to date 

library('lubridate')
shanghai_seoul_finedust$year <- year(shanghai_seoul_finedust$date)
shanghai_seoul_finedust$month <- month(shanghai_seoul_finedust$date)


  # 2014
shanghai_seoul_finedust2014 <- subset(shanghai_seoul_finedust, year=="2014")
    # correlation value = 0.1114912
cor(shanghai_seoul_finedust2014$shanghai_pm10, shanghai_seoul_finedust2014$seoul_pm10, use=("complete.obs"))
plot(shanghai_seoul_finedust2014$shanghai_pm10, shanghai_seoul_finedust2014$seoul_pm10)

    # shanghai & seoul finedus in 2014
library('dplyr')
shanghai_seoul_finedust2014 <- na.omit(shanghai_seoul_finedust2014)
shanghai_seoul_finedust2014 <- shanghai_seoul_finedust2014 %>%
  group_by(month) %>%
  summarize(shanghai_pm10 = mean(shanghai_pm10), seoul_pm10 = mean(seoul_pm10))

library('ggplot2')
shagg1 <- ggplot(shanghai_seoul_finedust2014, aes(month, shanghai_pm10, group = 1)) + geom_line(color = 'pink', size=1) + scale_x_continuous(breaks=seq(1, 12, 1)) + ggtitle("Finedust between Shanghai and Seoul 2014") + ylab('finedust') + theme(plot.title = element_text(size = 12, hjust=0.5))
shagg1 <- shagg1+geom_line(aes(month, seoul_pm10), color = 'skyblue', size=1)
shagg1


  # 2015
shanghai_seoul_finedust2015 <- subset(shanghai_seoul_finedust, year=="2015")
    # correlation value = 0.2097745
cor(shanghai_seoul_finedust2015$shanghai_pm10, shanghai_seoul_finedust2015$seoul_pm10, use=("complete.obs"))
plot(shanghai_seoul_finedust2015$shanghai_pm10, shanghai_seoul_finedust2015$seoul_pm10)

    # shanghai & seoul finedus in 2015
library('dplyr')
shanghai_seoul_finedust2015 <- na.omit(shanghai_seoul_finedust2015)
shanghai_seoul_finedust2015 <- shanghai_seoul_finedust2015 %>%
  group_by(month) %>%
  summarize(shanghai_pm10 = mean(shanghai_pm10), seoul_pm10 = mean(seoul_pm10))

library('ggplot2')
shagg2 <- ggplot(shanghai_seoul_finedust2015, aes(month, shanghai_pm10, group = 1)) + geom_line(color = 'pink', size=1) + scale_x_continuous(breaks=seq(1, 12, 1)) + ggtitle("Finedust between Shanghai and Seoul 2015") + ylab('finedust') + theme(plot.title = element_text(size = 12, hjust=0.5))
shagg2 <- shagg2+geom_line(aes(month, seoul_pm10), color = 'skyblue', size=1)
shagg2


  # 2016
shanghai_seoul_finedust2016 <- subset(shanghai_seoul_finedust, year=="2016")
    # correlation value = 0.2510347
cor(shanghai_seoul_finedust2016$shanghai_pm10, shanghai_seoul_finedust2016$seoul_pm10, use=("complete.obs"))
plot(shanghai_seoul_finedust2016$shanghai_pm10, shanghai_seoul_finedust2016$seoul_pm10)

    # shanghai & seoul finedus in 2016
library('dplyr')
shanghai_seoul_finedust2016 <- na.omit(shanghai_seoul_finedust2016)
shanghai_seoul_finedust2016 <- shanghai_seoul_finedust2016 %>%
  group_by(month) %>%
  summarize(shanghai_pm10 = mean(shanghai_pm10), seoul_pm10 = mean(seoul_pm10))

library('ggplot2')
shagg3 <- ggplot(shanghai_seoul_finedust2016, aes(month, shanghai_pm10, group = 1)) + geom_line(color = 'pink', size=1) + scale_x_continuous(breaks=seq(1, 12, 1)) + ggtitle("Finedust between Shanghai and Seoul 2016") + ylab('finedust') + theme(plot.title = element_text(size = 12, hjust=0.5))
shagg3 <- shagg3+geom_line(aes(month, seoul_pm10), color = 'skyblue', size=1)
shagg3


  # 2017
shanghai_seoul_finedust2017 <- subset(shanghai_seoul_finedust, year=="2017")
    # correlation value = 0.2510347
cor(shanghai_seoul_finedust2017$shanghai_pm10, shanghai_seoul_finedust2017$seoul_pm10, use=("complete.obs"))
plot(shanghai_seoul_finedust2017$shanghai_pm10, shanghai_seoul_finedust2017$seoul_pm10)

    # shanghai & seoul finedus in 2017
library('dplyr')
shanghai_seoul_finedust2017 <- na.omit(shanghai_seoul_finedust2017)
shanghai_seoul_finedust2017 <- shanghai_seoul_finedust2017 %>%
  group_by(month) %>%
  summarize(shanghai_pm10 = mean(shanghai_pm10), seoul_pm10 = mean(seoul_pm10))

library('ggplot2')
shagg4 <- ggplot(shanghai_seoul_finedust2017, aes(month, shanghai_pm10, group = 1)) + geom_line(color = 'pink', size=1) + scale_x_continuous(breaks=seq(1, 12, 1)) + ggtitle("Finedust between Shanghai and Seoul 2017") + ylab('finedust') + theme(plot.title = element_text(size = 12, hjust=0.5))
shagg4 <- shagg4+geom_line(aes(month, seoul_pm10), color = 'skyblue', size=1)
shagg4


  # 2018
shanghai_seoul_finedust2018 <- subset(shanghai_seoul_finedust, year=="2018")
    # correlation value = 0.2510347
cor(shanghai_seoul_finedust2018$shanghai_pm10, shanghai_seoul_finedust2018$seoul_pm10, use=("complete.obs"))
plot(shanghai_seoul_finedust2018$shanghai_pm10, shanghai_seoul_finedust2018$seoul_pm10)

    # shanghai & seoul finedus in 2018
library('dplyr')
shanghai_seoul_finedust2018 <- na.omit(shanghai_seoul_finedust2018)
shanghai_seoul_finedust2018 <- shanghai_seoul_finedust2018 %>%
  group_by(month) %>%
  summarize(shanghai_pm10 = mean(shanghai_pm10), seoul_pm10 = mean(seoul_pm10))

library('ggplot2')
shagg5 <- ggplot(shanghai_seoul_finedust2018, aes(month, shanghai_pm10, group = 1)) + geom_line(color = 'pink', size=1) + scale_x_continuous(breaks=seq(1, 12, 1)) + ggtitle("Finedust between Shanghai and Seoul 2018") + ylab('finedust') + theme(plot.title = element_text(size = 12, hjust=0.5))
shagg5 <- shagg5+geom_line(aes(month, seoul_pm10), color = 'skyblue', size=1)
shagg5


  # 2019
shanghai_seoul_finedust2019 <- subset(shanghai_seoul_finedust, year=="2019")
    # correlation value = 0.2510347
cor(shanghai_seoul_finedust2019$shanghai_pm10, shanghai_seoul_finedust2019$seoul_pm10, use=("complete.obs"))
plot(shanghai_seoul_finedust2019$shanghai_pm10, shanghai_seoul_finedust2019$seoul_pm10)

    # shanghai & seoul finedus in 2019
library('dplyr')
shanghai_seoul_finedust2019 <- na.omit(shanghai_seoul_finedust2019)
shanghai_seoul_finedust2019 <- shanghai_seoul_finedust2019 %>%
  group_by(month) %>%
  summarize(shanghai_pm10 = mean(shanghai_pm10), seoul_pm10 = mean(seoul_pm10))

library('ggplot2')
shagg6 <- ggplot(shanghai_seoul_finedust2019, aes(month, shanghai_pm10, group = 1)) + geom_line(color = 'pink', size=1) + scale_x_continuous(breaks=seq(1, 12, 1)) + ggtitle("Finedust between Shanghai and Seoul 2019") + ylab('finedust') + theme(plot.title = element_text(size = 12, hjust=0.5))
shagg6 <- shagg6+geom_line(aes(month, seoul_pm10), color = 'skyblue', size=1)
shagg6


  # 2020
shanghai_seoul_finedust2020 <- subset(shanghai_seoul_finedust, year=="2020")
    # correlation value = 0.2510347
cor(shanghai_seoul_finedust2020$shanghai_pm10, shanghai_seoul_finedust2020$seoul_pm10, use=("complete.obs"))
plot(shanghai_seoul_finedust2020$shanghai_pm10, shanghai_seoul_finedust2020$seoul_pm10)

    # shanghai & seoul finedus in 2020
library('dplyr')
shanghai_seoul_finedust2020 <- na.omit(shanghai_seoul_finedust2020)
shanghai_seoul_finedust2020 <- shanghai_seoul_finedust2020 %>%
  group_by(month) %>%
  summarize(shanghai_pm10 = mean(shanghai_pm10), seoul_pm10 = mean(seoul_pm10))

library('ggplot2')
shagg7 <- ggplot(shanghai_seoul_finedust2020, aes(month, shanghai_pm10, group = 1)) + geom_line(color = 'pink', size=1) + scale_x_continuous(breaks=seq(1, 12, 1)) + ggtitle("Finedust between Shanghai and Seoul 2020") + ylab('finedust') + theme(plot.title = element_text(size = 12, hjust=0.5))
shagg7 <- shagg7+geom_line(aes(month, seoul_pm10), color = 'skyblue', size=1)
shagg7


library('gridExtra')
grid.arrange(shagg1, shagg2, shagg3, shagg4, shagg5, shagg6, shagg7, ncol=3)
