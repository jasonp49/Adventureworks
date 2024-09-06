--just 2 columns here.  Looks like some salespeople have more territories than others

SELECT employeekey, salesterritorykey 
from salespersonregion;
272	1
272	2
272	3
272	4
272	5
272	6
277	1
277	2
277	3
277	4
277	5
277	6
277	7
277	8
277	9
277	10
281	2
281	3
281	5

--Looks like some salespeople have more territories than others  

SELECT employeekey, COUNT(salesterritorykey)
from salespersonregion
group by employeekey
order by 2 desc;

277	10
272	6
281	3
290	3
291	2
282	2
286	2
287	1
285	1
284	1
294	1
293	1
292	1
289	1
288	1
296	1
283	1
295	1
