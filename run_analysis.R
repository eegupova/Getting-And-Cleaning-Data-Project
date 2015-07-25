## Original data set:
## Human Activity Recognition Using Smartphones Dataset, Version 1.0
## Source:
## Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
## Smartlab - Non Linear Complex Systems Laboratory
## DITEN - Università degli Studi di Genova.
## Via Opera Pia 11A, I-16145, Genoa, Italy.
## activityrecognition@smartlab.ws
## www.smartlab.ws

## Check if appropriate packages are installed for downloading
if (!("downloader" %in% rownames(installed.packages())) ) {
    print("Please install 'downloader' package before proceeding")
}else{
    library(downloader)
}

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download(url, dest="ProjectData.zip")
unzip("ProjectData.zip")

## Set a new WD for convenience
setwd("./UCI HAR Dataset")

## Check if appropriate packages are installed for data reshaping
if (!("reshape2" %in% rownames(installed.packages())) ) {
    print("Please install 'reshape2' package before proceeding")
}else{
    library(reshape2)
}

## 1. Merge the training and the test sets to create one data set

## Get variable names for test and train data tables
features <- read.table("features.txt")
feat.names <- features$V2

## Read data and assign variable names
## This part of the script also addressed section 4 of the assignment
## instructions: Appropriately label the data set with descriptive
## variable names
test.data <- read.table("./test/X_test.txt")
colnames(test.data) <- feat.names
train.data <- read.table("./train/X_train.txt")
colnames(train.data) <- feat.names

## Read subject IDs and activity IDs for test set
test.subj.ID <- read.table("./test/subject_test.txt",
                           col.names = "subject_id")
test.act.ID <- read.table("./test/y_test.txt", col.names = "activity_id")

## Read subject IDs and activity IDs for train set
train.subj.ID <- read.table("./train/subject_train.txt",
                            col.names = "subject_id")
train.act.ID <- read.table("./train/y_train.txt", col.names = "activity_id")

## Add subject and activity IDs to test and train data tables
test.data <- cbind(test.subj.ID, test.act.ID, test.data)
train.data <- cbind(train.subj.ID, train.act.ID, train.data)

## Merge the training and the test sets to create one data set
full.set <- rbind(train.data, test.data)

## 2. Extract only the measurements on the mean and standard deviation
## for each measurement

## Get indecex for the columns that contain "mean" or "std" in their names
used.col.index <- grep("-mean\\(\\)|-std\\(\\)", colnames(full.set),
                       ignore.case = TRUE)

## Subsetting the full set of activity data to only include columns containing
## "mean" or "std" in their names, as well as column "subject_id" and
## "activity_id", which have indeces 1 and 2 respectively
mean.std.data <- full.set[, c(1, 2, used.col.index)]

## 3. Use descriptive activity names to name the activities in the data set

## Get acivity labels
act.labels <- read.table("activity_labels.txt",
                         col.names = c("activity_id", "activity_name"))

## Subsitute activity IDs with activity names
mean.std.data$activity_id = act.labels[mean.std.data$activity_id,2]

## Rename to column to better reflect the content
names(mean.std.data)[names(mean.std.data)=="activity_id"] <- "activity"

## 5. From the data set in step 4, creates a second, independent tidy data set
## with the average of each variable for each activity and each subject.

## Use reshape2 package to melt and cast the data set
meltdata <- melt(mean.std.data, id=c("subject_id", "activity"))
tidy.av.set <- dcast(meltdata, subject_id + activity ~ variable, mean)

## Create a txt file with the final data set
write.table(tidy.av.set, file = "tidy-av-activity-data.txt", row.names = FALSE)