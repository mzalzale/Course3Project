Code Book
==========
## General information
* Please look at the accompanying README.txt file before this CodeBook.md file
* For information regarding the origin of the data and the raw variables please run the run_analysis.R script and look at the README.txt file located in the "ICU HAR Dataset" folder

## Read and merge the required data
* subject_test: Subject ID's for the test dataset: each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
* subject_train: Subject ID's for the train dataset: each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
* X_test: Test set: Values of variables in the test data set
* X_train: Training set: Values of variables in the train data set
* y_test: Test lables: Activity ID in the test data set
* y_train: Training lables: Activity ID in the train data set
* activity_labels: Links the class lables with their activity name
* features: List of all features
* dataX : bound X_train with X_test

## Extract mean and std from the dataX data set
* Grep the locations of std and mean labels and use it to subset the dataX data set


## Change the labels to make them descriptive and stand-alone
* Replace "t" at the beginning of each label with "time"
* Replace "f" at the beginning of each label with "frequency"
* Remove "()"
* Replace "mad" with "medianAbsDev"
* Replace "sma" with "signalMagArea"
* Replace "irq" with "interquartileRange"
* Assign new clean names to dataX



## Add subject and activity to the dataX data set
* subject : subject_train bound with subject_test
* activity : y_train bound with y_test

## Rename ID to activity name
Rename the ID to the corresponding activity name 

## Finalize and export data
* Melt the data and re-cast with the mean
* Export a tidy data set called tidy_data.txt file to the current working directory.
