#HW3
#1
comm<-read.csv("comm.csv")

comm[comm$ACR > 10 & comm$AGS > 5, ]

comm$AGS==6

argiculatureLogical <- (comm$ACR ==3 & comm$AGS ==6)


which(argiculatureLogical==TRUE)

#2
url <-"https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(url = url, "jeff.jpg")

install.packages("jpeg")
library(jpeg)

?jpeg
getwd()
pic <- readJPEG("jeff.jpg", TRUE)
pic <- readJPEG("jeff2.jpg", TRUE)
pic

library(plyr)
quantile(pic, c(.30, .80) )

?quantile
?readJPEG
s
file.info("jeff.jpg")

file.info(list.files(getwd(),full.names=TRUE))

#3
gdp <- read.csv('GDP.csv')
countries <-read.csv('country.csv')
library(dplyr)
library("plyr")

bigset <- tbl_df(merge(gdp, countries, by="CountryCode", stringsAsFactors = FALSE))
filterbig <-filter (bigset, Ranking!='')

head(arrange(filterbig, desc(newrank)))
str(filterbig)
head(filterbig[order(as.numeric(filterbig$Ranking)), ])
sort()
filterbig <- mutate(bigset, newrank = as.numeric(Ranking))

grouped <- group_by(filterbig, IncomeGroup)
summarise(grouped, m = mean(as.numeric(Ranking)))

grouped

str(filterbig)
sapply(filterbig, class)
head(arrange(filterbig, desc(as.numeric(Ranking))), 13)
bigset$Ranking
head(bigset)
?dplyr

bucks <-select(filterbig, as.numeric(dollars))
class(bucks)
mean(as.numeric(bucks$dollars))

mean(filterbig$"dollars")

browseVignettes(package = "dplyr")

groupy <- group_by (filterbig, )

filterbig$dollars


