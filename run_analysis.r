
require(dplyr)


getwd()
# setwd("C:/Users/family/Documents/coursera/Getting Cleaning Data/week 4/project")
setwd("P:/Coursera/getting cleaning data/project")

#  Download and extract required data files

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp)

trainData <- read.table(unz(temp, "UCI HAR Dataset/train/X_train.txt"))
trainAct <- read.table(unz(temp, "UCI HAR Dataset/train/y_train.txt"))
trainSubj <- read.table(unz(temp, "UCI HAR Dataset/train/subject_train.txt"))

testData <- read.table(unz(temp, "UCI HAR Dataset/test/X_test.txt"))
testAct <- read.table(unz(temp, "UCI HAR Dataset/test/y_test.txt"))
testSubj <- read.table(unz(temp, "UCI HAR Dataset/test/subject_test.txt"))

actLabels <- read.table(unz(temp, "UCI HAR Dataset/activity_labels.txt"))
features <- read.table(unz(temp, "UCI HAR Dataset/features.txt"), stringsAsFactors = FALSE)

unlink(temp)

#  Process training data files

actLabels$V2 <- as.character(actLabels$V2)      # convert activity descriptions from factors to characters

#  Combine the Individuals and avtivity data sets
trainInfo<- tbl_df(data.frame(individual = as.numeric(trainSubj$V1), activity_num = as.numeric(trainAct$V1)))

#  add a column with activity descriptions
trainInfo <- mutate(trainInfo, activity_name = actLabels$V2[activity_num])
View(trainInfo)


index <- which(features$V2 %in% features$V2[duplicated(features$V2)])   # search for duplicted names in the features data set
features$V2[index] = index                                              # rename duplicates so all names are unique
colnames(trainData) <- features$V2                                      # Add column names to training data set           



cnames <- colnames(trainData)[grep("mean\\(|std\\(",colnames(trainData))]       # find all columns containing means and standard deviations only

trainDataShort <- select(trainData, which(colnames(trainData) %in% cnames))     # remove all colmns that do not contain mean and standard deviations 

trainData <- cbind(trainInfo , trainDataShort)                                  # append columns containing individuals and activities to left side of data set
View(trainData)

                      
#  Process test data files


#  Combine the Individuals and avtivity data sets
testInfo<- tbl_df(data.frame(individual = as.numeric(testSubj$V1), activity_num = as.numeric(testAct$V1)))

#  add a column with activity descriptions
testInfo <- mutate(testInfo, activity_name = actLabels$V2[activity_num])
View(testInfo)

colnames(testData) <- features$V2                                      # Add column names to test data set           

cnames <- colnames(testData)[grep("mean\\(|std\\(",colnames(testData))]       # find all columns containing means and standard deviations only

testDataShort <- select(testData, which(colnames(testData) %in% cnames))     # remove all colmns that do not contain mean and standard deviations 

testData <- cbind(testInfo , testDataShort)                                  # append columns containing individuals and activities to left side of data set
View(testData)

# Combine training and test data

comData <- rbind(trainData , testData)

View(comData)


g <- group_by(comData, individual,activity_num) %>% arrange(individual , activity_num)  # Group by and arrange by individual and activity number


c = dim(g)[2] # count columns of g

# Create a data frame containing averages for individual 1 and activity 1

ave_tbl <-  filter(g, individual == 1 & activity_num == 1)[,4:c]%>% apply(2, mean) %>% t

ind <- as.data.frame(1)
actn <- as.data.frame(1)
act <- as.data.frame(actLabels$V2[1])
ave_tbl <- as.data.frame(cbind(ind, actn,  act, ave_tbl))   # add individual #, activity #, and activty to left side of data frame
colnames(ave_tbl)[1] = "individual"                      # rename columns
colnames(ave_tbl)[2] = "activity_num"
colnames(ave_tbl)[3] = "activity"


#  compute averages of all variables and build output data frame row by row

for (i  in 1:30){
  
  for (j in 1:6){
    
    tnew <-  filter(g, individual == i & activity_num == j)[,4:c]%>% apply(2, mean) %>% t
    ind <- as.data.frame(i)
    actn <- as.data.frame(j)
    act <- as.data.frame(actLabels$V2[j])
    tnew<- cbind(individual = ind, activity_num = actn, activity = act, tnew)
    colnames(tnew)[1] = "individual"
    colnames(tnew)[2] = "activity_num"
    colnames(tnew)[3] = "activity"
    ave_tbl <- rbind(ave_tbl, tnew)
   
  }
  
}

ave_tbl <- ave_tbl[2:nrow(ave_tbl) , ]  # remove duplicate first row
View(ave_tbl)

write.table(ave_tbl, "ActivitySummary.txt", row.name = FALSE)
