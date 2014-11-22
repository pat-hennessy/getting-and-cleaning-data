### Code Book for the "TidyData_SubjectActivityGroupMeans.txt" Data Set
---

This data is a subset of the original data set produced by the study performed by Davide Anguita, et al on "Human Activity Recognition on Smartphones":  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

It consists of only those variables (features) pertaining to a measurement mean ("mean()") and standard deviation ("std()").  Below is an excerpted description of the study design from the original paper to provide a bit of context for the variables included in this subset.

**_The features selected for this database come from the accelerometer and gyroscope raw signals in the X, Y, and Z axes. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.  Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz._**

**_Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm._**


The subset of variables pertaining to the mean and standard deviation are given below.  The names were changed from the original data set to be a bit more descriptive in the hope that a code book translation would not be necessary when viewing the data set.

While the original data set was divided into a training set and a test set, this subset has combined them into one.  There are 30 subjects and six activities (WALKING, LAYING, etc.) performed by each.  Once the data was subsetted and merged, the mean of each variable was calculated on a per subject/activity basis.  The data values in the final data set are these means.  The units for the acceleration variables are meters per second squared, and the units for the gyroscope variables are radians per second.  

The data are stored as text, and values are separated by commas (CSV) in order to permit viewing by popular spreadsheet programs.  The data can also be read into R with the command, "data -> read.table(file, header = TRUE, sep = ",")", and convenintly viewed with the View(data) command.

---

#### Data Set Variables:
_(Note variable expansion for [X/Y/Z] axes and [Time/Freq] domains)_

* **BodyAccelerometerMean[X/Y/Z]axis[Time/Freq]Domain**:  mean of samples of acceleration due to body movement

* **BodyAccelerometerStdDev[X/Y/Z]axis[Time/Freq]Domain**:  standard deviation of samples of acceleration due to body movement

* **GravityAccelerometerMean[X/Y/Z]axisTimeDomain**:  mean of samples of acceleration due to gravity

* **GravityAccelerometerStdDev[X/Y/Z]axisTimeDomain**:  standard deviation of samples of acceleration due to gravity

* **BodyAccelerometerJerkMean[X/Y/Z]axis[Time/Freq]Domain**:  mean of calculated body jerk acceleration

* **BodyAccelerometerJerkStdDev[X/Y/Z]axis[Time/Freq]Domain**:  standard deviation of calculated body jerk acceleration

* **BodyGyroMean[X/Y/Z]axis[Time/Freq]Domain**:  mean of samples of body angular velocity 

* **BodyGyroStdDev[X/Y/Z]axis[Time/Freq]Domain**:  standard deviation of samples of body angular velocity

* **BodyGyroJerkMean[X/Y/Z]axisTimeDomain**:  mean of calculated body jerk angular velocity

* **BodyGyroJerkStdDev[X/Y/Z]axisTimeDomain**:  standard deviation of calculated body jerk angular velocity

* **BodyAccelerometerMagnitudeMean[Time/Freq]Domain**:  mean of calculated acceleration magnitude due to body movement

* **BodyAccelerometerMagnitudeStdDev[Time/Freq]Domain**:  standard deviation of calculated acceleration magnitude due to body movement

* **GravityAccelerometerMagnitudeMeanTimeDomain**:  mean of calculated acceleration magnitude due to gravity

* **GravityAccelerometerMagnitudeStdDevTimeDomain**:  standard deviation of calculated acceleration magnitude due to gravity

* **BodyAccelerometerJerkMagnitudeMeanTimeDomain**:  mean of calculated body jerk acceleration magnitude

* **BodyAccelerometerJerkMagnitudeStdDevTimeDomain**:  standard deviation of calculated body jerk acceleration magnitude

* **BodyGyroMagnitudeMeanTimeDomain**:  mean of calculated body angular velocity magnitude

* **BodyGyroMagnitudeStdDevTimeDomain**:  standard deviation of calculated body angular velocity magnitude

* **BodyGyroJerkMagnitudeMeanTimeDomain**:  mean of calculated body jerk angular velocity magnitude

* **BodyGyroJerkMagnitudeStdDevTimeDomain**:  standard deviation of calculated body jerk angular velocity magnitude

* **BodyBodyAccelerometerJerkMagnitudeMeanFreqDomain**:  mean of calculated body jerk acceleration magnitude

* **BodyBodyAccelerometerJerkMagnitudeStdDevFreqDomain**:  standard deviation of calculated body jerk acceleration magnitude

* **BodyBodyGyroMagnitudeMeanFreqDomain**:  mean of calculated body angular velocity magnitude

* **BodyBodyGyroMagnitudeStdDevFreqDomain**:  standard deviation of calculated body angular velocity magnitude

* **BodyBodyGyroJerkMagnitudeMeanFreqDomain**:  mean of calculated body jerk angular velocity magnitude

* **BodyBodyGyroJerkMagnitudeStdDevFreqDomain**:  standard deviation of calculated body jerk angular velocity magnitude
