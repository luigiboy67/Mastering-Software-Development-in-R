data basketball;
infile 'C:/STAT_330/basketball.dat';
length name $ 15;
input name $ 1-15 height 16-18 age 20-21 FGP 23-24 FTP 26-27 PPM 29-31 MPG 33-37 APM 39-41;
run;

proc print data = basketball;
run;

data basketball2;
set basketball;
run;

proc print data = basketball2;
run;

data tcdf;
t1 = probt(1.5,20);
t2 = probt(-1,10);
t3 = 1-probt(1.5,10);
run;

proc print data = tcdf;
run;

data inverset;
t_crit1 = tinv(.975,10);
t_crit2 = tinv(.975,20);
t_crit3 = tinv(.975,100);
run;

proc print data = inverset;
run;

proc print data = Stat330.eggs;
run;

data tech2A;
set Stat330.eggs;
if tech = 2;
run;

proc print data = tech2A;
run;

data tech2B;
set Stat330.eggs;
if tech = 2 then output;
run;

proc print data =  tech2B;
run;

data tech2C;
set Stat330.eggs;
if tech = 1 then output;
run;

proc print data = tech2C;
run;

data scores;
set Stat330.peopleinfo;
if avescore >= 90 then grade = 'A';
if 80<=avescore<90 then grade = 'B';
if 70<=avescore<80 then grade = 'C';
if 60<=avescore<70 then grade = 'D';
if avescore < 60 then grade = 'F';
if avescore = . then grade = .;
run;

proc print data = scores;
format dob mmddyy10.;
run;

data scores3a;
set scores;
length status $ 5;
status = 'Sad';
if grade in('A','B','C') then do;
pass = 'yes';
status = 'Happy';
end;
if grade = 'D' then pass = 'yes';
if grade = 'F' then pass = 'no';
run;

proc print data = scores3a;
run;

data scores3c;
set scores;
length status $ 5;
if grade in('A','B','C') then do;
pass = 'yes';
status = 'happy';
end;
else
status = 'sad';
if grade = 'D' then pass = 'yes';
if grade = 'F' then pass = 'no';
run;

proc print data = scores3c;
format dob mmddyy10.;
run;

proc print data = Stat330.cars;
run;

data cars4a;
set Stat330.cars;
if Mileage >= 33 then do;
MPG = 'Good';
money = 'Extra cash to spend';
end;
else if 27<=Mileage<33 then do;
MPG = 'OK';
money = 'Getting by';
end;
else if Mileage < 27 then do;
MPG = 'Bad';
money = 'Need more';
end;
run;

proc print data = cars4a;
run;

data example5;
set Stat330.peopleinfo;
drop Test3 dob avescore;
if Test1 = . and Test2 = . then
performance = 'Missing Score';
else if Test1 >=80 and Test2 >= 80 then
performance = 'Doing great';
else if Test1 >= 80 or Test2 >= 80 then
performance = 'Doing fine';
else if Test1 < 80 and Test2 < 80 then
performance = 'Study some more';
else
performance = 'Not Calculated';
run;

proc print data = example5;
run;

data tech2;
set Stat330.eggs;
where tech = 2;
run;

proc print data = tech2;
run;

proc print data = Stat330.eggs;
where tech = 2;
run;

proc means data = Stat330.eggs;
where tech = 1;
var fat;
title 'tech=1';
run;

proc means data = Stat330.eggs;
where tech = 2;
var fat;
title 'tech=2';
run;

proc means data = Stat330.eggs;
class tech;
var fat;
title 'The SAS System';
run;

data tech7a (where = (tech=2));
set Stat330.eggs;
run;

proc print data = tech7a;
run;

data tech7b;
set Stat330.eggs (where = (tech=2));
run;

proc print data = tech7b;
run;

data tech1 (where=(tech=1)) tech2 (where=(tech=2));
set Stat330.eggs;
proc print data = tech1; title 'tech1 dataset';
proc print data = tech2; title 'tech2 dataset';
run;
title 'The SAS System';

data earn8;
savings = 2000;
do year = 1 to 20;
	interest = savings * .04;
	savings = savings + interest;
	output;
end;
run;

proc print data = earn8;
run;

data test;
x = 0;
do i = 1 to 3;
	do j = 1 to 2;
		x = x + 1;
	end;
end;
run;

proc print data = test;
run;

data earn10;
year=0;
savings=20000;
do until (savings>=100000);
	year = year + 1;
	interest = savings * .04;
	savings = interest + savings;
	output;
end;
run;

proc print data = earn10;
run;

data earn11;
year = 0;
savings = 20000;
do while(savings < 50000);
	year = year + 1;
	interest = savings * .04;
	savings = interest + savings;
	output;
end;
run;

proc print data = earn11;
run;

