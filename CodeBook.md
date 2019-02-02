## Codebook Overview

The data set this script tidies up is accelreometer and gyrometer data taken from a smartphone, when the smartphone was attatched to participants doing 6 different activities (walking, walking upstairs, walking downstairs, standing ,sitting and lying down). The oroginal dataset and experiment can be found here:  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The tidied data takes a subset of the data from these studies and calculates the mean of the variables of the subset, based on the ac done and the subject doing it. 

## The tidy data set
The original study took data from the gyrometer and accelormeters and found the following measurements

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The actual dataset was created by perfoming the following operations on each of the measurments above


mean(): Mean value\
std(): Standard deviation\
mad(): Median absolute deviation\
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.




