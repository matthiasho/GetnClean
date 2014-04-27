## Coding by Matthias Ho for 
## Coursera course : Getting and Cleaning Data
## 25 April 2014
## matthiasho@yahoo.com


## Features file contains 561 labels common to both test and train files
goodlabel           <- read.table("c:/From US disk/coursera/johns - Cleandata/Project/features.txt", header = FALSE)


## Activity_labels file contain actviities description common to both test and train files
activitylabel       <- read.table("c:/From US disk/coursera/johns - Cleandata/Project/activity_labels.txt", header = FALSE)
colnames(activitylabel) <- c("ActivityCode","ActivityDesc")
activitylabel$ActivityDesc <- as.character(activitylabel$ActivityDesc )


## Handling of testing files
## =========================

subj_test           <- read.table("c:/From US disk/coursera/johns - Cleandata/Project/test/subject_test.txt", header = FALSE)
colnames(subj_test) <- c("Subjects")

y_test              <- read.table("c:/From US disk/coursera/johns - Cleandata/Project/test/y_test.txt", header = FALSE)
colnames(y_test)    <- c("ActivityCode")

## 3.  Uses descriptive activity names to name the activities in the data set

y_test$ActivityDesc <- rep(NA, nrow(y_test))
y_test$ActivityDesc <- activitylabel[y_test$ActivityCode,2]

x_test              <- read.table("c:/From US disk/coursera/johns - Cleandata/Project/test/X_test.txt", header = FALSE)

## 4.  Appropriately labels the data set with descriptive activity names. 
colnames(x_test)    <- goodlabel[,2]
iTest <- cbind(subj_test,y_test,x_test)

write.table(iTest, file = "c:/From US disk/coursera/johns - Cleandata/Project/checking.txt",sep="\t",append = FALSE,quote=FALSE)



## Handling of training files
## ==========================

subj_train           <- read.table("c:/From US disk/coursera/johns - Cleandata/Project/train/subject_train.txt", header = FALSE)
colnames(subj_train) <- c("Subjects")

y_train              <- read.table("c:/From US disk/coursera/johns - Cleandata/Project/train/y_train.txt", header = FALSE)
colnames(y_train)    <- c("ActivityCode")

## 3.  Uses descriptive activity names to name the activities in the data set

y_train$ActivityDesc <- rep(NA, nrow(y_train))
y_train$ActivityDesc <- activitylabel[y_train$ActivityCode,2]

x_train              <- read.table("c:/From US disk/coursera/johns - Cleandata/Project/train/X_train.txt", header = FALSE)

## 4.  Appropriately labels the data set with descriptive activity names. 
colnames(x_train)    <- goodlabel[,2]
iTrain <- cbind(subj_train,y_train,x_train)

write.table(iTrain, file = "c:/From US disk/coursera/johns - Cleandata/Project/checking.txt",sep="\t",append = FALSE,quote=FALSE)


## 1.  Merging the training and the test sets to create one data set.
iCombined <- rbind(iTest,iTrain)

## Output to file for self checking purpose only
 write.table(iCombined, file = "c:/From US disk/coursera/johns - Cleandata/Project/checking.txt",sep="\t",append = FALSE,quote=FALSE)

## 2.  Extract only the measurements on the mean and standard deviation for each measurement. i.e. those with mean() and std()
iExtracted = iCombined[,c(1,2,3,4,5,6,7,8,9,
                          44,45,46,47,48,49,
                          84,85,86,87,88,89,
                          124,125,126,127,128,129,
                          164,165,166,167,168,169,
                          204,205,
                          217,218,
                          230,231,
                          243,244,
                          269,270,271,272,273,274,
                          348,349,350,351,352,353,
                          427,428,429,430,431,432,
                          506,507,
                          519,520,
                          532,533,
                          545,546)] 

## Output to file for self checking purpose only
write.table(iExtracted, file = "c:/From US disk/coursera/johns - Cleandata/Project/checking.txt",sep="\t\t",append = FALSE,quote=FALSE)


##  5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

attach(iExtracted)
aggdata <-aggregate(iExtracted, by=list(Subjects,ActivityDesc), FUN=mean, na.rm=TRUE)

## Output to file for self checking purpose only
 write.table(aggdata, file = "c:/From US disk/coursera/johns - Cleandata/Project/tidydataset.txt",sep=" ",append = FALSE,quote=FALSE)

