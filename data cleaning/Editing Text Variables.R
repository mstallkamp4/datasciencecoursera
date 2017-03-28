

cameraData <-read.csv("./data/cameras.csv")

cameraData
names(cameraData)

#colname crossStreet
#make them lowername
tolower(names(cameraData))


#Location.1 is seperated with a dot"

splitNames = strsplit(names(cameraData), "\\.")
splitNames[[6]]

mylist <- list(letters = c("a,", "b", "c"), number=1:3, matrix(1:25, ncol=5))
head(mylist)

#access stuff
mylist[1]
mylist$letters

sapply()
splitNames[[6]][1]
firstElement <-function(x){x[1]}
sapply(splitNames, firstElement)

#Pee

#sub
#Replaces the first found character in a string
sub (charactertoreplace, replacmentchar, datasetname)
#GSUB
#REPLACES ALL FOUND CHARACTERS IN A STRIN

#grep("Alameda", cameraData$intersection)
#grep("Alameda", cameraData$intersection, value=TRUE)
##value = TRUE returns the actual data

##returns the data elements where the search string exist
#grepl("Alameda", cameraData$intersection)
##returns number of trues fales as a summary

#Dates
d1=date()
#character
class(d1)

d2=Sys.Date()
#Date class
class(d2)

#formatting dates
format(d2, "%a %b %d")
# %d = daynumber %a abbr weekday %A=weekday %m = Month
# %b = abbr months, %B =month name, $y= YY, $Y, YYYY

x=c("15Sep1981", "10Sep2001")
z=as.Date(x, '%d%b%Y')
z
#DateDiff
z[2]- z[1]
as.numeric(z[2]- z[1])

#Convert to Julian
Weekdays(d2)
months(d2)
julian(d2)

#lubridate
install.packages("lubridate")
library(lubridate)
ymd("20170326")
mdy("8/4/2021")

ymd_hms("2001-09-11-08:17", tz="Eastern")
