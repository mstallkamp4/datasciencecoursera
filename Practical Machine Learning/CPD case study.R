library(caret)
library(dplyr)
library(Hmisc)
install.packages("e1071")
?select

getwd()
setwd("C:\\GitHub\\datasciencecoursera\\Practical Machine Learning")
shootings <-read.csv("data\\CPD_Shootings.csv")

str(shootings)

head(shootings)

shootings$DAYOCCURRED

subshoot <-select(shootings, TYPE, DAYOCCURRED, HROCCURED, AGE, SEX, RACE, DISTRICT)
subshoot
inTrain <-createDataPartition(y=subshoot$TYPE, p=.75, list=FALSE)

training <-subshoot[inTrain,]
testing <- subshoot[-inTrain,]

featurePlot(x=training,c("AGE", "RACE", "DAYOCCURRED")
            ,y=training$TYPE, plot="pairs")

qplot(RACE, AGE,  data=training, color=TYPE, fill=AGE, geom="boxplot")

str(training)
qplot(DISTRICT, AGE, data=training, color=RACE, fill=TYPE,geom="boxplot")

#Making Factors
cutAge <-cut2(training$AGE, g=3)

qplot(cutAge, DISTRICT,  data=training, color=RACE, fill=TYPE,geom="boxplot")

t1<-table(cutAge, training$TYPE)
t1
t1<-table(cutAge, training$DISTRICT)
prop.table(t1,1)


#Preprocessing
#More useful when using model based approaches

#Clean data of crappy values
training[training$AGE <10, 0]

CleanTrain<-filter(training, !AGE <12 | DISTRICT %in% c(1,2,3,4,5,6) | !AGE > 80)
nrow(training)

str(CleanTrain)

CleanTrain$AGE

mean(training$AGE)
sd(training$AGE)
#Standardize Values 
TrainCapAge <-training$AGE
TrainCapAgeS <- (TrainCapAge - mean(TrainCapAge))/sd(TrainCapAge)
TrainCapAgeS

#preProces functions
#smooths the data programatically
preObj <-preProcess(training, method=c("center", "scale"))

modelFit <- train(TYPE~., data=training, preProcess=c("center", "scale"))

#Find correlations in the data


str(CleanTrain)
CleanTrain$HR <- as.numeric(as.character(CleanTrain$))
M<-abs(cor(CleanTrain[, -1]))

str(modelFit)

predict(preObj, )

modelFit <- train()

sd(TrainCapAgeS)

str(training)

?train

table(subshoot, a)

unique(subshoot$TYPE)

set.seed(1235)
modelFit <- train(training, training$TYPE,
                  method="lvq"
                  , preProcess="scale")
modelFit <- train(TYPE~., data=CleanTrain)
warnings()

summary(testing)
str(train)
str(modelFit)

str(training)

str()