SELECT *
  FROM information_schema.columns
 WHERE table_schema = 'public'
   AND table_name   = 'sales';

salesordernumber
orderdate
productkey
resellerkey
employeekey
salesterritorykey
quantity
unitprice
sales
cost

select sum(sales)
from sales;
77513704

select count(salesordernumber)
from sales;
57851

select employeekey, sum(sales)
from sales
where employeekey = 282
group by employeekey;
282	10154506

select resellerkey, sum(sales)
from sales
where resellerkey = 312
group by resellerkey ;
312	492548

--Convert date string into DATE datatype  
select 	orderdate, 
		sum(sales), 
		TO_DATE(LTRIM(orderdate, SPLIT_PART(orderdate, ' ', 1)),'Month DD YYYY') as conv_date
from sales
where orderdate like '%April%2020'
group by 1
order by 3
limit 5;
Wednesday, April 1, 2020	41607	2020-04-01
Friday, April 3, 2020	    29048	2020-04-03
Saturday, April 4, 2020	  47295	2020-04-04
Sunday, April 5, 2020	    74250	2020-04-05
Monday, April 6, 2020	   156976	2020-04-06

with cte_date as (
	select 	
		TO_DATE(LTRIM(orderdate, SPLIT_PART(orderdate, ' ', 1)),'Month DD YYYY') as dateordered
from sales
)
select MIN(dateordered) as earliest, MAX(dateordered) as latest
from cte_date;
2017-07-01	2020-05-31

select count(distinct resellerkey)
from sales;
632

select distinct resellerkey, sum(sales)
from sales
group by resellerkey 
order by sum(sales) desc
limit 5;
697	882083
328	816881
514	803507
678	794615
170	773209

--Identify salespeople with multiple territories
select employeekey, count(distinct salesterritorykey)
from sales
group by employeekey 
order by count(distinct salesterritorykey) DESC;
272	5
281	4
283	4
287	3
282	3
290	3
288	2
286	1














