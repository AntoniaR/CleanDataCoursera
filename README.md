CleanDataCoursera
=================

Get and Clean Data project for Coursera course

Run from the data directory by typing source('run_analysis.R')

Script method (also annotations in script):
1. reads the label names from the file 'features.txt'
2. tidies up the label names
3. read the test and train data using the label names from 'features.txt'
4. read in the subjects and activities from the respective files in test and trian directories
5. combine each of the test and train datasets into single arrays for the data, subjects and activities
6. select only the columns from the dataset that contain "mean()" or "std()"
7. relabel the activities in the activities dataset with the appropriate string from "activity_labels.txt"
8. combine the data, subject and activities dataframes into a single dataframe
9. rearrange the data to have the id values "activity" and "subject"
10. sort the data using these two ids and output the mean of all the other variables for these ids
11. save the data to "subject_activity_means.txt"
