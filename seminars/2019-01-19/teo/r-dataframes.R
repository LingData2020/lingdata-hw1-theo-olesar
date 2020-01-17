### 19 January ###
### Data frames in R ###

## Data loading
dat <- read.csv("http://math-info.hse.ru/f/2018-19/ling-data/Chi.kuk.2007.csv")
dat2 <- read.csv(file.choose())
View(dat)

## General information about data frames
str(dat)
summary(dat)
nrow(dat)

## Selection of columns and rows 
dat$age
summary(dat$age)
mean(dat$age)
hist(dat$age, col="red")

dat[1, 2]  # 1st speaker, 2nd column - s.duration.ms
dat[1,]  # type nothing after ,
dat[,3] # all rows, only the 3rd column

## Filtering
dat[dat$age > 32,]
dat[dat$age > 32]  # not ok
dat[dat$age > 20 & dat$orientation == "homo",]
nrow(dat[dat$age > 20 & dat$orientation == "homo",])
length(dat[dat$age > 20 & dat$orientation == "homo",])
dat_small <- dat[dat$age > 20 & dat$orientation == "homo",]
View(dat_small)

homo <- dat[dat$perceived.as.homo.percent > 0.5 & 
              dat$orientation == "homo",]
View(homo)

homo <- dat[dat$perceived.as.homo.percent > 0.5 & 
              dat$orientation == "homo",]
nrow(homo)/nrow(dat) * 100

mean_duration <- mean(dat$vowel.duration.ms)
mean_intonation <- mean(dat$average.f0.Hz)
homo2 <- dat[(dat$vowel.duration.ms > mean_duration | 
                dat$average.f0.Hz > mean_intonation) &
               dat$perceived.as.homo.percent > 0.5, ]
nrow(homo2)
hist(homo2$vowel.duration.ms, col="yellow")

