Getting And Cleaning Data Project
==================================

## Contents 
This repositery contains the following files:
* run_analysis.R: R script that downloads and manipulates data, see below for more information
* CodeBook.md: Markdown file that describes the data, the variables, and the transformations and work that were performed to clean up the data

## run_analysis.R
The script does the following:
* If necessary, downloads and unzips data files
* If necessary, installs and loads required libraries
* Merges the training and test sets to create one data set
* Extracts only the measuremens on the mean and standard deviation for each measurement
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names
* From the data set in the step above, creates a second, independent data set with the average 

## How to run
You should source the run_analysis.R script in the folder in which you want the analysis to be done and saved 