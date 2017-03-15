#The str function
# most useful function in all of R
f <- gl(40,10)
str(f)

x <-rnorm(100,2,4)
summary(x)
str(x)

library(datasets)
head(airquality)

str(airquality)

#str - quick examination of R objects
#    - gives you the definition and a sample of data

m <- matrix(rnorm(100), 10, 10)
str(m)
m[,1]

x <- split(airquality, airquality$Month)
str(x)