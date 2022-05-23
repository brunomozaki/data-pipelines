CREATE TABLE ORDERS ( 	
	ORDER_ID INT,
	ORDER_STATUS VARCHAR(30),
 	ORDER_DATE TIMESTAMP,
 	CUSTOMER_ID INT,
 	ORDER_TOTAL NUMERIC
 );

INSERT INTO ORDERS
	VALUES(1, 'Shipped', '2020-06-09', 100, 50.05);
INSERT INTO ORDERS
	VALUES(2, 'Shipped', '2020-07-11', 101, 57.45);
INSERT INTO ORDERS
	VALUES(3, 'Shipped', '2020-07-12', 102, 135.99);
INSERT INTO ORDERS
	VALUES(4, 'Shipped', '2020-07-12', 100, 43.00);