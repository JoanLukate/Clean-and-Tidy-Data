=====================================================
CODEBOOK for R Script for analysis of 
Human Activity Recognition Using Smartphones Dataset
Version 1.0
=====================================================
Johanna M. Lukate
PhD student
=====================================================
Content:
1. Original Data
2. Transformations/Changes to dataset
3. Variables (as in final, tidy dataset - step 2)
=====================================================

1. ORIGINAL DATA
original data files used: 

- X_test.txt
- y_test.txt
- subject_test.txt
- X_train.txt
- y_train.txt
- subject_train.txt
- features.txt, manually transformed to 'featuresadded.txt', please read IMPORTANT NOTE in README)

manual transformations of original data files:
1. features.txt - included functions, which were manually recoded to names. The result was stored in 'featuresadded.txt'. Example of transformation: 
	1 tBodyAcc-mean()-X --> tBodyAcc_meanX
	2 tBodyAcc-mean()-Y --> tBodyAcc_meanY
	3 tBodyAcc-mean()-Z --> tBodyAcc_meanZ

for a complete list of original variables and files see the documentation provided for the Human Activity Recognition Using Smartphones dataset here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

2. TRANSFORMATIONS/ CHANGES TO DATASET

	A. Preparatory step. Changed the class of the variable names as provided in featuresadded.txt from 'factor' to 'character'. The result was stored in 		'labels'.
	B. a subset of the complete dataset 'total' was created that only includes features that specify means and standard deviations using grep(). See also README.
	C. the subset was reshaped using melt() to simplify further analysis. The resulting dataframe 'tidytotal' includes 4 variables: subject, activity, feature and value.
	D. an additional column 'activity_names' was added to 'tidytotal' to provide descriptive activity names
	E. The tidy, reshaped dataframe was casted twice using dcast() to get the average of each variable for each activity and each subject. The resulting dataframes were merged to provide a tidy dataframe called 'tidydata'. Note that merge(x, y, ..., all = TRUE) was used to include NAs for subject or activity, where they were missing in the other dataset. 

3. VARIABLES
These variables are found in the final, tidy and reshaped dataframe 'tidytotal' after performing the R script including TASK 4.

 subject  
	number of subject in trial (total of 30 participants)
		integer 
		values 1 to 30
	
 activity 
	indicates activity that participants where performing 
		integer 
		values 1 to 6
			1 WALKING
			2 WALKING_UPSTAIRS
			3 WALKING_DOWNSTAIRS
			4 SITTING
			5 STANDING
			6 LAYING

 feature       
	specifies the feature, e.g. tBodyAcc_meanX	(the final dataset only includes estimates of means and standard deviations)
		factor with 76 levels
		normalized, bounded within [-1,1]

 value 
	value of feature
		numeric 
		values within [-1,1]
		
	
 activity_names 
	describes the activity that participants where performing
		character
		WALKING
		WALKING UPSTAIRS
		WALKING DOWNSTAIRS
		SITTING
		STANDING
		LAYING