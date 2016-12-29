Getting and Cleaning Data Course Project CodeBook
--------------------------------------------------
This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.

The site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The run_analysis.R script performs the following steps to clean the data:

1) Reading the Training Files ( xtrain, ytrain, subjecttrain)

2) Reading the Testing Files (xtest, ytest, subjecttest)

3) Reading othet Important Files (features, activitylabels)

4) Assigning names to the columns of training & test sets

5) Merging the training & test sets using 'cbind' & 'rbind' commands

6) Extracting only the measurements on the mean and standard deviation for each measurement

6a) Subsetting the columns using grepl command for mean & standard deviation

6b) Creating new dataframe (dfmeanandstd) based on the subset columns

7) Merging 'activitylabels' with 'dfmeanandstd' using 'activityID' to produce a new dataframe named 'wholedatasetwithactivitynames'.

8) Removing column named 'activityID' from 'wholedatasetwithactivitynames'.

9) Using function 'aggregate' to create a second, independent tidy data set ( named 'tidyreviseddata') with the average of each variable for each activity and each subject.

10) Ordering the 'tidyreviseddata' dataframe  to create a new dataframe 'tidydataset'.

11) Converting and writing the following datasets into txt file
a) Merged Data Set named 'mergeddataset.txt'
b) Tidy Data set named 'tidydataset'.

© Abhijit Jantre 2016 All Rights reserved.
