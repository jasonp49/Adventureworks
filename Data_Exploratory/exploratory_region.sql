SELECT *
  FROM information_schema.columns
 WHERE table_schema = 'public'
   AND table_name   = 'region';
salesterritorykey
region
country
Group

SELECT *
FROM region;
1	Northwest	      United States	  North America
2	Northeast	      United States	  North America
3	Central	        United States	  North America
4	Southwest	      United States	  North America
5	Southeast	      United States	  North America
6	Canada	        Canada	        North America
7	France	        France	        Europe
8	Germany	        Germany	        Europe
9	Australia	      Australia	      Pacific
10United Kingdom	United Kingdom	Europe

SELECT r.region, sum(s.sales) 
FROM sales s
JOIN region r ON r.salesterritorykey = s.salesterritorykey 
GROUP BY 1
ORDER BY 2 DESC 
Southwest	     17993464
Canada	       13868976
Northwest	     12000314
Southeast	      7635082
Central	        7630024
Northeast	      6711984
France	        4525777
United Kingdom	3881093
Germany	        1876784
Australia	      1390206

SELECT r.region, sum(s.sales) AS August2019Sales
FROM sales s
JOIN region r ON r.salesterritorykey = s.salesterritorykey 
WHERE s.orderdate LIKE '%Aug%2019%'
GROUP BY 1
ORDER BY 2 DESC 
Northwest	      743082
France	        728611
Southwest	      673150
Canada	        575143
Central	        383240
Northeast	      288552
Southeast	      279168
Germany	        263657
United Kingdom	223749
Australia	      145934
