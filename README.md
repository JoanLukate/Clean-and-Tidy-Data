CleanData
=========

repo for the Coursera course 'clean and tidy data'

======================================
R Script for analysis of 
Human Activity Recognition Using Smartphones Dataset
Version 1.0
======================================
Johanna M. Lukate
PhD student
======================================
Use of the script requires that the Human Activity Recognition Using Smartphones dataset has been loaded into the local working directory. 
The dataset is available here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
======================================
The script provides solutions for the following five tasks:

   1. Merging the training and the test sets as provided in the Human Activity Recognition Using Smartphones Dataset to create one data set.
   2. Extracting only the measurements on the mean and standard deviation for each measurement. 
   3. Relabelling the activity column using descriptive activity names. 
   4. Relabelling the data set with descriptive variable names. 
   5. Creating a second, independent tidy data set (from the dataset created in steps 2-4) with the average of each variable for each activity and each subject.
 
The script has been partitioned into the following parts:
A. Getting started. Set working directory and load required packages. Please specify the location of your working directory!
B. Data Prep. Read in the relevant files:

	- X_test.txt
	- y_test.txt
	- subject_test.txt
	- X_train.txt
	- y_train.txt
	- subject_train.txt
	- featuresadded.txt (originally 'features.txt' in dataset, please read IMPORTANT NOTE)

	IMPORTANT NOTE:
	the file 'features.txt' has been manually rewritten. Specifically, names previously specified as a function (e.g. fBodyBodyGyroJerkMag-std()) were 
	rewritten to get rid of the function. As a result the class of the names became 'character'. The result was stored in the file 'featuresadded.txt', which
	is used in this script to perform step 1.  The author of the script realizes that it would have been possible to perform this action in R via a function such as make.names(), but please note that the author only found out about this possibility after already having altered the file manually. 

C. Preparatory step that creates a character vector 'labels', which is attached to the relevant datasets via colnames().
D. Tasks 1 to 5 are solved in connected steps within the script.
	
	Task 1: Creates a complete dataset in three steps. First, two separate datasets 'test' and 'train' are created. These are merged to 'total'.
	Task 2: provides two solutions to exercise 2. Using grep() to select 78 variables that include estimates of means or standard deviations, a data frame with 10297 observations of 78 variables called 'workingset' is created. A subset of the total dataset that includes information on 'subject' and 'activity' is merged with the workingset. The second solution is a reshaped data frame called 'tidytotal', which provides 782572 observations of 5 variables. NOTE that all further steps are performed using the second, reshaped data frame 'tidytotal'.
	Task 3: adds a column with descriptive activity names to 'tidytotal'.
	Task 4: assign descriptive column names to 'tidytotal'.
	Task 5: creates a tidy data set, called 'tidydata', with the average of each variable for each activity and each subject in three steps. 
E. Saves output to text file (in the console).

==================================================================
Data credits:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
================================================================== 
