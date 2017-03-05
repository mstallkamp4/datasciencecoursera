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

setwd("C:\\github\\datasciencecoursera\\rProgramming")

hw <- read.csv("hw1_data.csv")

columnmean(hw)