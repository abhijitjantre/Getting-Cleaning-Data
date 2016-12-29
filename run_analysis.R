---
Title : 'Peer-Graded Assignment: Getting And Cleaning Data Course Project'
Author: "Abhijit Jantre"
Date  : "29 December 2016"
---
        
## Installing necessary libraries
        
library(R.utils)
library(data.table)
library(plyr)


## Unzipping the downloaded file

unzip("C:/Data Science/R/Getting & Cleaning Data/Programming Assignment/getdata%2Fprojectfiles%2FUCI HAR Dataset.zip",exdir = "C:/Data Science/R/Getting & Cleaning Data/Programming Assignment")


## Reading the Training Files

xtrain <- fread("C:/Data Science/R/Getting & Cleaning Data/Programming Assignment/UCI HAR Dataset/train/X_train.txt",sep = " ",stringsAsFactors = FALSE, na.strings = c("NA","#DIV/0!",""))
dim(xtrain)
ytrain <- fread("C:/Data Science/R/Getting & Cleaning Data/Programming Assignment/UCI HAR Dataset/train/y_train.txt",sep = " ",stringsAsFactors = FALSE, na.strings = c("NA","#DIV/0!",""))
dim(ytrain)
subjecttrain <- fread("C:/Data Science/R/Getting & Cleaning Data/Programming Assignment/UCI HAR Dataset/train/subject_train.txt", sep = " ",stringsAsFactors = FALSE, na.strings = c("NA","#DIV/0!","") )
dim(subjecttrain)

## Reading the Testing Files

xtest <- fread("C:/Data Science/R/Getting & Cleaning Data/Programming Assignment/UCI HAR Dataset/test/X_test.txt",sep = " ",stringsAsFactors = FALSE, na.strings = c("NA","#DIV/0!","") )
dim(xtest)
ytest <- fread("C:/Data Science/R/Getting & Cleaning Data/Programming Assignment/UCI HAR Dataset/test/y_test.txt",sep = " ",stringsAsFactors = FALSE, na.strings = c("NA","#DIV/0!","") )
dim(ytest)
subjecttest <- fread("C:/Data Science/R/Getting & Cleaning Data/Programming Assignment/UCI HAR Dataset/test/subject_test.txt",sep = " ",stringsAsFactors = FALSE, na.strings = c("NA","#DIV/0!","") )
dim(subjecttest)

## Reading othet Important Files

features <- fread("C:/Data Science/R/Getting & Cleaning Data/Programming Assignment/UCI HAR Dataset/features.txt")
dim(features)
activitylabels <- fread("C:/Data Science/R/Getting & Cleaning Data/Programming Assignment/UCI HAR Dataset/activity_labels.txt")
dim(activitylabels)


## Assigning names to the columns of training & test sets

colnames(xtrain) <- features$V2
colnames(xtest) <- features$V2

colnames(ytrain) <- "activityID"
colnames(ytest) <- "activityID"

colnames(subjecttrain) <- "subjectID"
colnames(subjecttest) <- "subjectID"

colnames(activitylabels) <- c("activityID","typeofactivity")

## Question 1 - 'Merges the training and the test sets to create one data set' is the dataset'
# Merging the training & test sets using 'cbind' & 'rbind'

mergedtrainingset <- cbind(xtrain,ytrain,subjecttrain)
mergedtestingset <- cbind(xtest,ytest,subjecttest)
wholedataset <- rbind(mergedtrainingset,mergedtestingset)

## Answer to Question 1 is the dataset 'wholedataset'

## Question 2 - Extracts only the measurements on the mean and standard deviation for each measurement

columnnames <- colnames(wholedataset)
meanandstd <- (grepl("activityID",columnnames)|grepl("subjectID",columnnames)|grepl("mean..", columnnames)|grepl("std..",columnnames))
dsmeanandstd <- wholedataset[,c(meanandstd==TRUE)]
b <- subset(columnnames,meanandstd==TRUE)
dfmeanandstd <- wholedataset[,c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,294:296,345:350,373:375,424:429,452:454,503:504,513,516:517,526,529:530,539,542:543,552,562:563)]

## Answer for Question 2 is 'dsmeanandstd'

## Question 3 & 4 - 'Use descriptive activity names to name the activities in the data set and appropriately labels the data set with descriptive variable names'

wholedatasetwithactivitynames <- merge(dfmeanandstd,activitylabels,by = 'activityID',all.x = TRUE)

## Answer for Question 3 & 4 is the dataframe 'wholedatasetwithactivitynames'


## Question 5 --  Create a second, independent tidy data set with the average of each variable for each activity and each subject

reviseddata <- wholedatasetwithactivitynames[,-c(1)]
dim(reviseddata)
tidyreviseddata <- aggregate(.~subjectID+typeofactivity,new,function(x=colnames(wholedatasetwithactivitynames)) mean(x))
dim(tidyreviseddata)
tidydataset <- tidyreviseddata[order(tidyreviseddata$subjectID,tidyreviseddata$typeofactivity),]

# Converting and writing the datasets into txt file
write.table(tidydataset,"C:/Data Science/R/Getting & Cleaning Data/Programming Assignment/tidydataset.txt",row.name=FALSE)
write.table(wholedatasetwithactivitynames,"C:/Data Science/R/Getting & Cleaning Data/Programming Assignment/mergeddataset.txt",row.name=FALSE)