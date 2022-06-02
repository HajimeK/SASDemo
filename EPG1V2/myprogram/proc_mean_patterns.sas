options validvarname=v7;
libname pg1 xlsx "C:/Users/hazkaw/EPG1V2/data/storm.xlsx";

data storm_summary;
	set pg1.storm_summary;
	where Season >= 2010;
	keep _all_;
	Basin = upcase(Basin);
run;

proc freq data=storm_summary;
	tables Basin; 
run;


proc means data = storm_summary mean std median min max maxdec=0;
	var MinPressure;
	where Season >= 2010;
	class Basin Type;
	ways 0 1 2;
run;

proc means data=storm_summary maxdec=0 n mean min;
    var MinPressure;
    where Season >=2010;
    class Season Basin;
    ways 1;
run;

proc means data=storm_summary maxdec=0 n mean min;
    var MinPressure;
    where Season >=2010;
    class Season Basin;
    ways 1;
run;