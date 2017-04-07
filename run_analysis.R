library(data.table)
library(dplyr)

# Read supporting Metadata
names_of_features <- read.table("D:/Coursera/GDA4/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/features.txt")
activityLabels <- read.table("D:/Coursera/GDA4/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/activity_labels.txt", header = FALSE)

# Read Training Data
training_subject <- read.table("D:/Coursera/GDA4/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", header = FALSE)
training_activity <- read.table("D:/Coursera/GDA4/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/train/y_train.txt", header = FALSE)
training_features <- read.table("D:/Coursera/GDA4/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", header = FALSE)

# Read Test Data
test_subject <- read.table("D:/Coursera/GDA4/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", header = FALSE)
test_activity <- read.table("D:/Coursera/GDA4/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/test/y_test.txt", header = FALSE)
test_features <- read.table("D:/Coursera/GDA4/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", header = FALSE)

#Merge the training and the test sets to create one data set
Subject <- rbind(training_subject, test_subject)
Activity <- rbind(training_activity, test_activity)
total_features <- rbind(training_features, test_features)

#Naming the columns
colnames(total_features) <- t(names_of_features[2])

#Merge the data
colnames(Activity) <- "Activity"
colnames(Subject) <- "Subject"
complete_data <- cbind(total_features,Activity,Subject)

#Extract the column indices that have either mean or std in them along with the activity and subject indicators
columns_with_mean_STD <- grep(".*Mean.*|.*Std.*", names(complete_data), ignore.case=TRUE)
columns_selected <- c(columns_with_mean_STD, 562, 563)
extractedData <- complete_data[,columns_selected]

#Inserting descriptive activity names to name the activities in the data set
extractedData$Activity <- as.character(extractedData$Activity)
for (i in 1:6){
  extractedData$Activity[extractedData$Activity == i] <- as.character(activityLabels[i,2])
}
extractedData$Activity <- as.factor(extractedData$Activity)

#Appropriately label the data set with descriptive variable names
names(extractedData)<-gsub("Acc", "Accelerometer", names(extractedData))
names(extractedData)<-gsub("Gyro", "Gyroscope", names(extractedData))
names(extractedData)<-gsub("BodyBody", "Body", names(extractedData))
names(extractedData)<-gsub("Mag", "Magnitude", names(extractedData))
names(extractedData)<-gsub("^t", "Time", names(extractedData))
names(extractedData)<-gsub("^f", "Frequency", names(extractedData))
names(extractedData)<-gsub("tBody", "TimeBody", names(extractedData))
names(extractedData)<-gsub("-mean()", "Mean", names(extractedData), ignore.case = TRUE)
names(extractedData)<-gsub("-std()", "STD", names(extractedData), ignore.case = TRUE)
names(extractedData)<-gsub("-freq()", "Frequency", names(extractedData), ignore.case = TRUE)
names(extractedData)<-gsub("angle", "Angle", names(extractedData))
names(extractedData)<-gsub("gravity", "Gravity", names(extractedData))

#Creating a second, independent tidy data set with the average of each variable for each activity 
#and each subject

extractedData$Subject <- as.factor(extractedData$Subject)
extractedData <- data.table(extractedData)
final_tidy_data <- aggregate(. ~Subject + Activity, extractedData, mean)
final_tidy_data <- final_tidy_data[order(final_tidy_data$Subject,final_tidy_data$Activity),]
write.table(final_tidy_data, file = "D:/Coursera/GDA4/getdata%2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/Tidy.txt", row.names = FALSE)
