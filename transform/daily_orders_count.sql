-- How many orders were placed on a given day?

SELECT 
		COUNT(*)    COUNT_ORDERS, 
		ORDER_DATE 
FROM ORDERS
GROUP BY ORDER_DATE