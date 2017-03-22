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
library(rJava)
library(xlsx)

excellent <- read.xlsx2('/data/gas.xlsx')