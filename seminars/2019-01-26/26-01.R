# create a matrix 2 * 3 consisting of 0
matrix(0, nrow = 2, ncol = 3)

# arrange a vector of 12 values into matrix 3 * 4
# arrange by rows
v <- 1:12
m <- matrix(v, nrow = 3, ncol = 4, byrow = TRUE)

# sum of every row in a matrix
rowSums(m)

# recall: how to create a sample of 0 and 1 of size 10
sample(c(0, 1), 10, replace = TRUE)

# experiment from the lecture
# toss a coin 10 times
# and repeat this sequence 10000 times

tosses <- 10
samples <- 10000
# matrix of results
dat <- matrix(sample(c(0,1), tosses * samples,
                     replace = TRUE), ncol = tosses,
              nrow = samples, byrow = TRUE)
dat

# phats - proportions of heads in each experiment
phat <- rowSums(dat) / tosses
hist(phat, breaks = tosses, xlim = c(0, 1))

# H0: p = 0.5
binom.test(3, 10, p=0.5) # 3 out of 10 - a fair coin?
binom.test(2, 10)  # 2 out of 10 - a fair coin?
binom.test(1, 10)  # 1 out of 10 - a fair coin?

# load poetry data
df <- read.csv("https://raw.githubusercontent.com/LingData2019/LingData/master/seminars/26-01/poetry_last_in_lines.csv",
               sep = "\t", encoding = "UTF-8") # Windows-1251

# suggest your hypotheses about p nouns
# H0: p = 0.6

# frequencies of PoS
table(df$UPoS)/sum(table(df$UPoS))

# select lines with nouns
nouns <- df[df$UPoS == "NOUN", ]
total <- nrow(df)
nnoun <- nrow(nouns)

# H0: p = 0.6
binom.test(nnoun, total, p = 0.6)
# not reject (correct)
# not reject != accept != H0 holds

# H0: p = 0.4
binom.test(nnoun, total, p = 0.4)

# choose one-syllable words and test H0: p= 0.6
one_syll <- df[df$RhymedNsyl == 1, ]
nrow(one_syll)
nrow(one_syll[one_syll$UPoS == "NOUN", ])
binom.test(32, 43, p=0.6)

# you can test on your own for every number of syllables
table(df$RhymedNsyl)
