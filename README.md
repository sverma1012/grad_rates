# Graduating Midwest Liberal Arts Colleges :mortar_board:
### The influence of student characteristics on graduation rates 
 
My research studies the influence of student characteristics such as gender, race, and financial status on the probability of graduating a private liberal arts college in the Midwest. This document explains how the files in the folders can be used to replicate the study and reproduce the results.

<hr>

## Contents and Structure

<b> Main folder </b> <br>
 
```diff
+ Verma-493-Project
```
<ul>
	<li>
		<b> Final Research Paper </b> <br>
		<i> Provides the introduction to the topic and data, and the results of the analysis with a discussion about its implications. </i>
	</li> <br>
	<li>
		<b> README file </b> <br>
		<i> Provides the information required to replicate the study. </i>
	</li> <br>
	<li>
		<b> Original Data folder </b>  <br>
		<ul> <br>
			<li>
				Original and Importable Data folders <br>
				<i> The data files obtained from the sources and the datasets used for processing, respectively. </i>
			</li> <br>
			<li>
				Metadata folder <br>
				<i> The Metadata file is a guide on how to obtain the original datasets from its sources and their descriptions. </i>
			</li> <br>
		</ul>
	</li>
	<li>
		<b> Command Files folder </b>
		<ul> <br>
			<li>
				processing.do <br>
				<i> consists of all the steps involved in transforming importable data files into full cleaned and processed data files that will be used to generate analysis data. </i>
			</li> <br>
			<li>
				summary.do <br>
				<i> consists of all the steps involved in generating summary statistics about the data. </i>
			</li> <br>
			<li>
				analysis.do <br>
				<i> consists of all the steps involved in generating the regression analysis results. </i>
			</li> <br>
		</ul>
	</li>
	<li>
		<b> Analysis Data folder </b> <br>
		<i> consists the datasets that are used to produce the regression results from analysis.do. </i>
	</li> <br>
	<li>
		<b> Documents folder </b>
		<ul> <br>
			<li>
				Final Research Paper and README files <br>
				<i> the Word documents of the final research paper and read me files. PDF versions are in the main folder. </i>
			</li> <br>
			<li>
				Data Appendix file <br>
				<i> statistical descriptions of the variables in each of the analysis datasets. </i>
			</li> <br>
		</ul>
	</li>
	</ul>
	
<hr>

## Creation of Importable Data Files

<p>
	The original datasets were obtained from the respective colleges’ websites. Refer to the <b> Metadata Guide </b> on further instructions on downloading these datasets.
</p>
<p>
	Since all the original data files are in a pdf format, the following method was used to create the importable version from the original data files:
</p>

<ol>
	<li>
		Open PDF file in Acrobat DC.
	</li>
	<li>
		Click on "Export PDF" in the right pane.
	</li>
	<li>
		Choose “spreadsheet" as the export format and then select “Microsoft Excel Workbook.”
	</li>
	<li>
		Click "Export."
	</li>
	<li>
		Save the converted file by clicking the “Save” button.
	</li>
</ol>

<p>
	Through this process the following original files were converted into importable excel documents:
</p>

<table>
	<tr>
		<th>
			<b> Original File </b>
		</th>
		<th>
			<b> Importable File </b>
	</tr>
	<tr>
		<th>
			4-yrGraduationBySex&Race.pdf
		</th>
		<th>
			4-yrGraduationBySex&Race.xlsx
		</th>
	</tr>
	<tr>
		<th>
			graduationByPell.pdf
		</th>
		<th>
			graduationByPell.xlsx
		</th>
	</tr>
	<tr>
		<th>
			CC_2010_20_graduationByPell.pdf
		</th>
		<th>
			CC_2010_20_graduationByPell.xlsx
		</th>
	</tr>
	<tr>
		<th>
			GC_graduationRates.pdf
		</th>
		<th>
			GC_graduationRates.xlsx
		</th>
	</tr>
	<tr>
		<th>
			LU_2003_14_graduationBySex.pdf
		</th>
		<th>
			LU_2003_14_graduationBySex.xlsx
		</th>
	</tr>
	<tr>
		<th>
			LU_2005_14_graduationByPell.pdf
		</th>
		<th>
			LU_2005_14_graduationByPell.xlsx
		</th>
	</tr>
	<tr>
		<th>
			LU_2005_14_graduationByRace.pdf
		</th>
		<th>
			LU_2005_14_graduationByRace.xlsx
		</th>
	</tr>
	<tr>
		<th>
			MC_2012_21_graduation.pdf
		</th>
		<th>
			MC_2012_21_graduation.xlsx
		</th>
	</tr>
</table>
	
<hr>

## Replicating the Study

<p>
	To replicate the research, use R Studio and the R programming language. Installation of various packages will be required; they are addressed within the command files, therefore, please read the command files to understand when and how to do the required installations.
</p>

<p>
	Copy the main folder (“Verma-493-Project”) onto your computer with the same layout as described above. The working directory should be the main folder- a command is run in each command file to ensure that the correct working directory is set to ensure the proper execution of the code. Please ensure that the path to the working directory in the command files corresponds with the path in your computer.
</p>

<p>
	First, run the processing.do command file to ensure that the importable data files are wrangled to usable forms for the statistical and regression analysis. The outputs from this command file are three datasets (racec.xlsx, sex.xlsx, pell.xlsx) that will be saved in the ‘Analysis Data’ folder. Second, the summary.do command file should be run to produce frequency tables and histograms that describe each variable. There are no external outputs from this command file. Lastly, the analysis.do command file should be run to retrieve the regression results. No external output will be generated from this command file.
</p>

<p>
	Please note that each of these command files can be “knitted” to produce Word documents with the comments, code, and results. To do so, click the ‘Knit’ button at the top center of the screen.
</p>
