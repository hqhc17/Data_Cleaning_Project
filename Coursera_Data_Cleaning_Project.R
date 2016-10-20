# This script reads in data collected from the accelerometers from the Samsung Galaxy S smartphone,
# extracts the measurements on the mean and standard deviation for each measurement, and
# creates a second, independent tidy data set with the average of each variable for each activity 
# and each subject.

rm(list=ls())
# set the working directory
setwd(".") # Change the period to the appropriate path.

# read in the training and test sets and merge them into one set Xall using rbind
Xtrain <- read.table("./UCI\ HAR\ Dataset/train/X_train.txt")
Xtest <- read.table("./UCI\ HAR\ Dataset/test/X_test.txt")
Xall <- rbind(Xtrain,Xtest)

# Xtrain and Xtest are not neeeded anymore.
remove(Xtrain,Xtest)

# read in the features.txt file
features <- read.table("./UCI\ HAR\ Dataset/features.txt",stringsAsFactors = F)
# use grep to find the locations of the mean and standard deviation features in the features table
mean_std_indices <- grep("mean|std",features$V2,value=F)
# subset Xall to a set containing only the mean and standard deviation features
mean_std_var_names <- features[mean_std_indices,]
Xsubset <- Xall[mean_std_var_names[,1]]
remove(Xall) # not needed anymore!

# Get rid of the dashes and () in column names and assign the modified names to the columns of Xsubset
# 
mean_std_var_names[,2] <- gsub("[[:punct:]]","",mean_std_var_names[,2])
names(Xsubset) = mean_std_var_names[,2] 

ytrain <- read.table("./UCI\ HAR\ Dataset/train/y_train.txt")
subjecttrain <- read.table("./UCI\ HAR\ Dataset/train/subject_train.txt")
ytest <- read.table("./UCI\ HAR\ Dataset/test/y_test.txt")
subjecttest <- read.table("./UCI\ HAR\ Dataset/test/subject_test.txt")

activity_labels <- read.table("./UCI\ HAR\ Dataset/activity_labels.txt",stringsAsFactors = FALSE)

yall <- rbind(ytrain,ytest) # combine the training and test set labels into one.
subjectall <- rbind(subjecttrain,subjecttest) # combine subject train and test data sets into one

# Add the labels and subjects as left most columns in Xsubset
Xsubset <- cbind(yall,Xsubset) 
Xsubset <- cbind(subjectall,Xsubset)

# Replace defaults variable names V1 and V2 in Xsubset (the first two columns) to more descriptive names.
colnames(Xsubset)[1] <- "Subject"
colnames(Xsubset)[2] <- "Activity"

# Replace activity numbers with the more descriptive labels
for (activity_num in activity_labels$V1){
    Xsubset$Activity[Xsubset$Activity == activity_num] <- activity_labels$V2[activity_num]
}

# Calculate the means of each column in Xsubset for each activity of each subject and write the resulting
# data to a data frame.
mean_std_df <- NULL
for (i in 1:30){
    df <- Xsubset[Xsubset$Subject == i,]
    for (j in activity_labels$V2) {
        subdf <- df[df$Activity == j,]
        p <- colMeans(subset(subdf,select=3:ncol(subdf)))
        q <- c(i,j,p)
        mean_std_df <- rbind(mean_std_df,q)
    }
}
colnames(mean_std_df)[1] <- "Subject" # Change the column name V1 to Subject
colnames(mean_std_df)[2] <- "Activity" # Change the column name V2 to Activity

# Create a tidy data set file by writing mean_std_df contents to a txt file
write.table(mean_std_df,file = "Data_Cleaning_Project_Tidy_Dataset.csv",sep=",",quote = FALSE,row.names = FALSE)

# write column names to a file
out <- colnames(mean_std_df)
fileout <- file("Column_Names.txt","w")
for (i in 1:length(out)){
    write(sprintf("%d    %s",i,out[i]),fileout,append=TRUE)
}
close(fileout)

