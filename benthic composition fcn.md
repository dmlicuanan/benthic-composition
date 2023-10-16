## The benthic composition function

### Introduction
One of the main benchmarks used to assess the condition of a coral reef is hard coral cover (HCC). To assess HCC, marine scientists typically take photos of the reef benthos using the photo-transect method, then score the images using Coral Point Count with Excel extensions (CPCe). The resulting CPCe file provides the 
% HCC of the assessed station, as well as the percent composition of other benthic categories in that particular station.

The benthic composition function automates the calculation of the percent cover of major benthic categories *across several coral reef stations*. Hence, it comes in handy in determining the average % HCC in whatever scale (e.g. municipal, provincial, regional, national) or classification (e.g. MPA, non-MPA) the user desires. 

### Limitations
The format of CPCe files are determined by the codefile used in scoring the photo-transect images. The benthic composition function was specifically written for summarizing the contents of CPCe files formatted by "NACRE_SHINE_40.txt", the codefile used in the latest nationwide assessment of coral reefs [(see reference)](http://philjournalsci.dost.gov.ph/pdf/pjs_pdf/vol146no2/initial_findings_of_the_nationwide_assessment_of_philippine_coral_reefs.pdf). 


### Instructions 
1. Create an empty directory. Transfer/paste the CPCe files that you want to summarize into the directory.
2. In R or R Studio, set the working directory to the newly created directory. 
3. Optional: run getwd() to double-check the file path of the working directory.
4. Download the benthic composition function.
5. Source the R code "benthic composition fcn.R".
6. The function returns the mean % cover of the following benthic categories for the CPCe files in the directory:
	* ABIOTIC (AB): abiotic components such as rubble, sand, silt 
	* ALGAE ASSEMBLAGE (AA): turf algae, crustose coralline algae, dead coral, etc.
	* CORAL (HC): hard corals
	* HALIMEDA (HA)
	* MACROALGAE (MA): *Sargassum*, *Codium*, *Kappaphycus*, and the like
	* OTHER BIOTA (OB): soft corals, crown-of-thorns, *Diadema*, sponges, etc.
	* TAPE, SHADOW, BLOCKS, IND (TWB): indeterminate objects 

### Additional notes
Folders can be nested. For example, folders for municipalities can be placed within the folders corresponding to their respective provinces. The function will read all CPCe files (all .xls and .xlsx files) within the sub-directories of the working directory. Hence, CPCe files can be organized hierarchically. The working directory just needs to be reset to the file path of the desired grouping before the function is run. 