## Read "flat file generator.md" for instructions in using the script

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
  obj <- read_excel(path = list[i], sheet = "Data Summary", range = "A20:F125")
  ## Remove rows with empty cells
  obj <- obj[complete.cases(obj),]
  ## Add column bearing file name (sans file extension)
  obj$FILE <- gsub(".xls","", list[i])
  frame <- rbind(frame, obj)
}

## Rename SUBCATEGORY column header
names(frame)[1] <- "SUBCATEGORY"

## Rename column headers for transects
for(i in 2:6) {
  names(frame)[i] <- paste("T", i-1, sep = "")
}

## Reformat data frame into a flat file
melted <- melt(frame, id.vars = c("FILE","SUBCATEGORY")) 

## Organize subcategories into original major benthic categories
## Note: major categories to which subcategories belong can be edited here 
AA <- "\\(AA\\)|\\(CA\\)|\\(DC\\)|\\(DCA\\)|\\(DIS\\)"
AB <- "\\(GRV\\)|\\(R\\)|\\(S\\)|\\(RCK\\)|\\(SI\\)"
HA <- "\\(HA\\)"
HC <- "\\(ACAN\\)|\\(ACB\\)|\\(ACC\\)|\\(ACD\\)|\\(ACH\\)|\\(ACT\\)|\\(ACR\\)|\\(AST\\)|\\(AF\\)|\\(CAU\\)|\\(COE\\)|\\(COS\\)|\\(CYP\\)|\\(DIP\\)|\\(ECHY\\)|\\(ECHI\\)|\\(EUP\\)|\\(FAV\\)|\\(FVI\\)|\\(CMR\\)|\\(GAL\\)|\\(GONIA\\)|\\(GONIO\\)|\\(HEL\\)|\\(HYD\\)|\\(ISO\\)|\\(LEPA\\)|\\(LEPS\\)|\\(LOB\\)|\\(MER\\)|\\(MILL\\)|\\(MON\\)|\\(MONTB\\)|\\(MONTE\\)|\\(MONTF\\)|\\(MYC\\)|\\(CB\\)|\\(BUB\\)|\\(CE\\)|\\(CF\\)|\\(FOT\\)|\\(CM\\)|\\(OULA\\)|\\(OULO\\)|\\(OXY\\)|\\(PACE\\)|\\(PACF\\)|\\(PAV\\)|\\(PEC\\)|\\(PLAT\\)|\\(POC\\)|\\(PORB\\)|\\(PORE\\)|\\(PORM\\)|\\(SER\\)|\\(STY\\)|\\(SYM\\)|\\(TUBI\\)|\\(TURB\\)"
MA <- "\\(COD\\)|\\(KAPP\\)|\\(MA\\)|\\(SARG\\)"
NOTES <- "\\(BLEC\\)|\\(ZACRF\\)|\\(ZAGARF\\)|\\(ZAGATF\\)|\\(ZDENF\\)|\\(ZEUPF\\)|\\(ZFAVF\\)|\\(ZCMRF\\)|\\(ZMUSF\\)|\\(ZNSC\\)|\\(ZOC\\)|\\(ZPOCF\\)|\\(ZPORF\\)"
OB <- "\\(COTS\\)|\\(COR\\)|\\(DIA\\)|\\(GORG\\)|\\(ISIS\\)|\\(OT\\)|\\(SG\\)|\\(SP\\)|\\(ZO\\)"
SC <- "\\(SC\\)"
TWB <- "\\(TWB\\)"

## Add column for major benthic category based on classification of subcategories
melted$CATEGORY <- ifelse(grepl(AA, melted$SUBCATEGORY), "AA", "")
melted$CATEGORY <- ifelse(grepl(AB, melted$SUBCATEGORY), "AB", melted$CATEGORY)
melted$CATEGORY <- ifelse(grepl(HA, melted$SUBCATEGORY), "HA", melted$CATEGORY)
melted$CATEGORY <- ifelse(grepl(HC, melted$SUBCATEGORY), "HC", melted$CATEGORY)
melted$CATEGORY <- ifelse(grepl(MA, melted$SUBCATEGORY), "MA", melted$CATEGORY)
melted$CATEGORY <- ifelse(grepl(NOTES, melted$SUBCATEGORY), "NOTES", melted$CATEGORY)
melted$CATEGORY <- ifelse(grepl(OB, melted$SUBCATEGORY), "OB", melted$CATEGORY)
melted$CATEGORY <- ifelse(grepl(SC, melted$SUBCATEGORY), "SC", melted$CATEGORY)
melted$CATEGORY <- ifelse(grepl(TWB, melted$SUBCATEGORY), "TWB", melted$CATEGORY)

## Rename flat file headers
names(melted)[3] <- "TRANSECT"
names(melted)[4] <- "% COVER"

## Write .csv file of directory
write.csv(melted, file = "flat file.csv", row.names=FALSE)