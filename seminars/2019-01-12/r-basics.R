### 12 January ###
### R basics ###

## R as a calculator
1 + 4 
4 - 9
6 * 5 + 7 / 2
sqrt(36) 
6 ^ 2
6 ** 2

log(4)
log(4, base = 2)  # so 2^2 = 4
log10(100)  # the same as log(100, base=10)

round(12.57)
round(12.57, 1)  # round to tenths, 1 digit after .

## Variables in R
a <- 3
a

x <- 2
x <- x + 3
x # updated, now it is 3 + 2 = 5

s <- "hello"
s
toupper(s)
s
s <- toupper(s)
s  # updated

## Vectors in R
v <- c(1, 0, 0, 1, 2) # vector v
v
class(v) # numeric values, not text ones
length(v)

v[1]  # first element
v[2]  # second element 
v[0]  # no error, but no such element

names <- c('Ann', 'Tom')
names

## Descriptive statistics in R
x <- c(6, 6, 7, 0, 14, 24, 16, 15, 2, 0)
x

min(x) # maximum value
max(x) # maximum value
mean(x) # an average, a sample mean
median(x) # a median
var(x) # a sample variance
sd(x) # a standard deviation

y <- c("a", "b", "c", "a", "c", "c")
table(y)
table(y)/sum(table(y))

## Histograms

hist(x)  # hist - from histogram
hist(x, col="red")  # col for color
hist(x, col="hotpink")  # more interesting color


# freq=FALSE, not absolute frequences by y-axis
hist(x, col="red", freq=FALSE) 
hist(x, col="red", freq=FALSE, breaks=3)  # 3 bins

