
/*
*  Show me all the employees, hired after 1991, that have had more than 2 titles
*  Database: Employees
*/
select
    e.emp_no, e.first_name, e.last_name, 
    count(t.title) as "# of titles"
from employees as e 
inner join titles as t on e.emp_no = t.emp_no 
where extract (year from hire_date) > 1991
group by e.emp_no
having count(t.title) > 2
order by e.emp_no


/*
*  Show me all the employees that have had more than 15 salary changes that work in the department development
*  Database: Employees
*/
select 
    e.emp_no, e.first_name, e.last_name,
    count(s.salary) as "# of raises",
    de.dept_no
 from employees as e 
 inner join salaries as s on e.emp_no = s.emp_no
 inner join dept_emp as de on e.emp_no = de.emp_no
 where de.dept_no = 'd005'
 group by e.emp_no, de.dept_no
 having count(s.salary) > 15
 order by count(s.salary) desc, e.emp_no


/*
*  Show me all the employees that have worked for multiple departments
*  Database: Employees
*/
select
    e.emp_no, e.first_name, e.last_name,
    count(de.dept_no) as "# of Departments"
from employees as e 
inner join dept_emp as de
on e.emp_no = de.emp_no
group by e.emp_no
having count(de.dept_no) > 1
order by e.emp_no
