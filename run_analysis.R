## Install and/or load required libraries 
if (!"reshape2" %in% installed.packages()){install.packages("reshape2")}
library("reshape2")


## If unzipped directory does not exist, download and unzip data
if(!dir.exists("UCI HAR Dataset")) {
    url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(url,"data.zip", mode = "wb")
    unzip("data.zip", exdir=".")
}


## Load the required data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

## Read the activity labels and features
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")  

## Analysis
# Merge the training and the test data sets to create one data set
dataX <- rbind(X_train,X_test)

# Extract the mean and standard deviation for each measurement 
MeanStdOnly <- grep("mean()|std()", features[, 2]) # Grep indices to then get data values
dataX <- dataX[,MeanStdOnly]


# Rename the data with descriptive names and remove unecessary text like for example "()"
featureNames <- features[, 2]
featureNames = gsub("^t", "time",featureNames)
featureNames = gsub("^f", "frequency",featureNames)
featureNames = gsub("\\(\\)$", "",featureNames)
featureNames = gsub("-mad", "-medianAbsDev",featureNames)
featureNames = gsub("-sma", "-signalMagArea",featureNames)
featureNames = gsub("-irq", "-interquartileRange",featureNames)

names(dataX) <- featureNames[MeanStdOnly]

# Merge test and train for subject and activity and assign descriptive labels
subject <- rbind(subject_train, subject_test)
names(subject) <- 'subject'
activity <- rbind(y_train, y_test)
names(activity) <- 'activity'

# Merge subject, activity and (mean,std) data to create the required data set
dataX <- cbind(subject,activity, dataX)


# Factorize data activity, use lables from activity_lables and put them in dataX 
activity_group <- factor(dataX$activity)
levels(activity_group) <- activity_labels[,2]
dataX$activity <- activity_group


## Create a second independent tidy data set with the average of each variable for each activity and each subject. 

# Melt the data so that each row is a unique id-variable combination
meltedDataX <- melt(dataX,id=c("subject","activity"))
# Re-case the data to get the mean
secondDataX <- dcast(meltedDataX, subject + activity ~ variable, mean)
# Rename all columns except first 2 that are already correct as subject and activity
names(secondDataX)[-c(1:2)] <- paste("avg[",names(secondDataX)[-c(1:2)],"]",sep="") 
# Export the data into a tidy.txt file
write.table(secondDataX, "tidy_data.txt", sep = ",", row.names = FALSE, quote = FALSE)


