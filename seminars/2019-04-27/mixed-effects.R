## 27 April ##
## Mixed effects ##

sh <- read.table("https://raw.githubusercontent.com/LingData2019/LingData/master/data/duryagin_ReductionRussian.txt", header=TRUE)
summary(sh)

# ! - negation of complete.cases()
sum(!complete.cases(sh))

# distribution
library(tidyverse)
sh %>% group_by(vowel) %>% summarise(n = n(), 
                                     mean_f1 = mean(f1), 
                                     mean_f2 = mean(f2))

ggplot(data = sh, aes(x = vowel, y = f1, fill = vowel)) + 
  geom_boxplot() +
  labs(x = "Vowel type", y = "1st formant (in Hz)")

ggplot(data = sh, aes(x = vowel, y = f2, fill = vowel)) + 
  geom_boxplot() + 
  labs(x = "Vowel type", y = "2nd formant (in Hz)")

# scatterplots
ggplot(data = sh, aes(x = f2, y = f1)) + geom_point()
ggplot(data = sh, aes(x = f2, y = f1, color = vowel)) + geom_point()

# correlations
sh %>% group_by(vowel) %>% summarise(corr = cor(f1, f2))
sh %>% group_by(vowel) %>% summarise(corr = cor.test(f1, f2)$estimate,
                                     pvalue = cor.test(f1, f2)$p.value)
# simple linear model
sm <- lm(f1 ~ f2, data = sh)
summary(sm)

ggplot(data = sh, aes(x = f2, y = f1)) + geom_point() +
  geom_smooth(method=lm)

# model with dummy variables
sm_dummy <- lm(f1 ~ f2 + vowel, data = sh)
summary(sm_dummy)

# model with random effects on the intercept
install.packages("lme4")
library(lme4)
me <- lmer(f1 ~ f2 + (1|vowel), data=sh, REML = FALSE)
summary(me)

# icc
library(sjstats)
icc(me)
