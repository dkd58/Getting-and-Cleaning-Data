# Requirements: 
#   - package dplyr
#   - datasets in working directory
#  
rm(list=ls())
library(dplyr)

# Step 1
# Read training and test sets
# Merge both sets to create one data set

train <- read.table("./UCI HAR Dataset/train/X_train.txt", sep="")
test <- read.table("./UCI HAR Dataset/test/X_test.txt", sep="")

# Both datasets have similar structure (same columns) so we can rbind them:
measures <- rbind(train,test)    

# Read column names from features.txt
colnames <- read.table("./UCI HAR Dataset/features.txt", sep="")
# some column names appear more than once (fBody.....bandsEnergy etc)
# so add column number to name to make unique
colnames(measures) <- paste(colnames[,1],colnames[,2])

# Step 2
# Extract only the measurements on the mean and standard deviation for each measurement 
# Apparently this does not work: ad <- select(alldata,(contains("mean",ignore.case=TRUE) | contains("std", ignore.case = TRUE)))
# So we do it in two steps:
ad1 <- select(measures, contains("mean", ignore.case = TRUE))
ad2 <- select(measures, contains("std", ignore.case = TRUE))
# Now combine columns with means and stds
ad <- cbind(ad1,ad2)

# Step 3
# Use descriptive activity names to name the activities in the data set
# The activity numbers for each feature vector are coded 1-6 and stored in the Y-train.txt and Y-test.txt files
train_actnr <- read.table("./UCI HAR Dataset/train/Y_train.txt", sep="")
test_actnr <- read.table("./UCI HAR Dataset/test/Y_test.txt", sep="")
# The activity labels are in activity_labels.txt
actlabel <- read.table("./UCI HAR Dataset/activity_labels.txt", sep="")
actlabel
# Now combine activity numbers with their respective labels and column bind with measurement dataset
# Don't use merge, because this will reorder the data: ada <- merge(rbind(train_actnr,test_actnr), actlabel, by = "V1")
# So activities will not be in the right row anymore
# Better use left_join from the dplyr package
ada <- left_join(rbind(train_actnr,test_actnr), actlabel, by = "V1")
alldata_act <- cbind(ada[,2],ad)
colnames(alldata_act)[1] <- "Activity"

# Step 4
# Appropriately label the data set with descriptive variable names
# This has already been done above (it makes selecting the right mean and std variables easier)

# Step 5

# Create a second, independent tidy data set with the average of each variable for each activity and each subject
# Similarly to the activity (labels), each feature vector is related to one subject
# The subject numbers are contained in the files subject_train.txt and subject_test.txt respectively
train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt", sep="")
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt", sep="")
# We combine the subject numbers with the measurement data
alldata <- cbind(rbind(train_subject,test_subject),alldata_act)
colnames(alldata)[1] <- "Subjectnr"
# Now the dataset is formed, we can remove the (starting) number part of the
# column names, like so:
colnames(alldata) <- sub("^.*\\s","",colnames(alldata))

# So now we have all the information in the dataset, but we still have multple
# table(alldata[,c("Activity","Subjectnr")]) shows that every subject is engaged in every activity
# Now summarise all variables by activity and subject, taking means
alldata_grouped <- group_by(alldata, Activity, Subjectnr) 
means_per_act_subj <- summarise_each(alldata_grouped,funs(mean)) 

# Finally, write the resulting dataset to an external txt file, as required
write.table(means_per_act_subj, file="./UCI HAR Dataset/means_per_act_subj.txt", row.name=FALSE)

# This  data file can be read again, by using the following statements:
#  data <- read.table(file="./UCI HAR Dataset/means_per_act_subj.txt", header = TRUE)
#  View(data)


