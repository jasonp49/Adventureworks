SELECT *
  FROM information_schema.columns
 WHERE table_schema = 'public'
   AND table_name   = 'reseller';
resellerkey
businesstype
reseller
city
stateprovince
countryregion

SELECT *
FROM reseller
limit 5;
277	Specialty Bike Shop	  The Bicycle Accessories Company	Alhambra	    California	United States
455	Value Added Reseller	Timely Shipping Service	        Alpine	      California	United States
609	Value Added Reseller	Good Toys	                      Auburn	      California	United States
492	Specialty Bike Shop	  Basic Sports Equipment	        Baldwin Park	California	United States
365	Specialty Bike Shop	  Distinctive Store	              Barstow	      California	United States
