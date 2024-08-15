/* TRY TO WRITE THESE AS JOINS FIRST */
/*
* DB: Store
* Table: orders
* Question: Get all orders from customers who live in Ohio (OH), New York (NY) or Oregon (OR) state
* ordered by orderid
*/
select 
    o.orderid,
    c.customerid, 
    c.firstname, 
    c.lastname, 
    c.state
from orders as o, (
    select customerid, firstname, lastname, state 
    from customers    
) as c 
where o.customerid = c.customerid and c.state in ('NY', 'OH', 'OR')
order by o.orderid;

-- USING JOIN
select 
    o.orderid,
    c.customerid, 
    c.firstname, 
    c.lastname, 
    c.state
from orders as o 
join customers as c using (customerid)
where c.state in ('NY', 'OH', 'OR')
order by o.orderid;

/*
* DB: Employees
* Table: employees
* Question: Filter employees who have emp_no 110183 as a manager
*/
select 
    emp_no, first_name, last_name 
from employees where emp_no in 
( select 
    emp_no 
from dept_emp
where dept_no = ( 
    select dept_no 
    from dept_manager
    where emp_no = '110183' 
));

-- USING JOIN
select 
    e.emp_no,
    e.first_name, 
    e.last_name
from employees as e
join dept_emp using (emp_no)
join dept_manager as dm using (dept_no)
where dm.emp_no = '110183';
