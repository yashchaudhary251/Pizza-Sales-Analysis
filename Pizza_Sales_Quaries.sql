USE[Pizza DB]

SELECT * FROM pizza_sales



--PIZZA SALES QUERIES
--	KPI’S
--1.	TOTAL REVENUE 

SELECT SUM(total_price) AS TOTAL_REVENUE FROM pizza_sales


--2.	AVERAGE ORDER VALUE 

SELECT (SUM(total_price)/ COUNT(DISTINCT(order_id))) AS AVG_ORDER_VALUE FROM pizza_sales

--3.	TOTAL PIZZAS SOLD

SELECT SUM(quantity) AS TOTAL_PIZZAS_SOLD FROM pizza_sales

 

 --4.	TOTAL ORDERS

SELECT COUNT(DISTINCT(order_id)) AS TOTAL_ORDER FROM pizza_sales

--5.	AVERAGE PIZZAS PER ORDER

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2))/CAST(COUNT(DISTINCT(order_id)) AS DECIMAL(10,2)) AS DECIMAL(10,2)) FROM pizza_sales



--DAILY TREND FOR TOTAL ORDERS

SELECT DATENAME(DW,order_date) AS order_day,COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP  BY DATENAME(DW , order_date)



--MONTHLY TRENDS FOR ORDERS

SELECT DATENAME(MONTH,order_date) AS Month,COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP  BY DATENAME(MONTH,order_date)
ORDER BY total_orders DESC



-- % of Sales by Pizza Category


SELECT pizza_category,
CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue , 
CONCAT(CAST(SUM(total_price)*100/(SELECT SUM(total_price) FROM pizza_sales ) AS DECIMAL(10,2)),'%') AS PCT
FROM pizza_sales
GROUP BY pizza_category


--% of Sales by Pizza Size


SELECT pizza_size,
CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue , 
CONCAT(CAST(SUM(total_price)*100/(SELECT SUM(total_price) FROM pizza_sales ) AS DECIMAL(10,2)),'%') AS PCT
FROM pizza_sales
GROUP BY pizza_size


--	 Total Pizzas Sold by Pizza Category


SELECT pizza_category,
SUM(quantity) AS Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_category

--Top 5 Pizzas by Revenue


SELECT TOP 5 pizza_name,
SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC


--Bottom 5 Pizzas by Revenue


SELECT TOP 5 pizza_name,
SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC


--Top 5 Pizzas by Quantity

SELECT TOP 5 pizza_name,
SUM(quantity) AS Total_qauntity_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_qauntity_sold DESC

--Bottom 5 Pizzas by Quantity


SELECT TOP 5 pizza_name,
SUM(quantity) AS Total_qauntity_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_qauntity_sold ASC


-- Top 5 Pizzas by Total Orders


SELECT TOP 5 pizza_name,
COUNT(DISTINCT order_id) AS Total_Order
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Order DESC

--Bottom 5 Pizzas by Total Orders


SELECT TOP 5 pizza_name,
COUNT(DISTINCT order_id) AS Total_Order
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Order ASC
