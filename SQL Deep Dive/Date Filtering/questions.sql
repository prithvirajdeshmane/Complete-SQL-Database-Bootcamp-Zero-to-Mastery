/*
* DB: Employees
* Table: employees
* Question: Get me all the employees above 60, use the appropriate date functions
*/

-- SELECT * FROM employees;
select *, AGE(birth_date) as "Age" from employees where extract (year from AGE(birth_date)) > 60

/*
* DB: Employees
* Table: employees
* Question: How many employees where hired in February?
*/

-- SELECT * FROM employees;
select count(emp_no) from employees where EXTRACT(MONTH from hire_date) = 2

/*
* DB: Employees
* Table: employees
* Question: How many employees were born in november?
*/

-- SELECT * FROM employees;
select count(emp_no) from employees where extract (month from birth_date) = 11

/*
* DB: Employees
* Table: employees
* Question: Who is the oldest employee? (Use the analytical function MAX)
*/

-- SELECT * FROM employees;
select Max(AGE(birth_date)) from employees


/*
* DB: Store
* Table: orders
* Question: How many orders were made in January 2004?
*/

-- SELECT * FROM orders;
select count(orderid) from orders where extract (month from orderdate) = 1 and extract (year from orderdate) = 2004;

