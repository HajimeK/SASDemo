***********************************************************;
*  Activity 4.08                                          *;
*    1) Run the program and examine the results. Why is   *;
*       Ocean truncated? What value is assigned when      *;
*       Basin='na'?                                       *;
*    2) Modify the program to add a LENGTH statement to   *;
*       declare the name, type, and length of Ocean       *;
*       before the column is created.                     *;
*    3) Add an assignment statement after the KEEP        *;
*       statement to convert Basin to uppercase. Run the  *;
*       program.                                          *;
*    4) Move the LENGTH statement to the end of the DATA  *;
*       step. Run the program. Does it matter where the   *;
*       LENGTH statement is in the DATA step?             *;
***********************************************************;
*  Syntax                                                 *;
*       LENGTH char-column $ length;                      *;
***********************************************************;
options validvarname=v7;
libname pg1 xlsx "C:/Users/hazkaw/EPG1V2/data/storm.xlsx";

data storm_summary2;
	set pg1.storm_summary;
	*Add a LENGTH statement;
	keep Basin Season Name MaxWindMPH Ocean;
	*Add assignment statement;
	OceanCode=substr(Basin,2,1);
	Basin = upcase(Basin);
	length Ocean $ 10;
	if OceanCode="I" then Ocean="Indian";
	else if OceanCode="A" then Ocean="Atlantic";
	else Ocean="Pacific";
/* 	length Ocean $ 10; */
run;

