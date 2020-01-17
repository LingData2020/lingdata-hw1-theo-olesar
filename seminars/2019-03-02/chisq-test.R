### Chi-squared test, Fisher's exact test, effect size

### PART 1 ###
# load data and get summary info
soc <- read.csv("http://math-info.hse.ru/f/2018-19/pep/socling.csv")
summary(soc)

# example of ifelse()
v <- c('a', 'b', 'b', 'a')
ifelse(v == 'a', 1, 0)  # 1 if a, 0 is not a

# add a column for Moscow vs Non-Moscow
library(tidyverse)
soc <- soc %>% mutate(moscow = ifelse(region == "Moscow", "Moscow", "Not Moscow"))

# create a contingency table
tab <- table(soc$phrase, soc$moscow)
tab

# create a contingency table with proportions
prop.table(tab)
prop.table(tab) * 100 # in %

# perform a chi-squared test
# variables of interest are in brackets,
# not a contingency table itself
chisq.test(soc$phrase, soc$moscow)

# perform a Fisher's exact test
fisher.test(soc$phrase, soc$moscow)

# save results of a chi-squared test and investigate them
res <- chisq.test(soc$phrase, soc$moscow)
res$expected  # expected frequencies
res$observed  # observed frequencies

# check why chi-square in the output is 12.518
# by hand - for the sake of clarity
(18 - 17)^2 / 17 + (16 - 17)^2 / 17 + 
  (1 - 5)^2 / 5 + (9 - 5)^2 / 5 + 
  (6 - 3)^2 / 3 + (0 - 3)^2 / 3

# do the same, but
# using R tables - more convenient
sum((res$expected - res$observed) ** 2 / res$expected)

# look at densities of a chi-squared 
# distributions with different df (degrees of freedom)
curve(dchisq(x, df = 1), xlim = c(0, 20))
curve(dchisq(x, df = 2), xlim = c(0, 20), col = "blue", add = TRUE)
curve(dchisq(x, df = 4), xlim = c(0, 20), col = "red", add = TRUE)
curve(dchisq(x, df = 12), xlim = c(0, 20), col = "green", add = TRUE)

### PART 2 ###
# visualise a contingency table
install.packages("vcd")
library(vcd)
mosaic(soc$phrase.eng ~ soc$moscow)
mosaic(data = soc, phrase.eng ~ moscow, 
       set_varnames = list(phrase.eng = "Phrase type", 
                           moscow = "Region of living"))

### PART 3 ###
# work on your own with phonological data
phono <- read.csv("https://raw.githubusercontent.com/LingData2019/LingData/master/data/elision.csv")
tab2 <- table(phono$v.elision, phono$group)
tab2

# chi-squared test
chisq.test(phono$v.elision, phono$group)

# calculate the effect size via Cramer's V
install.packages("lsr")
library(lsr)
cramersV(tab2)
