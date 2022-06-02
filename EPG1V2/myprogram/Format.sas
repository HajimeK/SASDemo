options validvarname=v7;
libname pg1 xlsx "C:/Users/hazkaw/EPG1V2/data/storm.xlsx";

proc print data=pg1.storm_damage;
	format Date ddmmyy8. Cost dollar14.;
run; 