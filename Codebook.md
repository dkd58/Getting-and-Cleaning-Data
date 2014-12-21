This codebook describes both the input files (Human Activity Recognition Using Smartphones Datasets) and the resulting tidy dataset called means_per_act_subj.txt created by the R code "run_analysis.R" in this repository. 

## Input files
The structure of the input files is as follows:

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject (range 1-30) who performed the activity.
- 'test/subject_test.txt': Each row identifies the subject (range 1-30) who performed the activity.

Feature Selection (describing variables in the X_train.txt and X_test.txt files)

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

## Tidy Output file

The output file contains one row for each combination of Activity and Subjectnr
The other columns give the mean of each of the following variables for these combinations:

 [1] "Subjectnr"                            "Activity"                            
 [3] "tBodyAcc-mean()-X"                    "tBodyAcc-mean()-Y"                   
 [5] "tBodyAcc-mean()-Z"                    "tGravityAcc-mean()-X"                
 [7] "tGravityAcc-mean()-Y"                 "tGravityAcc-mean()-Z"                
 [9] "tBodyAccJerk-mean()-X"                "tBodyAccJerk-mean()-Y"               
[11] "tBodyAccJerk-mean()-Z"                "tBodyGyro-mean()-X"                  
[13] "tBodyGyro-mean()-Y"                   "tBodyGyro-mean()-Z"                  
[15] "tBodyGyroJerk-mean()-X"               "tBodyGyroJerk-mean()-Y"              
[17] "tBodyGyroJerk-mean()-Z"               "tBodyAccMag-mean()"                  
[19] "tGravityAccMag-mean()"                "tBodyAccJerkMag-mean()"              
[21] "tBodyGyroMag-mean()"                  "tBodyGyroJerkMag-mean()"             
[23] "fBodyAcc-mean()-X"                    "fBodyAcc-mean()-Y"                   
[25] "fBodyAcc-mean()-Z"                    "fBodyAcc-meanFreq()-X"               
[27] "fBodyAcc-meanFreq()-Y"                "fBodyAcc-meanFreq()-Z"               
[29] "fBodyAccJerk-mean()-X"                "fBodyAccJerk-mean()-Y"               
[31] "fBodyAccJerk-mean()-Z"                "fBodyAccJerk-meanFreq()-X"           
[33] "fBodyAccJerk-meanFreq()-Y"            "fBodyAccJerk-meanFreq()-Z"           
[35] "fBodyGyro-mean()-X"                   "fBodyGyro-mean()-Y"                  
[37] "fBodyGyro-mean()-Z"                   "fBodyGyro-meanFreq()-X"              
[39] "fBodyGyro-meanFreq()-Y"               "fBodyGyro-meanFreq()-Z"              
[41] "fBodyAccMag-mean()"                   "fBodyAccMag-meanFreq()"              
[43] "fBodyBodyAccJerkMag-mean()"           "fBodyBodyAccJerkMag-meanFreq()"      
[45] "fBodyBodyGyroMag-mean()"              "fBodyBodyGyroMag-meanFreq()"         
[47] "fBodyBodyGyroJerkMag-mean()"          "fBodyBodyGyroJerkMag-meanFreq()"     
[49] "angle(tBodyAccMean,gravity)"          "angle(tBodyAccJerkMean),gravityMean)"
[51] "angle(tBodyGyroMean,gravityMean)"     "angle(tBodyGyroJerkMean,gravityMean)"
[53] "angle(X,gravityMean)"                 "angle(Y,gravityMean)"                
[55] "angle(Z,gravityMean)"                 "tBodyAcc-std()-X"                    
[57] "tBodyAcc-std()-Y"                     "tBodyAcc-std()-Z"                    
[59] "tGravityAcc-std()-X"                  "tGravityAcc-std()-Y"                 
[61] "tGravityAcc-std()-Z"                  "tBodyAccJerk-std()-X"                
[63] "tBodyAccJerk-std()-Y"                 "tBodyAccJerk-std()-Z"                
[65] "tBodyGyro-std()-X"                    "tBodyGyro-std()-Y"                   
[67] "tBodyGyro-std()-Z"                    "tBodyGyroJerk-std()-X"               
[69] "tBodyGyroJerk-std()-Y"                "tBodyGyroJerk-std()-Z"               
[71] "tBodyAccMag-std()"                    "tGravityAccMag-std()"                
[73] "tBodyAccJerkMag-std()"                "tBodyGyroMag-std()"                  
[75] "tBodyGyroJerkMag-std()"               "fBodyAcc-std()-X"                    
[77] "fBodyAcc-std()-Y"                     "fBodyAcc-std()-Z"                    
[79] "fBodyAccJerk-std()-X"                 "fBodyAccJerk-std()-Y"                
[81] "fBodyAccJerk-std()-Z"                 "fBodyGyro-std()-X"                   
[83] "fBodyGyro-std()-Y"                    "fBodyGyro-std()-Z"                   
[85] "fBodyAccMag-std()"                    "fBodyBodyAccJerkMag-std()"           
[87] "fBodyBodyGyroMag-std()"               "fBodyBodyGyroJerkMag-std()"  




