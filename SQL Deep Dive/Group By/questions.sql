/*
*  How many people were hired on any given hire date?
*  Database: Employees
*  Table: Employees
*/

-- SELECT e.emp_no
-- FROM employees as e
select hire_date, count(emp_no) from employees group by hire_date

/*
*   Show me all the employees, hired after 1991 and count the amount of positions they've had
*  Database: Employees
*/

-- SELECT e.emp_no
-- FROM employees as e
select e.emp_no, e.first_name, e.last_name, e.hire_date, count(t.title) from employees as e 
inner join titles as t on e.emp_no = t. emp_no
where extract (year from hire_date) > 1991 
group by e.emp_no

/*
*  Show me all the employees that work in the department development and the from and to date.
*  Database: Employees
*/

-- SELECT e.emp_no
-- FROM employees as e
select 
e.emp_no, e.first_name, e.last_name, 
de.dept_no, 
d.dept_name,
de.from_date, de.to_date 
from dept_emp as de 
inner join departments as d 
on de.dept_no = d.dept_no and d.dept_name = 'Development'
inner join employees as e on de.emp_no = e.emp_no
