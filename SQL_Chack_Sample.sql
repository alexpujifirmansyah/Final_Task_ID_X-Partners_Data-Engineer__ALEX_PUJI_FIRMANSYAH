use sample


SELECT * FROM customer
SELECT * FROM account
SELECT * FROM branch
SELECT * FROM transaction_db

USE sample;
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'customer';
