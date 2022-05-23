CREATE TABLE PAGEVIEWS_DAILY(
	VIEW_DATE 			DATE,
	URL_PATH 			VARCHAR(250),
	CUSTOMER_COUNTRY 	VARCHAR(50),
	VIEW_COUNT 			INT

);

-- How many page views are there for each urlpath on the site by day?

INSERT INTO PAGEVIEWS_DAILY
(VIEW_DATE, URL_PATH, CUSTOMER_COUNTRY, VIEW_COUNT)

SELECT 
	PV.VIEWTIME::DATE  	VIEW_DATE,
	PV.URL_PATH,
	C.CUSTOMER_COUNTRY,
	COUNT(*)			VIEW_COUNT
FROM PAGEVIEWS 			PV
LEFT JOIN CUSTOMERS 	C
	ON PV.CUSTOMER_ID = C.CUSTOMER_ID
GROUP BY 
	PV.VIEWTIME::DATE,
	PV.URL_PATH,
	C.CUSTOMER_COUNTRY