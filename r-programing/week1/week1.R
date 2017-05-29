# Objects: character, numeric, integer, complex, logical
# Vector: a list of the same object (class and length)
# Numbers
# Attributes: names or dimnames, dimensions, class, length, other user-defined attributes/metadata

# Vectors
x <- c(0.5, 0.6) # numeric
x <- c(TRUE, FALSE) # or c(T, F) are logical
x <- c("a", "b", "c") # character
x <- 9:29 # integer
x <- c(1+0i, 2+4i) # complex
x <- vector("numeric", length = 10)
print(x)

# Mixing objects
y <- c(1.7, "a") # character
y <- c(TRUE, 2) # numeric
y <- c("a", "TRUE") # character

# Explicit coercion
x <- 0:6
class(x)
as.numeric(x)
as.logical(x)
as.character(x)

y <- c("a", "b", "c")
as.numeric(y)
as.logical(y)
as.complex(y)

# Lists
x <- list(1, "a", TRUE, 1+4i)
x

# Matrices
m <- matrix(nrow=2, ncol=3)
m
dim(m)
attributes(m)

m <- matrix(1:6, nrow=2, ncol=3)
m

m <- 1:10
dim(m) <- c(2,5)
m

x <- 1:3
y <- 10:12
cbind(x,y)
rbind(x,y)

# Factors
x <- factor(c("yes", "yes", "no", "yes", "no"))
x
table(x)
unclass(x)

x <- factor(c("yes", "yes", "no", "yes", "no"),
            levels = c("yes", "no"))
x

# Missing values
is.na() # NA values have a class, they are integer
is.nan()
x <- c(1, 2, NaN, NA, 4)
is.na(x)
is.nan(x)

# Data Frames
# Different from matrices that just can store the same class, in dataframes  
x <- data.frame(foo=1:4, bar=c(T,T,F,F))
x
nrow(x)
ncol(x)

# Names attributes
x <- 1:3
names(x)
names(x) <- c("foo", "bar", "norf")
x
names(x)
x <- list(a=1, b=2, c=3)
x
m <- matrix(1:4, nrow=2, ncol=2)
dimnames(m) <- list(c("a", "b"), c("c", "d"))
m

# Reading and writing data
read.table()
read.csv()
readLines()
source() # inverse of dump
dget() # inverse of dput
load()
unserialize()

# Reading larger datasets
comment.char = " " # if there aren't any comment in your file
# using colClasses run read.table more faster
initial <- read.table("datatable.txt", nrows=100)
classes <- sapply(initial, class)
tabAll <- read.table("datatable.txt", colClasses = classes)

# dput-ting R objects
y <- data.frame(a=1, b="a")
dput(y)
dput(y, file="y.R")
new.y <- dget("y.R")
new.y

# Dumping R objects
x <- "foo"
y <- data.frame(a=1, b="a")
dump(c("x", "y"), file="data.R")
rm(x, y)
y
source("data.R")
y

# Interfaces to the outside world
# file, gzfile, bzfile, url
# File connections
str(file)
# Connections
con <- file("foo.txt", "r")
data <- read.csv(con)
close(con)
# the same as
data <- read.csv("foo.txt")

# Reading lines of a text
con <- gzfile("words.gz")
x <- readLines(con, 10)
x
# and for webpages
con <- url("http://www.jhsph.edu", "r")
x <- readLines(con)
head(x)

# Subsetting: [, [[, $
x <- c("a", "b", "c", "c", "d", "a")
x[1]
x[2]
x[1:4]
x[x>"a"]
u <- x>"a"
u
x[u]

# Subsetting lists
x <- list(foo=1:4, bar=0.6)
x[1]
x[[1]]
x$bar
x[["bar"]]
x["bar"]
# more than on element
x <- list(foo=1:4, bar=0.6, baz="hello")
x[c(1,3)]
# using [[ and $
name <- "foo"
x[[name]]
x$name #doesn't work
x$foo
# [[ can take an integer sequence
x <- list(a=list(10, 12, 14), b=c(3.14, 2.81))
x[[c(1, 3)]]
x[[1]][[3]]
x[[c(2, 1)]]

# Subsetting a matrix
x <- matrix(1:6, 2, 3)
x[1, 2]
x[2, 1]
x[1,]
x[,2]
# to still seeing the index
x[1, 2, drop=FALSE]
x[1, , drop=FALSE]

# Partial matching
x <- list(aardvark = 1:5)
x$a
x[["a"]]
x[["a", exact=FALSE]]

# Removing missing values (NA)
x <- c(1, 2, NA, 4, NaN, 5)
bad <- is.na(x)
x[!bad]
# for multiple vectors
y <- c("a", "b", NA, "d", NaN, "f")
good <- complete.cases(x, y)
x[good]
y[good]
# for dataframes
airquality[1:6, ]
good <- complete.cases(airquality)
airquality[good, ][1:6, ]

# Vectorized operations
x <- 1:4; y <- 6:9
x + y
x>2
x>=2
y==8
x*y
x/y
# element-wise multiplication
x <- matrix(1:4, 2, 2); y <- matrix(rep(10, 4), 2, 2)
x*y
x/y
# true matrix multiplication
x %*% y
