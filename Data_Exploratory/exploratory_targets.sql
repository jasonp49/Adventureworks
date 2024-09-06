SELECT *
  FROM information_schema.columns
 WHERE table_schema = 'public'
   AND table_name   = 'targets';
employeeid
target
targetmonth

SELECT employeeid, target, targetmonth
FROM targets
limit 5;
90836195	500000.00	Friday, December 1, 2017
112432117	500000.00	Saturday, July 1, 2017
139397894	500000.00	Friday, December 1, 2017
191644724	500000.00	Friday, September 1, 2017
502097814	500000.00	Saturday, July 1, 2017

SELECT target, employeeid
FROM targets
order by target desc
limit 5;
36500000.00	112432117
33000000.00	112432117
30000000.00	112432117
11000000.00	139397894
10000000.00	139397894

--someone seems to have the highest targets
SELECT target, employeeid, targetmonth
FROM targets
where employeeid = 112432117
order by target desc;
36500000.00	112432117	Wednesday, September 1, 2021
33000000.00	112432117	Tuesday, September 1, 2020
30000000.00	112432117	Sunday, September 1, 2019
5000000.00	112432117	Sunday, August 1, 2021
4500000.00	112432117	Saturday, August 1, 2020
4000000.00	112432117	Thursday, August 1, 2019

--summer has highest targets!

SELECT target, employeeid, targetmonth
FROM targets
where targetmonth like '%Sept%2020'
order by target desc;
33000000.00	112432117	Tuesday, September 1, 2020
3250000.00	502097814	Tuesday, September 1, 2020
1750000.00	61161660	Tuesday, September 1, 2020
1000000.00	982310417	Tuesday, September 1, 2020
1000000.00	987554265	Tuesday, September 1, 2020
1000000.00	139397894	Tuesday, September 1, 2020

SELECT target, employeeid, targetmonth 
FROM targets
order by target asc;
10000.00	758596752	Saturday, February 1, 2020
25000.00	481044938	Monday, July 1, 2019
25000.00	481044938	Friday, January 1, 2021
25000.00	134219713	Tuesday, January 1, 2019
25000.00	481044938	Wednesday, January 1, 2020
50000.00	758596752	Sunday, September 1, 2019
50000.00	758596752	Thursday, August 1, 2019
50000.00	134219713	Friday, March 1, 2019
50000.00	954276278	Friday, January 1, 2021

--winter has lower targets

SELECT target, employeeid, targetmonth
FROM targets
where targetmonth like '%Feb%2020'
order by target asc;
10000.00	758596752	Saturday, February 1, 2020
50000.00	481044938	Saturday, February 1, 2020
150000.00	954276278	Saturday, February 1, 2020
200000.00	615389812	Saturday, February 1, 2020
200000.00	716374314	Saturday, February 1, 2020

--lets filter out our top performer and see who has highest August targets
SELECT target, employeeid, targetmonth
FROM targets
where employeeid != 112432117 and targetmonth like '%Aug%'
order by target desc;
11000000.00	139397894	Sunday, August 1, 2021
10000000.00	139397894	Saturday, August 1, 2020
9000000.00	139397894	Thursday, August 1, 2019
3000000.00	502097814	Sunday, August 1, 2021
2950000.00	502097814	Wednesday, August 1, 2018
2750000.00	502097814	Saturday, August 1, 2020
2500000.00	502097814	Thursday, August 1, 2019
1500000.00	502097814	Tuesday, August 1, 2017
1500000.00	61161660	Saturday, August 1, 2020
1500000.00	61161660	Sunday, August 1, 2021
1400000.00	61161660	Thursday, August 1, 2019
1250000.00	61161660	Wednesday, August 1, 2018
1200000.00	191644724	Wednesday, August 1, 2018
1000000.00	191644724	Saturday, August 1, 2020
1000000.00	191644724	Thursday, August 1, 2019
1000000.00	982310417	Thursday, August 1, 2019
1000000.00	982310417	Saturday, August 1, 2020
1000000.00	987554265	Saturday, August 1, 2020
1000000.00	191644724	Sunday, August 1, 2021

--lets put the date string in DATE format so we can put in chronological order
SELECT 
	TO_DATE(LTRIM(targetmonth, SPLIT_PART(targetmonth, ' ', 1)),'Month DD YYYY') AS DateFormatted,
	target
FROM targets
where employeeid = 112432117
order by 1 asc;
2017-07-01	500000.00
2017-08-01	1500000.00
2017-09-01	1000000.00
2017-10-01	1000000.00
2017-11-01	2200000.00
2017-12-01	1750000.00
2018-01-01	650000.00
2018-02-01	1750000.00
2018-03-01	1500000.00
2018-04-01	750000.00
2018-05-01	2000000.00
2018-06-01	1500000.00
