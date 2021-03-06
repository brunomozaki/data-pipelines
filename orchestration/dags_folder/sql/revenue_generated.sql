-- How much revenue was generated from orders placed from a given country in a given month?

SELECT 
		SUM(ORD.ORDER_TOTAL)		REVENUE,
		CSTMR.CUSTOMER_COUNTRY,
		DATE_PART('MONTH',ORDER_DATE)			ORDER_MONTH
FROM ORDERS         	ORD
LEFT JOIN CUSTOMERS 	CSTMR
	ON ORD.CUSTOMER_ID	=	CSTMR.CUSTOMER_ID
GROUP BY 
		CSTMR.CUSTOMER_COUNTRY,
		DATE_PART('MONTH',ORDER_DATE)