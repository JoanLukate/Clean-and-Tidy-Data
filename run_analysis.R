##################################Getting started ###############################################
#set working directory
setwd()

#load packages
library(reshape)
library(Hmisc)
library(plyr)

# (1) Merges the training and the test sets to create one data set.
# (2) Extracts only the measurements on the mean and standard deviation for each measurement. 
# (3) Uses descriptive activity names to name the activities in the data set
# (4) Appropriately label the data set with descriptive variable names. 
# (5) From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

##################################DATA PREP ###############################################
#read data in 
file_test_set <- read.table("test//X_test.txt", sep = "", header = T)
file_test_label <- read.table("test//y_test.txt", sep = "", header = TRUE)
subjects_test <- read.table("test//subject_test.txt", sep = "", header = TRUE)

file_train_set <- read.table("train/X_train.txt", sep = "", header = TRUE)
file_train_label <- read.table("train/y_train.txt", sep = "", header = TRUE)
subjects_train <- read.table("train/subject_train.txt", sep = "", header = TRUE)

#note that the file loaded here has been pre-prepared manually. all brackets, commata and name spaces were removed (see also README).
file_features <- read.table("featuresadded.txt", sep = " ")

#################################PREPARATORY STEPS###########################################
#preparatory step: assign variable names that allow merging
labels <- as.vector(file_features$V2)
colnames(file_test_set) <- labels
colnames(file_train_set) <- labels  

################################### TASK 1: CREATE ONE DATASET ##################################
#step1: merge files for training and assign appropriate variable names
train <- cbind(subjects_train, file_train_label, stringsAsFactors = FALSE)
colnames(train) <- c( 'subject', 'activity')

train <- cbind(train, file_train_set, stringsAsFactors = FALSE)

#step 2: merge files for test 
test <- cbind(subjects_test, file_test_label, stringsAsFactors = FALSE)
colnames(test) <- c( 'subject', 'activity')

test <- cbind(test, file_test_set, stringsAsFactors = FALSE)

#step3: create working data set 'total'
total <- rbind(train, test)
str(total)

#################################TASK 2###########################################
#extract the measurements on the mean and standard deviation for each measurement
workingset <- subset(total, select = c("subject", "activity", "tBodyAcc_meanX", "tBodyAcc_meanY", "tBodyAcc_meanZ", "tBodyAccJerk_meanX", "tBodyAccJerk_meanY", "tBodyAccJerk_meanZ", "tBodyGyro_meanX","tBodyGyro_meanY", "tBodyGyro_meanZ","tBodyGyroJerk_meanX", "tBodyGyroJerk_meanY","tBodyGyroJerk_meanZ","tBodyAccMag_mean","tGravityAccMag_mean","tBodyAccJerkMag_mean","tBodyGyroMag_mean","tBodyGyroJerkMag_mean","fBodyAcc_meanX","fBodyAcc_meanY","fBodyAcc_meanZ","fBodyAcc-meanFreqX","fBodyAcc-meanFreqY","fBodyAcc-meanFreqZ","fBodyAccJerk_meanX","fBodyAccJerk_meanY","fBodyAccJerk_meanZ", "fBodyAccJerk-meanFreqX", "fBodyAccJerk-meanFreqY","fBodyAccJerk-meanFreqZ", "fBodyGyro_meanX","fBodyGyro_meanY", "fBodyGyro_meanZ", "fBodyGyro-meanFreqX", "fBodyGyro-meanFreqY", "fBodyGyro-meanFreqZ", "fBodyAccMag_mean", "fBodyAccMag-meanFreq", "fBodyBodyAccJerkMag_mean", "fBodyBodyAccJerkMag-meanFreq", "fBodyBodyGyroMag_mean", "fBodyBodyGyroMag-meanFreq", "fBodyBodyGyroJerkMag_mean", "fBodyBodyGyroJerkMag-meanFreq", "angle_tBodyAccMean_gravity","tBodyAcc_stdX", "tBodyAcc_stdY", "tBodyAcc_stdZ", "tGravityAcc_stdX", "tGravityAcc_stdY", "tGravityAcc_stdZ", "tBodyAccJerk_stdX", "tBodyAccJerk_stdY", "tBodyAccJerk_stdZ", "tBodyGyro_stdX", "tBodyGyro_stdY", "tBodyGyro_stdZ", "tBodyGyroJerk_stdX", "tBodyGyroJerk_stdY", "tBodyGyroJerk_stdZ", "tBodyAccMag_std", "tGravityAccMag_std", "tBodyAccJerkMag_std", "tBodyGyroMag_std", "tBodyGyroJerkMag_std", "fBodyAcc_stdX", "fBodyAcc_stdZ", "fBodyAccJerk_stdX", "fBodyAccJerk_stdY", "fBodyAccJerk_stdZ", "fBodyGyro_stdX", "fBodyGyro_stdY", "fBodyGyro_stdZ", "fBodyAccMag_std", "fBodyBodyAccJerkMag_std", "fBodyBodyGyroMag_std", "fBodyBodyGyroJerkMag_std"))
str(workingset)

#reshape dataset to create 4 variables
tidytotal <- melt(total, id= c("subject", "activity"), measure.vars = c("tBodyAcc_meanX", "tBodyAcc_meanY", "tBodyAcc_meanZ", "tBodyAccJerk_meanX", "tBodyAccJerk_meanY", "tBodyAccJerk_meanZ", "tBodyGyro_meanX","tBodyGyro_meanY", "tBodyGyro_meanZ","tBodyGyroJerk_meanX", "tBodyGyroJerk_meanY","tBodyGyroJerk_meanZ","tBodyAccMag_mean","tGravityAccMag_mean","tBodyAccJerkMag_mean","tBodyGyroMag_mean","tBodyGyroJerkMag_mean","fBodyAcc_meanX","fBodyAcc_meanY","fBodyAcc_meanZ","fBodyAcc-meanFreqX","fBodyAcc-meanFreqY","fBodyAcc-meanFreqZ","fBodyAccJerk_meanX","fBodyAccJerk_meanY","fBodyAccJerk_meanZ", "fBodyAccJerk-meanFreqX", "fBodyAccJerk-meanFreqY","fBodyAccJerk-meanFreqZ", "fBodyGyro_meanX","fBodyGyro_meanY", "fBodyGyro_meanZ", "fBodyGyro-meanFreqX", "fBodyGyro-meanFreqY", "fBodyGyro-meanFreqZ", "fBodyAccMag_mean", "fBodyAccMag-meanFreq", "fBodyBodyAccJerkMag_mean", "fBodyBodyAccJerkMag-meanFreq", "fBodyBodyGyroMag_mean", "fBodyBodyGyroMag-meanFreq", "fBodyBodyGyroJerkMag_mean", "fBodyBodyGyroJerkMag-meanFreq", "angle_tBodyAccMean_gravity","tBodyAcc_stdX", "tBodyAcc_stdY", "tBodyAcc_stdZ", "tGravityAcc_stdX", "tGravityAcc_stdY", "tGravityAcc_stdZ", "tBodyAccJerk_stdX", "tBodyAccJerk_stdY", "tBodyAccJerk_stdZ", "tBodyGyro_stdX", "tBodyGyro_stdY", "tBodyGyro_stdZ", "tBodyGyroJerk_stdX", "tBodyGyroJerk_stdY", "tBodyGyroJerk_stdZ", "tBodyAccMag_std", "tGravityAccMag_std", "tBodyAccJerkMag_std", "tBodyGyroMag_std", "tBodyGyroJerkMag_std", "fBodyAcc_stdX", "fBodyAcc_stdZ", "fBodyAccJerk_stdX", "fBodyAccJerk_stdY", "fBodyAccJerk_stdZ", "fBodyGyro_stdX", "fBodyGyro_stdY", "fBodyGyro_stdZ", "fBodyAccMag_std", "fBodyBodyAccJerkMag_std", "fBodyBodyGyroMag_std", "fBodyBodyGyroJerkMag_std"))
str(tidytotal)

######################################TASK 3############################################
#add column with descriptive activity names
tidytotal$activity_names <- ifelse(tidytotal$activity == 1, 'WALKING',
                            ifelse(tidytotal$activity == 2, 'WALKING UPSTAIRS',
                            ifelse(tidytotal$activity == 3, 'WALKING DOWNSTAIRS',
                            ifelse(tidytotal$activity == 4, 'SITTING',
                            ifelse(tidytotal$activity == 5,'STANDING',
                            ifelse(tidytotal$activity == 6, 'LAYING', NA))))))

################################### TASK 4 ###########################################
#assign descriptive names 
colnames(tidytotal) <- c( 'subject', 'activity', 'feature', 'value', 'activity_names')

################################## TASK 5 ###########################################
#create tidy data set with the average of each variable for each activity and each subject
library(reshape2)
tidydata_subject <- dcast(tidytotal, subject ~ feature, mean)
tidydata_activity <- dcast(tidytotal, activity_names ~ feature, mean)

tidydata <- merge(tidydata_subject, tidydata_activity, all=TRUE)
str(tidydata)

######################## save output into text file #################################
write.table(tidydata, file = "", row.names = FALSE)
