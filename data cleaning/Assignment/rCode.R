#################################
# Coursera Data Cleaning
# Peer Graded Assignment
# Mike Stallkamp
# 3/28/2016
#################################
library(dplyr)
library(data.table)

#Pull in all of the needed files 
## Train Files
trainSubject<-read.table("data\\train\\subject_train.txt")
trainActivities <-read.table("data\\train\\X_train.txt")
trainlabel <-read.table("data\\train\\Y_train.txt")

##Test Files
testSubject<-read.table("data\\test\\subject_test.txt")
testActivities <-read.table("data\\test\\X_test.txt")
testlabel <-read.table("data\\test\\Y_test.txt")

##Activity
activitylabels <- read.table("data\\activity_labels.txt")

##Features
features <- read.table("data\\features.txt")

#Combine the data sets - use rBind to combine by rows
#Subjects
Combined_Subject <-rbind(trainSubject, testSubject)
Combined_Activities<-rbind(trainActivities, testActivities)
Combined_Label <-rbind(trainlabel, testlabel)

#Assign column Names
colnames(Combined_Activities) <-features[ ,2]
colnames(Combined_Subject) <- c('Subject')
colnames(Combined_Label) <- c('Label')

#Which columns are for mean and STD
str(Combined_Activities)
str(trainY)
str(trainX)
str(activitylabels)
str(features)
testlabel
