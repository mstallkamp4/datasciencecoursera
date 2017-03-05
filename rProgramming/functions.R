add2 <- function(x,y) {
  
  x +y
  #last expression is returned
}

add2(3,4)

##return vector with values over 10
above10 <-function(x) {
  use <- x>10
  x[use]
}

x <- c(1,15,3,4,99, 320)

above10(x)

##return vector vith values over 10
aboven <-function(x,n)
{
  use <- x > n
  x[use]
}


##define a default value
aboven <-function(x,n=10)
{
  use <- x > n
  x[use]
}
aboven(x)


##One with a for loop
# get the mean

columnmean <-function(y, removeNA=TRUE)
{
  nc <-ncol(y)
  means <-numeric(nc)
  for (i in 1:nc)
  {
    means[i] <mean(y[, i], na.rm=removeNA)
  }
  means
}
setwd("C:\\github\\datasciencecoursera\\rProgramming")

hw <- read.csv("hw1_data.csv")

columnmean(hw)
args(lm)
args(paste)

search()


make.power <-function (n){
  pow<-function(x) {
    x^n}
  pow
}

cube <- make.power(3)
square <- make.power(2)

cube(3)
square(3)

ls(environment(cube))
ls(environment(square))

y <- 10
f <-function(x){
  y <-2
  y^2 + g(x)
}

g <- function(x) {x*y}

f(3)


g <-function(x) {
  a<-3
  x+a+m
}

g(2)
m<-10

g(2)


x <-as.Date("2000-01-01")

x

unclass(x)

weekdays(x)

s <-Sys.time()
s
unclass(s)
p <- as.POSIXlt(s)
names(unclass(p))
p$sec
p <- as.POSIXct((s))
s


datestring <-c("January 10, 2014 10:40", "December 7, 1942 04:00")
datestring
x <- strptime(datestring, "%B %d, %Y %H:%M")
x

?strptime