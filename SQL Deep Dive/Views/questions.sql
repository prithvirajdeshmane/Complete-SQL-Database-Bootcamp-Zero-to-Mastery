/*
*  Create a view "90-95" that:
*  Shows me all the employees, hired between 1990 and 1995
*  Database: Employees
*/

create view "90-95" as
select * from employees
where extract (year from hire_date) between 1990 and 1995
order by hire_date;
-- ...

/*
*  Create a view "bigbucks" that:
*  Shows me all employees that have ever had a salary over 80000
*  Database: Employees
*/

create or replace VIEW "bigbucks" AS
select distinct 
    s.emp_no,
    e.first_name, 
    e.last_name    
from salaries as s
join employees as e using (emp_no)
where salary > 80000
order by emp_no;
-- ...
