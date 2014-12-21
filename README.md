Getting-and-Cleaning-Data
=========================
The script "run_analysis.R" in this repository reads the Human Activity Recognition Using Smartphones (HARUS) Datasets 
and reshapes these into a tidy dataset.
The structure of these files is described in the Codebook.md, as is the structure of the resulting tidy dataset, which is called means_per_act_subj.txt.

Prerequisites:
- the UCI HAR Datasets (inclusing subdirectories) need to be in your working directoy
- the packages dplyr needs to be installed (it is loaded via a library command in the code)

Since the code "run_analysis.R" contains detailed comments, this Readme document gives a high-level description of the way the code works:

- Firstly, the training and test datasets containing 561 measurements each are combined rowwise (vertically), giving the measures dataset
- Secondly, column names of the 561 variables are read from the features.txt file; this may seem early, but this way it is easier to perform the selection of variables containing means and standard deviation (see next step). Since there are duplicate column names, each column name is expanded with its number (at the front end)
- Next, the columns from the measures dataset whose name contains the string "mean" or "std" are selected, giving dataset ad
- The activity numbers (file Y_train.txt and Y_test.txt) are combined vertically (I assume they are in the same order as the training and test measurement datasets; there is no common key) and left_joined with the activity name dataset read from activity_labels.txt, using the activity number. Note that using a regular merge here would not work, since the mentioned ordering would be lost. The resulting file is called ada.
- The activity name from ada and the ad file are combined "horizontally" (by columns) to give alldata_act, adding the column name "Activity" to the first column.
- In a similar fashion (except for the label) a column containing the subject number ("Subjectnr") is attached to the dataset, now called alldata.
- After cleaning up the variable names by removing the number attached up front (using the sub function) we can summarise the data using th dplyr package:
- grouping by Activity and Subjectnr the means of all other variables are calculated and stored in the final dataset means_per_act_subj
- Finally this dataset is written in txt format to the working directory. It may be read using the commands which are included in the final comment lines in the code
- 


