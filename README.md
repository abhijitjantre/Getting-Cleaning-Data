# Getting-Cleaning-Data
------------------------

This file describes how 'run_analysis.R' script works.

First, unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip .

Make sure the unzipped folder and the- run_analysis.R -script are both in the current working directory.

Second, use source("run_analysis.R") command in RStudio.
Third, you will find two output files are generated in the current working directory:
mergeddataset.txt (9.4 Mb): it contains a data frame called cleanedData with 10299*82 dimension.
tidydataset.txt (262 Kb): it contains a data frame called result with 180*81 dimension.

Finally, use data <- read.table("tidydataset.txt") command in RStudio to read the file. Since we are required to get the average of each variable for each activity and each subject, and there are 6 activities in total and 30 subjects in total, we have 180 rows with all combinations for each of the 79 features.

© Abhijit Jantre 2016 All Rights reserved.
