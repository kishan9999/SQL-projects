-- Query 1: Selects name, category, and power types for Avengers characters in the 'Tech' category (Join practice)
SELECT a.name,
       a.category, 
       s.power_type1,
       s.power_type2,
       s.power_type3
FROM avengers a 
JOIN superpowers s ON a.category = s.name
WHERE a.category = 'Tech';

-- Query 2: Selects name, category, and power types for Avengers characters in the 'Tech' category with 'Cybernetics' power type
-- Unioned with Avengers characters in the 'Tech' category with 'Laser Technology' power type (Union practice)
SELECT a.name,
       a.category, 
       s.power_type1,
       s.power_type2,
       s.power_type3
FROM avengers a 
JOIN superpowers s ON a.category = s.name
WHERE s.power_type1 = 'Cybernetics'
UNION
SELECT a.name,
       a.category, 
       s.power_type1,
       s.power_type2,
       s.power_type3
FROM avengers a 
JOIN superpowers s ON a.category = s.name
WHERE s.power_type3 = 'Laser Technology';

-- Query 3: Selects name, category, and power types for Avengers characters in the 'Tech' category with 'Cybernetics' power type or 'Laser Technology' power type (Logical operator practice)
SELECT a.name,
       a.category, 
       s.power_type1,
       s.power_type2,
       s.power_type3
FROM avengers a 
JOIN superpowers s ON a.category = s.name
WHERE s.power_type1 = 'Cybernetics' OR s.power_type3 = 'Laser Technology';

-- Query 4: Selects name, age, power, and category for Avengers characters with 'Cybernetics' power type (Subquery practice)
SELECT name, age, power, category
FROM avengers a 
WHERE name IN 
    (SELECT a.name
     FROM avengers a 
     JOIN superpowers s ON a.category = s.name
     WHERE s.power_type1 = 'Cybernetics');

-- Query 5: Selects name, maximum age, and count of distinct power_type1 for Avengers characters with 'Energy Manipulation' power type (Subquery and aggregation practice)
SELECT a.name,
       MAX(age) AS age,
       COUNT(DISTINCT s.power_type1) AS powertype1
FROM avengers a
JOIN superpowers s ON a.category = s."name"
WHERE a.name IN 
    (SELECT a.name
     FROM avengers a 
     JOIN superpowers s ON a.category = s.name
     WHERE s.power_type1 = 'Energy Manipulation')
GROUP BY a.name;

-- Query 6: Selects name, age, power, power1, power2, and score for Avengers characters in the 'Magic' category, along with their power_type1 scores (Join and subquery practice)
SELECT cc.name, 
       cc.age, 
       cc.power, 
       cc.power1, 
       cc.power2,
       ps.score
FROM (
    SELECT a.name AS name, 
           a.age AS age, 
           a.power AS power, 
           a.category AS category, 
           s.power_type1 AS power1, 
           s.power_type2 AS power2  
    FROM avengers a 
    JOIN superpowers s ON a.category = s.name
    WHERE a.category  = 'Magic'
) AS cc
JOIN power_scores ps ON cc.power1 = ps.power_type1
ORDER BY cc.name, cc.power1, ps.score DESC;
