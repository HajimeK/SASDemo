data cars_new;
	set sashelp.cars;
	where Origin ne "USA";
	Profit = MSRP-Invoice;
	Source = "Non-US Cars";
	format Profit dollar10.;
	keep Make Model MSRP Invoice Profit Source;
run;