#CodeBook for Getting and Cleaning Data Course Project
The data used for this project was obtained from the Human Activity Recognition Using Smartphones Data Set from the UCI Machine Learning Repository.
More information about the original raw data set, it variables, and how the data was generated can be found on the UCI website here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The original raw data set along with the ReadMe file describing the data set in detail can be downloaded here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##Modifications/Cleaning done on the raw data set
1. Following Tables read into RStudio  
	*features (shows information about the features, or variable names)  
	*X_test (data for the test group)  
	*y_test (Labels, or Activities for the test group)  
	*X_train (data for the training group)  
	*y_train (Labels, or Activities for the training group)  
	*activity_labels (description of Activities)  
	*subject_test (identifies the subject for each row of test group)  
	*subject_train (identifies the subject for each row of train group)  
2. Using the "plyr" package join activity_labels to both the y_test and y_train tables in order to get a table (testactivity & trainactivity) with both activity id and activity name.  
3. cbind the tables created in step 2 to their respective X_test and X_train tables to get 2 individual full data tables (TEST & TRAIN) for each group that includes all variables, subjects and descriptions.
4. rbind the X_test and X_train tables to get one data set with all data. Named data set "newdata"
5. Create new data table (newdata_means) using grep to select only columns with means or standard configurations.  
	a. also used "toupper" and wildcards to ensure no column name with "mean" or "std" regardless of case was missed.
6. Using the "reshape2" package, melt by Subject and Activity
7. Use dcast to create a new table (avg_activity) with the average of each variable by subject and activity.  
	a. Activities are in the Rows  
	b. Subjects are the columns  
	c. Avg of variables are the values
8. Loop through column names and add "Subject" in front of number to make the column names more descriptive.
9. Write new table to external file "avgforactivity_subject.txt"