-- HANDS ON LABS - SQL AGGREGATION

-- Question 1 
SELECT AVG(alt) 
FROM airports 
WHERE faa IN('JFK', 'LGA', 'EWR');

-- Question 2
SELECT tz, AVG(alt) 
FROM airports 
GROUP BY tz;

-- Question 3
SELECT tailnum, COUNT(*) AS 'COUNT' 
FROM flights 
GROUP BY tailnum 
HAVING tailnum IN('N125UW','N848MQ','N328AA','N247JB') 
ORDER BY COUNT DESC; 

-- Question 4
SELECT * 
FROM planes 
WHERE tailnum IN('N125UW','N848MQ','N328AA','N247JB');

-- Question 5
SELECT tailnum, year, month, day, dep_delay, arr_delay, dest 
FROM flights 
WHERE month = 2 AND day BETWEEN 14 AND 17 AND tailnum IN('N125UW','N848MQ','N328AA','N247JB') 
ORDER BY tailnum;