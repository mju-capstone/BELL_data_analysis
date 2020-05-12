# correlation analysis
finedust_without_na <- na.omit(finedust)
sum(is.na(finedust_without_na))
cor(finedust$china_average, finedust$seoul_average, method=c("pearson"), use=("complete.obs"))
  # pearson without NA
  # found chinese and korean fine dust are realated / 0.3681803

# find outlier
plot(finedust_without_na$china_average, finedust_without_na$seoul_average)

# remove outlier
boxplot(finedust_without_na$china_average, finedust_without_na$seoul_average)$stats # return statistic on boxplot
table(finedust_without_na$china_average)
finedust_without_na$re_china_average <- r_outlier <- ifelse(finedust_without_na$china_average < 13.61111 | finedust_without_na$china_average > 174.27778, NA, finedust_without_na$china_average)
finedust_without_na$re_seoul_average <- ifelse(finedust_without_na$seoul_average < 5 | finedust_without_na$seoul_average > 98, NA, finedust_without_na$seoul_average)
boxplot(finedust_without_na$re_china_average, finedust_without_na$re_seoul_average)
plot(finedust_without_na$re_china_average, finedust_without_na$re_seoul_average)


# visualization(finedust_with_na로 활용) -> too many x values
plot(finedust_without_na$re_china_average, type='o', col='red', ylim=c(1, 200), xlab='date', ylab='fine dust', main='graph for fine dust over 7 years')
lines(finedust_without_na$re_seoul_average, type='o', col='blue')

# visualization for year
finedust_without_na$date <- as.Date(finedust_without_na$date, format="%Y/%m/%d") # change string to date 

install.packages('lubridate')
library('lubridate')
finedust_without_na$year <- year(finedust_without_na$date)
finedust_without_na$month <- month(finedust_without_na$date)

install.packages('ggplot2')
library('ggplot2')
install.packages("dplyr")
library('dplyr')

finedust_v <- data.frame(finedust_without_na$year, finedust_without_na$month, finedust_without_na$re_china_average, finedust_without_na$re_seoul_average)
colnames(finedust_v) <- c("year", "month", "re_china_average", "re_seoul_average")
finedust_v$year <- format(finedust_v$year, format="%Y") # change year to string
finedust_v$month <- format(finedust_v$month, format="%m")
finedust_v <- na.omit(finedust_v)
  # weird graph ------------------------------
c_year_average <- finedust_v %>%
  group_by(year,month) %>%
  summarize(group_c = mean(re_china_average), group_s = mean(re_seoul_average))

gg1 <- ggplot(c_year_average, aes(year, group_c)) + geom_line(color = 'red') +ggtitle("Finedust over 7 years") + ylab('finedust')
gg1 <- gg1 + geom_line(aes(year, group_s), color = 'blue')
gg1

  # annal line graph -------------------------
c_year_average <- finedust_v %>%
  group_by(year) %>%
  summarize(group_c = mean(re_china_average), group_s = mean(re_seoul_average))

gg2 <- ggplot(c_year_average, aes(year, group_c, group = 1)) + geom_line(color = 'red') + ggtitle("Finedust over 7 years") + ylab('finedust') + theme(plot.title = element_text(size = 15, hjust=0.5))
gg2 <- gg2+geom_line(aes(year, group_s), color = 'blue')
gg2

                                                                    

# visualization for Jan to Apr
finedust_d <- finedust_v %>%
  group_by(year,month) %>%
  summarize(group_c = mean(re_china_average), group_s = mean(re_seoul_average))
finedust_d <- finedust_d[-grep("5", finedust_d$month),]
finedust_d <- finedust_d[-grep("6", finedust_d$month),]
finedust_d <- finedust_d[-grep("7", finedust_d$month),]
finedust_d <- finedust_d[-grep("8", finedust_d$month),]
finedust_d <- finedust_d[-grep("9", finedust_d$month),]
finedust_d <- finedust_d[-grep("10", finedust_d$month),]
finedust_d <- finedust_d[-grep("11", finedust_d$month),]
finedust_d <- finedust_d[-grep("12", finedust_d$month),]
finedust_d <- finedust_d %>%
  group_by(year) %>%
  summarize(group_c = mean(group_c), group_s = mean(group_s))

gg3 <- ggplot(finedust_d, aes(year, group_c, group = 1)) + geom_line(color = 'red') + ggtitle("Finedust from Jan to Apr") + ylab('finedust') + theme(plot.title = element_text(size = 15, hjust=0.5))
gg3 <- gg3+geom_line(aes(year, group_s), color = 'blue')
gg3


# visualization annually
  # 2014
finedust2014 <- subset(finedust_v, year=="2014")
    # correlation value = 0.1903838
cor(finedust2014$re_china_average, finedust2014$re_seoul_average, use=("complete.obs"))
plot(finedust2014$re_china_average, finedust2014$re_seoul_average)

    # china & seoul finedus in 2014
library('dplyr')
finedust2014 <- finedust2014 %>%
  group_by(month) %>%
  summarize(re_china_average = mean(re_china_average), re_seoul_average = mean(re_seoul_average))

library('ggplot2')
gg2014 <- ggplot(finedust2014, aes(month, re_china_average, group = 1)) + geom_line(color = 'red') + ggtitle("Finedust between china and Seoul 2014") + ylab('finedust') + theme(plot.title = element_text(size = 12, hjust=0.5))
gg2014 <- gg2014+geom_line(aes(month, re_seoul_average), color = 'blue')
gg2014

  # 2015
finedust2015 <- subset(finedust_v, year=="2015")
    # correlation value = 0.4164425
cor(finedust2015$re_china_average, finedust2015$re_seoul_average, use=("complete.obs"))
plot(finedust2015$re_china_average, finedust2015$re_seoul_average)

    # china & seoul finedus in 2015
library('dplyr')
finedust2015 <- finedust2015 %>%
  group_by(month) %>%
  summarize(re_china_average = mean(re_china_average), re_seoul_average = mean(re_seoul_average))

library('ggplot2')
gg2015 <- ggplot(finedust2014, aes(month, re_china_average, group = 1)) + geom_line(color = 'red') + ggtitle("Finedust between china and Seoul 2015") + ylab('finedust') + theme(plot.title = element_text(size = 12, hjust=0.5))
gg2015 <- gg2015+geom_line(aes(month, re_seoul_average), color = 'blue')
gg2015


  # 2016
finedust2016 <- subset(finedust_v, year=="2016")
    # correlation value = 0.4123887
cor(finedust2016$re_china_average, finedust2016$re_seoul_average, use=("complete.obs"))
plot(finedust2016$re_china_average, finedust2016$re_seoul_average)

    # china & seoul finedus in 2016
library('dplyr')
finedust2016 <- finedust2016 %>%
  group_by(month) %>%
  summarize(re_china_average = mean(re_china_average), re_seoul_average = mean(re_seoul_average))

library('ggplot2')
gg2016 <- ggplot(finedust2014, aes(month, re_china_average, group = 1)) + geom_line(color = 'red') + ggtitle("Finedust between china and Seoul 2016") + ylab('finedust') + theme(plot.title = element_text(size = 12, hjust=0.5))
gg2016 <- gg2016+geom_line(aes(month, re_seoul_average), color = 'blue')
gg2016

  # 2017
finedust2017 <- subset(finedust_v, year=="2017")
    # correlation value = 0.3868626
cor(finedust2017$re_china_average, finedust2017$re_seoul_average, use=("complete.obs"))
plot(finedust2017$re_china_average, finedust2017$re_seoul_average)

    # china & seoul finedus in 2017
library('dplyr')
finedust2017 <- finedust2017 %>%
  group_by(month) %>%
  summarize(re_china_average = mean(re_china_average), re_seoul_average = mean(re_seoul_average))

library('ggplot2')
gg2017 <- ggplot(finedust2017, aes(month, re_china_average, group = 1)) + geom_line(color = 'red') + ggtitle("Finedust between china and Seoul 2017") + ylab('finedust') + theme(plot.title = element_text(size = 12, hjust=0.5))
gg2017 <- gg2017+geom_line(aes(month, re_seoul_average), color = 'blue')
gg2017


  # 2018
finedust2018 <- subset(finedust_v, year=="2018")
    # correlation value = 0.5350477
cor(finedust2018$re_china_average, finedust2018$re_seoul_average, use=("complete.obs"))
plot(finedust2018$re_china_average, finedust2018$re_seoul_average)

    # china & seoul finedus in 2018
library('dplyr')
finedust2018 <- finedust2018 %>%
  group_by(month) %>%
  summarize(re_china_average = mean(re_china_average), re_seoul_average = mean(re_seoul_average))

library('ggplot2')
gg2018 <- ggplot(finedust2018, aes(month, re_china_average, group = 1)) + geom_line(color = 'red') + ggtitle("Finedust between china and Seoul 2018") + ylab('finedust') + theme(plot.title = element_text(size = 12, hjust=0.5))
gg2018 <- gg2018+geom_line(aes(month, re_seoul_average), color = 'blue')
gg2018


  # 2019
finedust2019 <- subset(finedust_v, year=="2019")
    # correlation value = 0.5708771
cor(finedust2019$re_china_average, finedust2019$re_seoul_average, use=("complete.obs"))
plot(finedust2019$re_china_average, finedust2019$re_seoul_average)

    # china & seoul finedus in 2019
library('dplyr')
finedust2019 <- finedust2019 %>%
  group_by(month) %>%
  summarize(re_china_average = mean(re_china_average), re_seoul_average = mean(re_seoul_average))

library('ggplot2')
gg2019 <- ggplot(finedust2019, aes(month, re_china_average, group = 1)) + geom_line(color = 'red') + ggtitle("Finedust between china and Seoul 2019") + ylab('finedust') + theme(plot.title = element_text(size = 12, hjust=0.5))
gg2019 <- gg2019+geom_line(aes(month, re_seoul_average), color = 'blue')
gg2019


  # 2020
finedust2020 <- subset(finedust_v, year=="2020")
    # correlation value = 0.3843637
cor(finedust2020$re_china_average, finedust2020$re_seoul_average, use=("complete.obs"))
plot(finedust2020$re_china_average, finedust2020$re_seoul_average)

    # china & seoul finedus in 2020
library('dplyr')
finedust2020 <- finedust2020 %>%
  group_by(month) %>%
  summarize(re_china_average = mean(re_china_average), re_seoul_average = mean(re_seoul_average))

library('ggplot2')
gg2020 <- ggplot(finedust2020, aes(month, re_china_average, group = 1)) + geom_line(color = 'red') + ggtitle("Finedust between china and Seoul 2020") + ylab('finedust') + theme(plot.title = element_text(size = 12, hjust=0.5))
gg2020 <- gg2020+geom_line(aes(month, re_seoul_average), color = 'blue')
gg2020


library('gridExtra')
grid.arrange(gg2014, gg2015, gg2016, gg2017, gg2018, gg2019, gg2020, ncol=3)

# visualization from Jan to Apr
  # 2014
finedust201414 <- finedust2014
finedust201414 <- finedust201414[-grep("5", finedust201414$month),]
finedust201414 <- finedust201414[-grep("6", finedust201414$month),]
finedust201414 <- finedust201414[-grep("7", finedust201414$month),]
finedust201414 <- finedust201414[-grep("8", finedust201414$month),]
finedust201414 <- finedust201414[-grep("9", finedust201414$month),]
finedust201414 <- finedust201414[-grep("10", finedust201414$month),]
finedust201414 <- finedust201414[-grep("11", finedust201414$month),]
finedust201414 <- finedust201414[-grep("12", finedust201414$month),]

  # correlation value = 0.607521
cor(finedust201414$re_china_average, finedust201414$re_seoul_average, use=("complete.obs"))
plot(finedust201414$re_china_average, finedust201414$re_seoul_average)

gg201414 <- ggplot(finedust201414, aes(month, re_china_average, group = 1)) + geom_line(color = 'red') + ggtitle("Finedust between china and Seoul from Jan to Apr in 2014") + ylab('finedust') + theme(plot.title = element_text(size = 9.5, hjust=0.5))
gg201414 <- gg201414+geom_line(aes(month, re_seoul_average), color = 'blue')
gg201414


  # 2015
finedust201514 <- finedust2015
finedust201514 <- finedust201514[-grep("5", finedust201514$month),]
finedust201514 <- finedust201514[-grep("6", finedust201514$month),]
finedust201514 <- finedust201514[-grep("7", finedust201514$month),]
finedust201514 <- finedust201514[-grep("8", finedust201514$month),]
finedust201514 <- finedust201514[-grep("9", finedust201514$month),]
finedust201514 <- finedust201514[-grep("10", finedust201514$month),]
finedust201514 <- finedust201514[-grep("11", finedust201514$month),]
finedust201514 <- finedust201514[-grep("12", finedust201514$month),]

    # correlation value = 0.7630118
cor(finedust201514$re_china_average, finedust201514$re_seoul_average, use=("complete.obs"))
plot(finedust201514$re_china_average, finedust201514$re_seoul_average)

gg201514 <- ggplot(finedust201514, aes(month, re_china_average, group = 1)) + geom_line(color = 'red') + ggtitle("Finedust between china and Seoul from Jan to Apr in 2015") + ylab('finedust') + theme(plot.title = element_text(size = 9.5, hjust=0.5))
gg201514 <- gg201514+geom_line(aes(month, re_seoul_average), color = 'blue')
gg201514


  # 2016
finedust201614 <- finedust2016
finedust201614 <- finedust201614[-grep("5", finedust201614$month),]
finedust201614 <- finedust201614[-grep("6", finedust201614$month),]
finedust201614 <- finedust201614[-grep("7", finedust201614$month),]
finedust201614 <- finedust201614[-grep("8", finedust201614$month),]
finedust201614 <- finedust201614[-grep("9", finedust201614$month),]
finedust201614 <- finedust201614[-grep("10", finedust201614$month),]
finedust201614 <- finedust201614[-grep("11", finedust201614$month),]
finedust201614 <- finedust201614[-grep("12", finedust201614$month),]

    # correlation value = 0.9696131
cor(finedust201614$re_china_average, finedust201614$re_seoul_average, use=("complete.obs"))
plot(finedust201614$re_china_average, finedust201614$re_seoul_average)

gg201614 <- ggplot(finedust201614, aes(month, re_china_average, group = 1)) + geom_line(color = 'red') + ggtitle("Finedust between china and Seoul from Jan to Apr in 2016") + ylab('finedust') + theme(plot.title = element_text(size = 9.5, hjust=0.5))
gg201614 <- gg201614+geom_line(aes(month, re_seoul_average), color = 'blue')
gg201614


  # 2017
finedust201714 <- finedust2017
finedust201714 <- finedust201714[-grep("5", finedust201714$month),]
finedust201714 <- finedust201714[-grep("6", finedust201714$month),]
finedust201714 <- finedust201714[-grep("7", finedust201714$month),]
finedust201714 <- finedust201714[-grep("8", finedust201714$month),]
finedust201714 <- finedust201714[-grep("9", finedust201714$month),]
finedust201714 <- finedust201714[-grep("10", finedust201714$month),]
finedust201714 <- finedust201714[-grep("11", finedust201714$month),]
finedust201714 <- finedust201714[-grep("12", finedust201714$month),]

    # correlation value = -0.7994713
cor(finedust201714$re_china_average, finedust201714$re_seoul_average, use=("complete.obs"))
plot(finedust201714$re_china_average, finedust201714$re_seoul_average)

gg201714 <- ggplot(finedust201714, aes(month, re_china_average, group = 1)) + geom_line(color = 'red') + ggtitle("Finedust between china and Seoul from Jan to Apr in 2017") + ylab('finedust') + theme(plot.title = element_text(size = 9.5, hjust=0.5))
gg201714 <- gg201714+geom_line(aes(month, re_seoul_average), color = 'blue')
gg201714


  # 2018
finedust201814 <- finedust2018
finedust201814 <- finedust201814[-grep("5", finedust201814$month),]
finedust201814 <- finedust201814[-grep("6", finedust201814$month),]
finedust201814 <- finedust201814[-grep("7", finedust201814$month),]
finedust201814 <- finedust201814[-grep("8", finedust201814$month),]
finedust201814 <- finedust201814[-grep("9", finedust201814$month),]
finedust201814 <- finedust201814[-grep("10", finedust201814$month),]
finedust201814 <- finedust201814[-grep("11", finedust201814$month),]
finedust201814 <- finedust201814[-grep("12", finedust201814$month),]

    # correlation value = -0.1736698
cor(finedust201814$re_china_average, finedust201814$re_seoul_average, use=("complete.obs"))
plot(finedust201814$re_china_average, finedust201814$re_seoul_average)

gg201814 <- ggplot(finedust201814, aes(month, re_china_average, group = 1)) + geom_line(color = 'red') + ggtitle("Finedust between china and Seoul from Jan to Apr in 2018") + ylab('finedust') + theme(plot.title = element_text(size = 9.5, hjust=0.5))
gg201814 <- gg201814+geom_line(aes(month, re_seoul_average), color = 'blue')
gg201814


  # 2019
finedust201914 <- finedust2019
finedust201914 <- finedust201914[-grep("5", finedust201914$month),]
finedust201914 <- finedust201914[-grep("6", finedust201914$month),]
finedust201914 <- finedust201914[-grep("7", finedust201914$month),]
finedust201914 <- finedust201914[-grep("8", finedust201914$month),]
finedust201914 <- finedust201914[-grep("9", finedust201914$month),]
finedust201914 <- finedust201914[-grep("10", finedust201914$month),]
finedust201914 <- finedust201914[-grep("11", finedust201914$month),]
finedust201914 <- finedust201914[-grep("12", finedust201914$month),]

    # correlation value = 0.3882499
cor(finedust201914$re_china_average, finedust201814$re_seoul_average, use=("complete.obs"))
plot(finedust201914$re_china_average, finedust201814$re_seoul_average)

gg201914 <- ggplot(finedust201914, aes(month, re_china_average, group = 1)) + geom_line(color = 'red') + ggtitle("Finedust between china and Seoul from Jan to Apr in 2019") + ylab('finedust') + theme(plot.title = element_text(size = 9.5, hjust=0.5))
gg201914 <- gg201914+geom_line(aes(month, re_seoul_average), color = 'blue')
gg201914


  # 2020
finedust202014 <- finedust2020

    # correlation value = 0.2507481
cor(finedust202014$re_china_average, finedust202014$re_seoul_average, use=("complete.obs"))
plot(finedust202014$re_china_average, finedust202014$re_seoul_average)

gg202014 <- ggplot(finedust202014, aes(month, re_china_average, group = 1)) + geom_line(color = 'red') + ggtitle("Finedust between china and Seoul from Jan to Apr in 2020") + ylab('finedust') + theme(plot.title = element_text(size = 9.5, hjust=0.5))
gg202014 <- gg202014+geom_line(aes(month, re_seoul_average), color = 'blue')
gg202014

grid.arrange(gg201414, gg201514, gg201614, gg201714, gg201814, gg201914, gg202014, ncol=3)


# write csv
write.csv(finedust, file="china seoul finedust.csv", row.names=TRUE)
write.csv(finedust_d, file="annual(1~4) finedust.csv", row.names=TRUE)
write.csv(finedust_v, file="whole monthly finedust.csv", row.names=TRUE)
write.csv(c_year_average, file="monthly finedust.csv", row.names=TRUE)
write.csv(finedust2014, file="finedust2014.csv", row.names=TRUE)
write.csv(finedust2015, file="finedust2015.csv", row.names=TRUE)
write.csv(finedust2016, file="finedust2016.csv", row.names=TRUE)
write.csv(finedust2017, file="finedust2017.csv", row.names=TRUE)
write.csv(finedust2018, file="finedust2018.csv", row.names=TRUE)
write.csv(finedust2019, file="finedust2019.csv", row.names=TRUE)
write.csv(finedust2020, file="finedust2020.csv", row.names=TRUE)
write.csv(finedust201414, file="finedust201414.csv", row.names=TRUE)
write.csv(finedust201514, file="finedust201514.csv", row.names=TRUE)
write.csv(finedust201614, file="finedust201614.csv", row.names=TRUE)
write.csv(finedust201714, file="finedust201714.csv", row.names=TRUE)
write.csv(finedust201814, file="finedust201814.csv", row.names=TRUE)
write.csv(finedust201914, file="finedust201914.csv", row.names=TRUE)
write.csv(finedust202014, file="finedust202014.csv", row.names=TRUE)
