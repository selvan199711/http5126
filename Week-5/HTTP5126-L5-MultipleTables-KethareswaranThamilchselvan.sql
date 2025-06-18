--  LAB 5 MULTIPLE TABLES

--  Put your answers on the lines after each letter. E.g. your query for question 1A should go on line 5; your query for question 1B should go on line 7...
--  1 
-- A 
SELECT * FROM sale WHERE stock_item_id = 1014;
-- B 
SELECT sale.date, stock_item.name FROM sale INNER JOIN stock_item ON sale.stock_item_id = stock_item.stock_item_id WHERE sale.stock_item_id = 1014;

--  2
-- A 
SELECT * FROM sale WHERE employee_id = 111;
-- B
SELECT sale.date, sale.stock_item_id, employee.last_name, employee.first_name FROM sale INNER JOIN employee ON sale.employee_id = employee.employee_id WHERE sale.employee_id = 111;

--  3
-- A
SELECT sale.date, stock_item.name FROM sale JOIN stock_item ON sale.stock_item_id = stock_item.stock_item_id ORDER BY sale.date DESC LIMIT 5;
-- B
SELECT employee.first_name, employee.last_name, sale.date, stock_item.name, stock_item.price FROM sale JOIN employee ON sale.employee_id = employee.employee_id JOIN stock_item ON sale.stock_item_id = stock_item.stock_item_id ORDER BY sale.date DESC LIMIT 5;
--  4
-- A
SELECT sale.date, stock_item.name AS item, employee.first_name FROM sale JOIN stock_item ON sale.stock_item_id = stock_item.stock_item_id JOIN employee ON sale.employee_id = employee.employee_id WHERE sale.date BETWEEN '2025-01-12' AND '2025-01-18';
-- B
SELECT employee.first_name, employee.last_name, COUNT(sale.sale_id) AS total_sales FROM sale JOIN employee ON sale.employee_id = employee.employee_id GROUP BY employee.first_name, employee.last_name ORDER BY total_sales DESC;

--  5
-- A
SELECT sale.date, stock_item.name, stock_item.price, stock_item.category, employee.first_name FROM sale INNER JOIN employee ON sale.employee_id = employee.employee_id INNER JOIN stock_item ON sale.stock_item_id = stock_item.stock_item_id WHERE sale.employee_id = (SELECT employee_id FROM sale GROUP BY employee_id ORDER BY COUNT(*) DESC LIMIT 1);
-- B
SELECT stock_item.stock_item_id, stock_item.name, stock_item.price, stock_item.category, COUNT(sale.sale_id) AS times_sold FROM stock_item LEFT JOIN sale ON stock_item.stock_item_id = sale.stock_item_id GROUP BY stock_item.stock_item_id, stock_item.name, stock_item.price, stock_item.category ORDER BY stock_item.stock_item_id;

--  6
-- A Which employee has brought in the most money overall from sales, and how much has each person brought in?
-- B
SELECT employee.first_name, employee.last_name, SUM(stock_item.price) AS total_revenue FROM sale INNER JOIN employee ON sale.employee_id = employee.employee_id INNER JOIN stock_item ON sale.stock_item_id = stock_item.stock_item_id GROUP BY employee.first_name, employee.last_name ORDER BY total_revenue DESC;