-- ===============  JOIN THREE TABLES ===============
USE learning;

SELECT * FROM cust_table;

SELECT * FROM trans_table;

CREATE TABLE order_status (
status_id INT,
trans_id INT,
delivery_status VARCHAR(20)
);

INSERT INTO order_status VALUES(100,1,'Delivered'),
							    (100,2,' Not Delivered'),
                                (101,3,'In transit'),
                                (101,4,'Not Delivered'),
                                (103,5,'Delivered'),
                                (104,6,'Delivered'),
                                (102,7,'Delivered'),
                                (102,8,'In transit'),
                                (104,9,'Not Delivered'),
                                (106,10,'Delivered');
                                
SELECT * FROM order_status;
SELECT * FROM cust_table;
SELECT * FROM trans_table;
-- cname, prodname, amt, delivery status

SELECT * FROM cust_table c INNER JOIN trans_table t ON c.cust_id = t.cust_id
INNER JOIN order_status o ON o.status_id = t.cust_id;


SELECT c.cust_name, t.prodname, t.amt, o.delivery_status
FROM cust_table c INNER JOIN trans_table t ON c.cust_id = t.cust_id
INNER JOIN order_status o ON t.cust_id=o.status_id;

SELECT c.cust_id,t.prodname,t.amt,o.delivery_status 
FROM trans_table t LEFT JOIN cust_table c ON c.cust_id= t.cust_id
LEFT JOIN order_status o ON t.cust_id=o.status_id;
