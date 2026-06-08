USE E_Commerce_Sales;

-- Customer Analytics

-- show all data of customer -- 
select* from customer_Table;

-- Find the total number of customers--
select count(*) as total_customer
from customer_Table;

-- Find customers from Karachi.

select customer_name ,city from
customer_table where  city='Karachi';

-- Count customers in each city.
select city, count(*) as total_customer from 
customer_table group by city ;

-- Find the newest registered customer.

select * 
from customer_table
order by registration_date desc
 limit 1;
 
 -- Find the oldest registered customer.
 select *
 from 
 customer_table  order by registration_date asc limit 1;
 
 -- Find customers who have never placed an order.
 select *from customer_table c
 left join order_table o
 on c.customer_id=o.customer_id
 where o.order_id is not null;

-- Find the top 3 customers by number of orders.

select
c.customer_id,
c.customer_name ,
count(o.order_id) as total_order
from customer_Table c
join  order_Table  o
on c.customer_id=o.customer_id
group by c.customer_id, c.customer_name
order by total_order desc
limit 3;

-- Find the customer who spent the most money.
select c.customer_id ,
c.customer_name,
sum(total_amount) as total_spend
from customer_Table c
join order_Table o
on c.customer_id =o.customer_id 
group by c.customer_id ,c.customer_name
order by total_spend desc
limit 1;

-- Calculate the average spending per customer.


select c.customer_id ,
c.customer_name,
avg(total_amount) as total_spend
from customer_Table c
join order_Table o
on c.customer_id =o.customer_id 
group by c.customer_id ,c.customer_name;

-- Find customers who placed more than 5 orders.
select c.customer_id ,
c.customer_name ,
count(o.order_id) as total_order
from  customer_Table c 
join order_Table o
on c.customer_id=o.customer_id 
group by c.customer_id ,
c.customer_name 
having 
count(o.order_id)>5;


-- Product Analytics--

-- Find the total number of products.
select count(*) as total_product
from product_Table;

-- Find the most expensive product. 
select product_name,price from
product_Table  order by price desc limit 1;

-- Find the cheapest product.

select product_name ,price from 
product_Table 
order by price asc limit 1;


-- Find the average product price.

select avg(price) as  ave_product_price
from product_Table ;

-- Find products with stock less than 3.

select product_id ,
product_name ,stock_quantity 
 from product_Table 
 where 
stock_quantity >3;

