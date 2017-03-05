setwd("C:\\GitHub\\datasciencecoursera\\rProgramming")

##QUiz Scratchpad
x<-4
class(x)

x<-c(4,TRUE)
class(x)

x
x <- list(2, "a", "b", TRUE)
class(x[[2]] )

x <- 4L 
class(x)
x <- c(4, TRUE)
u <-c(1,3,5)
v <-c(3,2,10)
cbind (u,v)


x <- 1:4
y <- 2
class(x+y)
x <-list(2, "a,", TRUE)

x[[1]]
class(x[[1]])

x<-1:4
y<-2

x+y
x <- c(17, 14, 4, 5, 13, 12, 10) 
x[x > 10] == 4

x <- c(17, 14, 4, 5, 13, 12, 10) 
x[x > 10] <- 4

x <- c(17, 14, 4, 5, 13, 12, 10) 
x[x == 4] > 10

x <- c(17, 14, 4, 5, 13, 12, 10) 
x[x >= 10] <- 4

x <- c(17, 14, 4, 5, 13, 12, 10) 
x[x == 10] <- 4

x <- c(17, 14, 4, 5, 13, 12, 10) 
x[x >= 11] <- 4

x <- c(17, 14, 4, 5, 13, 12, 10) 
x[x < 10] <- 4

x <- c(17, 14, 4, 5, 13, 12, 10) 
x[x > 4] <- 10

x<-c(3,5,1,10,12,6)
x[x %in% 1:5] <-0
x

hw <- read.csv("hw1_data.csv")
hw[1:2,]
hw[152:153,]
hw[47,]

bad<-is.na(hw[1])
hw[bad,]

install.packages("plyr")
library("plyr")
count(hw[bad,])

count(hw[bad,])

mean(hw[!bad,1])

##18
ozoneover31 <- hw$Ozone >31

excludedozone <- hw[ozoneover31,]
excludedozone <-excludedozone[!is.na(excludedozone[1]),]
excludedozone

excludedtemp <- excludedozone$Temp > 90

excludedtemp

answer <- excludedozone[excludedtemp,]
answernoNa <- answer[!is.na(answer[2]),]
answernoNa

mean(answernoNa$Solar.R)

answer

excludedtemp


##19
isjune <- hw$Month==6
onlyjune <-hw[isjune,]
mean (onlyjune$Temp)
tempover90[!is.na(tempover90[1]),]

onlyjune

##20
onlymay <-hw[hw$Month==5,]
maynona <- onlymay[!is.na(onlymay[1]),]

onlymay
max(maynona$Ozone)

