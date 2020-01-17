## 16 March ##
## Correlation and regression ##

### Part 1: Pearson's coefficient vs Spearman's coefficient

x <- c(1, 2, 6, 8, 9, 7, 7.5, 10, 3, 4, 5.5)
y <- c(2, 4, 11, 15, 19, 16, 14, 23, 7, 6, 11)
plot(x, y)

# Pearson's coefficient
cor.test(x, y)

# Spearman's coefficient
cor.test(x, y, method = 'spearman')

x <- c(1, 2, 6, 8, 9, 7, 7.5, 10, 3, 4, 5.5, 150)
y <- c(2, 4, 11, 15, 19, 16, 14, 23, 7, 6, 11, 10)
plot(x, y)

cor.test(x, y)
cor.test(x, y, method = 'spearman')
cor.test(x, y, method = 'kendall')

### Part 2: real data

educ <- read.csv("https://raw.githubusercontent.com/LingData2019/LingData/master/data/education.csv")

library(tidyverse)
library(GGally)

scores <- educ %>% select(read, write, math, science, socst)
pairs(scores)
ggpairs(scores)

ggplot(data = scores, aes(x = math, y = science)) + 
  geom_point() +
  labs(x = "Math score",
       y = "Science score",
       title = "Students' scores")

cor.test(scores$math, scores$science)
model1 <- lm(data = scores, science ~ math)
summary(model1)

ggplot(data = scores, aes(x = math, y = science)) + 
  geom_point() +
  labs(x = "Math score",
       y = "Science score",
       title = "Students' scores") +
  geom_smooth(method=lm)
