I wrote this piece of R code as the project assignment for 
Coursera course : Getting and Cleaning Data.
I completed this program by 25 April 2014 and I can be contacted with this email : matthiasho@yahoo.com

I observed the following:
1) Features file contains 561 labels common to both test and train files
2) Activity_labels file contain actviities description common to both test and train files
3) Both of these files were read, as first step of my programe

## Handling of testing files
## =========================

a) I read in the subject_test.txt and added the column name "Subjects"
b) Next, I read in y_test.txt and added the column name "ActivityCode"
c) Then I use descriptive activity names to name the activities in the data set
d) Then I read in X_test.txt and replace column names with those 561 labels that I found previously.
e) I combine the 3 data frame subj_test,y_test and x_test using the rbind command, , to form a data frame - iTest

## Handling of training files
## ==========================

a) I read in the subject_train.txt and added the column name "Subjects"
b) Next, I read in y_train.txt and added the column name "ActivityCode"
c) Then I use descriptive activity names to name the activities in the data set
d) Then I read in X_train.txt and replace column names with those 561 labels that I found previously.
e) I combine the 3 data frame subj_test,y_train and x_train using the rbind command, to form a data frame - iTrain

## Creating one data set from testing and training data
## ==================================================

I merged both iTest and iTrain data frame sets to create one data frame - iCombined consisting of 10299 rows


## Extracting on mean ad SD measurement
## ====================================

I extracted measurements on the mean and standard deviation for each measurement. i.e. those with mean() and std()
I realised they are from the columns of the combined dataset with the following number columns 

1,2,3,4,5,6,7,8,9,44,45,46,47,48,49,84,85,86,87,88,89,124,125,126,127,128,129,164,165,166,167,168,169,
204,205,217,218,230,231,243,244,269,270,271,272,273,274,348,349,350,351,352,353,427,428,429,430,431,432,
506,507,519,520,532,533,545,546

There are a total of 67 columns extracted


## Final steps
## ===========

I created a second, independent tidy data set with the average of each variable for each activity and each subject. 
Since there are 30 subjects each with 6 actvities, a total of 180 rows were output.  The output file was uploaded to
Coursera website for evaluation.