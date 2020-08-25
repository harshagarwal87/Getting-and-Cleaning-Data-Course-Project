# Getting-and-Cleaning-Data-Course-Project


## Project Scope
The goal of the `Coursera` project for `Getting and Cleaning Data` is to read in the data set, and create an output that is a `tidy` data set.

The data used for the project represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

Data set used can be downloaded from [data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

# Prequisites
Below are prequisites required before running [run_analysis.R](run_analysis.R):

- Package: [reshape2 package](http://cran.r-project.org/web/packages/reshape2/index.html). Use `install.package("reshape2")` to install the package if not already installed.
- Download and unzip the [data set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) in working directory

# Output

Output of the project is tidy data set [tidy.txt](tidy.txt) file. More details about the file and steps invlolved in creating it can be found in [CodeBook](CodeBook.md).