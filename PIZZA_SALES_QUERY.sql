create database pizza_db;
select * from pizza_sales;

#1
select sum(total_price) as total_Revenue from pizza_sales;
#2
SELECT * FROM pizza_sales;
SELECT sum(total_price)/count(distinct order_id) as Avg_order_value from pizza_sales;
#3
select sum(quantity) as total_pizza_sold from pizza_sales;
select count(distinct order_id) as total_orders from pizza_sales;
#4
select cast(cast(sum(quantity) as decimal(10,2)) / 
cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as Avg_pizza_per_order from pizza_sales;


# CHARTS REQUIREMENTS

describe pizza_sales;

UPDATE pizza_sales
set order_time = STR_TO_DATE(order_time, '%H:%i:%s');
alter table pizza_sales
modify column order_time TIME;

UPDATE pizza_sales
set order_date = STR_TO_DATE(order_date, '%m/%d/%Y');
alter table pizza_sales
modify column order_date DATE;

#1
SELECT DAYNAME(order_date) AS order_day, 
       COUNT(DISTINCT order_id) AS total_order
FROM pizza_sales
GROUP BY DAYNAME(order_date);

#2
SELECT MONTHNAME(order_date) AS month_name, 
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY MONTHNAME(order_date);

#3
select pizza_category, sum(total_price) as total_sales , sum(total_price)*100 / (select sum(total_price) from pizza_sales) as pct
from pizza_sales
where month(order_date)=1 
group by pizza_category;

#4
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size

#5
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;

#6
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
LIMIT 5;






