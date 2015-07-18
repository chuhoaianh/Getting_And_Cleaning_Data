# Getting And Cleaning Data
This is repo for project in "Getting and cleaning data" course. This repo contains run_analysis.R script which will create a tidy data set from a given data set.

## Project details
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following.
  
1. Merges the training and the test sets to create one data set.  
2. Extracts only the measurements on the mean and standard deviation for each measurement.  
3. Uses descriptive activity names to name the activities in the data set.  
4. Appropriately labels the data set with descriptive variable names.  
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  

## How the script works
1. Download and unzip the data set "UCI HAR Dataset" to a folder, for example "C:/test/"
2. Copy the script to the same location with the data set folder "UCI HAR Dataset", for example "C:/test/". Now the "test"" folder will have
    - C:/test/UCI HAR Dataset/
    - C:/test/run_analysis.r
3. Using R console, set working folder to the location of the script and the folder, i.e. 
```r{}
setwd("C://test//")
```  
4. Run the script
```r{}
source("run_analysis.R")
```  
5. The out put from the script will be text file "MergedClean_Average_dataset.txt", which is a clean data set with average of variable for each activity and each subject. The dimension of the data set is 180x68, which contains average data (mean and standard deviation) of each activity (6 activities per subject) from 30 subjects.
