# Control Structures
# if, else: testing a condition
# for: execute a loop a fixed number of times
# while: execute a loop while a condition is true
# repeat: execute an infinite loop
# break: break the execution of a loop
# next: skip an interation of a loop
# return: exit a function

# If/else
x=3
y <- if(x>3) {
  10
} else {
  0
}
y

# For loops
for(i in 1:10) {
  print(i)
}
x <- c("a", "b", "c", "d")
for(i in 1:4) {
  print(x[i])
}
for(i in seq_along(x)) {
  print(x[i])
}
for(letter in x) {
  print(letter)
}
for(i in 1:4) print(x[i])
# nested for loops
x <- matrix(1:6, 2, 3)
for(i in seq_len(nrow(x))) {
  for(j in seq_len(ncol((x)))) {
    print(x[i, j])
  }                      
}
x

# While
count <- 0
while(count < 10) {
  print(count)
  count <- count+1
}

z<- 5
while(z >= 3 && z <= 10) {
  print(z)
  coin <- rbinom(1, 1, 0.5)
  if(coin == 1) {
    z <- z+1
  } else {
    z <- z-1
  }
}

# Repeat and break
x0 <- 1
tol <- 1e-8
repeat {
  x1 <- computeEstimate() # isn't real
  if(abs(x1-x0) < tol) {
    break
  } else {
    x0 <- x1
  }
}

# Next and return
for(i in 1:100) {
  if(i <= 20) {
    next
  } else {
    print("Hello world")
  }
}

# Functions
add2 <- function(x, y) {
  x+y
}
add2(3, 2)

above10 <- function(x) {
  use <- x > 10
  x[use]
}

above <- function(x, n=10) {
  use <- x > n
  x[use]
}
x <- 1:20
above(x)

columnmean <- function(y, removeNA=TRUE) {
  nc <- ncol(y)
  means <- numeric(nc)
  for(i in 1:nc) {
    means[i] <- mean(y[, i], na.rm=removeNA) #calculate for the entire column
  }
  means
}
columnmean(airquality)
columnmean(airquality, FALSE)

# Functions part 1
# argument matching
mydata <- rnorm(100)
sd(mydata)
sd(x=mydata)
sd(x=mydata, na.rm=FALSE)
sd(na.rm=FALSE, x=mydata)
sd(na.rm=FALSE, mydata)

args(lm)
lm(data = mydata, y ~ x, model = FALSE, 1:100)
lm(y ~ x, mydata, 1:100, model=FALSE)

# Functions part 2
#lazy evaluation
f <- function(a, b) {
  a+2
}
f(2)
f <- function(a, b) {
  print(a)
  print(b)
}
f(45)
# the "..." argument
myplot <- function(x, y, type="1", ...) {
  plot(x, y, type=type, ...)
}

args(paste)
args(cat)

paste("a", "b", sep=":")

# Scoping rules
lm <- function(x) { x*x }
lm
# lexical scoping
f <- function(x, y) {
  x**2 + y/z
}

make.power <- function(n) {
  pow <- function(x) {
    x**n
  }
  pow
}
cube <- make.power(3)
square <- make.power(2)
cube(3)
square(3)

# function closure
ls(environment(cube))
get("n", environment(cube))
ls(environment(square))
get("n", environment(square))

# lexical vs dynamic scoping
y <- 10
f <- function(x) {
  y <- 2 #lexical scoping
  y**2 + g(x)
}
g <- function(x) {
  x*y #dynamic scoping (variable environment)
}
f(3)

g <- function(x) {
  a <- 3
  x+a+y
}
g(2)
y <- 3
g(2)

# Scoping rules - optimization example
# maximizing a normal likelihood
make.NegLogLik <- function(data, fixed=c(FALSE, FALSE)) {
  params <- fixed
  function(p) {
    params[!fixed] <- p
    mu <- params[1]
    sigma <- params[2]
    a <- -0.5*length(data)*log(2*pi*sigma**2)
    b <- -0.5*sum(data-mu)**2) / (sigma**2)
    -(a+b)
  }
}
set.seed(1); normals <- rnorm(100, 1, 2)
nLL <- make.NegLogLik(normals)
nLL
ls(environment(nLL))
# estimating parameters
optim(c(mu=0, sigma=1), nLL)$par
nLL <- make.NegLogLik(normals, c(FALSE, 2))
optimize(nLL, c(-1, 3))$minimum
nLL <- make.NegLogLik(normals, c(1, FALSE))
optimize(nLL, c(1e-6, 10))$minimum
# plotting the likelihood
nLL <- make.NegLogLik(normals, c(1, FALSE))
x <- seq(1.7, 1.9, len=100)
y <- sapply(x, nLL)
plot(x, exp(-(y - min(y))), type="l")
nLL <- make.NegLogLik(normals, c(FALSE, 2))
x <- seq(0.5, 1.5, len=100)
y <- sapply(x, nLL)
plot(x, exp(-(y -min(y))), type="l")