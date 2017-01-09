/* Week 1
   Assignment SQL Select and Aggregations
   Curwen Arthurs
*/

-- Question 1 BEGIN --
/*
Which destination in the flights database is the furthest distance away, based on information in the flights table?
ANSWER: Since distance is calculated from airport to airport the destination that is furthest away is HNL. Specifically from JFK to HNL is 4983 miles.
*/

SELECT DISTINCT origin, dest, distance FROM flights
ORDER BY distance DESC;

-- Question 1 END --



-- Question 2 BEGIN -- 
/*
What are the different numbers of engines in the planes table?
ANSWER: 1,2,3,4
*/
SELECT DISTINCT engines 
FROM planes
ORDER BY engines;

/*
For each number of engines, which aircraft have the most number of seats?
ANSWER:
Engines, model, seats 
1 - OTTER DHC-3 - 16
2 - 777-200 - 400
2 - 777-222 - 400
2 - 777-224 - 400  
2 - 777-232 - 400
3 - A330-223- 379
4 - 747-451 - 450
*/
SELECT * FROM planes
WHERE engines = 1
ORDER BY seats DESC;

SELECT * FROM planes
WHERE engines = 2
ORDER BY seats DESC;

SELECT * FROM planes
WHERE engines = 3
ORDER BY seats DESC;

SELECT * FROM planes
WHERE engines = 4
ORDER BY seats DESC;

-- Question 2 END -- 



-- Question 3 BEGIN --
SELECT COUNT(*) AS 'Total Number of Flights' 
FROM flights;

-- Question 3 END --


-- Question 4 BEGIN --
SELECT carrier, COUNT(*) AS 'Total Number of Flights' 
FROM flights
GROUP BY carrier;

-- Question 4 END --


-- Question 5 BEGIN --
SELECT carrier, COUNT(*) AS 'Total Number of Flights' 
FROM flights
GROUP BY carrier
ORDER BY COUNT(*) DESC;

-- Question 5 END --



-- Question 6 BEGIN --
SELECT carrier, COUNT(*) AS 'Total Number of Flights' 
FROM flights
GROUP BY carrier
ORDER BY COUNT(*) DESC
LIMIT 5;

-- Question 6 END --



-- Question 7 BEGIN --
SELECT carrier, COUNT(*) AS 'Total Number of Flights' 
FROM flights
WHERE distance >= 1000
GROUP BY carrier
ORDER BY COUNT(*) DESC
LIMIT 5;

-- Question 7 END --



-- Question 8 BEGIN -- 
/*
What is the average temperature for each weather station(origin) in the weather table (ROUND To 2 Decimal places)?
ANSWER:
origin, Average Temperature
EWR,	55.49
JFK,	51.58
LGA,	75.92
*/

SELECT origin, ROUND(AVG(temp), 2) AS 'Average Temperature' 
FROM weather
GROUP BY origin;

-- Question 8 END -- 
