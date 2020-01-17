### 19 January ###
### More on vectors ###

## Operations on vectors
v <- c(2, 7, 1, 0, 9, 5, 8)
w <- c(0, 0, 1, 2, 1, 5, 0)
v
w
v - 1
v * 2
v + w
v * w

# the 2nd element is doubled
# and the warning says that lengths are different
c(1, 4, 5) + c(6, 7)

# problem 1 with solution
start <- c(20, 30, 40, 10, 15, 12)
finish <- c(30, 38, 42, 15, 17, 18)
dur_min <- (finish - start) * 60
dur_min

# problem 2 with solution
speakers <- c(25, 32, 10, 43, 50)
total <- c(100, 120, 45, 50, 65)
perc <- (speakers/total) * 100
perc

## Sequences in R
1:10
-10:20
v[1]
v[1:4]
v[4:6]
v[c(1, 4, 6)]
v[-c(2, 4)]

seq(1, 10)
seq(1, 10, 2)
seq(1, 10, 0.5)

## Filtering elements by value
v
v[v > 2]
v > 2
v[v == 5]
v[v != 5] 
v[v > 1 & v < 7]
v[v < 2 | v > 5] 

## Vectors of repeated values
rep("F", 15)
rep(2, 10)
rep(c("F", "M"), 5)
rep(c("F", "M"), each=5)

## Type conversion
a <- c("1", "0", "1", "0", "1")
as.numeric(a)
a
a <- as.numeric(a)
a

b <- c(1, 2, 3, 0)
b <- as.character(b)
class(b)

region <- c(1, 3, 2, 4, 4, 1)
region <- as.factor(region)
class(region)
hist(region) # if you get the error, it is ok

summary(a)
summary(b)
summary(region)
