# DATA DICTIONARY - TIDY-AV-ACTIVITY-DATA.TXT


This codebook contains description of data, variables and transformation work accomplished for a dataset contained in _tidy-av-activity-data.txt_.

## Raw Data

Raw data used to obtain the final dataset is contained in **“Human Activity Recognition Using Smartphones Dataset”** collected by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto of Smartlab - Non Linear Complex Systems Laboratory (www.smartlab.ws).

Data was obtained through experiments, which had been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data (X_test.txt) and 30% the test data (X_train.txt). Each observation is represented by a 561-feature vector with time and frequency domain variables.

Raw data source:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Raw data description:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Raw data set includes the following data:

1. Time domain accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ (prefix 't' to denote time), captured at a constant rate of 50 Hz
2. Acceleration signal separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ)
3. Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ) obtained from the body linear acceleration and angular velocity derived in time
4. Magnitude of these three-dimensional signals calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag)
5. fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag ('f' to indicate frequency domain signals) obtained through a Fast Fourier Transform (FFT)

Signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

   tBodyAcc-XYZ
   tGravityAcc-XYZ
   tBodyAccJerk-XYZ
   tBodyGyro-XYZ
   tBodyGyroJerk-XYZ
   tBodyAccMag
   tGravityAccMag
   tBodyAccJerkMag
   tBodyGyroMag
   tBodyGyroJerkMag
   fBodyAcc-XYZ
   fBodyAccJerk-XYZ
   fBodyGyro-XYZ
   fBodyAccMag
   fBodyAccJerkMag
   fBodyGyroMag
   fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

   mean(): Mean value
   std(): Standard deviation
   mad(): Median absolute deviation 
   max(): Largest value in array
   min(): Smallest value in array
   sma(): Signal magnitude area
   energy(): Energy measure. Sum of the squares divided by the number of values. 
   iqr(): Interquartile range 
   entropy(): Signal entropy
   arCoeff(): Autorregresion coefficients with Burg order equal to 4
   correlation(): correlation coefficient between two signals
   maxInds(): index of the frequency component with largest magnitude
   meanFreq(): Weighted average of the frequency components to obtain a mean frequency
   skewness(): skewness of the frequency domain signal 
   kurtosis(): kurtosis of the frequency domain signal 
   bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
   angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

   gravityMean
   tBodyAccMean
   tBodyAccJerkMean
   tBodyGyroMean
   tBodyGyroJerkMean

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
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

Data location: _activity_labels.txt_
The variable name "activity_id" was changed to "activity"

The resulting merged file
1. was subsetted to include only variables that represented mean and standard deviation of each measurment, _and_
2. was transformed into the final dataset contained in _"tidy-av-activity-data.txt"_ by melting and recasting data to include average value of each variable for every combination of subject and activity

## Variables

Final dataset includes variables:
1. subject_id – integer between 1 and 30. Test subject ID corresponding to each row
2. activity – activity that test subject performed (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

Remaining 64 variables match mean() and std() variables of original raw data but they represent average value of each variable by subject by activity.