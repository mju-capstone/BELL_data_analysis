# merge cities in Shandong without NA
shandong <- merge(x = binzhou_aqi, y = dezhou_aqi, by = "date", all =TRUE)
shandong <- merge(x = shandong, y = dongying_aqi, by = "date", all =TRUE)
shandong <- merge(x = shandong, y = heze_aqi, by = "date", all =TRUE)
shandong <- merge(x = shandong, y = jinan_aqi, by = "date", all =TRUE)
shandong <- merge(x = shandong, y = jining_aqi, by = "date", all =TRUE)
shandong <- merge(x = shandong, y = liaocheng_aqi, by = "date", all =TRUE)
shandong <- merge(x = shandong, y = linyi_aqi, by = "date", all =TRUE)
shandong <- merge(x = shandong, y = qingdao_aqi, by = "date", all =TRUE)
shandong <- merge(x = shandong, y = rizhao_aqi, by = "date", all =TRUE)
shandong <- merge(x = shandong, y = taian_aqi, by = "date", all =TRUE)
shandong <- merge(x = shandong, y = weifang_aqi, by = "date", all =TRUE)
shandong <- merge(x = shandong, y = weihai_aqi, by = "date", all =TRUE)
shandong <- merge(x = shandong, y = yantai_aqi, by = "date", all =TRUE)
shandong <- merge(x = shandong, y = zaozhung_aqi, by = "date", all =TRUE)
shandong <- merge(x = shandong, y = zibo_aqi, by = "date", all =TRUE)
sum(is.na(shandong)) # 12
shandong <- na.omit(shandong)

s_f <- shandong[, c(2:16)]
shandong$average <- rowMeans(s_f, na.rm=TRUE)
s_f <- shandong[, c(1, 18)]
shandong_seoul_finedust <- merge(x = s_f, y = seoul_aqi, by = "date", all=TRUE)
colnames(shandong_seoul_finedust) <- c("date", "shandong_average", "seoul_average")
sum(is.na(shandong_seoul_finedust)) # 59개
shandong_seoul_finedust <- na.omit(shandong_seoul_finedust)

# correlation values over 7years between shandong and seoul 0.3677968
cor(shandong_seoul_finedust$shandong_average, shandong_seoul_finedust$seoul_average, method=c("pearson"))

# find outlier
plot(shandong_seoul_finedust$shandong_average, shandong_seoul_finedust$seoul_average)

# remove outlier / scatter graph for shandong and seoul
boxplot(shandong_seoul_finedust$shandong_average, shandong_seoul_finedust$seoul_average)
boxplot(shandong_seoul_finedust$shandong_average, shandong_seoul_finedust$seoul_average)$stats # return statistic on boxplot
shandong_seoul_finedust$shandong_average <- r_outlier <- ifelse(shandong_seoul_finedust$shandong_average < 12.73333 | shandong_seoul_finedust$shandong_average > 180.20000, NA, shandong_seoul_finedust$shandong_average)
shandong_seoul_finedust$seoul_average <- ifelse(shandong_seoul_finedust$seoul_average < 5 | shandong_seoul_finedust$seoul_average > 98, NA, shandong_seoul_finedust$seoul_average)
boxplot(shandong_seoul_finedust$shandong_average, shandong_seoul_finedust$seoul_average)
plot(shandong_seoul_finedust$shandong_average, shandong_seoul_finedust$seoul_average)

gg6 <- ggplot(shandong_seoul_finedust, aes(x=seoul_average, y=shandong_average)) + geom_point(shape=19, size=2, color='pink') + xlab("Seoul") + ylab("Shandong") + ggtitle("Correlation analysis between Seoul findeust and Shandong finedust") + theme(plot.title = element_text(size=15, hjust=0.5))
gg6

# visualization annually
shandong_seoul_finedust$date <- as.Date(shandong_seoul_finedust$date, format="%Y/%m/%d") # change string to date 

library('lubridate')
shandong_seoul_finedust$year <- year(shandong_seoul_finedust$date)
shandong_seoul_finedust$month <- month(shandong_seoul_finedust$date)


  # 2014
shandong_seoul_finedust2014 <- subset(shandong_seoul_finedust, year=="2014")
    # correlation value = 0.1.886321
cor(shandong_seoul_finedust2014$shandong_average, shandong_seoul_finedust2014$seoul_average, use=("complete.obs"))
plot(shandong_seoul_finedust2014$shandong_average, shandong_seoul_finedust2014$seoul_average)

    # shandong & seoul finedus in 2014
library('dplyr')
shandong_seoul_finedust2014 <- na.omit(shandong_seoul_finedust2014)
shandong_seoul_finedust2014 <- shandong_seoul_finedust2014 %>%
  group_by(month) %>%
  summarize(shandong_average = mean(shandong_average), seoul_average = mean(seoul_average))

library('ggplot2')
shgg1 <- ggplot(shandong_seoul_finedust2014, aes(month, shandong_average, group = 1)) + geom_line(color = 'pink', size=1) + scale_x_continuous(breaks=seq(1, 12, 1)) + ggtitle("Finedust between Shandong and Seoul 2014") + ylab('finedust') + theme(plot.title = element_text(size = 12, hjust=0.5))
shgg1 <- shgg1+geom_line(aes(month, seoul_average), color = 'skyblue', size=1)
shgg1


  # 2015
shandong_seoul_finedust2015 <- subset(shandong_seoul_finedust, year=="2015")
    # correlation value = 0.4135932
cor(shandong_seoul_finedust2015$shandong_average, shandong_seoul_finedust2015$seoul_average, use=("complete.obs"))
plot(shandong_seoul_finedust2015$shandong_average, shandong_seoul_finedust2015$seoul_average)

    # shandong & seoul finedus in 2015
shandong_seoul_finedust2015 <- na.omit(shandong_seoul_finedust2015)
shandong_seoul_finedust2015 <- shandong_seoul_finedust2015 %>%
  group_by(month) %>%
  summarize(shandong_average = mean(shandong_average), seoul_average = mean(seoul_average))

shgg2 <- ggplot(shandong_seoul_finedust2015, aes(month, shandong_average, group = 1)) + geom_line(color = 'pink', size=1) + scale_x_continuous(breaks=seq(1, 12, 1)) + ggtitle("Finedust between Shandong and Seoul 2015") + ylab('finedust') + theme(plot.title = element_text(size = 12, hjust=0.5))
shgg2 <- shgg2+geom_line(aes(month, seoul_average), color = 'skyblue', size=1)
shgg2


  # 2016
shandong_seoul_finedust2016 <- subset(shandong_seoul_finedust, year=="2016")
    # correlation value = 0.4177797
cor(shandong_seoul_finedust2016$shandong_average, shandong_seoul_finedust2016$seoul_average, use=("complete.obs"))
plot(shandong_seoul_finedust2016$shandong_average, shandong_seoul_finedust2016$seoul_average)

    # shandong & seoul finedus in 2016
shandong_seoul_finedust2016 <- na.omit(shandong_seoul_finedust2016)
shandong_seoul_finedust2016 <- shandong_seoul_finedust2016 %>%
  group_by(month) %>%
  summarize(shandong_average = mean(shandong_average), seoul_average = mean(seoul_average))

shgg3 <- ggplot(shandong_seoul_finedust2016, aes(month, shandong_average, group = 1)) + geom_line(color = 'pink', size=1) + scale_x_continuous(breaks=seq(1, 12, 1)) + ggtitle("Finedust between Shandong and Seoul 2016") + ylab('finedust') + theme(plot.title = element_text(size = 12, hjust=0.5))
shgg3 <- shgg3+geom_line(aes(month, seoul_average), color = 'skyblue', size=1)
shgg3


  # 2017
shandong_seoul_finedust2017 <- subset(shandong_seoul_finedust, year=="2017")
    # correlation value = 0.3793914
cor(shandong_seoul_finedust2017$shandong_average, shandong_seoul_finedust2017$seoul_average, use=("complete.obs"))
plot(shandong_seoul_finedust2017$shandong_average, shandong_seoul_finedust2017$seoul_average)

    # shandong & seoul finedus in 2017
shandong_seoul_finedust2017 <- na.omit(shandong_seoul_finedust2017)
shandong_seoul_finedust2017 <- shandong_seoul_finedust2017 %>%
  group_by(month) %>%
  summarize(shandong_average = mean(shandong_average), seoul_average = mean(seoul_average))

shgg4 <- ggplot(shandong_seoul_finedust2017, aes(month, shandong_average, group = 1)) + geom_line(color = 'pink', size=1) + scale_x_continuous(breaks=seq(1, 12, 1)) + ggtitle("Finedust between Shandong and Seoul 2017") + ylab('finedust') + theme(plot.title = element_text(size = 12, hjust=0.5))
shgg4 <- shgg5+geom_line(aes(month, seoul_average), color = 'skyblue', size=1)
shgg4


  # 2018
shandong_seoul_finedust2018 <- subset(shandong_seoul_finedust, year=="2018")
    # correlation value = 0.5177797
cor(shandong_seoul_finedust2018$shandong_average, shandong_seoul_finedust2018$seoul_average, use=("complete.obs"))
plot(shandong_seoul_finedust2018$shandong_average, shandong_seoul_finedust2018$seoul_average)

    # shandong & seoul finedus in 2018
shandong_seoul_finedust2018 <- na.omit(shandong_seoul_finedust2018)
shandong_seoul_finedust2018 <- shandong_seoul_finedust2018 %>%
  group_by(month) %>%
  summarize(shandong_average = mean(shandong_average), seoul_average = mean(seoul_average))

shgg5 <- ggplot(shandong_seoul_finedust2018, aes(month, shandong_average, group = 1)) + geom_line(color = 'pink', size=1) + scale_x_continuous(breaks=seq(1, 12, 1)) + ggtitle("Finedust between Shandong and Seoul 2018") + ylab('finedust') + theme(plot.title = element_text(size = 12, hjust=0.5))
shgg5 <- shgg5+geom_line(aes(month, seoul_average), color = 'skyblue', size=1)
shgg5


  # 2019
shandong_seoul_finedust2019 <- subset(shandong_seoul_finedust, year=="2019")
    # correlation value = 0.5729801
cor(shandong_seoul_finedust2019$shandong_average, shandong_seoul_finedust2019$seoul_average, use=("complete.obs"))
plot(shandong_seoul_finedust2019$shandong_average, shandong_seoul_finedust2019$seoul_average)

    # shandong & seoul finedus in 2019
shandong_seoul_finedust2019 <- na.omit(shandong_seoul_finedust2019)
shandong_seoul_finedust2019 <- shandong_seoul_finedust2019 %>%
  group_by(month) %>%
  summarize(shandong_average = mean(shandong_average), seoul_average = mean(seoul_average))

shgg6 <- ggplot(shandong_seoul_finedust2019, aes(month, shandong_average, group = 1)) + geom_line(color = 'pink', size=1) + scale_x_continuous(breaks=seq(1, 12, 1)) + ggtitle("Finedust between Shandong and Seoul 2019") + ylab('finedust') + theme(plot.title = element_text(size = 12, hjust=0.5))
shgg6 <- shgg6+geom_line(aes(month, seoul_average), color = 'skyblue', size=1)
shgg6


  # 2020
shandong_seoul_finedust2020 <- subset(shandong_seoul_finedust, year=="2020")
  # correlation value = 0.3994715
cor(shandong_seoul_finedust2020$shandong_average, shandong_seoul_finedust2020$seoul_average, use=("complete.obs"))
plot(shandong_seoul_finedust2020$shandong_average, shandong_seoul_finedust2020$seoul_average)

  # shandong & seoul finedus in 2020
shandong_seoul_finedust2020 <- na.omit(shandong_seoul_finedust2020)
shandong_seoul_finedust2020 <- shandong_seoul_finedust2020 %>%
  group_by(month) %>%
  summarize(shandong_average = mean(shandong_average), seoul_average = mean(seoul_average))

shgg7 <- ggplot(shandong_seoul_finedust2020, aes(month, shandong_average, group = 1)) + geom_line(color = 'pink', size=1) + scale_x_continuous(breaks=seq(1, 12, 1)) + ggtitle("Finedust between Shandong and Seoul 2020") + ylab('finedust') + theme(plot.title = element_text(size = 12, hjust=0.5))
shgg7 <- shgg7+geom_line(aes(month, seoul_average), color = 'skyblue', size=1)
shgg7

library('gridExtra')
grid.arrange(shgg1, shgg2, shgg3, shgg4, shgg5, shgg6, shgg7, ncol=3)


# visualization from Jan to Apr
  # 2014
shandong_seoul_finedust201414 <- shandong_seoul_finedust2014
shandong_seoul_finedust201414 <- shandong_seoul_finedust201414[-grep("5", shandong_seoul_finedust201414$month),]
shandong_seoul_finedust201414 <- shandong_seoul_finedust201414[-grep("6", shandong_seoul_finedust201414$month),]
shandong_seoul_finedust201414 <- shandong_seoul_finedust201414[-grep("7", shandong_seoul_finedust201414$month),]
shandong_seoul_finedust201414 <- shandong_seoul_finedust201414[-grep("8", shandong_seoul_finedust201414$month),]
shandong_seoul_finedust201414 <- shandong_seoul_finedust201414[-grep("9", shandong_seoul_finedust201414$month),]
shandong_seoul_finedust201414 <- shandong_seoul_finedust201414[-grep("10", shandong_seoul_finedust201414$month),]
shandong_seoul_finedust201414 <- shandong_seoul_finedust201414[-grep("11", shandong_seoul_finedust201414$month),]
shandong_seoul_finedust201414 <- shandong_seoul_finedust201414[-grep("12", shandong_seoul_finedust201414$month),]

    # correlation value = 0.6905623
cor(shandong_seoul_finedust201414$shandong_average, shandong_seoul_finedust201414$seoul_average, use=("complete.obs"))
plot(shandong_seoul_finedust201414$shandong_average, shandong_seoul_finedust201414$seoul_average)

shgg201414 <- ggplot(shandong_seoul_finedust201414, aes(month, shandong_average, group = 1)) + geom_line(color = 'pink', size=1) + ggtitle("Finedust between Shandong and Seoul from Jan to Apr in 2014") + ylab('finedust') + theme(plot.title = element_text(size = 9, hjust=0.5))
shgg201414 <- shgg201414+geom_line(aes(month, seoul_average), color = 'skyblue', size=1)
shgg201414

  # 2015
shandong_seoul_finedust201514 <- shandong_seoul_finedust2015
shandong_seoul_finedust201514 <- shandong_seoul_finedust201514[-grep("5", shandong_seoul_finedust201514$month),]
shandong_seoul_finedust201514 <- shandong_seoul_finedust201514[-grep("6", shandong_seoul_finedust201514$month),]
shandong_seoul_finedust201514 <- shandong_seoul_finedust201514[-grep("7", shandong_seoul_finedust201514$month),]
shandong_seoul_finedust201514 <- shandong_seoul_finedust201514[-grep("8", shandong_seoul_finedust201514$month),]
shandong_seoul_finedust201514 <- shandong_seoul_finedust201514[-grep("9", shandong_seoul_finedust201514$month),]
shandong_seoul_finedust201514 <- shandong_seoul_finedust201514[-grep("10", shandong_seoul_finedust201514$month),]
shandong_seoul_finedust201514 <- shandong_seoul_finedust201514[-grep("11", shandong_seoul_finedust201514$month),]
shandong_seoul_finedust201514 <- shandong_seoul_finedust201514[-grep("12", shandong_seoul_finedust201514$month),]

    # correlation value = 0.8031002
cor(shandong_seoul_finedust201514$shandong_average, shandong_seoul_finedust201514$seoul_average, use=("complete.obs"))
plot(shandong_seoul_finedust201514$shandong_average, shandong_seoul_finedust201514$seoul_average)

shgg201514 <- ggplot(shandong_seoul_finedust201514, aes(month, shandong_average, group = 1)) + geom_line(color = 'pink', size=1) + ggtitle("Finedust between Shandong and Seoul from Jan to Apr in 2015") + ylab('finedust') + theme(plot.title = element_text(size = 9, hjust=0.5))
shgg201514 <- shgg201514+geom_line(aes(month, seoul_average), color = 'skyblue', size=1)
shgg201514


# 2016
shandong_seoul_finedust201614 <- shandong_seoul_finedust2016
shandong_seoul_finedust201614 <- shandong_seoul_finedust201614[-grep("5", shandong_seoul_finedust201614$month),]
shandong_seoul_finedust201614 <- shandong_seoul_finedust201614[-grep("6", shandong_seoul_finedust201614$month),]
shandong_seoul_finedust201614 <- shandong_seoul_finedust201614[-grep("7", shandong_seoul_finedust201614$month),]
shandong_seoul_finedust201614 <- shandong_seoul_finedust201614[-grep("8", shandong_seoul_finedust201614$month),]
shandong_seoul_finedust201614 <- shandong_seoul_finedust201614[-grep("9", shandong_seoul_finedust201614$month),]
shandong_seoul_finedust201614 <- shandong_seoul_finedust201614[-grep("10", shandong_seoul_finedust201614$month),]
shandong_seoul_finedust201614 <- shandong_seoul_finedust201614[-grep("11", shandong_seoul_finedust201614$month),]
shandong_seoul_finedust201614 <- shandong_seoul_finedust201614[-grep("12", shandong_seoul_finedust201614$month),]

# correlation value = 0.8134761
cor(shandong_seoul_finedust201614$shandong_average, shandong_seoul_finedust201614$seoul_average, use=("complete.obs"))
plot(shandong_seoul_finedust201614$shandong_average, shandong_seoul_finedust201614$seoul_average)

shgg201614 <- ggplot(shandong_seoul_finedust201614, aes(month, shandong_average, group = 1)) + geom_line(color = 'pink', size=1) + ggtitle("Finedust between Shandong and Seoul from Jan to Apr in 2016") + ylab('finedust') + theme(plot.title = element_text(size = 9, hjust=0.5))
shgg201614 <- shgg201614+geom_line(aes(month, seoul_average), color = 'skyblue', size=1)
shgg201614


  # 2017
shandong_seoul_finedust201714 <- shandong_seoul_finedust2017
shandong_seoul_finedust201714 <- shandong_seoul_finedust201714[-grep("5", shandong_seoul_finedust201714$month),]
shandong_seoul_finedust201714 <- shandong_seoul_finedust201714[-grep("6", shandong_seoul_finedust201714$month),]
shandong_seoul_finedust201714 <- shandong_seoul_finedust201714[-grep("7", shandong_seoul_finedust201714$month),]
shandong_seoul_finedust201714 <- shandong_seoul_finedust201714[-grep("8", shandong_seoul_finedust201714$month),]
shandong_seoul_finedust201714 <- shandong_seoul_finedust201714[-grep("9", shandong_seoul_finedust201714$month),]
shandong_seoul_finedust201714 <- shandong_seoul_finedust201714[-grep("10", shandong_seoul_finedust201714$month),]
shandong_seoul_finedust201714 <- shandong_seoul_finedust201714[-grep("11", shandong_seoul_finedust201714$month),]
shandong_seoul_finedust201714 <- shandong_seoul_finedust201714[-grep("12", shandong_seoul_finedust201714$month),]

    # correlation value = -0.8636085
cor(shandong_seoul_finedust201714$shandong_average, shandong_seoul_finedust201714$seoul_average, use=("complete.obs"))
plot(shandong_seoul_finedust201714$shandong_average, shandong_seoul_finedust201714$seoul_average)

shgg201714 <- ggplot(shandong_seoul_finedust201714, aes(month, shandong_average, group = 1)) + geom_line(color = 'pink', size=1) + ggtitle("Finedust between Shandong and Seoul from Jan to Apr in 2017") + ylab('finedust') + theme(plot.title = element_text(size = 9, hjust=0.5))
shgg201714 <- shgg201714+geom_line(aes(month, seoul_average), color = 'skyblue', size=1)
shgg201714


  # 2018
shandong_seoul_finedust201814 <- shandong_seoul_finedust2018
shandong_seoul_finedust201814 <- shandong_seoul_finedust201814[-grep("5", shandong_seoul_finedust201814$month),]
shandong_seoul_finedust201814 <- shandong_seoul_finedust201814[-grep("6", shandong_seoul_finedust201814$month),]
shandong_seoul_finedust201814 <- shandong_seoul_finedust201814[-grep("7", shandong_seoul_finedust201814$month),]
shandong_seoul_finedust201814 <- shandong_seoul_finedust201814[-grep("8", shandong_seoul_finedust201814$month),]
shandong_seoul_finedust201814 <- shandong_seoul_finedust201814[-grep("9", shandong_seoul_finedust201814$month),]
shandong_seoul_finedust201814 <- shandong_seoul_finedust201814[-grep("10", shandong_seoul_finedust201814$month),]
shandong_seoul_finedust201814 <- shandong_seoul_finedust201814[-grep("11", shandong_seoul_finedust201814$month),]
shandong_seoul_finedust201814 <- shandong_seoul_finedust201814[-grep("12", shandong_seoul_finedust201814$month),]

    # correlation value = 0.2889347
cor(shandong_seoul_finedust201814$shandong_average, shandong_seoul_finedust201814$seoul_average, use=("complete.obs"))
plot(shandong_seoul_finedust201814$shandong_average, shandong_seoul_finedust201814$seoul_average)

shgg201814 <- ggplot(shandong_seoul_finedust201814, aes(month, shandong_average, group = 1)) + geom_line(color = 'pink', size=1) + ggtitle("Finedust between Shandong and Seoul from Jan to Apr in 2018") + ylab('finedust') + theme(plot.title = element_text(size = 9, hjust=0.5))
shgg201814 <- shgg201814+geom_line(aes(month, seoul_average), color = 'skyblue', size=1)
shgg201814


  # 2019
shandong_seoul_finedust201914 <- shandong_seoul_finedust2019
shandong_seoul_finedust201914 <- shandong_seoul_finedust201914[-grep("5", shandong_seoul_finedust201914$month),]
shandong_seoul_finedust201914 <- shandong_seoul_finedust201914[-grep("6", shandong_seoul_finedust201914$month),]
shandong_seoul_finedust201914 <- shandong_seoul_finedust201914[-grep("7", shandong_seoul_finedust201914$month),]
shandong_seoul_finedust201914 <- shandong_seoul_finedust201914[-grep("8", shandong_seoul_finedust201914$month),]
shandong_seoul_finedust201914 <- shandong_seoul_finedust201914[-grep("9", shandong_seoul_finedust201914$month),]
shandong_seoul_finedust201914 <- shandong_seoul_finedust201914[-grep("10", shandong_seoul_finedust201914$month),]
shandong_seoul_finedust201914 <- shandong_seoul_finedust201914[-grep("11", shandong_seoul_finedust201914$month),]
shandong_seoul_finedust201914 <- shandong_seoul_finedust201914[-grep("12", shandong_seoul_finedust201914$month),]

    # correlation value = 0.7910905
cor(shandong_seoul_finedust201914$shandong_average, shandong_seoul_finedust201914$seoul_average, use=("complete.obs"))
plot(shandong_seoul_finedust201914$shandong_average, shandong_seoul_finedust201914$seoul_average)

shgg201914 <- ggplot(shandong_seoul_finedust201914, aes(month, shandong_average, group = 1)) + geom_line(color = 'pink', size=1) + ggtitle("Finedust between Shandong and Seoul from Jan to Apr in 2019") + ylab('finedust') + theme(plot.title = element_text(size = 9, hjust=0.5))
shgg201914 <- shgg201914+geom_line(aes(month, seoul_average), color = 'skyblue', size=1)
shgg201914


  # 2020
shandong_seoul_finedust202014 <- shandong_seoul_finedust2020

    # correlation value = 0.1736526
cor(shandong_seoul_finedust202014$shandong_average, shandong_seoul_finedust202014$seoul_average, use=("complete.obs"))
plot(shandong_seoul_finedust202014$shandong_average, shandong_seoul_finedust202014$seoul_average)

shgg202014 <- ggplot(shandong_seoul_finedust202014, aes(month, shandong_average, group = 1)) + geom_line(color = 'pink', size=1) + ggtitle("Finedust between Shandong and Seoul from Jan to Apr in 2020") + ylab('finedust') + theme(plot.title = element_text(size = 9, hjust=0.5))
shgg202014 <- shgg202014+geom_line(aes(month, seoul_average), color = 'skyblue', size=1)
shgg202014

grid.arrange(shgg201414, shgg201514, shgg201614, shgg201714, shgg201814, shgg201914, shgg202014, ncol=3)


# write csv
write.csv(shandong_seoul_finedust2014, file="shandong_seoul_finedust2014.csv", row.names=TRUE)
write.csv(shandong_seoul_finedust2015, file="shandong_seoul_finedust2015.csv", row.names=TRUE)
write.csv(shandong_seoul_finedust2016, file="shandong_seoul_finedust2016.csv", row.names=TRUE)
write.csv(shandong_seoul_finedust2017, file="shandong_seoul_finedust2017.csv", row.names=TRUE)
write.csv(shandong_seoul_finedust2018, file="shandong_seoul_finedust2018.csv", row.names=TRUE)
write.csv(shandong_seoul_finedust2019, file="shandong_seoul_finedust2019.csv", row.names=TRUE)
write.csv(shandong_seoul_finedust2020, file="shandong_seoul_finedust2020.csv", row.names=TRUE)
write.csv(shandong_seoul_finedust201414, file="shandong_seoul_finedust201414.csv", row.names=TRUE)
write.csv(shandong_seoul_finedust201514, file="shandong_seoul_finedust201514.csv", row.names=TRUE)
write.csv(shandong_seoul_finedust201614, file="shandong_seoul_finedust201614.csv", row.names=TRUE)
write.csv(shandong_seoul_finedust201714, file="shandong_seoul_finedust201714.csv", row.names=TRUE)
write.csv(shandong_seoul_finedust201814, file="shandong_seoul_finedust201814.csv", row.names=TRUE)
write.csv(shandong_seoul_finedust201914, file="shandong_seoul_finedust201914.csv", row.names=TRUE)
write.csv(shandong_seoul_finedust202014, file="shandong_seoul_finedust202014.csv", row.names=TRUE)