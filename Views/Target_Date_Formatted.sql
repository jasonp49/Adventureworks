--THIS IS USUALLY UNNECESSARY, USE (LIKE '%July%2017') TO AGGREGATE DATES IN NATIVE STRING FORMAT

CREATE VIEW TargetToDate AS 
	SELECT DISTINCT targetmonth                                                    AS TargetString,
		TO_DATE(LTRIM(targetmonth, SPLIT_PART(targetmonth, ' ', 1)),'Month DD YYYY') AS TargetDate
	FROM targets
	GROUP BY 1
	ORDER BY 2;

SELECT *
FROM TargetToDate
Saturday, July 1, 2017	2017-07-01
Tuesday, August 1, 2017	2017-08-01
Friday, September 1, 2017	2017-09-01
Sunday, October 1, 2017	2017-10-01
Wednesday, November 1, 2017	2017-11-01
Friday, December 1, 2017	2017-12-01
Monday, January 1, 2018	2018-01-01
Thursday, February 1, 2018	2018-02-01
Thursday, March 1, 2018	2018-03-01
Sunday, April 1, 2018	2018-04-01
Tuesday, May 1, 2018	2018-05-01
Friday, June 1, 2018	2018-06-01
Sunday, July 1, 2018	2018-07-01
Wednesday, August 1, 2018	2018-08-01
Saturday, September 1, 2018	2018-09-01
Monday, October 1, 2018	2018-10-01
Thursday, November 1, 2018	2018-11-01
Saturday, December 1, 2018	2018-12-01
Tuesday, January 1, 2019	2019-01-01
Friday, February 1, 2019	2019-02-01
Friday, March 1, 2019	2019-03-01
Monday, April 1, 2019	2019-04-01
Wednesday, May 1, 2019	2019-05-01
Saturday, June 1, 2019	2019-06-01
Monday, July 1, 2019	2019-07-01
Thursday, August 1, 2019	2019-08-01
Sunday, September 1, 2019	2019-09-01
Tuesday, October 1, 2019	2019-10-01
Friday, November 1, 2019	2019-11-01
Sunday, December 1, 2019	2019-12-01
Wednesday, January 1, 2020	2020-01-01
Saturday, February 1, 2020	2020-02-01
Sunday, March 1, 2020	2020-03-01
Wednesday, April 1, 2020	2020-04-01
Friday, May 1, 2020	2020-05-01
Monday, June 1, 2020	2020-06-01
Wednesday, July 1, 2020	2020-07-01
Saturday, August 1, 2020	2020-08-01
Tuesday, September 1, 2020	2020-09-01
Thursday, October 1, 2020	2020-10-01
Sunday, November 1, 2020	2020-11-01
Tuesday, December 1, 2020	2020-12-01
Friday, January 1, 2021	2021-01-01
Monday, February 1, 2021	2021-02-01
Monday, March 1, 2021	2021-03-01
Thursday, April 1, 2021	2021-04-01
Saturday, May 1, 2021	2021-05-01
Tuesday, June 1, 2021	2021-06-01
Thursday, July 1, 2021	2021-07-01
Sunday, August 1, 2021	2021-08-01
Wednesday, September 1, 2021	2021-09-01
Friday, October 1, 2021	2021-10-01
Monday, November 1, 2021	2021-11-01
Wednesday, December 1, 2021	2021-12-01
