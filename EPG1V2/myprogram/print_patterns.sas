options validvarname=v7;
libname xlslib xlsx "C:/Users/hazkaw/EPG1V2/data/storm.xlsx";


proc print data = xlslib.storm_summary (obs=10);
	var Basin EndDate MaxWindMPH MinPressure Name Season StartDate Type;
run;

proc means data = xlslib.storm_summary;
	var EndDate MaxWindMPH MinPressure Season StartDate;
run;

proc univariate data = xlslib.storm_summary;
	var EndDate MaxWindMPH MinPressure Season StartDate;
run;

proc freq data = xlslib.storm_summary;
	tables Basin Type Season;
run;

/* Wherea clause where comparison with numeric */
proc print data = xlslib.storm_summary;
	var Basin EndDate MaxWindMPH MinPressure Name Season StartDate Type;
	where MaxWindMPH >= 156;
run;

/* Where clause with feature data */
proc print data = xlslib.storm_summary;
	var Basin EndDate MaxWindMPH MinPressure Name Season StartDate Type;
	where Basin = "WP";
run;

/* Where clause with feature data */
proc print data = xlslib.storm_summary;
	var Basin EndDate MaxWindMPH MinPressure Name Season StartDate Type;
	where Basin in ("WP" "SI");
run;

/* Where clause with date */
proc print data = xlslib.storm_summary;
	var Basin EndDate MaxWindMPH MinPressure Name Season StartDate Type;
	where StartDate >= "01JUL2016"d;
run;

libname xlslib clear;