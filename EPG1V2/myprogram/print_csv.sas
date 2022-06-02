%let outpath=C:\Users\hazkaw\EPG1V2\output;
ods csvall file="&outpath\cars.csv";
proc print data = sashelp.cars noobs;
	var Make Model Type MSRP MPG_City MPG_Highway;
	format MSRP dollar8.;
run;
ods csvall close;

proc export data = sashelp.cars
	dbms = xlsx
	outfile = "&outpath\cars.xlsx";
run;
