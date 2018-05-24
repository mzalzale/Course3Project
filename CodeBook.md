Code Book
==========
## 0. General information
* Please look at the accompanying README.txt file before this CodeBook.md file
* For information regarding the origin of the data and the raw variables please run the run_analysis.R script and look at the README.txt file located in the "ICU HAR Dataset" folder

## 1. Merges the training and the test sets to create one data set
* subject_test: Subject ID's for the test dataset: each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
* subject_train: Subject ID's for the train dataset: each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
* X_test: Test set: Values of variables in the test data set
* X_train: Training set: Values of variables in the train data set
* y_test: Test lables: Activity ID in the test data set
* y_train: Training lables: Activity ID in the train data set
* activity_labels: Links the class lables with their activity name
* features: List of all features
* dataX : bound X_train with X_test


## 2. Extracts only the measurements on the mean and standard deviation for each measurement
* Grep the locations of std and mean labels and use it to subset the dataX data set


## 3. Uses descriptive activity names to name the activities in the data set
* Replace "t" at the beginning of each label with "time"
* Replace "f" at the beginning of each label with "frequency"
* Remove "()"
* Replace "mad" with "medianAbsDev"
* Replace "sma" with "signalMagArea"
* Replace "irq" with "interquartileRange"
* Assign new clean names to dataX


## 4. Appropriately labels the data set with descriptive variable names.
* Add subject and activity to the dataX data set
  * subject : subject_train bound with subject_test
  * activity : y_train bound with y_test
* Rename the ID to the corresponding activity name 

## 5. creates a second, independent tidy data set with the average of each variable for each activity and each subject
* Melt the data and re-cast with the mean
* Export a tidy data set called tidy_data.txt file to the current working directory.
