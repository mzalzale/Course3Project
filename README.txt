Getting And Cleaning Data Project
==================================

## Contents 
This repositery contains the following files:
* run_analysis.R - R script that manipulates data, see below for more
* CodeBook.md - Markdown file that describes the variables, the data, and the transformations and work that were performed to clean up the data

## run_analysis.R
The script does the following:
* If necessary, downloads and unzip data files
* If necessary, installs and load required libraries
* Merges the training and test sets to create one data set
* Extracts only the measuremens on the mean and standard deviation for each measurement
* Uses descriptive activity names to name the activities in the data set
* Appropriately lables the data set with descriptive variable names
* From the data set in the step above, creates a second, independent data set with the average 

## How to run
You should source the run_analysis.R script in the folder in which you want the analysis to be done and saved 