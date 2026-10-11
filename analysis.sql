-- =============================================================================
-- E-COMMERCE SQL ANALYTICS QUERIES
-- Project: E-Commerce Customer & Revenue Performance Analytics
-- Author: Data Analyst Portfolio
-- =============================================================================

-- =============================================================================
-- SECTION 1: CORE BUSINESS PERFORMANCE QUERIES (Foundation Layer)
-- =============================================================================

-- Query 1: Total Gross Revenue
-- Business Value: Overall top-line financial performance of the platform.
SELECT
    SUM(p.price * o.quantity) AS total_revenue
FROM orders o
JOIN products p
    ON o.product_id = p.product_id;


-- Query 2: Revenue by Product
-- Business Value: Identifies revenue drivers and inventory prioritization candidates.
SELECT
    p.product_id,
    p.product_name,
    p.category,
    SUM(p.price * o.quantity) AS revenue
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_name,
    p.category
ORDER BY
    revenue DESC;


-- Query 3: Revenue by Category
-- Business Value: Highlights high-yielding department lines for budget allocation.
SELECT
    p.category,
    SUM(p.price * o.quantity) AS revenue,
    ROUND(
        100.0 * SUM(p.price * o.quantity) / (
            SELECT SUM(p2.price * o2.quantity)
            FROM orders o2
            JOIN products p2 ON o2.product_id = p2.product_id
        ),
        2
    ) AS revenue_percentage
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
GROUP BY
    p.category
ORDER BY
    revenue DESC;


-- Query 4: Customer Spending Overview (Top Customers)
-- Business Value: Detects VIP spenders for loyalty and retention initiatives.
SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    SUM(p.price * o.quantity) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN products p
    ON o.product_id = p.product_id
GROUP BY
    c.customer_id,
    c.customer_name,
    c.city
ORDER BY
    total_spent DESC;


-- Query 5: Average Order Value (AOV)
-- Business Value: Baseline metric for cart size optimization and pricing strategy.
SELECT
    ROUND(AVG(order_total), 2) AS average_order_value
FROM (
    SELECT
        o.order_id,
        SUM(p.price * o.quantity) AS order_total
    FROM orders o
    JOIN products p
        ON o.product_id = p.product_id
    GROUP BY
        o.order_id
) sub;


-- Query 6: Most Popular Products by Volume
-- Business Value: Pinpoints high-velocity inventory to prevent stockouts.
SELECT
    p.product_id,
    p.product_name,
    SUM(o.quantity) AS units_sold
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY
    units_sold DESC;


-- Query 7: Repeat Customers Identification
-- Business Value: Tracks multi-order retention and customer loyalty.
SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    COUNT(o.order_id) AS order_count
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name,
    c.city
HAVING
    COUNT(o.order_id) > 1;


-- Query 8: Customer Revenue Ranking (Window Function: RANK)
-- Business Value: Hierarchical revenue tiers for customer segmentation.
SELECT
    c.customer_name,
    SUM(p.price * o.quantity) AS total_spent,
    RANK() OVER (
        ORDER BY SUM(p.price * o.quantity) DESC
    ) AS revenue_rank
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN products p
    ON o.product_id = p.product_id
GROUP BY
    c.customer_name;


-- =============================================================================
-- SECTION 2: ADVANCED ANALYTICS (Layer 2 Portfolio Differentiator)
-- =============================================================================

-- Query 9: RFM Customer Value Segmentation (CTEs + Window Functions + CASE)
-- Business Value: Categorizes customers into High Spender, Mid-Tier, or Entry Spender.
WITH customer_aggregates AS (
    SELECT
        c.customer_id,
        c.customer_name,
        c.city,
        COUNT(o.order_id) AS total_orders,
        SUM(p.price * o.quantity) AS monetary_value,
        MAX(o.order_date) AS last_order_date
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN products p ON o.product_id = p.product_id
    GROUP BY c.customer_id, c.customer_name, c.city
)
SELECT
    customer_id,
    customer_name,
    city,
    total_orders,
    monetary_value,
    last_order_date,
    NTILE(3) OVER (ORDER BY monetary_value DESC) AS spending_tercile,
    CASE
        WHEN monetary_value >= 4000 THEN 'VIP High Value'
        WHEN monetary_value >= 2000 THEN 'Mid-Tier Spender'
        ELSE 'Emerging Spender'
    END AS customer_segment
FROM customer_aggregates
ORDER BY monetary_value DESC;


-- Query 10: Geographic Sales Penetration & City Performance
-- Business Value: Evaluates geographic distribution to guide regional marketing spend.
SELECT
    c.city,
    COUNT(DISTINCT c.customer_id) AS total_customers,
    COUNT(o.order_id) AS total_orders,
    SUM(o.quantity) AS total_units_sold,
    SUM(p.price * o.quantity) AS total_city_revenue,
    ROUND(
        SUM(p.price * o.quantity) / COUNT(DISTINCT c.customer_id), 
        2
    ) AS revenue_per_customer
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN products p ON o.product_id = p.product_id
GROUP BY c.city
ORDER BY total_city_revenue DESC;


-- Query 11: Product Velocity vs. Revenue Pareto Analysis
-- Business Value: Categorizes SKUs into High Revenue / High Volume vs Niche / Low Margin.
WITH product_summary AS (
    SELECT
        p.product_id,
        p.product_name,
        p.category,
        p.price,
        COALESCE(SUM(o.quantity), 0) AS total_units_sold,
        COALESCE(SUM(p.price * o.quantity), 0) AS total_revenue
    FROM products p
    LEFT JOIN orders o ON p.product_id = o.product_id
    GROUP BY p.product_id, p.product_name, p.category, p.price
)
SELECT
    product_name,
    category,
    price,
    total_units_sold,
    total_revenue,
    DENSE_RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank,
    ROUND(
        100.0 * total_revenue / SUM(total_revenue) OVER (), 
        2
    ) AS revenue_share_pct
FROM product_summary
ORDER BY total_revenue DESC;
