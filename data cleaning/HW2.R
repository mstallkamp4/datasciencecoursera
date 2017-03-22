#Cleaning data homework 2
library(httr)
install.packages("httpuv")
library(httpuv)
require(jsonlite)

oauth_endpoints("github")


myapp = oauth_app("git", key='54ec3f75ebc61655a59e'
                  , secret="3ed9c54bf6c55c283746807edddd7ded4ad704a2")

github_token <-oauth2.0_token(oauth_endpoints("github"), myapp)
#sign in with the tokens
gtoken <-config(token=github_token)
##Note:  I set the callback URL to http://localhost:1410"
##The httpuv package sets up a webserver on local and opens up the port 
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
content(req)
req

library(jsonlite)
json1 = content(req)

json1

json2 = jsonlite::fromJSON(toJSON(json1))
json2

head(json2)
json2[11, "created_at"]

#Question 2 /3
install.packages("sqldf")
library(sqldf)
#Need to install local mySQL instance to get this package to work
getwd()

acs <- read.csv("acs.csv")
sqldf("select pwgtp1 from acs where AGEP < 50", user="mstallakmp", password="Wilbury1", port=3306)
?sqldf

#Question 4

con=url("http://biostat.jhsph.edu/~jleek/contact.html")

#read the html as one long string
htmlCode=readLines(con)
#confirm that it is a text field
class(htmlCode)
#count the number of characters per line
htmlCode[10]
nchar(htmlCode[10])
nchar(htmlCode[20])
nchar(htmlCode[30])
nchar(htmlCode[100])


#Question 5

fixed <- read.table("wksst.txt")

fixed
