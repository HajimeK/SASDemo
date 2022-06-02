***********************************************************;
*  Activity 6.05                                          *;
*    1) Run the program and open the pressure.pptx file.  *;
*    2) Modify the ODS statements to change the output    *;
*       destination to RTF. Change the style to sapphire. *;
*    3) Run the program and open the pressure.rtf file.   *;
*    4) Add the STARTPAGE=NO option in the first ODS RTF  *;
*       statement to eliminate the page break.            *;
*    5) Rerun the program and examine the results in      *;
*       Microsoft Word.                                   *;
***********************************************************;
%let outpath=C:\Users\hazkaw\EPG1V2\output;
libname pg1 xlsx "C:\Users\hazkaw\EPG1V2\data\storm.xlsx";

/* ods powerpoint file="&outpath/pressure.pptx" style=powerpointlight; */
ods rtf file="&outpath/pressure.rtf" style=sapphire startpage=no;

data storm_final;
	set pg1.storm_summary;
	where MinPressure > 600;
	Basin = upcase(Basin);
run;

title "Minimum Pressure Statistics by Basin";
ods noproctitle;
proc means data=storm_final mean median min maxdec=0;
    class Basin;
    var MinPressure;
run;

title "Correlation of Minimum Pressure and Maximum Wind";
proc sgscatter data=storm_final;
	plot minpressure*maxwindmph;
run;
title;  

ods rtf close;
