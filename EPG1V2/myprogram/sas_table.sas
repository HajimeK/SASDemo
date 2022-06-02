options validvarname=v7;
libname pg1 xlsx "C:/Users/hazkaw/EPG1V2/data/storm.xlsx";
libname out "C:/Users/hazkaw/EPG1V2/output";

data out.Storm_cat5;
	set pg1.storm_summary;
	where MaxWindMPH >= 156 and StartDate >= "01JAN2000"d;
	keep Season Basin Name Type MaxWindMPH;
run;
