#Subsetting and Sorting

#create a data frame with some data
set.seed(13435)
X <-data.frame("var1"=sample(1:5), "var2"=sample(6:10), "var3"=sample(11:15))

#Set some values to NA
X <-X[sample(1:5), ]; X$var2[c(1,3)]=NA

X

#get columns
X[,1]
X[, "var1"]

#rows and columns
X[1:2, "var2"]

#Logicals ands / Ors
X[(X$var1 <=3 & X$var3>11), ]
X[X$var1 <=3 | X$var3 >15, ]

#Handle Missing Values 
X[which(X$var2 > 8), ]

#Sorting
sort(X$var1)
sort(X$var1, decreasing = TRUE)
sort(X$var2)
#Preserve NAs
sort(X$var2, na.last =  TRUE)

#Order the full result
X[order(X$var1), ]
#Order on multiple values
X[order(X$var1, X$var3),  ]

#plyr
library(plyr)
arrange(X, var1)
arrange(X, desc(var1))

#Add Rows and Columns
X$var4 <- rnorm(5)
X
Y <-cbind(X, "var5"=rnorm(5))
Y



#Summarizing data
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accesstype=DOWNLOAD"
download.file(fileUrl, "rest.csv")
restData <- read.csv("rest.csv")

head(restData, n=3)
tail(restData, n=3)
summary(restData)
class(restData)
str(restData)
quantile(restData$councilDistrict, na.rm=TRUE)
quantile(restData$councilDistrict, na.rm=TRUE, probs=c(.5, .75, .9))

#Make Table 
#UseNA - If any missing values, they will be included
#By default, table function removes NAs
table(restData$zipCode, useNA="ifany")
table(restData$zipCode, restData$councilDistrict, useNA="ifany")

#Check for missing values
sum(is.na(restData$councilDistrict))
#No NAs
#Are there any NAs
any(is.na(restData$councilDistrict))

#Does every value satisfy  your condition
all(restData$zipCode > 0 )

colSums(is.na(restData))
all(colSums(is.na(restData))==0)

#values with specific characteristics
table(restData$zipCode %in% c("21212", "21213"))

#view those rows with scpecific characteristics
restData[restData$zipCode %in% c("21212", "21213"), ]

#CrossTabs
#use new data set
data("UCBAdmissions")
DF = as.data.frame(UCBAdmissions)
summary(DF)

xt <- xtabs(Freq ~ Gender + Admit, data=DF)
xt

#Flat Files
warpbreaks<-data("warpbreaks")
warpbreaks$replicate <- rep(1:9, len=54)
xt=xtabs(breaks ~., data=warpbreaks)

#size of data set
fakeData = rnorm(1e5)
object.size(fakeData)

#Create new variables
#Missing indicators
#"cutting up" quantitative metrics
#transformations

restData

#indexes for your data set
s1<-seq(1,10, by=2); s1
s2<-seq(1,10, length=3); s1
x <- c(1,3,8, 25); seq(along=x)

#Subsetting
restData$nearme = restData$neighborhood %in% c("Roland Park", "Homeland")
table(restData$nearme)

#Binary variables
restData$zipWrong = ifelse(restData$zipCode <0, TRUE, FALSE)
table(restData$zipWrong)
restData$zipcode
#Categorirical Variables
restData$zipGroups = cut(restData$zipCode,breaks=quantile(restData$zipCode))
table(restData$zipGroups)

table(restData$zipGroups, restData$zipCode)

#easier cutting 
install.packages("Hmisc")
install.packages("survival")
library(Hmisc)

restData$zipGroups = cut2(restData$zipCode, g=4)

#Creating Factor Vaiables 
restData$zcf <- factor(restData$zipCode)
restData$zcf[1:10]

#Levels of factor variables
yesno <- sample(c("yes", "no"), size=10, replace=TRUE)
yesnofac = factor(yesno, levels=c("yes", "no"))
relevel(yesnofac, ref="yes")

#Cutting produces factor variables
#Use mutate function

library(plyr)
restData2 = mutate(restData, zipGroups=cut2(zipCode, g=4))
restData2

#abs(x)
#sqrt
#ceiling
#floor
#round
#signif(x, digits=x)
#cos, sign
#log, log2, log10


#Sdata reshapiing

library(reshape2)
head(mtcars)

#Melting data frames

mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars, id=c("carname", "gear", "cyl"), measure.vars=c("mpg","hp"))
head(carMelt)

#Summarize data set by casting into a data frame
#acast casts into an array
cyclData <-dcast(carMelt, cyl ~ variable)
cyclData

#Summarize by mean
cyclData <-dcast(carMelt, cyl ~ variable,mean)
cyclData

#Average Values
head(InsectSprays)
#Apply to count, along the index spray, the function sum
tapply(InsectSprays$count, InsectSprays$spray, sum)

#Another way - Split
#Get a list of each spray
spIns = split(InsectSprays$count, InsectSprays$spray)
#APPLY FN TO LIST
lis <- lapply(spIns,sum)
#go back to a vector
unlist(lis)

sapply(spIns, sum)

#another way - plyr package

ddply(InsectSprays,.(spray), summarize, sum=sum(count))

#Create new variable

#Sum for A for every element in data set
spraySums <-ddply(InsectSprays, .(spray), summarize, sum=ave(count, FUN=sum))
head(spraySums)

#dplyr
#data frame is a key data structure in stats and R
## Assumptions: One observation per row
## Each column represents a variable or measure or characteristic
## Primary implmentation is the base r package
## optimized and distilled version of plyr package
## simplifies syntax and works fast!
## VERBS:  select, filter, arrange, rename, mutate, summarise, print

#First arg is always a data frame
#subsequent args describe what to do with it (no need for $ operator)
#result is always a new data frame
# data frams must be properly formatted and annotated for this to be useful

library(dplyr)
chicago <- readRDS("chicago.rds")

fileURL <- "https://github.com/DataScienceSpecialization/courses/blob/master/03_GettingData/dplyr/chicago.rds?raw=true"

# 4. download data
download.file(fileURL, destfile = "chicago.rds", extra='-L')
?readRDS
# 5. read data
chicago <- readRDS("chicago.rds")

#subsetting and filtering
filtered <-filter(chicago, pm25tmean2 > 30 & tmpd > 80)

#rename a variable
chicago <- rename(chicago, pm25 = pm25tmean2, depoint=dptp)
head(chicago)

#Create a new variable pm25 detrend
chicago <- mutate (chicago, pm25detrend = pm25-mean(pm25, na.rm=TRUE))

#Group by function
hotcold <- group_by(chicago, tempcat)
summarize(hotcold, pm25=mean(pm25, na.rm=TRUE), o3=max(o3tmean2), no2=median(no2tmean2))

chicago <-mutate(chicago, year=as.POSIXlt(date),)


##Merging data

fileURL1 = "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileURL2 = "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"

download.file(fileURL1, destfile="reviews.csv")
download.file(fileURL2, destfile="solutions.csv")

reviews=read.csv("reviews.csv")
solutions <- read.csv("solutions.csv")

str(reviews)
str(solutions)

#reviews.solutionid=solutions.id

names(reviews)
names(solutions)

#merge() - x,y by by x by y all
# In this data set it would try to merge by common names 
# Telling it all=TRUE preserves rows outside of intersection
merge(reviews, solutions, by.x="solution_id", by.y="id", all=TRUE)

#default - merge all column common names
##Can find those by using intersect of the column names
intersect(names(solutions), names(reviews))

#ply package
# Can only merge based on common names between data sets
# defaults to left join

df1=data.frame(id=sample(1:10), x=rnorm(10))
df2=data.frame(id=sample(1:10), y=rnorm(10))
arrange(join(df1, df2))

#join all! multiple data sets
df1=data.frame(id=sample(1:10), x=rnorm(10))
df2=data.frame(id=sample(1:10), y=rnorm(10))
df3=data.frame(id=sample(1:10), z=rnorm(10))
dflist=list(df1, df2, df3)
join_all(dflist)


