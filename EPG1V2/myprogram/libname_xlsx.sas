options validvarname=v7;
libname xlslib xlsx "C:/Users/hazkaw/EPG1V2/data/np_info.xlsx";

proc contents data=xlslib.parks out=out1;
run;

libname xlslib clear;