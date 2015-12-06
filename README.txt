Youthful Cities Capstone Project
---------------------------------------------------------------------------------

Data Analytics, Predictive Analytics and Big Data - Ryerson University
CKME136 - Data Analytics: Capstone Crs - F2015
Kie Gouveia

---------------------------------------------------------------------------------

This repository contains the final capstone project submission for the Data Analytics, Predictive Analytics and Big Data 
program at Ryerson University. 


Folders:
	> app
	> documentations
	> proj_files
	
Note that the final report is titled "Gouveia, Kie - Final_Report.pdf" in the proj_files folder
and the code used to build the application may be found in the "app.R" in the app folder.
	
	
### app ###
Contains the files necessary to run the interactive RShiny Dashboard
----------------------------------------------------------------------------------

	Files:
		1. app.R - the actual app, contain both the ui and server components of the app
		2. final.ranking.values.unweight.csv - the output from yc_index_final.used by the app
		3. raw.sample - a test file containing raw data from youthful cities dataset. 
		4. www FOLDER
			contains cascading style sheet to customize RShiny Dashboard
		5. rsconnect FOLDER
			created in the process of creating app.
			

			
### documentation ###
Contains documentation of steps out of R and some previously submitted files
---------------------------------------------------------------------------------

	Files:
		1. excel.data.transformations.txt - documentation of all excel cleaning steps which were carried out prior to R import
		2. Gouveia, Kie - Literature Review.docx - Literature Review Submission
		3. variable_audit - full audit of raw dataset and standardization techniques used by YouthfulCities
	
	
	
### proj_files ###
Analysis & files provided by YouthfulCities and created through analysis
----------------------------------------------------------------------------------
		
Files:
	1. data FOLDER - conatins all original data provided by YouthfulCities and subsequently created csv files.
		1a. 2015_YouthfulCities_Index_Ranking_Sheet_Values.xlsx - the output once 2015_YouthfulCities_Index_Ranking_Sheet.xlsx has been transformed
			according to excel.data.transformations.txt
	2. rsconnect FOLDER - test folder for RShiny app
	3. Gouveia, Kie - Final_Report.pdf - Final report
	4. final.ranking.values.unweight.csv - the output from yc_index_final.used by the app
	5. yc.index_final.Rmd - All cleaning, imputation and analysis
	6. yc.index_final.html - htmal knit version of yc.index_final.Rm6