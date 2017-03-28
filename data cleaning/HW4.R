#HW 4

#1
acs <- read.csv("getdata_data_ss06hid.csv")

strsplit(as.character(names(acs)), 'wgtp')

#2
gdp <- read.csv("data\\getdata_data_GDP.csv")

nrow(gdp)

tail(gdp[5:200, ])

#Give columns Names
colnames(gdp)<- c("CountryCode", "Ranking", "Junk", "Economy", "Millions")

#remove junk rows
gdp<-gdp[!gdp$Economy=='', ]
gdp<-gdp[!gdp$Economy=='Economy', ]

tail(gdp)
#remove NA RECORDS
#Remove commas
gdp$Millions[1-9]
mean(as.numeric(gdp$Millions))

regexpr("[1-9]", gdp$Millions)
gregexpr('[0-9]', gdp$Millions)

gdp
sub(',', '', gdp)
gdp[200, ]
grep(",", gdp$Millions)
gdp
?gsub
numbers <- as.numeric(gsub(',', '', gdp$Millions))
numbers[1:191]

?mean