library(caret)
library(dplyr)
library(Hmisc)
install.packages("e1071")
?select

getwd()
setwd("C:\\GitHub\\datasciencecoursera\\Practical Machine Learning")
batting <-read.csv("data\\batting.csv")

str(batting)

subbat <-select(batting,HomeRuns, Runs, StolenBases, RunsBattedIn, Age, Games, PlateAppearances)

str(subbat)

#Set the training set
inTrain <-createDataPartition(y=subbat$HomeRuns, p=.75, list=FALSE)

training <-subbat[inTrain,]
testing <- subbat[-inTrain,]

str(training)
training$HomeRuns

#Do some exploratory work
#Feature plot plots a bunch of shit together
featurePlot(x=training,c("Age","RunsBattedIn", "PlateAppearances")
            ,y=training$HomeRuns, plot="pairs")

qplot(Age, RunsBattedIn,  data=training, color=HomeRuns, fill=HomeRuns, geom="boxplot")


#set up a cut variable to bucket ages together

cutAge <-cut2(training$Age, g=6)

qplot(cutAge, HomeRuns,  data=training, color=RunsBattedIn, fill=PlateAppearances,geom="boxplot")

t1<-table(cutAge, training$HomeRuns)
t1
t1<-table(cutAge, training$DISTRICT)

#Find correlations in the data
M<-abs(cor(training[, -6]))
#set the correlations of things with themselves to zero
diag(M)<-0

#Which are correlated with each other
which (M>.8, arr.ind=TRUE)


#RunsBattedIn/Runs/HomeRuns and Plate Appearances are highly correlated
#Can we use fewer variables to explain this?
#SVD - If x is a matrix with each variable in a column and each observation in a row then the "SVD' is a matrix decomposition"
#where the columns of U are orthogonal and the columns of V are orthognal

#Principal COmponents 
#reduce variables 
SubBats <- training[ ,c("RunsBattedIn", "HomeRuns", "PlateAppearances")]
prComp <- prcomp(SubBats)

#make it look better by applying log
prComp <- prcomp(log10(SubBats+1))
plot(prComp$x[,1], prComp$x[,2])
prComp$rotation

#Color this by the result (Age)
TypeColor <-training$Age
plot(prComp$x[,1], prComp$x[,2], col=TypeColor)
?prcomp

#PCA with caret
PreProc <- preProcess(log10(SubBats+1), method="pca", pcaComp = 2)
PC <- predict(PreProc, log10(SubBats+1))

str(PC)
modelFit<-train(training$Age ~ .,  data=training)
              





tail(training)