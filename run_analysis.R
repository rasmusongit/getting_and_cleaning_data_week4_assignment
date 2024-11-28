## First we load in all the data
feature_names <- read.csv("UCI HAR Dataset/features.txt", sep="\n", header = FALSE)
names(feature_names) <- c("Feature_name")
labels_names <- read.csv("UCI HAR Dataset/activity_labels.txt", sep="\n", header=FALSE)
names(labels_names) <- c("Activity_label")

train_x_data <- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE)
names(train_x_data) <- feature_names[,]
train_y_data <- read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE)
names(train_y_data) <- c("Activity_label")
train_subject_ids <- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE)
names(train_subject_ids) <- c("Subject_ids")

test_x_data <- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE)
names(test_x_data) <- feature_names[,]
test_y_data <- read.table("UCI HAR Dataset/test/y_test.txt", header=FALSE)
names(test_y_data) <- c("Activity_label")
test_subject_ids <- read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE)
names(test_subject_ids) <- c("Subject_ids")

# making the merged data, first we cbind everything for the train data, then rbind it to the test data
train_merged_data <- cbind(train_subject_ids, train_x_data, train_y_data)
test_merged_data <- cbind(test_subject_ids, test_x_data, test_y_data)
merged_data <- rbind(train_merged_data, test_merged_data)

# Now to select only the columns that are taking the mean or std of something
# Remembering also to select IDs and labels
# Filter for selecting mean or std
mean_or_std_filter <- (grepl("mean()", names(merged_data),fixed=TRUE) | grepl("std()", names(merged_data),fixed=TRUE))
# Filter for ids and labels
id_label_selection <- c("Subject_ids", "Activity_label")
merged_data_only_id_labels <- merged_data[,id_label_selection]

mean_or_std_merged_no_labels <- merged_data[,mean_or_std_filter]
# Put it together
mean_or_std_merged <- cbind(merged_data_only_id_labels, mean_or_std_merged_no_labels)

# Now make the average for each activity (label) and each subject (subject id) 

