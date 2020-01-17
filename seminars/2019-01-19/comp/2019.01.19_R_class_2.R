artists <- scan("http://math-info.hse.ru/f/2018-19/ling-data/artists-sizes.txt")
median(artists)
artists > 7000
artists <= 7000
artists == 7000
artists != 7000
artists >= 7000
artists < 7000
sum(artists > 7000)
sum(artists < 7000)

artists < 7000 & artists > 570
artists < 7000 | artists > 8700

artists[artists < 7000]

1:100
seq(1, 100, 1)
seq(1000, 5000, 30)

1:100*40+960
seq(1000, by = 40, length.out = 100)

1:100+960*40

median(artists[artists < 7000])
quantile(artists, probs = 0.43)
quantile(artists, probs = c(0.43, 0.58, 0.95, 0.33))

length(artists)*0.4
sort(artists)[c(5679, 5680)]
sort(artists)[c(5675:5685)]
quantile(artists, probs = 0.45)

# Генерация данных
1:100
1:100*5-40
seq(60, -30, -4.5)
sample(artists, 
       size = 100, 
       prob = seq(0, 1, length.out = length(artists)))

set.seed(42)
pppl <- sample(c("a", "b", "c"),
            size = 243,
            replace = TRUE,
            prob = c(0.2, 0.5, 0.3))

table(pppl)
prop.table(table(pppl))

plot(seq(0, 1, length.out = length(artists)))

set.seed(42)
rnorm(100)
rt(100, df = 2)
rchisq(100, df = 4)
rlnorm(100)

options(scipen = 999)
hist(artists[artists < 40000])
hist(artists, 
     breaks = 100000, 
     xlim = c(quantile(artists, .25),
              quantile(artists, .85)))
hist(artists, 
     breaks = 50)

hist(sample(artists, size = 10), 
     breaks = 50)

hist(sample(artists, size = 100), 
     breaks = 50)

hist(sample(artists, size = 1000), 
     breaks = 50)

hist(sample(artists), 
     breaks = 50)

v <- c("детский сад", 
       "старшая школа", 
       "аспирантура",
       "магистратура")
typeof(v)
nchar(v)
v2 <- factor(v)
v2 <- factor(v, levels = c("детский сад", 
                           "старшая школа", 
                           "магистратура",
                           "аспирантура"))
nchar(v2)

df <- data.frame(names = c("Эдик", "Виолетта", "Артур"),
                 age = c(43, 23, 6),
                 sex = c("m", "f", "m"))
summary(df)
str(df)

df <- read.csv("/home/agricolamz/work/databases/adyghe_noun_database/1.dental_preruptives.csv")
setwd("/home/agricolamz/work/materials/2019_HSE_Data_Analysis_for_linguists/data/")
df <- read.csv("colreg.csv")
df <- read.csv("http://math-info.hse.ru/f/2018-19/ling-data/Chi.kuk.2007.csv")

df$age
df[2,4]
df[2:10,4]

df1 <- df
df1[5,4] <- 100
df1[5,4]
df[df$age < 20,]

df[df$age > 20 & df$orientation == c("homo", "hetero")|df$speaker == "L", 
   c("age", "orientation")]

mtcars
iris
Titanic

typeof(NA)
c(1:10, NA)
c(letters, NA)
c(1+2i, NA)
c(TRUE, FALSE,  NA)
NA_character_

mtcars[101,]
mtcars[,101]

mean(c(1:100, NA), na.rm = TRUE)
median(c(1:100, NA), na.rm = TRUE)
min(c(1:100, NA), na.rm = TRUE)
max(c(1:100, NA), na.rm = TRUE)
sum(c(1:100, NA), na.rm = TRUE)
prod(c(1:100, NA), na.rm = TRUE)
df$mean <- mean(df$age)

getwd()
write.csv(mtcars, "MY_MTCARS.csv")