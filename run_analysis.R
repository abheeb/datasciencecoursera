if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/Dataset.zip", method = "curl")
unzip(zipfile="./data/Dataset.zip",exdir="./data")

setwd("/Users/abheebrahmnalkar/Desktop/datasciencecoursera/data/UCI HAR Dataset") #Changing working directory to the folder where extracted files are

# Reading 6 files in R
ActivityTest <- read.table("./test/Y_test.txt", header = FALSE)
ActivityTrain <- read.table("./train/Y_train.txt", header = FALSE)
SubjectTrain <- read.table("./train/subject_train.txt", header = FALSE)
SubjectTest <- read.table("./test/subject_test.txt", header = FALSE)
FeaturesTest <- read.table("./test/X_test.txt", header = FALSE)
FeaturesTrain <- read.table("./train/X_train.txt", header = FALSE)

# Reading activity labels 
Activity_Labels <- read.table("./activity_labels.txt", header = FALSE)
Activity_Labels$V2 <- as.character(Activity_Labels$V2) # Changing labels column to character for later use

# Get the column headers for 561 variables from Features file
FeatureList <- read.table("./features.txt", header = FALSE) #This varaible will store column names of the 561 columns that appear in the FeaturesTrain and FeaturesTest variables
Feature_Column_Headers <- FeatureList[,2] # Extracts 561 column names in a single vector.
Feature_Colum_Headers <- as.vector(Feature_Column_Headers) # This forces a simple character vector to hold the column names

# merging test and train

Subject <- rbind(SubjectTrain, SubjectTest)
Features <- rbind(FeaturesTrain, FeaturesTest)
Activity <- rbind(ActivityTrain, ActivityTest)

# Giving column names to Subject and Activity variables as Subject and Activity
names(Subject) <- "Subject"
names(Activity) <- "Activity"

# Giving column names to all 561 variables in Features 
names(Features) <- Feature_Column_Headers

# Now all the variables have column headers.  It's time to combine them into a single dataframe.
data <- cbind(Subject, Activity, Features)

# Extract only mean and std.
test1 <- data[, grep("mean\\(", colnames(data))] # This gets all mean variables.  MEAN NEEDS TO BE MEAN()
test2 <- data[, grep("std", colnames(data))] # This gets std variables

# Do a cbind on Subject, Activity, test1 and test2
subset_data <- cbind(Subject, Activity, test1, test2)

# Changing Activity column values by actual names like standing, walking

subset_data$Activity <- as.character(subset_data$Activity) # changing column class as character so that replacement is of same class
  # Chaging all six activity values one line at a time
subset_data$Activity[subset_data$Activity == 1] <- Activity_Labels[1,2]
subset_data$Activity[subset_data$Activity == 2] <- Activity_Labels[2,2]
subset_data$Activity[subset_data$Activity == 3] <- Activity_Labels[3,2]
subset_data$Activity[subset_data$Activity == 4] <- Activity_Labels[4,2]
subset_data$Activity[subset_data$Activity == 5] <- Activity_Labels[5,2]
subset_data$Activity[subset_data$Activity == 6] <- Activity_Labels[6,2]

# group the data by subject and activity and then taking mean for the other variables using aggregate command.
library(plyr)
new_subset_data <- aggregate(. ~ Subject + Activity, subset_data, mean)
