#
# A program to create a tidy data set from the "Human Activity Recognition Using Smartphones Dataset"
#
# Input:  - unlabeled sensor data from the test and training sets (X_test.txt, X_train.txt)
#         - the activity vector corresponding to the test and training data (Y_test.txt, Y_train.txt)
#         - the subject vector corresponding to the test and training data (subject_test.txt, subject_train.txt)
#         - labels for the 561 columns of sensor data (features.txt)
#         - descriptive labels for the activity indicators (activity_labels.txt)
#
# Output:  - a file containing the tidy data set (TidyData_SubjectActivityGroupMeans.txt)
#             - the output file is written with comma separated values to facilitate display in spreadsheets
#
# Processing:  - test and training data sets are combined
#              - subject and activity vectors are prepended
#              - numeric activity indicators are given descriptive names
#              - mean and std dev measurements are extracted (all others dropped)
#              - column names are made more descriptive
#              - calculate means of all variables by subject/activity groups
#              - order by subject then by activity
#              - output to file


# Read in the data and metadata files
data_train <- read.table("train/X_train.txt")
data_test <- read.table("test/X_test.txt")
subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")
activity_train <- read.table("train/Y_train.txt")
activity_test <- read.table("test/Y_test.txt")
features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")

# Combine test and training data, subjects and activities
data <- rbind(data_train, data_test)
subject <- rbind(subject_train, subject_test)
activity <- rbind(activity_train, activity_test)

# Set the names of the data.table columns
library(data.table)
setnames(data, names(data), as.character(features[[2]]))
setnames(subject, names(subject), "Subject")
setnames(activity, names(activity), "Activity")

# Swap descriptive names for the numeric activity indicators
activity[activity$Activity == 1,] <- as.character(activity_labels[1,2])
activity[activity$Activity == 2,] <- as.character(activity_labels[2,2])
activity[activity$Activity == 3,] <- as.character(activity_labels[3,2])
activity[activity$Activity == 4,] <- as.character(activity_labels[4,2])
activity[activity$Activity == 5,] <- as.character(activity_labels[5,2])
activity[activity$Activity == 6,] <- as.character(activity_labels[6,2])

# Remove columns from the data that we don't want
trimmed_data <- data[, grep(".+-mean\\(\\)|.+-std\\(\\)", colnames(data))]

# Combine data with the subject and activity indicators
data_set <- cbind(subject, cbind(activity, trimmed_data))

# Change the sensor data labels to be a little more descriptive
newNames <- sub("(^f)(.+)", "\\2FreqDomain",
            sub("(^t)(.+)", "\\2TimeDomain",
            sub("-([X-Z])", "\\1axis",
            sub("-std\\(\\)", "StdDev",
            sub("-mean\\(\\)", "Mean",
            sub("Mag", "Magnitude",
            sub("Acc", "Accelerometer", names(data_set))))))))
setnames(data_set, names(data_set), newNames)


# For each combination of subject and activity, calculate the mean of their measurements
data_set <- aggregate(data_set[, 3 : length(data_set)], by = list(Subject = data_set$Subject, Activity = data_set$Activity), FUN = mean)

# Sort by subjectn then by activity for readability
data_set <- data_set[order(as.numeric(data_set$Subject), data_set$Activity),]

# Output
write.table(data_set, "TidyData_SubjectActivityGroupMeans.txt", row.names = FALSE, sep = ",")
