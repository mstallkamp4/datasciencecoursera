##R Console Input and evaluation

setwd("C:\\GitHub\\datasciencecoursera")


x <-1 
print(x)

msg <-"hello"

x <-5

print (x)

x <- 1:20

y <- 1/0

attributes (y)

#Data Type Conversion
t <- c(T,F)
print(t)
t <-c(T, 'b')
print(t)

t <-vector("numeric", length=4)

y <- c(T, 2)
y

attributes((y))

x=(0:6)
class (x)

#Explicit
as.numeric((x))

class(as.numeric(x))

as.logical(x)

#Conversion Failure:
x <-c("a", "b")
as.numeric(x)


#Lists 
x <- list(1,"a", T)
x

#Creates a vector of vectors
#Each element gets a vector

x <- list(1,"a",2, T, "B", F)

x


#Matricies 
m <- matrix(nrow=2, ncol=3)
m
dim(m)
attributes(m)

#Matrix takes a vector and inserts values as rows
m <-matrix(1:6,nrow=2, ncol=3)
m

#You can start with a vector and add a dimension
y <-1:10
dim(y) <- c(2,5)
y


#You can also use column binding and row binding
a <-1:3
b <- 10:12
cbind(a,b)
rbind(a,b)


#factors
## categorical data that can be ordered and unordered
## Integer vectors with labels
lm()
glm()

x <- factor(c("yes", "yes", "no", "yes", "no"))
x
unclass(x)
x

#Order of the levels can be set using the levels argument to factor()
##The first level is used as the baseline


x <- factor(c("yes", "yes", "no", "yes", "no"),
            levels =c("yes","no"))

x

#Missing Values
#na - Test if values are missing
#NaN - test for missing numeric values

x <- (c(1,2, NA, 10, 3))
is.nan(x)
is.na(x)

#Data Frames 
##used to store tabular data
##every element of list has to have same length
##Each Element can be thought of a calums and the lengh of each element of the list is the number of rows
##Data frames can store different classes

row.names()

#cretaed by calling
read.table() 
read.csv()

data.matrix()

x <- data.frame(foo = 1:4, bar=c(T,T,F,T))
x
nrow(x)
ncol(x)


#Names
#vectors
x<-1:3 
names(x)
names(x) <- c("Mike", "IsThe", "Best")
x

#lists 
x <-list(a=1, b=2, c=3)
x

#matrices
x <-matrix (1:4, nrow=2, ncol=2)
dimnames(x) <- list(c("Row1", "Row2"), c("Col1", "Col2"))
x











