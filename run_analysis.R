# Read the data labels into an array
labels <- read.table("features.txt")
labels <- labels$V2

# Tidy up the labels
labels = gsub("tBodyAcc\\-", "Time Domain Body Accel ", labels)
labels = gsub("tGravityAcc\\-", "Time Domain Gravity Accel ", labels)
labels = gsub("tBodyAccJerk\\-", "Time Domain Body Accel Jerk ", labels)
labels = gsub("tBodyGyro\\-", "Time Domain Body Gyro ", labels)
labels = gsub("tBodyGyroJerk\\-", "Time Domain Body Gyro ", labels)
labels = gsub("tBodyAccMag\\-", "Time Domain Accel Magnitude ", labels)
labels = gsub("tGravityAccMag\\-", "Time Domain Body Accel Magnitude ", labels)
labels = gsub("tBodyAccJerkMag\\-", "Time Domain Body Accel Jerk Megnitude ", labels)
labels = gsub("tBodyGyroMag\\-", "Time Domain Body Gyro Magnitude ", labels)
labels = gsub("tBodyGyroJerkMag\\-", "Time Domain Jerk Magnitude ", labels)
labels = gsub("fBodyAcc\\-", "Frequency Domain Body Accel ", labels)
labels = gsub("fBodyAccJerk\\-", "Frequency Domain Body Accel Jerk ", labels)
labels = gsub("fBodyGyro\\-", "Frequency Domain Body Gyro ", labels)
labels = gsub("fBodyAccMag\\-", "Frequency Domain Body Accel Magnitude ", labels)
labels = gsub("fBodyAccJerkMag\\-", "Frequency Domain Body Accel Jerk Magnitude ", labels)
labels = gsub("fBodyGyroMag\\-", "Frequency Domain Body Gyro Magnitude ", labels)
labels = gsub("fBodyGyroJerkMag\\-", "Frequency Domain Body Gyro Jerk Magnitude ", labels)
labels = gsub("fBodyBodyAccJerk\\-", "Frequency Domain Body Body Accel Jerk ", labels)
labels = gsub("fBodyBodyGyro\\-", "Frequency Domain Body Body Gyro ", labels)
labels = gsub("fBodyBodyAccMag\\-", "Frequency Domain Body Body Accel Magnitude ", labels)
labels = gsub("fBodyBodyAccJerkMag\\-", "Frequency Domain Body Body Accel Jerk Magnitude ", labels)
labels = gsub("fBodyBodyGyroMag\\-", "Frequency Domain Body Body Gyro Magnitude ", labels)
labels = gsub("fBodyBodyGyroJerkMag\\-", "Frequency Domain Body Body Gyro Jerk Magnitude ", labels)

# read the test and train data into arrays with the column names from features.txt
xtest <- read.table("test/X_test.txt", col.names=labels) 
xtrain <- read.table("train/X_train.txt", col.names=labels)

# read the subjects and activities into data arrays
xtest_subjects <- read.table("test/subject_test.txt", col.names=c("subject"))
xtest_activities <- read.table("test/y_test.txt", col.names=c("activity"))
xtrain_subjects <- read.table("train/subject_train.txt", col.names=c("subject"))
xtrain_activities <- read.table("train/y_train.txt", col.names=c("activity"))

# combine the two datasets into one
x <- rbind(xtest,xtrain)

# combine the subject and activity datasets into one
x_subjects <- rbind(xtest_subjects,xtrain_subjects)
x_activities <- rbind(xtest_activities, xtrain_activities)

# select all the columns in x which contain "-mean()" or "-std()"
x_reduced <- x[,c(grep("mean\\(\\)",labels),grep("std\\(\\)",labels))]

# read in the activity labels
activity_labels <- read.table("activity_labels.txt")

# relabel the activities
x_activities_relabled <- factor(x_activities$activity) # gets the current levels
levels(x_activities_relabled) <- activity_labels$V2 # changes the current levels to those from activity_labels.txt

# add the subject and activity label to the data set
x_reduced[,"activity"] <- x_activities_relabled
x_reduced[,"subject"] <- x_subjects

# rearrange the dataset sorting by the id columns "activity" and "subject"
molten <- melt(x_reduced, id=c("activity","subject"))

# output the data, sorted by "activity" and "subject" with the mean value for each variable in the dataset
casted <- dcast(molten, formula = subject + activity ~ variable, fun.aggregate = mean)

# save resulting dataset
write.csv(casted, "subject_activity_means.txt", row.names=FALSE)