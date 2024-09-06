SELECT sp.employeekey, sp.salesperson, SUM(s.sales) AS TotalSales
FROM salesperson sp
JOIN sales s ON s.employeekey = sp.employeekey 
WHERE title = 'Sales Representative' AND s.orderdate LIKE '%2020%'
GROUP BY sp.employeekey, sp.salesperson
ORDER BY 3 DESC;
282	Linda Mitchell	1611781
291	Jae Pak	1370149
292	Ranjit Varkey Chudukatil	1258490
281	Michael Blythe	1168821
283	Jillian Carson	1035787
285	Tsvi Reiter	856783
287	Shu Ito	856693
288	Jos√© Saraiva	810626
295	Rachel Valdez	694179
293	Tete Mensa-Annan	694148
289	David Campbell	534192
286	Pamela Ansman-Wolfe	501263
296	Lynn Tsoflias	492768
284	Garrett Vargas	425204

SELECT sp.title, sp.salesperson, SUM(s.sales) AS TotalSales
FROM salesperson sp
JOIN sales s ON s.employeekey = sp.employeekey 
WHERE title != 'Sales Representative' AND s.orderdate LIKE '%2020%'
GROUP BY sp.title, sp.salesperson
ORDER BY 3 DESC;
North American Sales Manager	Stephen Jiang	212243
European Sales Manager	Amy Alberts	98283
Pacific Sales Manager	Syed Abbas	22364

SELECT sp.title, sp.salesperson, SUM(s.sales) AS TotalSales
FROM salesperson sp
JOIN sales s ON s.employeekey = sp.employeekey 
WHERE s.orderdate LIKE '%Mar%2020%'
GROUP BY sp.title, sp.salesperson
ORDER BY SUM(s.sales) DESC;
Sales Representative	Jae Pak	353747
Sales Representative	Jos√© Saraiva	310791
Sales Representative	Jillian Carson	278232
Sales Representative	Michael Blythe	247998
Sales Representative	Linda Mitchell	237551
Sales Representative	Lynn Tsoflias	200523
Sales Representative	Shu Ito	189715
Sales Representative	Tsvi Reiter	181877
Sales Representative	Tete Mensa-Annan	151087
Sales Representative	Pamela Ansman-Wolfe	142163
Sales Representative	Garrett Vargas	111046
Sales Representative	David Campbell	109914
Sales Representative	Ranjit Varkey Chudukatil	88538
Sales Representative	Rachel Valdez	81726
European Sales Manager	Amy Alberts	53487
North American Sales Manager	Stephen Jiang	1413

SELECT sp.title, sp.salesperson, p.subcategory, SUM(s.sales) AS TotalSales
FROM salesperson sp
JOIN sales s ON s.employeekey = sp.employeekey 
JOIN products p ON p.productkey = s.productkey 
WHERE s.orderdate LIKE '%Mar%2020%' AND p.subcategory LIKE '%Frames%'
GROUP BY sp.title, sp.salesperson, p.subcategory 
ORDER BY SUM(s.sales) DESC
LIMIT 10;
Sales Representative	Michael Blythe	      Mountain Frames	34130
Sales Representative	Jae Pak	              Mountain Frames	21238
Sales Representative	Jos√© Saraiva	        Mountain Frames	17457
Sales Representative	Pamela Ansman-Wolfe	  Mountain Frames	13984
Sales Representative	Jae Pak	              Touring Frames	11627
Sales Representative	Garrett Vargas	      Touring Frames	8424
Sales Representative	Jos√© Saraiva	        Touring Frames	7818
Sales Representative	Shu Ito	              Mountain Frames	6502
Sales Representative	Jillian Carson	      Road Frames	5538
Sales Representative	Ranjit Varkey Chudukatil	Mountain Frames	5221

SELECT sp.salesperson, s.salesterritorykey, p.subcategory, 
	SUM(s.sales) AS TotalSales, SUM(s.quantity) AS QuantitySold, SUM(s.sales)/SUM(s.quantity) AS AvgSale
FROM salesperson sp
JOIN sales s ON s.employeekey = sp.employeekey 
JOIN products p ON p.productkey = s.productkey 
WHERE s.orderdate LIKE '%Mar%2020%' AND p.subcategory LIKE '%Frames%'
GROUP BY sp.salesperson, s.salesterritorykey, p.subcategory 
ORDER BY SUM(s.sales)/SUM(s.quantity) DESC
LIMIT 10;
Michael Blythe	  4	  Touring Frames	602	  1	  602
Garrett Vargas	  6	  Touring Frames	8424	20	421
Tete Mensa-Annan	1	  Touring Frames	5012	13	385
Jose Saraiva	    10	Touring Frames	7818	21	372
Jae Pak	          6	  Touring Frames	11627	32	363
Lynn Tsoflias	    9	  Touring Frames	1804	5	   360
Jae Pak	          6  	Mountain Frames	21238	59	359
Michael Blythe	  4  	Mountain Frames	28248	79	357
Jae Pak	          6  	Road Frames	      356	1	  356
Tsvi Reiter	      5  	Road Frames	    1426	4	  356

SELECT sp.salesperson, r.region, p.subcategory, 
	SUM(s.sales) AS TotalSales, SUM(s.quantity) AS QuantitySold, SUM(s.sales)/SUM(s.quantity) AS AvgSale
FROM salesperson sp
JOIN sales s ON s.employeekey = sp.employeekey 
JOIN products p ON p.productkey = s.productkey 
JOIN region r ON s.salesterritorykey = r.salesterritorykey
WHERE s.orderdate LIKE '%Feb%2020%' AND p.subcategory LIKE '%Frames%'
GROUP BY sp.salesperson, r.region, p.subcategory 
ORDER BY SUM(s.sales) DESC
LIMIT 5;
Ranjit Varkey Chudukatil	France	    Mountain Frames	35026	77	454
David Campbell	          Northwest	  Mountain Frames	17189	35	491
Michael Blythe	          Southwest	  Mountain Frames	15828	47	336
Rachel Valdez	            Germany	    Touring Frames	15243	36	423
Ranjit Varkey Chudukatil	France	    Touring Frames	15236	42	362

--Ranjit Varkey Chudukatil is performing well! Is it a fluke?

SELECT sp.salesperson, r.region, p.subcategory, 
	SUM(s.sales) AS TotalSales, SUM(s.quantity) AS QuantitySold, SUM(s.sales)/SUM(s.quantity) AS AvgSale
FROM salesperson sp
JOIN sales s ON s.employeekey = sp.employeekey 
JOIN products p ON p.productkey = s.productkey 
JOIN region r ON s.salesterritorykey = r.salesterritorykey
WHERE (s.orderdate LIKE '%2020%' OR s.orderdate LIKE '%2019%') AND p.subcategory LIKE '%Frames%'
GROUP BY sp.salesperson, r.region, p.subcategory 
ORDER BY SUM(s.sales) DESC
LIMIT 20;
Jae Pak	                  Canada	        Mountain Frames	452460	1267	357
Michael Blythe	          Southwest	      Mountain Frames	305193	820	372
Jae Pak	                  Canada	        Road Frames	    293857	804	365
Jillian Carson	          Northeast	      Road Frames	    254948	648	393
Ranjit Varkey Chudukatil	France	        Mountain Frames	249289	652	382
Jillian Carson	          Northeast	      Mountain Frames	204762	601	340
Rachel Valdez	            Germany	        Touring Frames	183946	425	432
Linda Mitchell	          Southwest	      Mountain Frames	178760	499	358
David Campbell	          Northwest	      Mountain Frames	175083	468	374
Ranjit Varkey Chudukatil	France	        Touring Frames	173637	402	431
Michael Blythe	          Southwest	      Road Frames	    170008	502	338
Ranjit Varkey Chudukatil	France	        Road Frames	    164436	445	369
Jose Saraiva	            United Kingdom	Mountain Frames	157974	429	368
Linda Mitchell	          Northwest	      Mountain Frames	156001	483	322
Tsvi Reiter	              Southeast	      Road Frames	    151381	393	385
Shu Ito	                  Southwest	      Road Frames	    142388	380	374
Linda Mitchell	          Southwest	      Road Frames	    138463	379	365
Tsvi Reiter	              Southeast	      Mountain Frames	137626	441	312
Tete Mensa-Annan	        Northwest	      Touring Frames	136809	310	441
Pamela Ansman-Wolfe	      Northwest	      Mountain Frames	125100	357	350

--
