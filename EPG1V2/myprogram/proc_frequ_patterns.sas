options validvarname=v7;
libname pg1 xlsx "C:/Users/hazkaw/EPG1V2/data/storm.xlsx";

data storm_summary;
	set pg1.storm_summary;
	where MinPressure > 0;
	Bain = upcase(Basin);
run;

ods graphics on;
ods noproctitle;
proc freq data = storm_summary order = freq nlevels;
	tables Basin MinPressure / nocum plots=freqplot(orient = horizonta scale = percent);
	where MinPressure > 0;
run;
ods proctitle;
ods graphics off;

proc freq data = pg1.storm_summary nlevels;
	tables Basin StartDate / nocum;
	where MinPressure > 0;
	format SartDate monname.;
run;

proc freq data = pg1.storm_summary;
	tables Basin*StartDate / norow nocol nofreq;
	format StartDate monname.;
	label Basin = "Basin" StartDate = "Start Month";
run;

proc freq data = pg1.storm_summary;
	tables Basin*StartDate / norow nocol;
	format StartDate monname.;
	label Basin = "Basin" StartDate = "Start Month";
run;

