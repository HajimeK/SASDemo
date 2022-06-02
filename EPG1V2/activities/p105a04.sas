***********************************************************;
*  Activity 5.04                                          *;
*    1) Create a temporary output table named storm_count *;
*       by completing the OUT= option in the TABLES       *;
*       statement.                                        *;
*    2) Add the NOPRINT option on the PROC FREQ statement *;
*       to suppress the printed report.                   *;
*    3) Run the program. Which statistics are included in *;
*       the output table? Which month has the highest     *;
*       number of storms?                                 *;
***********************************************************;
options validvarname=v7;
libname pg1 xlsx "C:/Users/hazkaw/EPG1V2/data/storm.xlsx";

title "Frequency Report for Basin and Storm Month";

proc freq data=pg1.storm_summary order=freq nlevels;
	tables StartDate / out= storm_count;
run;

proc freq data=pg1.storm_summary order=freq nlevels;
	tables StartDate / out= storm_count;
	format StartDate monname.;
run;

ods graphics on;
ods noproctitle;
title "Frequency report for Basing and Storm Month";
proc freq data=pg1.storm_summary order=freq nlevels;
	tables Basin StartDate / nocum plots=freqplot(orient=horizontal scale=percent);
	format StartDate monname.;
run;
title;
ods proctitle;