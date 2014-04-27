CleanDataCoursera
=================

Get and Clean Data project for Coursera course

Run from the data directory by typing source('run_analysis.R')

Script method (also annotations in script):

<ol>
<li> reads the label names from the file 'features.txt' </li>
<li> tidies up the label names </li>
<li> read the test and train data using the label names from 'features.txt' </li>
<li> read in the subjects and activities from the respective files in test and trian directories </li>
<li> combine each of the test and train datasets into single arrays for the data, subjects and activities </li>
<li> select only the columns from the dataset that contain "mean()" or "std()" </li>
<li> relabel the activities in the activities dataset with the appropriate string from "activity_labels.txt" </li>
<li> combine the data, subject and activities dataframes into a single dataframe </li>
<li> rearrange the data to have the id values "activity" and "subject" </li>
<li> sort the data using these two ids and output the mean of all the other variables for these ids </li>
<li> save the data to "subject_activity_means.txt" </li>
</ol>
