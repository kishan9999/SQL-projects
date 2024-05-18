-- Query 1: Selects name and age of Avengers characters aged over 50
SELECT name, age
FROM avengers 
WHERE age > 50;

-- Query 2: Selects name and category of Avengers characters belonging to the 'Nature' category
SELECT name, category
FROM avengers
WHERE category = 'Nature';

-- Query 3: Counts the number of Avengers characters, calculates the average power for each category
SELECT COUNT(name) AS avengers, 
       ROUND(AVG(power), 2) AS avg_power, 
       category
FROM avengers 
GROUP BY category;

-- Query 4: Counts the number of Avengers characters, calculates the average power for each category with power greater than 7
SELECT COUNT(name) AS avengers, 
       ROUND(AVG(power), 2) AS avg_power, 
       category
FROM avengers 
WHERE power > 7
GROUP BY category;

-- Query 5: Counts the number of Avengers characters, calculates the average power for each category and filters only categories with average power greater than 7
SELECT COUNT(name) AS avengers, 
       ROUND(AVG(power), 2) AS avg_power, 
       category
FROM avengers 
GROUP BY category 
HAVING ROUND(AVG(power), 2) > 7;
