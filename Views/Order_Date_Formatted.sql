CREATE VIEW OrderToDate AS 
	SELECT DISTINCT orderdate AS orderstring,
		TO_DATE(LTRIM(orderdate, SPLIT_PART(orderdate, ' ', 1)),'Month DD YYYY') AS dateorder
	FROM sales
	ORDER BY 2;

SELECT  *
FROM  OrderToDate
LIMIT 10;
Saturday, July 1, 2017	2017-07-01
Sunday, July 2, 2017	2017-07-02
Monday, July 3, 2017	2017-07-03
Tuesday, July 4, 2017	2017-07-04
Wednesday, July 5, 2017	2017-07-05
Thursday, July 6, 2017	2017-07-06
Friday, July 7, 2017	2017-07-07
Saturday, July 8, 2017	2017-07-08
Sunday, July 9, 2017	2017-07-09
Monday, July 10, 2017	2017-07-10






