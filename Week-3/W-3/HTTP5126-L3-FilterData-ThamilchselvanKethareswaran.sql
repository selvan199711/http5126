-- LAB 3 FILTER DATA
-- Put your answers on the lines after each letter. E.g. your query for question 1A should go on line 6; your query for question 1B should go on line 8...

-- 1 
-- A
SELECT * FROM employee WHERE role ='Manager' OR role = 'Assistant';
-- B
SELECT * FROM stock_item WHERE category ='Piscine' AND inventory < '24';

-- 2
-- A
SELECT item, price FROM stock_item WHERE item LIKE '%cage%' ;
-- B
SELECT * FROM employee WHERE first_name LIKE 'F%';

-- 3
-- A
SELECT * FROM stock_item WHERE id BETWEEN '1010' AND '1015';
-- B
SELECT * FROM stock_item WHERE price BETWEEN '10' AND '20';

-- 4
-- A
SELECT first_name, last_name, phone, role FROM employee WHERE NOT (role = 'Manager' OR role = 'Assistant');
-- B
SELECT * FROM stock_item WHERE NOT (item LIKE '%cat%' OR item  LIKE  '%dog%') AND inventory < 20 ;

-- 5
-- A
SELECT first_name, last_name, role, phone FROM employee ORDER BY last_name ASC; 
-- B
SELECT id, item, price, inventory FROM stock_item WHERE category = 'Murine' AND inventory > 20 ORDER BY price DESC;