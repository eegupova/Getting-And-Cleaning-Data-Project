# DATA DICTIONARY - TIDY-AV-ACTIVITY-DATA.TXT


This codebook contains description of data, variables and transformation work accomplished for a dataset contained in _tidy-av-activity-data.txt_.

## Raw Data

Raw data used to obtain the final dataset is contained in **“Human Activity Recognition Using Smartphones Dataset”** collected by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto of Smartlab - Non Linear Complex Systems Laboratory (www.smartlab.ws).

Data was obtained through experiments, which had been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data (X_test.txt) and 30% the test data (X_train.txt). Each observation is represented by a 561-feature vector with time and frequency domain variables.

Raw data source:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Raw data description:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Transformation

In order to obtain a full dataset containing both training and testing data, the identical sets of steps were performed for each group of files in ‘train’ and ‘test’ categories.

**_First_**, names of variables were obtained in order to identify columns in data tables in files:
* test/X_test.txt
* train/X_train.txt
Variable names match names of the features in observation vectors and listed in file: features.txt

**_Second_**, subject identification numbers were extracted. Each row in test and train tables corresponds to the subject who performed the activity. He/she is identified by a number between 1 and 30. Files containing subject IDs are:
* test/subject_test.txt
* train/subject_train.txt

**_Third_**, similar to subject IDs, activity IDs were extracted from files:
* test/y_test.txt
* train/y_train.txt
Activity ID are integers within 1-6 range.

**_Fourth_**, subject IDs (var name – subject_id) and activity IDs (var name – activity_id) were appended to each set (train and test) separately.

**_Finally_**, two sets were merged together, train set being first.

For additional clarity activity number IDs were substituted by activity names as follows:
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

Data location: _activity_labels.txt_
The variable name "activity_id" was changed to "activity"

The resulting merged file was transformed into the final dataset contained in _"tidy-av-activity-data.txt"_ by melting and recasting data to include average value of each variable for every combination of subject and activity

## Variables

Final dataset includes the following variables:

Final dataset includes the following variables:
[1] subject_id – integer between 1 and 30. Test subject ID corresponding to each row
[2] activity – activity that test subject performed (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
[3] tBodyAcc-mean()-X" – remaining variables are copied directly from raw data source
[4] tBodyAcc-mean()-Y
[5] tBodyAcc-mean()-Z
[6] tBodyAcc-std()-X
[7] tBodyAcc-std()-Y
[8] tBodyAcc-std()-Z
[9] tGravityAcc-mean()-X
[10] tGravityAcc-mean()-Y
[11] tGravityAcc-mean()-Z
[12] tGravityAcc-std()-X
[13] tGravityAcc-std()-Y
[14] tGravityAcc-std()-Z
[15] tBodyAccJerk-mean()-X
[16] tBodyAccJerk-mean()-Y
[17] tBodyAccJerk-mean()-Z
[18] tBodyAccJerk-std()-X
[19] tBodyAccJerk-std()-Y
[20] tBodyAccJerk-std()-Z
[21] tBodyGyro-mean()-X
[22] tBodyGyro-mean()-Y
[23] tBodyGyro-mean()-Z
[24] tBodyGyro-std()-X
[25] tBodyGyro-std()-Y
[26] tBodyGyro-std()-Z
[27] tBodyGyroJerk-mean()-X
[28] tBodyGyroJerk-mean()-Y
[29] tBodyGyroJerk-mean()-Z
[30] tBodyGyroJerk-std()-X
[31] tBodyGyroJerk-std()-Y
[32] tBodyGyroJerk-std()-Z
[33] tBodyAccMag-mean()
[34] tBodyAccMag-std()
[35] tGravityAccMag-mean()
[36] tGravityAccMag-std()
[37] tBodyAccJerkMag-mean()
[38] tBodyAccJerkMag-std()
[39] tBodyGyroMag-mean()
[40] tBodyGyroMag-std()
[41] tBodyGyroJerkMag-mean()
[42] tBodyGyroJerkMag-std()
[43] fBodyAcc-mean()-X
[44] fBodyAcc-mean()-Y
[45] fBodyAcc-mean()-Z
[46] fBodyAcc-std()-X
[47] fBodyAcc-std()-Y
[48] fBodyAcc-std()-Z
[49] fBodyAccJerk-mean()-X
[50] fBodyAccJerk-mean()-Y
[51] fBodyAccJerk-mean()-Z
[52] fBodyAccJerk-std()-X
[53] fBodyAccJerk-std()-Y
[54] fBodyAccJerk-std()-Z
[55] fBodyGyro-mean()-X
[56] fBodyGyro-mean()-Y
[57] fBodyGyro-mean()-Z
[58] fBodyGyro-std()-X
[59] fBodyGyro-std()-Y
[60] fBodyGyro-std()-Z
[61] fBodyAccMag-mean()
[62] fBodyAccMag-std()
[63] fBodyBodyAccJerkMag-mean()
[64] fBodyBodyAccJerkMag-std()
[65] fBodyBodyGyroMag-mean()
[66] fBodyBodyGyroMag-std()
[67] fBodyBodyGyroJerkMag-mean()
[68] fBodyBodyGyroJerkMag-std
