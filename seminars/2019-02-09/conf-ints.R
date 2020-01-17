### install and load library for CI's
install.packages("DescTools")
library(DescTools)

### confidence intervals for proportions

nheads1 <- 4 # number of heads
n1 <- 20  # total number of tosses
BinomCI(nheads1, n1) # 95% CI by default

# lengths of CI
ci.95 <- BinomCI(nheads1, n1)
ci.95[3] - ci.95[2]

nheads2 <- 40 # now 40 heads
n2 <- 200 # now 200 tosses
ci.95.2 <- BinomCI(nheads2, n2)
ci.95.2[3] - ci.95.2[2]  # it shrinked

sqrt(10) # square root of N
0.3353598/0.1104032 # ratio of lengths

ci.99 <- BinomCI(nheads2, n2, conf.level = 0.99)
ci.99[3] - ci.99[2] # it extended

# calculate number of CI's that include true p
p0 <- 0.5 # true probability of getting a head in one tossing
tosses <- 100 # series of 100 tosses (for one person)
samples <- 1000  # 1000 people tossed a coin
dat <- matrix(sample(c(0, 1), 
                     tosses * samples, 
                     replace=TRUE), ncol=tosses, byrow=TRUE)
head(dat)

cis <- BinomCI(rowSums(dat), tosses)
head(cis)
head(cis[,"lwr.ci"])
head(cis[,"upr.ci"])
head(cis[,"lwr.ci"] <= p0 & cis[,"upr.ci"] >= p0)

# count the proportion of CIs that include p0
mean(cis[,"lwr.ci"] <= p0 & cis[,"upr.ci"] >= p0)

### Confidence intervals: real data
verses <- read.csv("https://raw.githubusercontent.com/LingData2019/LingData/master/data/poetry_last_in_lines.csv", sep = "\t")
str(verses) # recall which variables are there

nnouns <- nrow(verses[verses$UPoS == "NOUN", ])
total <- nrow(verses)
BinomCI(nnouns, total)

### Confidence intervals for means

phono <- read.csv("http://math-info.hse.ru/f/2018-19/ling-data/icelandic.csv")
asp <- phono[phono$aspiration == "yes", ]
nasp <- phono[phono$aspiration == "no", ]

MeanCI(asp$vowel.dur)
MeanCI(nasp$vowel.dur)

# plot CI's
install.packages("sciplot")
library(sciplot)

# specify data
# response is a variable for which mean we plot a CI
# x.factor is a grouping variable (as we create plots by groups)
# ci.fun - function that calculates CI (1.96 multipled by standard error)
lineplot.CI(data = phono, 
            response = vowel.dur, 
            x.factor = aspiration,
            ci.fun = function(x) c(mean(x)-1.96*se(x), mean(x)+1.96*se(x)))