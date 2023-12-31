# benthic_composition_summary.R

### Introduction

One of the main benchmarks used to assess the condition of a coral reef is hard coral cover (HCC). To assess HCC, marine scientists may take photos of the reef benthos using the photo-transect method, then score the images using Coral Point Count with Excel extensions (CPCe). The resulting CPCe file provides the % HCC of the assessed station, as well as the percent composition of other benthic categories in that particular station.

The benthic_composition_summary.R script automates the calculation of the percent cover of major benthic categories *across several coral reef stations*. Hence, it comes in handy in determining the average % HCC in whatever scale (e.g. municipal, provincial, regional, national) or classification (e.g. MPA, non-MPA) the user desires.

### Limitations

The format of CPCe files are determined by the codefile used in scoring the photo-transect images. The benthic composition summary script was specifically written for summarizing the contents of CPCe files formatted by "NACRE_SHINE_40.txt", the codefile used in the 2015-2017 nationwide assessment of coral reefs [(see reference)](https://philjournalsci.dost.gov.ph/images/pdf/pjs_pdf/vol146no2/initial_findings_of_the_nationwide_assessment_of_philippine_coral_reefs.pdf).

### Instructions

1.  Create an empty directory. Move/copy the CPCe files that you want to summarize into the directory.
2.  In R or R Studio, set the working directory to the newly created directory.
3.  Optional: run getwd() to double-check the file path of the working directory.
4.  Download and run "benthic_composition_summary.R".
5.  The script returns the mean % cover of the following benthic categories for the CPCe files in the directory:
    -   ABIOTIC (AB): abiotic components such as rubble, sand, silt
    -   ALGAE ASSEMBLAGE (AA): turf algae, crustose coralline algae, dead coral, etc.
    -   CORAL (HC): hard corals
    -   HALIMEDA (HA)
    -   MACROALGAE (MA): *Sargassum*, *Codium*, *Kappaphycus*, and the like
    -   OTHER BIOTA (OB): soft corals, crown-of-thorns, *Diadema*, sponges, etc.
    -   TAPE, SHADOW, BLOCKS, IND (TWB): indeterminate objects

### Additional notes

Folders can be nested. For example, folders for municipalities can be placed within the folders corresponding to their respective provinces. The function will read all CPCe files (all .xls and .xlsx files) within the sub-directories of the working directory. Hence, CPCe files can be organized hierarchically. The working directory just needs to be reset to the file path of the desired grouping before the function is run.

# flat_file_generator.R

### Introduction

In assessing the condition of a coral reef, marine scientists may take photos of the reef benthos using the photo-transect method, then score the images using Coral Point Count with Excel extensions (CPCe). The resulting CPCe file provides the % cover of each benthic category in the assessed station.

The % cover of major benthic categories allow scientists to make crude analyses on the state of the reefs in an area. For example, by examining % hard coral cover, a reef can be classified to be one in "poor", "fair", "good", or "excellent" condition [(see reference)](https://philjournalsci.dost.gov.ph/images/pdf/pjs_pdf/vol146no2/initial_findings_of_the_nationwide_assessment_of_philippine_coral_reefs.pdf). However, further dissecting the composition of the reef may pave way for deeper insights into the state of the reef. By looking into the percent cover of subcategories, scientists can note the presence or absence of certain taxa, and compare their % covers.

The flat file generator is a handy tool in allowing marine scientists to gain deeper insights into photo-transect data. As the name suggests, the R script extracts all important subcategory data and generates a flat file (written in .csv format), given a directory of CPCe files. The flat file can then be manipulated to create pivot tables and other summary tables. The flat file geneator saves the user time in extracting data from CPCe files individually.

### Limitations

The format of CPCe files are determined by the codefile used in scoring the photo-transect images. The flat file generator was specifically written for extracting the contents of CPCe files formatted by "NACRE_SHINE_40.txt", the codefile used in the 2015-2017 nationwide assessment of coral reefs [(see reference)](https://philjournalsci.dost.gov.ph/images/pdf/pjs_pdf/vol146no2/initial_findings_of_the_nationwide_assessment_of_philippine_coral_reefs.pdf).

### Instructions

1.  Create an empty directory. Move/copy the CPCe files that you want to create a flat file for into the directory.
2.  Optional: rename the CPCe file names into descriptive or easily identifiable codes since a column containing the file names is created in the flat file.
3.  In R or R Studio, set the working directory to the newly created directory.
4.  Optional: run getwd() to double-check the file path of the working directory.
5.  Download and run "flat_file_generator.R".
6.  The R script writes the flat file, named "flatfile.csv" into the working directory. The flat file has the following columns:
    -   FILE: the file name (and path, if folders are nested) of the CPCe file (sans the file extension)
    -   SUBCATEGORY
    -   TRANSECT
    -   \% COVER
    -   CATEGORY: the major benthic category classification of each subcategory

### Additional notes

-   Folders can be nested. For example, folders for municipalities can be placed within the folders corresponding to their respective provinces. The R script will read all CPCe files (all .xls and .xlsx files) within the sub-directories of the working directory. Hence, CPCe files can be organized hierarchically. The working directory just needs to be reset to the file path of the desired grouping before the script is run.
-   The major categories to which subcategories belong can be edited in the script (in the event that the user wants to create major categories of his own). In the codefile around which the script was built, the major categories are as follows:
    -   ABIOTIC (AB): abiotic components such as rubble, sand, silt
    -   ALGAE ASSEMBLAGE (AA): turf algae, crustose coralline algae, dead coral, etc.
    -   CORAL (HC): hard corals
    -   HALIMEDA (HA)
    -   MACROALGAE (MA): *Sargassum*, *Codium*, *Kappaphycus*, and the like
    -   OTHER BIOTA (OB): soft corals, crown-of-thorns, *Diadema*, sponges, etc.
    -   TAPE, SHADOW, BLOCKS, IND (TWB): indeterminate objects
-   In the script, a separate major category was made for soft coral as its percent cover (with that of hard coral) is used to calculate live coral cover.

# Other repository contents
-   The sample_cpce directory contains sample CPCe files to run the scripts with.
-   NACRE_SHINE_40.txt is the codefile used in CPCe to score the photo-transect images.

***

Author's note: 

Original scripts were written in August 2018 to serve as my final output for the training program Data, Connectivity and Intelligence: Data Science Track under the project titled, “Learning at Scale Vol. I: Data Science Track” jointly organized by the Philippine Council for Industry, Energy and Emerging Technology Research and Development (PCIEERD), Department of Science and Technology, and MOOCSX PH.

Last edit: 2023-10-17
