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

