SELECT *
  FROM information_schema.columns
 WHERE table_schema = 'public'
   AND table_name   = 'salesperson';
employeekey
employeeid
salesperson
title
upn

SELECT *
FROM salesperson
limit 5;
272	502097814	Stephen Jiang	North American Sales Manager	stephen-jiang@adventureworks.com
277	112432117	Brian Welcker	Director of Sales	brian-welcker@adventureworks.com
281	841560125	Michael Blythe	Sales Representative	michael-blythe@adventureworks.com
282	191644724	Linda Mitchell	Sales Representative	linda-mitchell@adventureworks.com
283	615389812	Jillian Carson	Sales Representative	jillian-carson@adventureworks.com
