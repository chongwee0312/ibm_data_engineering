--Check 1NF
SELECT COUNT(*)
FROM transactions;
--3455

SELECT COUNT(*)
FROM
(
	SELECT DISTINCT *
	FROM transactions
) AS T;
--3455
--1NF confirmed

--Check 2NF
SELECT *
FROM transactions;
/*
Not 2NF since firstname, surname, shipping_state, 
loyalty_discount depend partially on (timestampsec, customerid)
*/
-- Modification
CREATE TABLE customers AS
SELECT DISTINCT
	customerid,
	firstname,
	surname,
	shipping_state,
	loyalty_discount
FROM transactions;

ALTER TABLE transactions
DROP COLUMN firstname,
DROP COLUMN surname,
DROP COLUMN shipping_state,
DROP COLUMN loyalty_discount;

SELECT *
FROM customers;
--2NF confirmed
SELECT *
FROM transactions;
-- 2NF confirmed

--Check 3NF
SELECT *
FROM customers;
--3NF confirmed

SELECT *
FROM transactions;
/*
Not 3NF since description and retail_price are 
transitively dependent on transactionid and (timestampsec, customerid)
*/
--Modification
CREATE TABLE items AS
SELECT DISTINCT
	item,
	description,
	retail_price
FROM transactions;

ALTER TABLE transactions
DROP COLUMN description,
DROP COLUMN retail_price;

SELECT *
FROM items;
--3NF confirmed
SELECT *
FROM transactions;
--3NF confirmed
--Database is normalised into 3NF