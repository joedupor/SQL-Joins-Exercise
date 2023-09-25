/* 1.  joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 -- use tables: products and categories and filter with where keyword
 SELECT products.Name as 'Product', categories.Name as 'Category' FROM products
 INNER JOIN categories
 ON products.CategoryID = categories.CategoryID
 WHERE categories.Name = 'Computers';
 
 
/* 2.  joins: find all product names, product prices, and products ratings that have a rating of 5 */
-- use tables: products and reviews
SELECT products.Name as 'Product', products.Price, reviews.Rating FROM products
INNER JOIN reviews
ON products.ProductID = reviews.ProductID
WHERE reviews.Rating = '5';


/* 3.  joins: find the employee with the most total quantity sold.  use the sum() function and group by */
-- use tables: employees and sales, I used limit 3 to show the next closest employee to the most
SELECT employees.FirstName, employees.LastName, Sum(sales.Quantity) as TotalSales FROM employees
INNER JOIN sales
ON employees.EmployeeID = sales.EmployeeID
GROUP BY employees.EmployeeID
ORDER BY TotalSales DESC
LIMIT 3;


/* 4.  joins: find the name of the department, and the name of the category for Appliances and Games */
-- use tables: categories and departments
SELECT categories.Name as 'Product Category', departments.Name as 'Department' FROM categories
INNER JOIN departments
ON categories.DepartmentID = departments.DepartmentID
WHERE categories.Name = 'Appliances' OR categories.Name = 'Games';


/* 5.  joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
-- use tables: products and sales
SELECT products.Name, products.Price, Sum(sales.Quantity) as 'Total Qty Sold', Sum(sales.Quantity * products.Price) as 'Total Revenue' FROM products
INNER JOIN sales
ON products.ProductID = sales.ProductID
WHERE products.Name LIKE '%Hotel%';


/* 6.  joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
-- use tables: products and reviews
SELECT products.Name as 'Product', reviews.Reviewer as 'Customer Name', reviews.Rating, reviews.Comment FROM products
INNER JOIN reviews
ON products.ProductID = reviews.ProductID
WHERE products.Name LIKE '%Visio%' AND reviews.Rating ='1';


-- ------------------------------------------ Extra - May be difficult
/* 7.  Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
-- use 3 tables: employees joins with sales and sales joins with products
SELECT employees.EmployeeID, employees.FirstName, employees.LastName, products.Name as 'Product', sales.Quantity
FROM employees
INNER JOIN sales ON employees.EmployeeID = sales.EmployeeID 
INNER JOIN products ON sales.ProductID = products.ProductID 
ORDER BY employees.EmployeeID;
