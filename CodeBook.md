This is a short description of the files containing the output data described in the exercise.

* The merged dataframe is in the file "merged data.txt"
    * This data contains the "UCI HAR Dataset" for training and 
      testing. Both features (X) and labels (y), as well as 
      subject IDS and activity labels are included as columns.
* The merged dataframe only containing means and standard 
deviations is in the file "mean_or_std_merged.txt"
    * This data contains the columns from the "merged data.txt" 
      (see above) that have either "std()" or "mean()" in the 
      header name.
* The dataframe with merged values for each subject ID is in the file "subject_id_averages.txt"
    * This data takes all rows from "mean_or_std_merged.txt" (see 
      above) with identical values in the "Subject_ids" column, computes the mean for each column and stores this in in a single 
      row for the individual subject_id.
* The dataframe with merged values for each activity is in the file "activity_labels_averages.txt"
    * This data takes all rows from "mean_or_std_merged.txt" (see 
      above) with identical values in the "Activity_label" column, computes the mean for each column and stores this in in a single 
      row for the individual Activity_label.