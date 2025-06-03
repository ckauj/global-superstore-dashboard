SELECT * 
FROM orders_raw;

DROP TABLE IF EXISTS orders_stagging;
CREATE TABLE orders_stagging(
	SELECT *
	FROM orders_raw
);

SELECT *
FROM orders_stagging;

# Find duplicates
WITH duplicates AS (
SELECT 
	*,
    ROW_NUMBER() OVER(
		PARTITION BY `Order ID`, `Product ID`, `Quantity`, `Shipping Cost`
        ORDER BY `Order ID`) AS row_num
FROM orders_stagging
)
SELECT
	*
FROM duplicates
WHERE
	row_num > 1;

# Check each column for standardizing 
SELECT DISTINCT `Postal Code`
FROM orders_stagging;

UPDATE orders_stagging
SET `Postal Code` = TRIM(TRAILING '.0' FROM `Postal Code`)
WHERE `Postal Code` LIKE '%.0';

SELECT DISTINCT `State`
FROM orders_stagging
ORDER BY `State`;

UPDATE orders_stagging
SET `State` = TRIM(LEADING "'" FROM `State`)
WHERE `State` LIKE "'%";

UPDATE orders_stagging
SET `State` = 'Lima'
WHERE `State` LIKE 'Lima%';

SELECT DISTINCT `City`, `State`
FROM orders_stagging
WHERE `State` LIKE '%?%'
ORDER BY `State`, `City`;

UPDATE orders_stagging
SET `State` = `City`
WHERE `State` LIKE '%?%';

SELECT *
FROM orders_stagging;



	