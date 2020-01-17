## 23 March ##
## ANOVA ##

phono <- read.csv("http://math-info.hse.ru/f/2018-19/ling-data/icelandic.csv")
table(phono$cons1)

library(tidyverse)
ggplot(data = phono, aes(x = cons1, y = vowel.dur)) + geom_boxplot()

res <- aov(phono$vowel.dur ~ phono$cons1)
res
summary(res)

## Multiple comparisons ##

pairwise.t.test(phono$vowel.dur, 
                g = phono$cons1, 
                p.adjust.method = "none")

pairwise.t.test(phono$vowel.dur, g = phono$cons1, p.adjust.method = "bonferroni")

