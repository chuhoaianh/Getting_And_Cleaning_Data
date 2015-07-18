# Code book
The data set "MergedClean_Average_dataset.txt" is a tidy data set from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  

The attached "run_analysis.R" will perform the following:  

1. Merges train and test data sets to one data set  
    - X_data: X_train.txt merges with X_test.txt, which is 10299 x 561 data frame will all tested data
    - Y_data: Y_train.txt merges with Y_test.txt, which is 10299 x 1 data frame with activity ID
    - Subject_data: subject_train.txt merges with subject_test.txt, which is 10299 x 1 data frame with subject ID
2. Extracts only the measurements on the mean and standard deviation for each measurement based on "features.txt".
    - X_data: is now a 10299 x 66 data frame with only mean and standard deviation data
3. Assigns activity lables to Y_data (at this moment, only has activity codes)
    - Y_data: is now a 10299 x 66 data frame with values  
        - WALKING  
        - WALKING_UPSTAIRS  
        - WALKING_DOWNSTAIRS  
        - SITTING  
        - STANDING  
        - LAYING  
4. Labels the data set with descriptive variable names: all values and column names are lower case, "_" and "()" are removed. For example: "WALKING_UPSTAIRS" -> "walking upstairs", "tBodyAcc-mean()-X" -> "tBodyAcc-mean-x". After clean up all the data set, they are all merged together to provide one tidy data set, which is 10299 x 68 data frame with subject ID, activity labels, all mean and standard deviation tested data.   

    - subject
    - activities
    - tbodyacc-mean-xyz
    - tbodyacc-std-xyz
    - tgravityacc-mean-xyz
    - tgravityacc-std-xyz
    - tbodyaccjerk-mean-xyz
    - tbodyaccjerk-std-xyz
    - tbodygyro-mean-xyz
    - tbodygyro-std-xyz
    - tbodygyrojerk-mean-xyz
    - tbodygyrojerk-std-xyz
    - tbodyaccmag-mean
    - tbodyaccmag-std
    - tgravityaccmag-mean
    - tgravityaccmag-std
    - tbodyaccjerkmag-mean
    - tbodyaccjerkmag-std
    - tbodygyromag-mean
    - tbodygyromag-std
    - tbodygyrojerkmag-mean
    - tbodygyrojerkmag-std
    - fbodyacc-mean-xyz
    - fbodyacc-std-xyz
    - fbodyaccjerk-mean-xyz
    - fbodyaccjerk-std-xyz
    - fbodygyro-mean-xyz
    - fbodygyro-std-xyz
    - fbodyaccmag-mean
    - fbodyaccmag-std
    - fbodybodyaccjerkmag-mean
    - fbodybodyaccjerkmag-std
    - fbodybodygyromag-mean
    - fbodybodygyromag-std
    - fbodybodygyrojerkmag-mean
    - fbodybodygyrojerkmag-std  
    
*Please note that, the lable of x, y, z will be combined into one xyz in this code book (not letting the codebook too long), for example: tbodyacc-mean-x, tbodyacc-mean-y, tbodyacc-mean-z -> tbodyacc-mean-xyz. In the data set they will still be seperated*
    
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. Then save this second tidy data set to "MergedClean_Average_dataset.txt"
- tidy_data2: is a 180 x 68 data frame which includes average of each variable for each activity at each subject. 
    - 180 rows: each subject performed 6 activites as shown above, there are 30 subjects, therefore 180 rows (30 x 6). 
    - 68 columns: 66 columns of average data, together with subject ID and activities columns, there are total of 68 columns. 
