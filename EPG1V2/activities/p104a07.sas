***********************************************************;
*  Activity 4.07                                          *;
*    1) Add the ELSE keyword to test conditions           *;
*       sequentially until a true condition is met.       *;
*    2) Change the final IF-THEN statement to an ELSE     *;
*       statement.                                        *;
*    3) How many storms are in PressureGroup 1?           *;
***********************************************************;
options validvarname=v7;
libname pg1 xlsx "C:/Users/hazkaw/EPG1V2/data/storm.xlsx";

data storm_cat;
	set pg1.storm_summary;
	keep Name Basin MinPressure StartDate PressureGroup;
	*add ELSE keyword and remove final condition;
	if MinPressure=. then PressureGroup=.;
	else if MinPressure<=920 then PressureGroup=1;
	else PressureGroup=0;
run;

proc freq data=storm_cat;
	tables PressureGroup;
run;
