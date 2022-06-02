***********************************************************;
*  Activity 6.04                                          *;
*    1) Add ODS statements to create an Excel file named  *;
*       pressure.xlsx in the output folder. Be sure to    *;
*       close the ODS location at the end of the program. *;
*       Run the program and open the Excel file.          *;
*       * SAS Studio: Navigate to the output folder in    *;
*       the Files and Folders section of the navigation   *;
*       pane. Select pressure.xlsx and click Download.    *;
*       * Enterprise Guide: Click the Results - Excel tab *;
*       and click Download.                               *;
*    2) Add the STYLE=ANALYSIS option in the first ODS    *;
*       EXCEL statement. Run the program again and open   *;
*       the Excel file.                                   *;
***********************************************************;

*Add ODS statement;
%let outpath=C:\Users\hazkaw\EPG1V2\output;
libname pg1 xlsx "C:\Users\hazkaw\EPG1V2\data\storm.xlsx";
ods excel file="&outpath\pressure.xlsx"
	style = analysis
	options(sheet_name = "Pressure Stats");
	
data storm_summary;
	set pg1.storm_summary;
	where MinPressure > 600;
run;

title "Minimum Pressure Statistics by Basin";
ods noproctitle;
proc means data=storm_summary mean median min maxdec=0;
    class Basin;
    var MinPressure;
run;

ods excel options(sheet_name = "scatter");
title "Correlation of Minimum Pressure and Maximum Wind";
proc sgscatter data=storm_summary;
	plot minpressure*maxwindmph;
run;
title;

ods excel options(sheet_name = "Pressure Distributions");
title "Histogram of Minimum Pressure";
proc sgplot data=storm_summary;
	histogram MinPressure;
	density MinPressure;
run;
title;  

*Add ODS statement;

ods proctitle;
ods excel close;
