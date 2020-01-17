# load data on Icelandic language
phono <- read.csv("http://math-info.hse.ru/f/2018-19/ling-data/icelandic.csv")

# look at groups of consonants
table(phono$cons1)

# boxplot by groups
boxplot(phono$vowel.dur ~ phono$cons1)

# perform ANOVA
# H0: there are no difference in population means by groups
res <- aov(phono$vowel.dur ~ phono$cons1)
res

# more informative summary
summary(res)



