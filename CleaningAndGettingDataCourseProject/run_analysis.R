# To do:
#   You should create one R script called run_analysis.R that does the following. 
#   1.Merges the training and the test sets to create one data set.
#   2.Extracts only the measurements on the mean and standard deviation for each measurement. 
#   3.Uses descriptive activity names to name the activities in the data set
#   4.Appropriately labels the data set with descriptive variable names. 
#   5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

library(plyr)
library(reshape2)


# Download file and unzip it
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "file.zip")
unzip ("file.zip")

# Get raw data (task #1)
trainSub<-read.table ("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)
trainX<-read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
trainY<-read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
testSub<-read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
testX<-read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
testY<-read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
activityLabels<-read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE)
features<-read.table("./UCI HAR Dataset/features.txt",header=FALSE)

# summary(trainSub)
# summary(trainX)
# summary(trainY)
# summary(testSub)
# summary(testX)
# summary(testY)
# summary(activityLabels)
# summary(features)

# str(trainSub)
# str(trainX)
# str(trainY)
# str(testSub)
# str(testX)
# str(testY)
# str(activityLabels)
# str(features)

# Merge train? and test? by row (task #1)
allSub <- rbind(trainSub, testSub)
allX   <- rbind(trainX, testX)
allY   <- rbind(trainY, testY)

# Name lists allSub, allX, allY, activityLabels, features (task #1)
names(allSub) <- c("Subject")
names(allX) <- c(1:ncol(allX))
names(activityLabels) <- c("ActivityID", "ActivityName")
names(features) <- c("FeatureID", "FeatureName")

# Replace allY$ActivityID by activityLabels$ActivityName (task #3)
allY[,1] = activityLabels[allY[,1], 2]
names(allY) <- c("ActivityName")


# Create complete data set (Subject, ActivityID, Features) (task #1)
completeDataSet <- cbind(allSub, allY, allX)
# head(completeDataSet, n=1)

# Create index for "mean" and "std" features (task #2)
meanIndex <- grep ("*mean*", features$FeatureName)
stdIndex <- grep ("*std*", features$FeatureName)

# Create complete index in sorted order (task #2)
completeIndex <- c("Subject", "ActivityName", sort(c(meanIndex, stdIndex)))
# head(completeIndex, n=1)

# Create relevant data set by subset function over index (task #3)
relevantDataSet <- subset(completeDataSet, select=completeIndex)
# head(relevantDataSet, n=1)

# Rename column names with descriptions of features$FeatureName (task #4)
colnames(relevantDataSet) = features[colnames(relevantDataSet), 2]
colnames(relevantDataSet)[1] <- "Subject"
colnames(relevantDataSet)[2] <- "ActivityName"
# head(relevantDataSet, n=1)

# Group relevant data set over subject and activity name for mean variables 
groupDataSet <- relevantDataSet %>%
  group_by(Subject, ActivityName) %>%
  summarise_each(funs(mean))  
# head(groupDataSet, n=4)

# Write tidy file
write.table(groupDataSet, "tidy.txt", row.names = FALSE)
