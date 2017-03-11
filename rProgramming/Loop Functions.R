#lapply

x <- list(a = 1:5, b = rnorm(10))
#rnorm = normal random variables
x
x$a
#gets the mean of both a and b
lapply(x,mean)


y <-list(a = 1:4, b=rnorm(10), c=rnorm(20,1), d=rnorm(100,5))

y

lapply(y,mean)

#lapply with runif
l<-1:4
lapply(l,runif)
#runif generates uniform random variables
#1 = generate 1 random uniform variables, 2 = generate 2 randome unifrorm, et

lapply(l,runif, min=0, max=10)
#min and max are optional variables of runif

##Lapply can use anonymous functions
#want to get the first column of matrix
#annonymous function are not named and go away after execution of lapply
x <-list(a=matrix(1:4,2,2), b=matrix(1:9, 3,3))
x
lapply(x, function(elt) elt[,1])

#sapply will try simplify the result of lapply if possible
##If the result is a list where every element is a length of 1, then a vector is returned
##If the result is a list where every element is a vector of the same len, a matrix is returned
##If it can't figure it out, a list is returned


y <-list(a = 1:4, b=rnorm(10), c=rnorm(20,1), d=rnorm(100,5))
sapply(y, mean)

#apply 
##used to evaluate a fucntion (oftan an anonymous one) over the margins of an array
##Most ofent used to apply a function to the rows or columsn of a matrix 
##Can be used with general arrays (taking the avg of an array
#Not faster than an apply

str(apply)

x <- matrix(rnorm(200),20,10)
##Matrix 20 rows 10 columns
x
function (x, margin, fun,...)
    apply(x,2,mean)
##Takes the mean across all the second dimension -- In this case COlumsn
#^preserve the columns collapse the rows

apply(x,1,mean)
#^ preserve therows collapse the columns

##Shortcuts for matrixes
## Optimized for performance
rowSums(x)  # = apply(x, 1, sum)
rowMeans(x) # = apply (x, 1, mean)
colSums(x)  # = apply (x, 2, sum)
colMeans(x) # = apply (x, 2, mean)

#quantiles using apply
##quantiles function gives percentiles and needs to know what percentile(s) to caluclate
x <-matrix (rnorm(200), 20, 10)
apply(x, 1, quantile, probs = c(.25, .75))  #25% and 75% quantiles


#ARRAYS

a <- array(rnorm(2*2*10), c(2,2,10))
## 2 ,2 matrixes stacked together 10 times
apply(a,c(1,2), mean) ##The averages of 2x2 matrices is a matrix
rowMeans(a, dims=2)

#mapply
##input to lapply is a single list
## what if you want to compare values from multiple lists
# you could use for loop to index each element of list
## - oor - use mapply

function (FUN, ..., MoreArgs = NULL, SIMPLIFY = TRUE, USE.NAMES = TRUE) 
    
    str(mapply)

list(rep(1,4), rep(2,3), rep(3,2), rep(4,1))
#same as 
mapply (rep, 1:4, 4:1)

noise <-function(n, mean, sd) {rnorm(n,mean,sd)
}
noise (5,1,2)

#vecotrize a function that does not allow for vector arguments
mapply(noise, 1:5, 1:5, 2)
#same as 
list (noise(1,1,2),... )

#tapply
##apply a function over subsets of a function
str(tapply)
#function (x, index, FUN, ..., MoreArgs = NULL, SIMPLIFY = TRUE, USE.NAMES = TRUE)
# x is a vector
# index is a factor or a list of factor
# fun is a function to be applied
# ... args for fun
# simplify - should we simplify the results (like  s apply)

w <- c(rnorm(10), runif(10), rnorm(10,1))
f <- gl(3,10)
#f is the group
w
f
tapply(w, f, mean)
tapply(w, f, range)

#tapply splits a vector into subset,applies the function, and returns the results

#split
#split takes a vector or other objects and splits it into grous
#determined by a factor or list of factors

str(split)

x<-c(rnorm(10), runif(10), rnorm(10,1))
f <- gl(3,10)
x
f
lapply(split(x, f), mean)


#splitting a data frame
library(datasets)
head(airquality)

#want to split the data frame into seperate months
#and caclulate the column mean

s <-split(airquality,airquality$Month)
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R","Wind")]))
#remote NAs

sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R","Wind")], na.rm="TRUE"))

#splitting on more than one level
x <- rnorm(10)
f1 <-gl(2,5)
f2 <-gl(5,2)

#grouping variables
##Age
f1
##Leage
f2

##INteraction function will combine factors to create levles
interaction(f1,f2)

#checking list
str(split(x,list(f1,f2)))

#drop the empty levels
str(split(x,list(f1,f2), drop=TRUE))



