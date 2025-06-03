INSERT IGNORE INTO customers(customer_id, customer_name, segment)
SELECT DISTINCT `Customer ID`, `Customer Name`, `Segment`
FROM orders_stagging;

INSERT IGNORE INTO products(product_id, product_name, sub_category, category)
SELECT DISTINCT `Product ID`, `Product Name`, `Sub-Category`, `Category`
FROM orders_stagging;

INSERT IGNORE INTO locations(city, state, country, region, market)
SELECT DISTINCT City, State, Country, Region, Market
FROM orders_stagging;

INSERT IGNORE INTO ship_modes(ship_mode)
SELECT DISTINCT `Ship Mode`
FROM orders_stagging;

INSERT INTO orders(
	row_id, order_id, order_date, ship_date, ship_mode_id,
    customer_id, location_id, product_id, sales, quantity,
    discount, profit, shipping_cost, order_priority
)
SELECT
	ord.`Row ID`,
    ord.`Order ID`,
    ord.`Order Date`,
    ord.`Ship Date`,
    sm.ship_mode_id,
    ord.`Customer ID`,
    loc.location_id,
    ord.`Product ID`,
    ord.Sales,
    ord.Quantity,
    ord.Discount,
    ord.Profit,
    ord.`Shipping Cost`,
    ord.`Order Priority`
FROM orders_stagging ord
JOIN ship_modes sm ON ord.`Ship Mode` = sm.ship_mode
JOIN locations loc ON ord.City = loc.city AND ord.State = loc.state AND ord.Country = loc.country;