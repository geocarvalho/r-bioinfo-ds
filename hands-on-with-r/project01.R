# Chapter 1: Objects and functions

roll <- function(list=1:6, size=2) {
      sum(sample(x=list, size=size, replace=TRUE))
}

# Chapter 2: Packages and help pages

library(ggplot2)
x <- c(-1, -0.8, -0.6, -0.4, -0.2, 0, 0.2, 0.4, 0.6, 0.8, 1)
y <- x^3
qplot(x, y)

#histogram
x <- c(1, 2, 2, 2, 3, 3)
qplot(x, binwidth=1)
x2 <- c(1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 4)
qplot(x2, binwidth=1)
x3 <- c(0, 1, 1, 2, 2, 2, 3, 3, 4)
qplot(x3, binwidth=1)

rolls <- replicate(1000, roll())
qplot(rolls, binwidth=1)

roll <- function(list=1:6, size=2) {
      sum(sample(x=list, size=size, replace=TRUE, prob=c(1/8, 1/8, 1/8, 1/8, 1/8, 3/8)))
}
rolls <- replicate(1000, roll())
qplot(rolls, binwidth = 1)
