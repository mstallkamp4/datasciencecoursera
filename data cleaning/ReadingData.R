getwd()
setwd("c:/github/datasciencecoursera/data cleaning")

#downloading from URL

fileUrl <-"https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"

#need to set param method="curl" if you are using a MAC
download.file("https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD", destfile="./data/cameras.csv")
list.files("./data")

#always record when the file was acquired!
dateDownloaded <-date()
dateDownloaded

#Reading Local Files
## read.csv params
# sep = seperator
# header = is first row header
# quote = "" means no quote
#na.strings = sets the character that represents a missing value
# nrows = how many rows to read of the file
# skip = number of lines to skip beofre starting to read

##tip:  set quote="" often to remove quotes


#Reading Excel files
## read.xlsX

colindex <- 1:4
rowindex <- 2:50
cameraData <- read.xlsx("./data./cameras.xlsx", sheetIndex=1, colindex=colindex, rowIndex=rowIndex)

##write.xlsx will write excel files
## read.xlsx2 is much faster but slightly unstable
## The XL connect package has more options for writing and manipulating Excel files
## Best practice is to store in a database or .cvs / .txt file

# XML
## Extensible markup language; basis for web scraping
## Components - Markup and Content

install.packages("XML")
library(XML)
fileUrl<-"http://www.w3schools/xml/simple.xml"
doc <- xmlTreeParse("./data/cd.xml", useInternal=TRUE)

rootNode <-xmlRoot(doc)

xmlName(rootNode)
##drill into the file by subsetting
rootNode[[1]][[1]]

##Programatically extract parts of the file
xmlSApply(rootNode, xmlValue)

##xpATH
# /node Top level node
# // Node at any level
# node[@attr-name] Node with an attribute name

xpathSApply(rootNode, "//ARTIST", xmlValue)

#Let's try an example from the web!
fileUrl <-"http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
# Use htmlTreeParse becuase you are parsing a webpage
doc <- htmlTreeParse(fileUrl, useInternal=TRUE)

#extract certain objects
scores <- xpathSApply(doc, "//li[@class='active']", xmlValue)

scores <- xpathSApply(doc, "//li[@class='team-name']", xmlValue)


##Reading JSON
## Javascript Object Notation
## APIS

##Data stored as numbers, strings, bools, arrays, objects
install.packages("jsonlite")
library(jsonlite)
json <- fromJSON("https://api.github.com/users/tleek/repos")

json
#Drill into the name of an attribute
names(json$owner)
#Drill two levels deep
json$owner$login

#create JSON file
toJSON(iris, pretty=TRUE)





