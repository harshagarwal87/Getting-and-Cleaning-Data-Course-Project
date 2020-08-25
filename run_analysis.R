
library(reshape2)

# Reading Data sets in R
Start <- Sys.time()
Path_main <- "getdata_projectfiles_UCI HAR Dataset/"
Path_test <- "getdata_projectfiles_UCI HAR Dataset/test/"
Path_train <- "getdata_projectfiles_UCI HAR Dataset/train/"
Subject_test <-
  read.table(paste(Path_test, "subject_test.txt", sep = ""))
X_test <- read.table(paste(Path_test, "X_test.txt", sep = ""))
y_test <- read.table(paste(Path_test, "y_test.txt", sep = ""))
Subject_train <-
  read.table(paste(Path_train, "subject_train.txt", sep = ""))
X_train <- read.table(paste(Path_train, "X_train.txt", sep = ""))
y_train <- read.table(paste(Path_train, "y_train.txt", sep = ""))

# Reading the features & activity file containing column names
Features <- read.table(paste(Path_main, "features.txt", sep = ""))
Activities <-
  read.table(paste(Path_main, "activity_labels.txt", sep = ""))

# Combining test & train data sets
Subject <- rbind(Subject_test, Subject_train)
X_combined <- rbind(X_test, X_train)
y_combined <- rbind(y_test, y_train)

# Naming the columns
names(Subject) <- "Subject"
names(X_combined) <- Features$V2
names(y_combined) <- "Activity"

# Combining all data sets into one
Combined_Data <- cbind(Subject, y_combined, X_combined)

# Creating a list of features which have mean or std of the activity
Required_features <-
  Features[grep("(mean|std)\\(\\)", Features$V2), 2]

# Filtering columns
Combined_Data <-
  Combined_Data[, c("Subject", "Activity", Required_features)]

#Replacing activity ID with respective activity name
Combined_Data$Activity <-
  merge(Combined_Data$Activity, Activities, by = 1) [, 2]

# Removing () and - from column names
names(Combined_Data) <- gsub("\\(\\)|-", "", names(Combined_Data))

# Renaming column names
names(Combined_Data) <- gsub("^t", "Time", names(Combined_Data))
names(Combined_Data) <-
  gsub("^f", "Frequency", names(Combined_Data))
names(Combined_Data) <-
  gsub("BodyBody", "Body", names(Combined_Data))
names(Combined_Data) <-
  gsub("Acc", "Accelerometer", names(Combined_Data))
names(Combined_Data) <-
  gsub("Gyro", "Gyroscope", names(Combined_Data))
names(Combined_Data) <-
  gsub("Mag", "Magnitude", names(Combined_Data))
names(Combined_Data) <-
  gsub("freq", "Frequency", names(Combined_Data))
names(Combined_Data) <- gsub("mean", "Mean", names(Combined_Data))
names(Combined_Data) <- gsub("std", "STD", names(Combined_Data))

# Melting the data set & casting with mean of the variables
melted_Data <- melt(Combined_Data, id = c("Subject", "Activity"))
tidy_Data <- dcast(melted_Data, Subject + Activity ~ variable, mean)

# Writing the data set to disk
write.table(tidy_Data, "tidy.txt", row.name = FALSE)





