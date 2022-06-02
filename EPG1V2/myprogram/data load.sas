data class;
	set sashelp.class;
	where Age >= 15;
	keep Name Age Height Weight;
	format Height 4.1 Weight 3.;
run;