## Read "benthic composition fcn.md" for instructions in using the function

## Install required packages (if needed)
requiredpackages <- c("readxl", "reshape2")
missingpackages <- requiredpackages[!(requiredpackages %in% installed.packages()[,"Package"])]
if(length(missingpackages)) install.packages(missingpackages)

## Load required packages
library(readxl) 
library(reshape2) 

## Create list of CPCe files to read; files in subdirectories included
list <- list.files(pattern = "*.xls", recursive = TRUE)

## Create empty data frame
frame <- data.frame()

## Read CPCe files and bind into one data frame
for(i in 1:length(list)) {
    obj <- read_excel(path = list[i], sheet = "Data Summary", range = "A10:H17", col_types = c("guess",rep("skip",6),"guess"))
    names(obj)[1] <- "BENTHIC_CATEGORY"
    obj$FILE <- list[i]
    frame <- rbind(frame, obj)
}

## Restructure data frame for summary table
melted <- melt(frame, id.vars = c("FILE","BENTHIC_CATEGORY")) 
directory <- dcast(melted, FILE ~ BENTHIC_CATEGORY) 
summary <- dcast(melted, BENTHIC_CATEGORY ~ variable,mean)

## Print summary table 
print(summary)
