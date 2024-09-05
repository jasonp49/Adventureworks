SELECT *
  FROM information_schema.columns
 WHERE table_schema = 'public'
   AND table_name   = 'products';
productkey
product
standardcost
color
subcategory
category
backgroundcolorformat
fontcolorformat

SELECT product, standardcost 
FROM products
order by standardcost desc;
Touring Front Wheel	96.80
ML Mountain Front Wheel	92.81
Half-Finger Gloves, L	9.71
Half-Finger Gloves, M	9.71
Half-Finger Gloves, S	9.71
LL Mountain Tire	9.35
ML Road Tire	9.35
Half-Finger Gloves, L	9.16
Half-Finger Gloves, M	9.16
Half-Finger Gloves, S	9.16
Road-450 Red, 58	884.71
Road-450 Red, 44	884.71

--Standard cost is Varchar :(

--recreate table
CREATE TABLE public.products (
	productkey				int4,
	product					varchar(50),
	standardcost			numeric(10,2),
	color					varchar(50),
	subcategory				varchar(50),
	category				varchar(50),
	backgroundcolorformat	varchar(50),
	fontcolorformat			varchar(50)
);

--test it out
SELECT product, standardcost 
FROM products
order by standardcost desc;
Road-150 Red, 62	2171.29
Road-150 Red, 52	2171.29
Road-150 Red, 48	2171.29
Road-150 Red, 44	2171.29
Road-150 Red, 56	2171.29
Mountain-100 Silver, 38	1912.15
--it worked!

--explore all products
SELECT category, subcategory, product, MAX(standardcost)
FROM products
group by category, subcategory, product, standardcost
order by category, subcategory, standardcost desc;
Accessories	Bike Racks	      Hitch Rack - 4-Bike	    44.88
Accessories	Bike Stands	      All-Purpose Bike Stand	59.47
Accessories	Bottles and Cages	Mountain Bottle Cage	  3.74
Accessories	Bottles and Cages	Road Bottle Cage	      3.36
Accessories	Bottles and Cages	Water Bottle - 30 oz.	  1.87

--search for a specific color and size bike
SELECT category, subcategory, product, MAX(standardcost)
FROM products
where subcategory = 'Road Bikes' and product like '%Red%52%'
group by category, subcategory, product, standardcost
order by category, subcategory, standardcost desc;
Bikes	Road Bikes	Road-150 Red, 52	2171.29
Bikes	Road Bikes	Road-250 Red, 52	1518.79
Bikes	Road Bikes	Road-450 Red, 52	884.71
Bikes	Road Bikes	Road-650 Red, 52	486.71
Bikes	Road Bikes	Road-650 Red, 52	413.15


