
#Accessing MySQL Database
install.packages("RMySQL")
library(RMySQL)
ucscDb <- dbConnect(MySQL(), user="genome", host="genome-mysql.cse.ucsc.edu")
result <-dbGetQuery(ucscDb,"show databases;"); dbDisconnect(ucscDb);

result


hg19 <- dbConnect(MySQL(), user="genome", db="hg19", host="genome-mysql.cse.ucsc.edu")
allTables <-dbListTables(hg19)
length((allTables))

#Get Fields for a table
dbListFields(hg19,"affyU133Plus2")

dbGetQuery(hg19, "SELECT COUNT(*) FROM affyU133Plus2")

affyData <- dbReadTable(hg19, "affyU133Plus2" )
str(affyData)

affyFilteredData <- dbSendQuery(hg19, "SELECT * FROM affyU133Plus2 WHERE MisMatches between 1 and 3")
affyMis <- fetch(affyFilteredData);  

str(affyMis)
quantile (affyMis$misMatches)

#select top 10 
affyMissSmall <- fetch(affyFilteredData, n=10); dbClearResult(affyFilteredData)

affyMissSmall

#close the connection
dbDisconnect(hg19)

#Do not delete or join things  Only select!

