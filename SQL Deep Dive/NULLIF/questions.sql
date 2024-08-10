/*
* DB: Store
* Table: products
* Question: Show NULL when the product is not on special (0)
*/

select
    prod_id,
    title,
    price,
    nullif(special, 0) as "Is on special"
from products

