data baseball2;
    set sashelp.baseball;
    BatAvg=CrHits/CrAtBat;
    label BatAvg=“Batting Average”;
run;


proc print data=baseball2 label;
    var Name Team BatAvg;
run;


proc means data=baseball2;
    var BatAvg;
run;

proc freq data=sashelp.shoes nlevels;
	tables  Region / nocum;
run;

proc freq data=sashelp.cars;
    where Cylinders in (4,6) and 
          Type in('Sedan', 'SUV');
    tables Type*Cylinders / crosslist;
run;

proc means data=sashelp.heart;
    var Cholesterol;
    class Weight_Status;
run; 

title1 'Fall Semester';
title2 'Students';

proc print data=baseball2 label;
    var Name Team BatAvg;
run;

title2 'Class';

proc print data=baseball2 label;
    var Name Team BatAvg;
run;

title 'School';

proc print data=baseball2 label;
    var Name Team BatAvg;
run; 