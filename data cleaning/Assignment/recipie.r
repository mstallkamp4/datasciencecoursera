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

# Tidy data requires columns to be named
# Assign column Names
colnames(Combined_Activities) <-features[, 2]
colnames(Combined_Subject) <- c('SubjectID')
colnames(Combined_Label) <- c('ActivityID')
colnames(activitylabels) <- c('ActivityID', 'ActivityDescription')
colnames(features) <- c('FeatureID', 'FeatureDescription')


#Which columns are for mean and STD
#Find out from the features set!
means<-grep("mean", features[,2])
stdevs <- grep("std", features[,2])

#Now merge them together to contain only one vector
meansandstdevs <-c(means, stdevs)

#Here is the big set with only those metrics that we care about
CombinedSet <- Combined_Activities[ ,meansandstdevs]

#Add labels on the activities to allow us to have descriptive activity names
CombinedActivityLabels <- merge(activitylabels, Combined_Label, "ActivityID")




#Now add the Activities and Subjects columns to the tidy data set
CombinedSet$Activities<- CombinedActivityLabels[ ,2]
CombinedSet$Subjects <- Combined_Subject[,1]



#Our combined set is nice and tidy!
CombinedSet
##str(CombinedSet)

#Need for a second file
#Summarize data using dplyr functions
Outputfile <- CombinedSet %>% group_by(Activities,Subjects) %>% summarize_all(funs(mean))

#Write the first file
write.table(CombinedSet, "FirstTidySet.txt", row.name=FALSE )

#Write the second file
write.table(Outputfile, "SecondTidySet.txt", row.name=FALSE )
