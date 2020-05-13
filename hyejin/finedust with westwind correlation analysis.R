wind2014 <- read.csv(file="./wind data/2014_count_of_winds.csv", header=T)
wind2015 <- read.csv(file="./wind data/2015_count_of_winds.csv", header=T)
wind2016 <- read.csv(file="./wind data/2016_count_of_winds.csv", header=T)
wind2017 <- read.csv(file="./wind data/2017_count_of_winds.csv", header=T)
wind2018 <- read.csv(file="./wind data/2018_count_of_winds.csv", header=T)
wind2019 <- read.csv(file="./wind data/2019_count_of_winds.csv", header=T)
wind2020 <- read.csv(file="./wind data/2020_count_of_winds.csv", header=T)

china_seoul_finedust <- read.csv(file="china seoul finedust.csv", header=T)

colnames(wind2014) <- c("date","westwind")

# finedust & westwind daily correlation analysis
#2014
wind_finedust2014 <- merge(wind2014, china_seoul_finedust, by='date')

sum(is.na(wind_finedust2014))
wind_finedust2014 <- na.omit(wind_finedust2014)
wind_finedust2014 <- wind_finedust2014[, 2:4]

cor(wind_finedust2014, method=c("pearson"), use=("complete.obs")) # 0.3625338     0.2186302
plot(wind_finedust2014)

#2015 
colnames(wind2015) <- c("date","westwind")
wind_finedust2015 <- merge(wind2015, china_seoul_finedust, by='date')

sum(is.na(wind_finedust2015))
wind_finedust2015 <- na.omit(wind_finedust2015)
wind_finedust2015 <- wind_finedust2015[, 2:4]

cor(wind_finedust2015, method=c("pearson"), use=("complete.obs")) # 0.188612703   0.258479970 
plot(wind_finedust2015)

#2016
colnames(wind2016) <- c("date","westwind")
wind_finedust2016 <- merge(wind2016, china_seoul_finedust, by='date')

sum(is.na(wind_finedust2016))
wind_finedust2016 <- na.omit(wind_finedust2016)
wind_finedust2016 <- wind_finedust2016[, 2:4]

cor(wind_finedust2016, method=c("pearson"), use=("complete.obs")) # 0.21345109    0.38368865
plot(wind_finedust2016)

#2017
colnames(wind2017) <- c("date","westwind")
wind_finedust2017 <- merge(wind2017, china_seoul_finedust, by='date')

sum(is.na(wind_finedust2017))
wind_finedust2017 <- na.omit(wind_finedust2017)
wind_finedust2017 <- wind_finedust2017[, 2:4]

cor(wind_finedust2017, method=c("pearson"), use=("complete.obs")) # 0.10184299    0.45153786
plot(wind_finedust2017)

#2018
colnames(wind2018) <- c("date","westwind")
wind_finedust2018 <- merge(wind2018, china_seoul_finedust, by='date')

sum(is.na(wind_finedust2018))
wind_finedust2018 <- na.omit(wind_finedust2018)
wind_finedust2018 <- wind_finedust2018[, 2:4]

cor(wind_finedust2018, method=c("pearson"), use=("complete.obs")) # 0.36330890    0.53612248
plot(wind_finedust2018)

#2019
colnames(wind2019) <- c("date","westwind")
wind_finedust2019 <- merge(wind2019, china_seoul_finedust, by='date')

sum(is.na(wind_finedust2019))
wind_finedust2019 <- na.omit(wind_finedust2019)
wind_finedust2019 <- wind_finedust2019[, 2:4]

cor(wind_finedust2019, method=c("pearson"), use=("complete.obs")) # 0.2674649     0.5882914
plot(wind_finedust2019)

#2020
colnames(wind2020) <- c("date","westwind")
wind_finedust2020 <- merge(wind2020, china_seoul_finedust, by='date')

sum(is.na(wind_finedust2020))
wind_finedust2020 <- na.omit(wind_finedust2020)
wind_finedust2020 <- wind_finedust2020[, 2:4]

cor(wind_finedust2020, method=c("pearson"), use=("complete.obs")) # 0.2764803     0.3843637
plot(wind_finedust2020)

