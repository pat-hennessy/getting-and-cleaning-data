### README.md
---

The `run_analysis.R` program creates a tidy data set from the "_Human Activity Recognition Using Smartphones Dataset_"

**Input**
- unlabeled sensor data from the test and training sets (test/X_test.txt, train/X_train.txt)
- the activity vectors corresponding to the test and training data (test/Y_test.txt, train/Y_train.txt)
- the subject vectors corresponding to the test and training data (test/subject_test.txt, train/subject_train.txt)
- labels for the 561 columns of sensor data (features.txt)
- descriptive labels for the activity indicators (activity_labels.txt)

**Output**
- a file containing the tidy data set ("TidyData_SubjectActivityGroupMeans.txt")
    - the output file is written with comma separated values to facilitate display in popular spreadsheet programs

**Processing**
- test and training measurement data, subject vectors, and activity vectors are individually row combined with each other
- mean and std dev measurements are extracted (all others dropped)
- numeric activity indicators are given descriptive names
- the combined subject and activity vectors are column combined with the measurement data
- column names are made more descriptive
- means of all variables are calculated by subject/activity group
- results are ordered by subject then by activity
- results are written to a file

**Viewing the results in R**
- data <- read.table("TidyData_SubjectActivityGroupMeans.txt", header = TRUE, sep = ",")
- View(data)
