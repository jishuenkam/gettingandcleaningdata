####Part 1, merging training and test sets

#first set the directory (you should set it to the path that I mentioned in
#the README file)
#setwd("C:/Users/Kam/Desktop/Coursera/Getting and Cleaning Data/Peer Graded Assignment/UCI HAR Dataset")

#load the training set dataframe
train <- read.table("./train/X_train.txt") 

#load the test set dataframe
test <- read.table("./test/X_test.txt")

#extract the column labels from features.txt
label <- read.table("./features.txt") #the label will be on second column, V2
label_names <- c(as.character(label$V2))

#attach the label to the dataframes
names(train) <- label_names; names(test) <- label_names

#using rbind to merge the train and test sets
merged <- rbind(train, test)

####Part 2: extract the measurement that has mean and standard deviation

#first extract names that have mean and store their positions 
pos1 <- grep("(.*)mean(.*)", label_names) #find the position of column with "mean"
pos2 <- grep("(.*)std(.*)", label_names) #find the position of column with "std"
totalpos <- c(pos1, pos2) #this numeric vector contains all the numbers that
                          #correspond to the columns that we want

#susbset the dataframe based on the column number in totalpos
merged_mstd <- merged[, totalpos]

####Part 3: 

#Now we need to append an extra column on activity to the dataframe 
#First we prepare the column for attachment later.

train_act <- as.numeric(readLines("./train/y_train.txt"))
test_act <- as.numeric(readLines("./test/y_test.txt"))
activity <- c(train_act, test_act)

#attach the activity column to our dataframe
merged_mstd$activity <- activity

#next, load the labels from activity_labels.txt in dataframe format
df <- read.table("./activity_labels.txt")
names(df) <- c("activity", "activity_names")

#Merge the two dataframes based on the activity numeric number using "join" from
#plyr package. The "merge" function does not preserve the row ordering.

library(plyr)
merged_mstd_new <- join(merged_mstd, df, by = "activity")

##Part 4
#Given that we need to compute the mean of each variable FOR each combination of
#activity and subject, we need to append the subject column 

#Prepare the subject column and then append to the dataframe

id_train <- as.numeric(readLines("./train/subject_train.txt"))
id_test <- as.numeric(readLines("./test/subject_test.txt"))
id <- c(id_train, id_test)

#append the id column to the data frame
merged_mstd_new$id <- id

#need to melt the dataframe
library(reshape2)
merged_melt <- melt(merged_mstd_new, id.vars = c("id", "activity_names"))

#use dcast to show the mean of each variable for every combination of id and
#activity name
tidy_data <- dcast(merged_melt, id + activity_names ~ variable, mean)

#remove irrelevant column
tidy_data$activity <- NULL

#need to output the tidy_data into a text file
write.table(tidy_data, "./tidy_data.txt", sep = "\t", row.names = FALSE)
