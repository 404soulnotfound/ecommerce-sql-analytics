-- =============================================================================
-- E-COMMERCE SAMPLE DATASET POPULATION
-- =============================================================================

-- Populate Customers
INSERT INTO customers (customer_id, customer_name, city, signup_date) VALUES
(1, 'Aarav', 'Delhi', '2025-01-10'),
(2, 'Riya', 'Mumbai', '2025-02-14'),
(3, 'Kabir', 'Bangalore', '2025-03-20'),
(4, 'Ananya', 'Pune', '2025-04-11'),
(5, 'Vihaan', 'Delhi', '2025-05-18');

-- Populate Product Catalog
INSERT INTO products (product_id, product_name, category, price) VALUES
(101, 'Wireless Mouse', 'Electronics', 799.00),
(102, 'Keyboard', 'Electronics', 1499.00),
(103, 'Notebook', 'Stationery', 199.00),
(104, 'Backpack', 'Accessories', 1299.00),
(105, 'Headphones', 'Electronics', 2499.00);

-- Populate Transactional Orders
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity) VALUES
(1001, 1, 101, '2025-06-01', 2),
(1002, 2, 105, '2025-06-02', 1),
(1003, 3, 102, '2025-06-05', 1),
(1004, 1, 104, '2025-06-08', 1),
(1005, 4, 103, '2025-06-10', 5),
(1006, 5, 105, '2025-06-12', 2);
