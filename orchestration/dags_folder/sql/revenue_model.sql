CREATE TABLE IF NOT EXISTS ORDER_SUMMARY_DAILY(
    ORDER_DATE          DATE,
    ORDER_COUNTRY       VARCHAR(10),
    TOTAL_REVENUE       NUMERIC,
    ORDER_COUNT         INT


);

INSERT INTO ORDER_SUMMARY_DAILY
(ORDER_DATE, ORDER_COUNTRY, TOTAL_REVENUE, ORDER_COUNT)
SELECT  
    O.ORDER_DATE,
    C.CUSTOMER_COUNTRY,
    SUM(ORDER_TOTAL)    TOTAL_REVENUE,
    COUNT(O.ORDER_ID)   ORDER_COUNT
FROM  public."orders"             as   O
INNER JOIN public."customers"     as   C
    ON O.CUSTOMER_ID    =   C.CUSTOMER_ID
GROUP BY 
    O.ORDER_DATE,
    C.CUSTOMER_COUNTRY
