CREATE TABLE Electric_Vehicle_Population(
VIN VARCHAR(200),
County VARCHAR(200) ,
City VARCHAR(200) ,
State VARCHAR(200) ,
Postal_Code VARCHAR(200) ,
Model_Year VARCHAR(200),
Make VARCHAR(200),
Model VARCHAR(200),
Electric_Vehicle_Type VARCHAR(200),
Clean_Alternative_Fuel_Vehicle_CAFV_Eligibility VARCHAR(200),
Electric_Range INT ,
Base_MSRP INT ,
Legislative_District VARCHAR(200),
DOL_Vehicle_ID INT ,
Vehicle_Location VARCHAR (200),
Electric_Utility VARCHAR(200),
2020_Census_Tract VARCHAR(200) 
);

SELECT * FROM electric_vehicle_population;

/* Top 10 quantity of vehicles per city */
SELECT DISTINCT City, COUNT(City) AS Vehicle_per_City, State 
FROM electric_vehicle_population
GROUP BY City, State
ORDER BY COUNT(City) DESC
LIMIT 10;

/* Top 10 quantity of vehicles per Country */
SELECT DISTINCT County, COUNT(County) AS Vehicle_per_County, State 
FROM electric_vehicle_population
GROUP BY County, State
ORDER BY COUNT(County) DESC
LIMIT 10;

/*Citie and Countries wit */
SELECT MAKE, COUNT(Make), County
FROM electric_vehicle_population
GROUP BY Make, County
ORDER BY COUNT(MAKE) DESC
LIMIT 10;

SELECT model_year, electric_range, electric_vehicle_type
FROM electric_vehicle_population
ORDER BY model_year ASC;

