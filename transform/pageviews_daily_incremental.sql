CREATE TABLE TEMP_PAGEVIEWS_DAILY AS(
SELECT * 
FROM PAGEVIEWS_DAILY 
WHERE VIEW_DATE < (SELECT MAX(VIEW_DATE) FROM PAGEVIEWS_DAILY) 
);

INSERT INTO TEMP_PAGEVIEWS_DAILY(VIEW_DATE, URL_PATH, CUSTOMER_COUNTRY, VIEW_COUNT)
SELECT 
	P.VIEWTIME::DATE 	VIEW_DATE,
	P.URL_PATH,
	C.CUSTOMER_COUNTRY,
	COUNT(*)
FROM PAGEVIEWS			P
LEFT JOIN CUSTOMERS 	C
	ON P.CUSTOMER_ID = C.CUSTOMER_ID
WHERE P.VIEWTIME > (SELECT MAX(VIEW_DATE) FROM PAGEVIEWS_DAILY)
GROUP BY
	P.VIEWTIME::DATE,
	P.URL_PATH,
	C.CUSTOMER_COUNTRY;
	
TRUNCATE TABLE PAGEVIEWS_DAILY ;

INSERT INTO PAGEVIEWS_DAILY 
SELECT * FROM TEMP_PAGEVIEWS_DAILY;

DROP TABLE TEMP_PAGEVIEWS_DAILY;

