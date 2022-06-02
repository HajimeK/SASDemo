***********************************************************;
*  Activity 3.03                                          *;
*    1) Change the value in the %LET statement from NA to *;
*       SP.                                               *;
*    2) Run the program and carefully read the log.       *;
*       Which procedure did not produce a report?         *;
*       What is different about the WHERE statement in    *;
*       that step?                                        *;
***********************************************************;
options validvarname=v7;
libname pg1 xlsx "C:/Users/hazkaw/EPG1V2/data/storm.xlsx";

%let BasinCode=SP;

proc means data=pg1.storm_summary;
	where Basin="&BasinCode";
	var MaxWindMPH MinPressure;
run;

proc freq data=pg1.storm_summary;
/* 	Single Quotation Mart cannot be used with MACRO */
/* 	where Basin='&BasinCode'; */
	where Basin="&BasinCode";
	tables Type;
run;
