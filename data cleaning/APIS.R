#Reading from APIS
## Application Programming Interfaces

#create a developer account on twitter
dev.twitter.com/apps
#createa new twitter application
##I have not done this yet :(

#OAuth settings - Setting that you use to identify yourself on the API

#Start the authorization Process
#"twitter' is a friendly name for use to reference later

myapp = oauth_app("twitter", key='4gJXDmizupNohhQes4PP0qNDU'
                  , secret="mm6ALBB65JLR7DpGvjwOj2oBukuk8GzlxHtZCDYwL25IoQxL8r")

#sign in with the tokens
sig = sign_oauth1.0(myapp, token="409493031-CyBUnRYMtLIOFt1ux75Ybd6W7f2QQKpiPhU7Be4G",
                     token_secret="0BDNz3UIfcBeNhb2tOpypJLQTCvcaniFjVUHfw5cuIUXH")

#Now we are authenticated; let's get the home timeline
homeTL= GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)

library(jsonlite)
json1 = content(homeTL)
json2 = jsonlite::fromJSON(toJSON(json1))

json2[1, 1:4]

#how to know what url to use
#Read the documentation on the twitter API!
#There are multiple params
https://dev.twitter.com/rest/public

##httr works well with Facebook, Google, Twitter, Github, etc
