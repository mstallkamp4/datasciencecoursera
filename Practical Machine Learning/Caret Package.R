#Cincinnati Crime Set

install.packages("caret")
library(caret)
#To get stuff
library(httr)
library(jsonlite)

Cin= GET("https://data.cincinnati-oh.gov/resource/cxea-umgx.json")

json1 = content(Cin)

json2 = toJSON(json1)

json3 = fromJSON(json2, flatten=TRUE)
head(json3)
nrow(json2)

json3 <- lapply(json3, function(x) {
    x[sapply(x, is.null)] <- NA
    unlist(x)
})

str(json3)
df <- data.frame(matrix(unlist(json3), nrow=1000, byrow=T),stringsAsFactors=FALSE)
str(df)
head(df)
head(json3)

typeof(json3)
typeof(json2)
df <- data.frame(unlist(json3))

library (dplyr)
df <- ldply (json3, data.frame)

df <- as.data.frame(json3)
str(df)



head(json1)


nrow(json1)

?GET
?jsonlite