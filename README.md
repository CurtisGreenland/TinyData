TinyData
========
Tiny Data project for Coursera Getting and Cleaning Data course

#Purpose
The purpose of this project was to demonstrate ability to collect, work with, and clean a data set with the goal of preparing a tiny data set that can be used for analysis later.

#Raw Data
The Raw Data used for this project comes from the Human Activity Recognition Using Smartphones Data Set obtained from the UCI Machine Learning Repository.
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Data download: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#Working with the run_analysis.R script
##Dependancies
1.	Data for the analysis downloaded and unzipped to your working directory
2.	The script requires the use of the following libraries. If not installed, they will need to be installed prior to starting.  
*a."plyr"
*b."reshape2"
3.	Download the "run_analysis.R" file from this repository to your working directory

##Run script
1.	Run source("run_analysis.R") command within RStudio
2.	New Tidy Data set named "avgforactivity_subject.txt" will be saved in your working directory.
  a.	Rows:  Variable by Activity
  b.	Columns: Subject
  c.	Values: Means for each variable by subject and activity
3.	You can load this file into RStudio later for analysis by using the read.table("avgforactivity_subject.txt",header=TRUE)
