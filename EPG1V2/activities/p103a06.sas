***********************************************************;
*  Activity 3.06                                          *;
*    1) Modify the OUT= option in the PROC SORT statement *;
*       to create a temporary table named STORM_SORT.     *;
*    2) Complete the WHERE and BY statements to answer    *;
*       the following question: Which storm in the North  *;
*       Atlantic basin (NA or na) had the strongest       *;
*       MaxWindMPH?                                       *;
***********************************************************;
options= validvarname=v7;
libname pg1 xlsx "C:/Users/hazkaw/EPG1V2/data/storm.xlsx";

proc sort data=pg1.storm_summary out=storm_sort;
	where Basin in ("NA" "na");
	by DESCENDING MaxWindMPH;
run;
