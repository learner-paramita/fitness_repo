Code Book to define the various variables used in the Analysis

1. names_of_features : The names of all the measurements being taken during traiing & Testing
2. avtivityLabels : The various types of activities performed during the trainings & testing process
3. training_subject and test_subject : Contains the list of subjects IDs in the training & testing process. This is a numeric feild
4. training_activity and test_activity : Contains the list activities performed in the training & testing process when the measurements are taken
5. training_features and test_features : Contains all the observations taken of the subjects for the activities performed during training & testing process
6. subject : Combined list of subject IDs in training & testing process
7. activity : Combined list of activities performed in training & testing
8. total_features : Combined list of measurements taken during testing & trainings process
9. complete_data : Combined list of all measurements including the corresponding subject Ids and the activities performed
10. columns_with_mean_STD : Selected columns in the complete_data where the mean & standard deviation measurements are stored
11. columns_selected : Selected columns where the mean & standard deviation measurements, the activity & subject information are stored
12. extracted_data : Extracted data from the columns selected in the columns_selected list from teh complete data of measurements
13. final_tidy_data : Data set with the average of each measurement types for each activity and each subject
