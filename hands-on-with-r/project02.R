# Atomic vectors
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

# Class