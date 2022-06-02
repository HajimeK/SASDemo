***********************************************************;
*  Activity 6.02                                          *;
*    1) Complete the PROC EXPORT step to read the         *;
*       PG1.STORM_FINAL SAS table and create a            *;
*       comma-delimited file named STORM_FINAL.CSV. Use   *;
*       &outpath to substitute the path of the output     *;
*       folder.                                           *;
*    2) Run the program and view the text file:           *;
*                                                         *;
*       SAS Studio - Navigate to the output folder in the *;
*       Navigation pane, right-click on storm_final.csv,  *;
*       and select View File as Text.                     *;
*                                                         *;
*       Enterprise Guide - Select Open -> Navigate to the *;
*       output folder in the Servers pane, right click    *;
*       storm_final.csv and select Open.                  *;
***********************************************************;
*  Syntax                                                 *;
*                                                         *;
*    PROC EXPORT DATA=input-table                         *;
*                OUTFILE="output-file"                    *;
*                <DBMS=identifier> <REPLACE>;             *;
*    RUN;                                                 *; 
***********************************************************;
%let outpath=C:\Users\hazkaw\EPG1V2\output;
%let spoutpath=C:\Users\hazkaw\EPG1V2\output\southpacific.xlsx;

options validvarname=v7;
libname pg1 xlsx "C:/Users/hazkaw/EPG1V2/data/storm.xlsx";
libname xlsout xlsx "&spoutpath";

data storm_final;
	set pg1.storm_summary;
	where MinPressure > 0;
run;

proc export
	data = storm_final
	outfile = "&outpath\storm_final.csv"
	dbms = csv replace;
run;  

data SouthPacific;
	set pg1.storm_summary;
	where Basin = 'SP';
run;

proc export
	data = storm_final
	outfile = "&spoutpath"
	dbms = xlsx replace;
run; 

proc means data=storm_final noprint maxdec=1;
	where BASIN = "SP";
	var MaxWindMPH;
	class season;
	ways 1;
	output out=xlsout.Seasons_Stat n=Count mean=AvgMaxWindMPH max = StrongetsWindMPH;
run;
