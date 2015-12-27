# *Code Book* for the Coursera "Cleaning and Getting Data" course project

### Explanation of the code
The R script "run_analysis.R" is performing the following tasks in the given order:
- Download and unzip the experimental data from the source URL.
- Read the raw data sets (trainSub, trainX, trainY, testSub, testX, testY, activityLabels and features).
- Merge the raw data sets (trainSub, trainX, trainY, testSub, testX, testY).
- Name the data sets.
- Replace the activityID in the data set (trainY + testY) by the activityName from the activeLabels data set.
- Create the complete data set.
- Identify the index position for the mean and standard deviation figures.
- Create the data set for the relevant data.
- Rename the data set names to the variable description.
- Group data over subject and activity name for mean of variables.
- The data is written to the file "tidy.txt".

### Variables description
The first two variables included in the output file are:
  - subject_id 		The participant number
  - activityName 	The name of the activity that the participant performed

The following columns are a subset from the original data. A detailed description of the variables can be found in the "features_info.txt" filewhich is included in the [data file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The following variables are included in the output file: 

  - tBodyAcc_mean_X
  - tBodyAcc_mean_Y
  - tBodyAcc_mean_Z
  - tGravityAcc_mean_X
  - tGravityAcc_mean_Y
  - tGravityAcc_mean_Z
  - tBodyAccJerk_mean_X
  - tBodyAccJerk_mean_Y
  - tBodyAccJerk_mean_Z
  - tBodyGyro_mean_X
  - tBodyGyro_mean_Y
  - tBodyGyro_mean_Z
  - tBodyGyroJerk_mean_X
  - tBodyGyroJerk_mean_Y
  - tBodyGyroJerk_mean_Z
  - tBodyAccMag_mean
  - tGravityAccMag_mean
  - tBodyAccJerkMag_mean
  - tBodyGyroMag_mean
  - tBodyGyroJerkMag_mean
  - fBodyAcc_mean_X
  - fBodyAcc_mean_Y
  - fBodyAcc_mean_Z
  - fBodyAccJerk_mean_X
  - fBodyAccJerk_mean_Y
  - fBodyAccJerk_mean_Z
  - fBodyGyro_mean_X
  - fBodyGyro_mean_Y
  - fBodyGyro_mean_Z
  - fBodyAccMag_mean
  - fBodyAccJerkMag_mean
  - fBodyGyroMag_mean
  - fBodyGyroJerkMag_mean
  - tBodyAcc_std_X
  - tBodyAcc_std_Y
  - tBodyAcc_std_Z
  - tGravityAcc_std_X
  - tGravityAcc_std_Y
  - tGravityAcc_std_Z
  - tBodyAccJerk_std_X
  - tBodyAccJerk_std_Y
  - tBodyAccJerk_std_Z
  - tBodyGyro_std_X
  - tBodyGyro_std_Y
  - tBodyGyro_std_Z
  - tBodyGyroJerk_std_X
  - tBodyGyroJerk_std_Y
  - tBodyGyroJerk_std_Z
  - tBodyAccMag_std
  - tGravityAccMag_std
  - tBodyAccJerkMag_std
  - tBodyGyroMag_std
  - tBodyGyroJerkMag_std
  - fBodyAcc_std_X
  - fBodyAcc_std_Y
  - fBodyAcc_std_Z
  - fBodyAccJerk_std_X
  - fBodyAccJerk_std_Y
  - fBodyAccJerk_std_Z
  - fBodyGyro_std_X
  - fBodyGyro_std_Y
  - fBodyGyro_std_Z
  - fBodyAccMag_std
  - fBodyAccJerkMag_std
  - fBodyGyroMag_std
  - fBodyGyroJerkMag_std