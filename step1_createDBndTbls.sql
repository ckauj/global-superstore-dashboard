# CREATE DATABASE global_superstore;

# Create table for raw CSV data
DROP TABLE IF EXISTS orders_raw;
CREATE TABLE orders_raw (
	`Row ID` INT,
	`Order ID` VARCHAR(20),
    `Order Date` DATE,
    `Ship Date` DATE,
    `Ship Mode` VARCHAR(50),
    `Customer ID` VARCHAR(20),
    `Customer Name` VARCHAR(100),
    `Segment` VARCHAR(50),
	`City` VARCHAR(50),
    `State` VARCHAR(50),
	`Country` VARCHAR(50),
    `Postal Code` VARCHAR(20),
    `Market` VARCHAR(50),
    `Region` VARCHAR(50),
    `Product ID` VARCHAR(20),
    `Category` VARCHAR(50),
    `Sub-Category` VARCHAR(50),
    `Product Name` VARCHAR(100),
    `Sales` DECIMAL(10,2),
    `Quantity` INT,
    `Discount` DECIMAL(4,2),
    `Profit` DECIMAL(10,2),
    `Shipping Cost` DECIMAL(10,2),
    `Order Priority` VARCHAR(20)
);


# Load CSV
LOAD DATA LOCAL INFILE 'C:/Users/Cy/Desktop/DataAnalytics/MySQL/GlobalSuperstore/Global_Superstore_2.csv'
INTO TABLE orders_raw
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


# Create tables
DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
	customer_id VARCHAR(20) PRIMARY KEY,
    customer_name VARCHAR(100),
    segment VARCHAR(50),
);

DROP TABLE IF EXISTS products;
CREATE TABLE products (
	product_id VARCHAR(20) PRIMARY KEY,
    product_name VARCHAR(100),
    sub_category VARCHAR(50),
    category VARCHAR(50)
);

DROP TABLE IF EXISTS ship_modes;
CREATE TABLE ship_modes (
	ship_mode_id INT AUTO_INCREMENT PRIMARY KEY,
    ship_mode VARCHAR(50) UNIQUE
);

DROP TABLE IF EXISTS locations;
CREATE TABLE locations (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),
    region VARCHAR(100),
    market VARCHAR(50),
    UNIQUE(city, state, country)
);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
	row_id INT PRIMARY KEY,
	order_id VARCHAR(20),
    order_date DATE,
    ship_date DATE,
    ship_mode_id INT,
    customer_id VARCHAR(20),
    location_id INT,
    product_id VARCHAR(20),
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(4,2),
    profit DECIMAL(10,2),
    shipping_cost DECIMAL(10,2),
    order_priority VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (ship_mode_id) REFERENCES ship_modes(ship_mode_id),
	FOREIGN KEY (location_id) REFERENCES locations(location_id)
);