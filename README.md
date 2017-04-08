Step by Step Analysis of the Fitness Data for smartphones

1. The data files are downloaded and stored in local directory
2. The Run_Analysis Script reads the text files from the local directory
3. First the feature names and the activity labels are read by the script
4. Then the training and test data subject,features, and activity list is fetched from the respective files
5. Then we merge the training & test data for subjects, activity & features in seperate lists
6. Then the columns of the features data list are named using the feature names obtained earlier in step 3
7. Merge the features, activity & subject obtained in step 7 & 8 to crate the complete data set
8. Then extract the column indices that have either mean or std in them along with the activity and subject indicators
9. Next inserting descriptive activity names to rename the activities which were earlier indicated by numbers in the complete data set
10. After that appropriately label the complete data set with descriptive variable names for the various feature
11. Create a second, independent tidy data set with the average of each variable for each activity and each subject
12. Write the result obtaine din step 11 into Tidy.txt file
