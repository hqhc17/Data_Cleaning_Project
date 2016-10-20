# Codebook for the Data Cleaning Final Project
This codebook describes the main steps used in cleaning a given dataset and writing the mean and standard deviations of select variables to a file in tidy format.

The main steps used are

* Set the Working Directory to the directory where the "UCI HAR" files have been downloaded.
* Combine the X_train.txt and X_test.txt files into Xall dataframe
* Read in the features.txt file, find the locations of the various mean and standard deviation variables. Use these locations to subset the Xall dataframe to contain only the mean and standard deviation variables. The subset dataframe is called Xsubset. Note that this subset does not have subjects and activitities columns.
* Modify the variable names in Xsubset so that dashes and () are removed.
Read in the subject test and train data sets as well as the label train and test data sets.
Combine the test and train data sets to produce a single data set for subjects and another data set for labels. Append these as first and second columns of Xsubset. These two column, by default, are given the variables V1 and V2. Change them to Subject and Activity respectively.
* Replace the activity column values to more descriptive activity labels using the data from the activity_labels.txt file.
* Compute the mean of each of the data variables in the Xsubset dataframe and write the output in a tidy format to Data_Cleaning_Project_Tidy_Dataset.csv.

# Reading in the tidy data
A sample script Read_Tidy_Dataset.R is provided for reading in the tidy data.

# List of Variables (Column Names) included in the tidy dataset

1.    Subject
2.    Activity
3.   tBodyAccmeanX
4.    tBodyAccmeanY
5.    tBodyAccmeanZ
6.    tBodyAccstdX
7.    tBodyAccstdY
8.    tBodyAccstdZ
9.    tGravityAccmeanX
10.    tGravityAccmeanY
11.    tGravityAccmeanZ
12.    tGravityAccstdX
13.    tGravityAccstdY
14.    tGravityAccstdZ
15.    tBodyAccJerkmeanX
16.    tBodyAccJerkmeanY
17.    tBodyAccJerkmeanZ
18.    tBodyAccJerkstdX
19.    tBodyAccJerkstdY
20.    tBodyAccJerkstdZ
21.   tBodyGyromeanX
22.    tBodyGyromeanY
23.    tBodyGyromeanZ
24.    tBodyGyrostdX
25.    tBodyGyrostdY
26.    tBodyGyrostdZ
27.    tBodyGyroJerkmeanX
28.    tBodyGyroJerkmeanY
29.    tBodyGyroJerkmeanZ
30.    tBodyGyroJerkstdX
31.    tBodyGyroJerkstdY
32.    tBodyGyroJerkstdZ
33.    tBodyAccMagmean
34.    tBodyAccMagstd
35.    tGravityAccMagmean
36.    tGravityAccMagstd
37.    tBodyAccJerkMagmean
38.    tBodyAccJerkMagstd
39.    tBodyGyroMagmean
40.    tBodyGyroMagstd
41.    tBodyGyroJerkMagmean
42.    tBodyGyroJerkMagstd
43.    fBodyAccmeanX
44.    fBodyAccmeanY
45.    fBodyAccmeanZ
46.    fBodyAccstdX
47.    fBodyAccstdY
48.    fBodyAccstdZ
49.    fBodyAccmeanFreqX
50.    fBodyAccmeanFreqY
51.    fBodyAccmeanFreqZ
52.    fBodyAccJerkmeanX
53.    fBodyAccJerkmeanY
54.    fBodyAccJerkmeanZ
55.    fBodyAccJerkstdX
56.    fBodyAccJerkstdY
57.    fBodyAccJerkstdZ
58.    fBodyAccJerkmeanFreqX
59.    fBodyAccJerkmeanFreqY
60.    fBodyAccJerkmeanFreqZ
61.    fBodyGyromeanX
62.    fBodyGyromeanY
63.    fBodyGyromeanZ
64.    fBodyGyrostdX
65.    fBodyGyrostdY
66.    fBodyGyrostdZ
67.    fBodyGyromeanFreqX
68.    fBodyGyromeanFreqY
69.    fBodyGyromeanFreqZ
70.    fBodyAccMagmean
71.    fBodyAccMagstd
72.    fBodyAccMagmeanFreq
73.    fBodyBodyAccJerkMagmean
74.    fBodyBodyAccJerkMagstd
75.    fBodyBodyAccJerkMagmeanFreq
76.    fBodyBodyGyroMagmean
77.    fBodyBodyGyroMagstd
78.    fBodyBodyGyroMagmeanFreq
79.    fBodyBodyGyroJerkMagmean
80.    fBodyBodyGyroJerkMagstd
81.    fBodyBodyGyroJerkMagmeanFreq
