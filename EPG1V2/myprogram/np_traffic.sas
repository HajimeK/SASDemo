/* options validvarname=v7; */
proc import
	datafile = "C:/Users/hazkaw/EPG1V2/data/np_traffic.csv"
	dbms = csv
	out=traffic
	replace;
run;

proc contents data = traffic;
run;