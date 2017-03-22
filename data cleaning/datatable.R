#data.table
#inherits from data.frame
#written in c - much faster at subsetting, group, and updating

install.packages("data.table")
library(data.table)

#data frame
data <- data.frame(x=rnorm(9), y=rep(c("a","b", "c"), each=3), z=rnorm(9))

#data table
datatable <- data.table(x=rnorm(9), y=rep(c("a","b", "c"), each=3), z=rnorm(9))
head (datatable,3)
#see all the data tables in memory
tables()

#subsetting rows
datatable[2,]
datatable[,2]
datatable[datatable$y=="b"]

##subsetting columns?
datatable[ , c(2,3)]
#subsetting is modified for data.table
#The arg you pass after the comma is an expression

##Pass a function
## List makes it readable
datatable[, list(mean(x), sum(z))]

##Add a new column!
datatable[, w:=z^2]

##Need to use copy to create a non-changing copy of the data table!

#MULTIPLE FUNCTIONS
#remember that the last statement of a function is applied
#In the example below, m is the l of tmp +5
datatable[,m:={tmp<-(x+z); log2(tmp+5)}]
datatable


#PLYR Functions
#Adds Binary type named a evaluated on expression
datatable[, a:=x>0]
#by grouped by a variable
#mean of x+w where a=TRUE
#mean of x+w where a=FALSE
datatable[, b:=mean(x+w), by=a]

datatable

#Special Variables
#.n an integer length 1, containing the number 
# Count
#creates 100,000 random as bs or cs
DT <- data.table (x=sample(letters[1:3], 1E5, TRUE))
#groups by X and displays count!
DT [, .N, by=x]


#KEYS!
DT <- data.table(x=rep(c("a","b","c"),each=100), y=rnorm(300))
setkey(DT, x)
DT['a']

#JOINS!
DT1 <- data.table(x=c('a', 'a','c'), y=1:4)
DT2 <- data.table(x=c('a', 'b','c'), y=5:9)

setkey(DT1,x)
setkey(DT2,x)
#JOINS ON KEY
merge(DT1, DT2)


#Fast Reading!

#Faster and more efficient than data frames!
#Different Syntax than data frames
#Rapidly develing - melt and dcast activities

