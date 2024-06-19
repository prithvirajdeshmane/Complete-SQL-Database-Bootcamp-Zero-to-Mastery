
/*
* DB: Store
* Table: orders
* Question: Get all orders from customers who live in Ohio (OH), New York (NY) or Oregon (OR) state
* ordered by orderid
*/
select a.orderid, a.customerid,
CONCAT(b.firstname, ' ', b.lastname) as "Name",
b.state
from orders as a 
inner join customers as b 
on a.customerid = b.customerid
and b.state in ('OH', 'NY', 'OR')
order by customerid, orderid;


/*
* DB: Store
* Table: products
* Question: Show me the inventory for each product
*/
select p.prod_id, p.title,
inv.quan_in_stock
from products as p 
inner join inventory as inv 
on p.prod_id = inv.prod_id
order by prod_id;

/*
* DB: Employees
* Table: employees
* Question: Show me for each employee which department they work in
*/
select 
e.emp_no, e.first_name, e.last_name, 
d_e.dept_no, 
d.dept_name
from employees as e
inner join dept_emp as d_e 
on e.emp_no = d_e.emp_no
-- and d_e.to_date::text = '9999-01-01'
inner join departments as d 
on d_e.dept_no = d.dept_no 
order by emp_no


