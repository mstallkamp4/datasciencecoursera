#Week 1 Quiz

getwd()

#1.
install.packages("data.table")
library(data.table)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile="./data/communities.csv")
list.files("./data")

commune <- read.csv("./data/communities.csv")
data <- data.table(commune)
str(commune)
data [, .N, by=VAL]
data[data$VAL==24]

#2
##No coding needed


#3
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx", destfile="./data/gas.xlsx")
install.packages("xlsx")
install.packages("rJava")
library(xlsx)
library(openxlsx)
excellent <- read.xlsx('gasx.xlsx')

excellent
colindex <- 18:23
rowindex <- 7:15
exsub <- read.xlsx("gasx.xlsx", colindex=18:23, rowIndex=7:15, sheetIndex=1)

dat <- excellent [18:23, 7:15]
str(dat)
dat$X7

sum(dat$x7*dat$x12,na.rm=T)


#4
install.packages("XML")
library(XML)
doc <- xmlTreeParse("./rest.xml", useInternal=TRUE)
class(doc)

rootNode <-xmlRoot(doc)
zips<-xpathSApply(rootNode, "//zipcode", xmlValue)

zips[zips==21231]

#5

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", destfile = "comm.csv")

library(data.table)

DT <- fread("comm.csv")

system.time(DT[,mean(pwgtp15),by=SEX])

system.time(rowMeans(DT)[DT$SEX==1] rowMeans(DT)[DT$SEX==2])

system.time(mean(DT$pwgtp15,by=DT$SEX))

system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))

system.time(mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15))

system.time(tapply(DT$pwgtp15,DT$SEX,mean))
