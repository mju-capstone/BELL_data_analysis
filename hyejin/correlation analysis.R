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

  # can ignore
w <- ggplot(c_year_average, aes(x = year))
w <- w + geom_line(aes(y=group_c), stat = "identity", group=1) + coord_cartesian(ylim = c(0, 120))
w <- w + geom_line(aes(y=group_s), color = "skyblue", size=2, group=1)
w <- w + scale_y_continuous(sec.axis = sec_axis(~., name="finedust"))
w
rm(w)
                                                                    

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

# write csv
write.csv(finedust, file="finedust.csv", row.names=TRUE)
write.csv(finedust_d, file="annual(1~4) finedust.csv", row.names=TRUE)
write.csv(finedust_v, file="whole monthly finedust.csv", row.names=TRUE)
write.csv(c_year_average, file="monthly finedust.csv", row.names=TRUE)
