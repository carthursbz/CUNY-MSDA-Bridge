-- HANDS ON LABS - SQL BASICS

-- Question 1
SELECT * 
FROM planes; 

-- Question 2
SELECT CONCAT(day, '/', month, '/', year) AS 'Date' 
FROM weather;

-- Question 3
SELECT * 
FROM planes 
ORDER BY seats DESC;

-- Question 4
SELECT * 
FROM planes 
WHERE engines = 'Reciprocating';

-- Question 5
SELECT * 
FROM flights 
LIMIT 5;

-- Question 6
SELECT MAX(air_time) 
FROM flights
WHERE air_time IS NOT NULL; 

-- Question 7
SELECT MIN(air_time) 
FROM flights 
WHERE carrier = 'DL' AND air_time IS NOT NULL; 

-- Question 8
SELECT * 
FROM flights 
WHERE carrier = 'AS' AND month = 7 AND day BETWEEN 1 AND 3; 

-- Question 9
SELECT * 
FROM airlines 
WHERE name LIKE "%America%"; 

-- Question 10
SELECT COUNT(*) 
FROM flights
 WHERE dest = 'MIA';

-- Question 11
SELECT month, COUNT(*) 
FROM flights
WHERE dest = 'MIA'
GROUP BY month 
HAVING month in(1,7);

-- Question 12
SELECT AVG(alt) 
FROM airports;