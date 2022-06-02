/**********************************************/
/* DO NOT EDIT THE CODE BELOW                 */
/* This program creates the data for EPG2V2   */
/* in SAS OnDemand for Academics              */
/**********************************************/

%let path=C:\Users\hazkaw\CouseraSASLang\EPG2V2\data;
libname PG2 "&path";

%include "&path/pg2v2.sas";


