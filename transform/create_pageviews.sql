CREATE TABLE PAGEVIEWS(
	CUSTOMER_ID 	INT,
	VIEWTIME 		TIMESTAMP,
	URL_PATH 		VARCHAR(250),
	UTM_MEDIUM 		VARCHAR(50)
);

INSERT INTO PAGEVIEWS
	VALUES(100, '2020-06-01 12:00:00', '/home', 'social');
INSERT INTO PAGEVIEWS
	VALUES(100, '2020-06-01 12:00:13', '/product/2554', NULL);
INSERT INTO PAGEVIEWS
	VALUES(101, '2020-06-01 12:01:30', '/product/6754', 'search');
INSERT INTO PAGEVIEWS
	VALUES(102, '2020-06-02 7:05:00', '/home', 'NULL');
INSERT INTO PAGEVIEWS
	VALUES(101, '2020-06-02 12:00:00', '/product/2554', 'social');