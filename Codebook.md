---
title: "Activity Summary Codebook"
author: "gvelatini"
date: "August 14, 2016"
output: html_document
---

==================================================================

##Human Activity Recognition Using Smartphones

###Tidy data set containing means and standard deviations


==================================================================

greggv
8/14/2106

==================================================================



Description of the study: 

An original study performed by Jorge L. Reyes-Ortiz et.al measured the use of  smartphones for human Activity Recognition with potential applications in assisted living technologies. For more information, including the original data sets, please refer to 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


The original data were collected on 30 individuals. 21 of these individuals were selected for the "training" group, and the rest were selected for the "test" group. 


The original data sets include the following files:

=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

=========================================

The original training data (X_train.txt) set contained 7352 observations of 561 variables measured on 21 individuals.

The original test data (X_train.txt) set contained 2947 observations of the same 561 variables on 9 individuals.

Following is a very brief description of the original data collection and post processing.

'The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. The acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.'





###Variables contained in "ActivitySummary.txt"

The data was processed via "run_analysis.r" This file produces a tidy data set "ActivitySummary.txt". Explanations of the processing can be found in the "ReadMe.txt" file as well as the comments contained in "run_analysis.r" 

#### Explanation of variables

Please note that the suffix 

[1] "individual"          numeric identifier of the individual being observed.
  
[2]"activity_num"        numeric identifier of activity type. Integer values between 1 and 6.
  
[3] "activity"           Descriptive name for activity.  Possible Values are "WALKING", "WALKING                         UPSTAIRs", "WALKING DOWNSTAIRS", "SITTING", "STANDING", "LAYING".

The remaining 66 variable names are the same as the original variable names in the raw data sets. They appear to be a reasonable compromise between being brief but descriptive.  In addition,  they may be somewhat "standard" names for these types of signals.


 [4] "tBodyAcc-mean()-X"
 [5] "tBodyAcc-mean()-Y"  
 [6] "tBodyAcc-mean()-Z"          
 [7] "tBodyAcc-std()-X" 
 [8] "tBodyAcc-std()-Y"  
 [9] "tBodyAcc-std()-Z"   
[10] "tGravityAcc-mean()-X" 
[11] "tGravityAcc-mean()-Y" 
[12] "tGravityAcc-mean()-Z"  
[13] "tGravityAcc-std()-X" 
[14] "tGravityAcc-std()-Y" 
[15]"tGravityAcc-std()-Z"        
[16] "tBodyAccJerk-mean()-X" 
[17] "tBodyAccJerk-mean()-Y" 
[18] "tBodyAccJerk-mean()-Z"   
[19] "tBodyAccJerk-std()-X"  
[20] "tBodyAccJerk-std()-Y"  
[21] "tBodyAccJerk-std()-Z"  
[22] "tBodyGyro-mean()-X"    
[23] "tBodyGyro-mean()-Y" 
[24] "tBodyGyro-mean()-Z"         
[25] "tBodyGyro-std()-X"
[26] "tBodyGyro-std()-Y"   
[27] "tBodyGyro-std()-Z"          
[28] "tBodyGyroJerk-mean()-X"  
[29] "tBodyGyroJerk-mean()-Y" 
[30] "tBodyGyroJerk-mean()-Z"
[31] "tBodyGyroJerk-std()-X" 
[32] "tBodyGyroJerk-std()-Y"  
[33] "tBodyGyroJerk-std()-Z"      
[34] "tBodyAccMag-mean()"
[35] "tBodyAccMag-std()"    
[36] "tGravityAccMag-mean()"  
[37] "tGravityAccMag-std()" 
[38] "tBodyAccJerkMag-mean()"   
[39] "tBodyAccJerkMag-std()"  
[40] "tBodyGyroMag-mean()"  
[41] "tBodyGyroMag-std()"    
[42] "tBodyGyroJerkMag-mean()"    
[43] "tBodyGyroJerkMag-std()"  
[44] "fBodyAcc-mean()-X"   
[45] "fBodyAcc-mean()-Y"          
[46] "fBodyAcc-mean()-Z"  
[47] "fBodyAcc-std()-X" 
[48] "fBodyAcc-std()-Y"           
[49] "fBodyAcc-std()-Z" 
[50] "fBodyAccJerk-mean()-X"  
[51] "fBodyAccJerk-mean()-Y"      
[52] "fBodyAccJerk-mean()-Z" 
[53]"fBodyAccJerk-std()-X"  
[54] "fBodyAccJerk-std()-Y"       
[55] "fBodyAccJerk-std()-Z"  
[56] "fBodyGyro-mean()-X"     
[57] "fBodyGyro-mean()-Y"         
[58] "fBodyGyro-mean()-Z"   
[59] "fBodyGyro-std()-X"   
[60] "fBodyGyro-std()-Y"          
[61] "fBodyGyro-std()-Z" 
[62] "fBodyAccMag-mean()"   
[63] "fBodyAccMag-std()"          
[64] "fBodyBodyAccJerkMag-mean()" 
[65] "fBodyBodyAccJerkMag-std()" 
[66] "fBodyBodyGyroMag-mean()"    
[67] "fBodyBodyGyroMag-std()"  
[68] "fBodyBodyGyroJerkMag-mean()"
[69] "fBodyBodyGyroJerkMag-std()" 

###Units


Units are listed in the table below.

Velocity | Angular Velocity | Acceleration | 
-----------|--------------|----------|
m/sec | rad/sec | g(gravity) | 



An independent tidy data set with the average of each variable for each activity and each subject was generated.  This data is contained in the included data set "ActivitySummary.txt"
tHe upper left of the output shown below.

individual | activity_num | activity | tBodyAcc-mean()-X |
-----------|--------------|----------|------------------
1 | 1 | WALKING | 0.277330759 |

In the output file, the AVERAGE of the mean of the tBodyAcc signal for individual 1 while walking is 0.277330759g where g is the standard unit for gravity.
