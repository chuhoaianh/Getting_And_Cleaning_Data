UCIFolder <- "UCI HAR Dataset/"
TrainFolder <- "UCI HAR Dataset/train/"
TestFolder <- "UCI HAR Dataset/test/"

#1. Merges the training and the test sets to create one data set.
X_data <- rbind(read.table(paste(TrainFolder, "X_train.txt", sep = "")), 
                read.table(paste(TestFolder, "X_test.txt", sep = "")))

Y_data <- rbind(read.table(paste(TrainFolder, "Y_train.txt", sep = "")), 
                read.table(paste(TestFolder, "Y_test.txt", sep = "")))

Subject_data <- rbind(read.table(paste(TrainFolder, "subject_train.txt", sep = "")), 
                      read.table(paste(TestFolder, "subject_test.txt", sep = "")))

#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table(paste(UCIFolder, "features.txt", sep = ""))
names(X_data) <- features[, 2]
i <- grep("-mean\\(\\)|-std\\(\\)", names(X_data))
X_data <- X_data[,i]
names(X_data) <- gsub("\\(|\\)", "", names(X_data))

#3. Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table(paste(UCIFolder,"activity_labels.txt", sep = ""))

#loop thru Y_data and assigned the activity labels
for (i in 1:nrow(Y_data)){
  for (j in 1:nrow(activity_labels)){
    if (Y_data[i,1] == activity_labels[j,1])
      Y_data[i,1] = as.character(activity_labels[j,2])
  }
}
names(Y_data) <- "activities"


#4. Appropriately labels the data set with descriptive variable names. 
names(Subject_data) <- "subject"

#Cleanup Y_data values
Y_data <- as.data.frame(sapply(Y_data, tolower))  #set lower case all values
Y_data <- as.data.frame(sapply(Y_data, gsub, pattern="_", replacement=" ")) #remove "_"

#Cleanup X_data column names
names(X_data) <- tolower(names(X_data)) #set lowever case all values

#create tidy data set
tidy_data <- cbind(Subject_data, Y_data, X_data)


#5. From the data set in step 4, creates a second, independent tidy data set with the average 
#of each variable for each activity and each subject.
subjects <- unique(tidy_data$subject)
activities <- unique(tidy_data$activities)
tidy_data2 <- tidy_data[1,] #initialize new data set

k <- 1
for (i in 1:length(subjects)){  #loop thru the subjects list
  for (j in 1: length(activities)){   #loop thru the activities list
    tidy_data2[k, 1] <- subjects[i]   #assign the subject to the current row of the new data set
    tidy_data2[k, 2] <- activities[j] #assign the activities lable to the current row of the new data set
    
    #create a temp data frame with all the match current subject and activities label
    temp <- tidy_data[tidy_data$subject==i & tidy_data$activities==activities[j], ]
    
    #calculate means of every columns from the temp data frame and put them to the new data set
    tidy_data2[k, 3:length(tidy_data)] <- colMeans(temp[, 3:length(tidy_data)])
    
    #increase the current row
    k <- k + 1
  }
}

write.table(tidy_data2, "MergedClean_Average_dataset.txt", row.names = FALSE)