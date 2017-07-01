# Atomic vectors!
#types: double, integers, characters, logicals, complex and raw
die <- c(1, 2, 3, 4, 5, 6)
is.vector(die) #test if it is a atomic vector returning a boolean
length(die)
int <- c(1L, 5L)
text <- c("ace", "hearts")
sum(int)
sum(text) # can't sum strings

# Doubles
die <- c(1, 2, 3, 4, 5, 6)
typeof(die)
sqrt(2)^2 - 2 # double are accurate to about 16 significant digits

# Integers
int <- c(-1L, 2L, 4L)
typeof(int)

# Characters
text <- c("Hello", "World")
typeof(text)

# Logicals
3 > 4
logic <- c(TRUE, FALSE, TRUE)
typeof(logic)
typeof(F)

# Complex and Raw
comp <- c(1 + 1i, 1+2i, 1+3i)
typeof(comp)

raw(3)
typeof(raw(3))

hand <- c("ace", "king", "queen", "jack", "ten")

# Attributes
attributes(die) # NULL if hasn't attributes

# Names
names(die)
names(die) <- c("one", "two", "three", "four", "five", "six")
attributes(die)
die+1
names(die) <- c("uno", "dos", "tres", "quatro", "cinco", "seis") # You can change or remove all
names(die) <- NULL

# Dim
dim(die) <- c(2, 3) # reorganize in a matrix
die
dim(die) <- c(1, 2, 3) # 3d structure without control (arguments)
die

# Matrices: 2 dimensional array
m <- matrix(die, nrow=2) # by column as default
m
n <- matrix(die, nrow=2, byrow=TRUE) # or by row
n
?matrix

# Array: n-dimensional array, works like Dim
ar <- array(c(11:14, 21:24, 31:34), dim=c(2, 2, 3)) # 2 rows 2 columns and 3 slices
ar

hand1 <- c("ace", "king", "queen", "jack", "ten", "spades", "spades", "spades",
           "spades", "spades")
matrix(hand1, nrow=5)
matrix(hand1, ncol=2)
dim(hand1) <- c(5, 2)
hand1
hand2 <- c("ace", "spades", "king", "spades", "queen", "spades", "jack", 
           "spades", "ten", "spades")
matrix(hand2, nrow=5, byrow=TRUE)
matrix(hand2, ncol=2, byrow=TRUE)

# Class: according to the structure
dim(die) <- c(2, 3)
typeof(die)
class(die)
attributes(die)
class("hello") # for objects without class, it returns the type
class(5)

# Dates and time
now <- Sys.time()
now
typeof(now)
class(now)
unclass(now)
mil <- 1000000
mil
class(mil) <- c("POSIXct", "POSIXt")

# Factors
genders <- factor(c("male", "female", "female", "male"))
genders
typeof(genders)
attributes(genders)
unclass(genders)
as.character(genders)

# Coercions: character <- numeric <- logical
sum(c(T, F, F, T))
as.character(1)
as.logical(1)
as.numeric(F)

# Lists
list1 <- list(100:130, "R", list(T, F))
list1
card <- list("ace", "hearts", "1")
card

# Data Frames: sequence of columns (each one have a type)
df <- data.frame(face=c("ace", "two", "six"), suit=c("clubs", "clubs", "clubs"),
                 value=c(1, 2, 3))
df
typeof(df)
class(df)
str(df) # string characters saved as factors

df <- data.frame(face=c("ace", "two", "six"), suit=c("clubs", "clubs", "clubs"),
                 value=c(1, 2, 3), stringsAsFactors=F)
str(df) # not anymore

deck <- data.frame(
      face=c("king", "queen", "jack", "ten", "nine", "eight", "seven", "six",
             "five", "four", "three", "two", "ace", "king", "queen", "jack", "ten",
             "nine", "eight", "seven", "six", "five", "four", "three", "two", "ace",
             "king", "queen", "jack", "ten", "nine", "eight", "seven", "six", "five",
             "four", "three", "two", "ace", "king", "queen", "jack", "ten", "nine",
             "eight", "seven", "six", "five", "four", "three", "two", "ace"), 
      suit=c("spades", "spades", "spades", "spades", "spades", "spades",
             "spades", "spades", "spades", "spades", "spades", "spades", "spades",
             "clubs", "clubs", "clubs", "clubs", "clubs", "clubs", "clubs", "clubs",
             "clubs", "clubs", "clubs", "clubs", "clubs", "diamonds", "diamonds",
             "diamonds", "diamonds", "diamonds", "diamonds", "diamonds", "diamonds",
             "diamonds", "diamonds", "diamonds", "diamonds", "diamonds", "hearts",
             "hearts", "hearts", "hearts", "hearts", "hearts", "hearts", "hearts",
             "hearts", "hearts", "hearts", "hearts", "hearts"), 
      value=c(13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 13, 12, 11, 10, 9, 8,
              7, 6, 5, 4, 3, 2, 1, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 13, 12, 11,
              10, 9, 8, 7, 6, 5, 4, 3, 2, 1), 
      stringsAsFactors=F)

# Loading Data
library(readr)
deck <- read.csv("/home/george/Git-projects/r-bioinfo-ds/hands-on-with-r/desk.csv", 
                  stringsAsFactors=F)
#skip first rows and nrow to select rows
head(deck)
deck

# Saving Data
write.csv(deck, file="cards.csv", row.names=F)

# R notation
deck[1,1] # using positive integers
deck[1,1:3] # or deck[1, c(1,2,3)]
deck[c(1,1), c(1,2,2,3)] # to repeat
vec <- c(6,1,3,6,10,5)
vec[1:3]
deck[1:2,1,drop=F]

deck[-1,1:3] # negative integer exclude the item
deck[-(2:52),1:3]
deck[0,0] # zero create a empty object
deck[1,] # white spaces indicate every value
deck[1, c(TRUE, TRUE, FALSE)] # booleans means if the item have or not be showed
rows <- c(TRUE, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F,
          F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F, F,
          F, F, F, F, F, F, F, F, F, F, F, F, F, F)
deck[rows,]
deck[1, c('face', 'suit')] # ask elements using names, columns are great for it
deck[,'value']

deal <- function(cards) {
      cards[1,]
}
deal(deck)

deck2 <- deck[1:52,] # copy, I know it isn't necessary
deck3 <- deck[c(2,1,3:52),]
deck3

random <- sample(1:52, size=52)
deck4 <- deck[random,]
deck4

shuffle <- function(cards){
      random <- sample(1:52, size=52)
      cards[random,]
}
deal(deck)
deck2 <- shuffle(deck)
deal(deck2)

deck$value # $ returns the value as a vector    
deck$face
mean(deck$value)

lst <- list(numbers=c(1,2), logical=T, strings=c('a','b','c'))
lst[1]
sum(lst[1]) # error
sum(lst[[1]])
lst$numbers
sum(lst$numbers)

# Chapter 5: Modifying Values
