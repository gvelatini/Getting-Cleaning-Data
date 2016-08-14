---
title: "ReadMe"
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



This repository includes a "tidy" data set of averages of means and standard deviations for various accelerometer and gyroscopic measurements of several common human activities. These data were collected via smartphones and processed.  The original data, data descriptions, information concerning the data collection and post processing can be found at 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.  

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

###Data Processing

The file "run_analysis.r" was used to process the raw data and contains ALL processing operations required to produce the final data set "ActivitySummary.txt"

The original data file was unzipped and the necessary files were extracted

The training and test date were combined into a single data set. 

Several  different signals were included in the raw data and The set of variables that were estimated from these signals are: 

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

###However, only the variables that were listed as either means or standard deviations of other variables in the data set were retained.

For example, time domain body acceleration was measured on the x, y, z axis 
and listed under the variable names 

tBodyAcc-X  
tBodyAcc-Y  
tBodyAcc-Z  

Only

tBodyAcc-mean()-X  
tBodyAcc-mean()-Y  
tBodyAcc-mean()-Z  
tBodyAcc-std()-X  
tBodyAcc-std()-Y 
tBodyAcc-std()-Z  

were used for this analysis.

####Please note that there are variable names  included in the original data set that contain the word "mean", however, they were not included in this analysis because they are not the mean or standard deviation of another listed variable.  

For example,

fBodyAcc-meanFreq()-X  
fBodyAcc-meanFreq()-Y  
fBodyAcc-meanFreq()-Z  

were omitted intentionally from the analysis

Once the  unecessary variables were removed, the names for each variable were added to the raw data.  The original variable names were left unchanged because they appear to be a reasonable compromise between being brief but descriptive.  In addition,  they may be somewhat "standard" names for these types of signals.

Three columns were added to the left of the raw data containing the individual number, a numeric identifier for the activity, and a descriptive label for the activtiy, respectively.

An independent tidy data set with the average of each variable for each activity and each subject was generated.  This data is contained in the included data set "ActivitySummary.txt"
the upper left of the output shown below.

individual | activity_num | activity | tBodyAcc-mean()-X  
-----------|--------------|----------|------------------
1 | 1 | WALKING | 0.277330759 |

In the output file, the AVERAGE of the mean of the tBodyAcc signal for individual 1 while walking is 0.277330759g where g is the standard unit for gravity.
