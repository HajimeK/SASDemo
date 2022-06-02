options validvarname=v7;
libname pg1 xlsx "C:/Users/hazkaw/EPG1V2/data/storm.xlsx";
libname out "C:/Users/hazkaw/EPG1V2/output";

/* default create report */
proc sql;
	select Season, Name, summary.Basin, MaxWIndMPH, MinPressure/100 as pres
	from pg1.storm_summary as summary left join pg1.basin_codes as codes
	on upcase(storm_summary.Basin) = basin_codes.Basin
	where MinPressure > 600
	order by Season desc, Name;
quit;


proc sql;
	create table work.stormjoin as
	select Season, Name, summary.Basin, MaxWIndMPH, MinPressure/100 as pres
	from pg1.storm_summary as summary left join pg1.basin_codes as codes
	on upcase(storm_summary.Basin) = basin_codes.Basin
	where MinPressure > 600
	order by Season desc, Name;
quit;