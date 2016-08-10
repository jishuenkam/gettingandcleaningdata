# Assignment for Getting and Cleaning Data

The ultimate goal of the assignment is to produce a tidy data set with the average of each variable (i.e. all the measurement with "mean" and "std") for each subject (labelled 1 to 30) and activity (Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing and Laying).

We first recall what a tidy data is. The definition of tidy data as per Hadley Wickham is the following:

1. Each variable forms a column.
2. Each observation forms a row.
3. Each type of observational unit forms a table.

I have created the R script named `run_analysis.R` which I used to create my tidy data set named `tidy_data.txt`, a file in tab delimited format. To run my script, you should download the file from [Coursera](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and extract it to a directory of your preference. Next, set your working directory to a path that ends with `UCI HAR Dataset` which contains the `test` and `training` folders plus some other text files. For example, the working directory should look something like:

```javascript
setwd("C:/Users/ABC/Desktop/Coursera/Getting and Cleaning Data/Peer Graded Assignment/UCI HAR Dataset")
```

Once you extract the file, please do not alter any file in the `UCI HAR Dataset` folder otherwise I would not be able to guarantee that my script will run successfully. The running of the script may take some time, depending on how capable is your computer processor, but the end result should be a text file named `tidy_data.txt` being produced in your working directory.

My R script contains quite a bit of comment, so it can be quite long-winded for someone. Nonetheless, the goal is to make the script self-contained and self-explanatory for someone who sees the code for the first time.

Lastly, I believe that my tidy data set produced does obey the 3 characteristics of tidy
data set, since each row is an observation, each column is a variable and that each type of observational unit forms a table.

To read my tidy data in R, use the following code which utilizes the `RCurl` package:

```javascript
install.packages("RCurl")
library(RCurl)
x <-getURL("https://raw.githubusercontent.com/jishuenkam/gettingandcleaningdata/343ca51d09d6a31ccb8f6016de70fc99c95a2ce1/tidy_data.txt")
df <- read.table(text = x)
View(df)
```

Acknowledgement:

[David Hood](https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/) and various Stack Overflow articles.