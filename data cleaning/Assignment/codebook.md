Eight 
# recipie.R
This codebook explains the variables and methods used in the recipie.R script. 
This project was completed to satisfy the peer reviewed assignment requirement for the data cleaning course on coursera.
link: https://www.coursera.org/learn/data-cleaning/

# variables
trainSubject - Contains the contents of the subject_training data file.  This holds subject data for the training set.

trainActivites - Contains the contents of the x_train data file.  This holds result data for the training set.

trainLabel - Contains the contents of the training label file  This holds label data for the training set.

testSubject - Contains the contents of the subject_test data file.  This holds subject data for the test set.

testActivity - Contains the contents of the x_test data file.  This holds result data for the test set.

testlabel - Contains the contents of the y_test data file.  This holds label data for the test set

activitylabels - This is the master list of activities.

features - This is the master list of features.

Combined_Subject - The combined set of test and train subject data.

Combined_Activities - The combined set of test and train activity data.

Combined_Label - The combined set of test and train label data

CombinedActivityLabels - A helper variable that merges the combined activities set with descriptive names.

meansandstdevs - A helper variable that extracts the columns that describe mean and standard deviations

CombinedSet - The set of activity data for means and stand deviation measures.  This variable also includes subject and activity data. 

Outputfile - The combined set of mean values grouped by activities and subjects.  This variable is used to produce the second output file.


# data transformation / processing
1. Eight data sets are imported into R that will be needed to produce the final result.
2. The data sets from 'train' and 'test' are merged to create combined sets for subjects, activities, and labels.
3. Column Names are cleaned up for the combined sets as well as the activity and feature master tables.
4. Identify the data that was collected for mean and standard deviation values.
5. Create a new data set (CombinedSet) that contains combined data for mean and standard deviation values.
6. Add activities and subjects to the combined set.
7. Create  new data set (outputfile) that contains a set of mean values for each measure grouped by activity and subject
8. Write the two tidy data sets to disk
