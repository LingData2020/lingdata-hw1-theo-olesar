# load data
df <- read.csv("http://math-info.hse.ru/f/2018-19/ling-data/icelandic.csv")

# general boxplot
boxplot(df$vowel.dur)

# number of outliers
length(boxplot(df$vowel.dur)$out)

# look at number of aspirated and non-aspirated cases
table(df$apriration)

# choose two subsamples
asp <- df[df$aspiration == 'yes',]
nasp <- df[df$apriration == 'no',]

# summary for aspirated and non-aspirated cases
summary(asp$vowel.dur)
summary(nasp$vowel.dur)

# boxplot for groups
boxplot(df$vowel.dur ~ df$aspiration)

# more interesting - boxplot for all groups
boxplot(df$vowel.dur ~ df$cons1)

# correct - make sure we work with the same type of a consonant (mid height)
asp <- df[df$aspiration == 'yes' & df$height == 'mid',]
nasp <- df[df$aspiration == 'no' & df$height == 'mid',]

# again summary for a corrected case
summary(asp$vowel.dur)
summary(nasp$vowel.dur)

# sizes of updated samples
nrow(asp)
nrow(nasp)

# t-test
t.test(asp$vowel.dur, nasp$vowel.dur)

# H1: mu_aps < mu_nasp
t.test(asp$vowel.dur, nasp$vowel.dur, alternative = "less")