#WebScraping

#many websites have information that you want to progammatically read
# some website will block your IP if you try to do this

con=url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")

#read the html
htmlCode=readLines(con)
#close the connection
close(con)
#one big long string
htmlCode


#use XML
library(XML)
url<-"http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
#internal nodes get entire structure out
html <- htmlTreeParse(url, useInternalNodes = T)
xpathSApply(html, "//title", xmlValue)

xpathSApply(html, "//td[@class='gsc_a_t']",xmlValue)


#GET from the httr package 
library(httr); html2=GET(url)
content2 = content(html2, as="text")
#parsed html looks the same as if we used the XML package
parsedHtml = htmlParse(content2, asText = TRUE)
xpathSApply(parsedHtml, "//title", xmlValue)

#HTTR PACKAGE
#allows to pass un pwd
pg1 = GET("http://httpbin.org/basic-auth/user/passwd",
authenticate("user", "passwd"))
pg1
#now i'm logged in and we can see stuff
names(pg1)

#using Handles
google=handle("http://google.com")
tg1 = GET(handle=google, path="/")
tg2 = GET(handle=google, path="search")
tg1
tg2
#if you authenticate the handle once, it will remember the auth (cookies)

# more examples?  search web scraping on r bloggers



