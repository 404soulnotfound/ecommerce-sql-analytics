# 🛒 E-Commerce SQL Analytics

A production-grade SQL analytics project investigating customer purchasing patterns, SKU performance, category share, and revenue distribution using relational e-commerce transaction data.

Designed specifically for **Data Analyst & Analytics Engineer** portfolios to demonstrate proficiency in database modeling, advanced SQL techniques, and executive-ready business insights.

---

## 🎯 Architecture & Analytical Framework

```
                 E-COMMERCE DATA
                        │
          ┌─────────────┼─────────────┐
          ↓             ↓             ↓
       Customer       Product        Order
     (Dimensions)   (Catalog)     (Fact Log)
          │             │             │
          └─────────────┼─────────────┘
                        ↓
                  SQL ANALYSIS
                        │
       ┌────────────────┼────────────────┐
       ↓                ↓                ↓
    Revenue          Customer         Product
    Analysis         Analysis         Analysis
  (AOV, Margin)    (RFM, Repeat)    (Pareto, SKU)
       │                │                │
       └────────────────┼────────────────┘
                        ↓
                 BUSINESS INSIGHTS
           (Executive Strategy & OKRs)
```

---

## 📁 Repository Structure

```
ecommerce-sql-analytics/
│
├── README.md        # Comprehensive project overview, schema diagrams, and SQL showcase
├── schema.sql       # Relational DDL definitions, primary/foreign keys & indexes
├── data.sql         # Seed dataset with realistic e-commerce transactions
├── analysis.sql     # Analytical queries spanning foundational SQL to advanced CTEs & window functions
└── insights.md      # Executive business insights, KPI calculations, and strategic recommendations
```

---

## 🏗️ Data Model & Schema Design

The relational schema implements a **Star / Snowflake hybrid** structure optimized for transactional integrity and analytical querying:

- **`customers` (Dimension):** Captures customer demographic attributes and acquisition date.
- **`products` (Dimension):** Contains SKU catalog details, categories, and unit pricing.
- **`orders` (Fact Table):** Captures transactional logs connecting customer events to items purchased and quantity.

```sql
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    signup_date DATE NOT NULL
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    order_date DATE NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
```

---

## 🔍 Key Business Questions Answered

1. **What is the platform's total gross revenue?**  
   *Evaluates top-line e-commerce turnover.*
2. **Which individual products generate the highest revenue and volume?**  
   *Pinpoints hero SKUs vs low-margin volume drivers.*
3. **What is the revenue contribution across merchandise categories?**  
   *Identifies high-performing product categories for inventory budget allocation.*
4. **Who are the highest-value customers and what is their geographic distribution?**  
   *Segments VIP spenders for targeted retention programs.*
5. **What is the Average Order Value (AOV)?**  
   *Establishes a baseline metric for checkout cart optimization.*
6. **Which customers demonstrate repeat purchase behavior?**  
   *Measures customer retention and loyalty beyond the first acquisition.*
7. **How do customers rank across total spend tiers?**  
   *Uses SQL analytical window functions to assign competitive customer percentiles.*

---

## 💡 SQL Skills & Techniques Demonstrated

| SQL Technique | Application in Project |
| :--- | :--- |
| **Relational Joins (`INNER JOIN`, `LEFT JOIN`)** | Stitching normalized fact (`orders`) and dimension tables (`customers`, `products`). |
| **Aggregations (`SUM`, `AVG`, `COUNT`)** | Calculating Gross Merchandise Value (GMV), AOV, and volume metrics. |
| **Filtering & Grouping (`GROUP BY`, `HAVING`)** | Multi-dimensional summarization and identifying repeat buyers (`HAVING COUNT > 1`). |
| **Window Functions (`RANK()`, `DENSE_RANK()`, `NTILE()`)** | Dynamic customer ranking and quartile spending segmentation without self-joins. |
| **Common Table Expressions (CTEs - `WITH`)** | Modular, readable multi-stage queries for RFM customer value modeling. |
| **Conditional Logic (`CASE WHEN`)** | Creating dynamic segmentation tags (`VIP High Value`, `Mid-Tier`, `Emerging`). |
| **Pareto & Percentage Share Calculations** | Evaluating category contribution using subqueries and window-based grand totals. |

---

## 🚀 Quick Execution Guide

You can run this project in **MySQL, PostgreSQL, SQLite, Snowflake, or SQL Server**.

### Option A: Using SQLite (Command Line / In-Memory)
```bash
sqlite3 ecommerce.db < schema.sql
sqlite3 ecommerce.db < data.sql
sqlite3 ecommerce.db < analysis.sql
```

### Option B: Using PostgreSQL / pgAdmin
```sql
\i schema.sql
\i data.sql
\i analysis.sql
```

### Option C: Using MySQL / Workbench
```sql
source schema.sql;
source data.sql;
source analysis.sql;
```

---

## 📈 Executive Summary of Insights

A full narrative breakdown with strategic business recommendations is documented in [`insights.md`](insights.md).

- **Total Gross Revenue:** ₹13,990 across 6 orders (AOV: ₹2,331.67).
- **Dominant Category:** **Electronics** accounts for **75.7%** of platform GMV.
- **Top Product:** *Headphones* (₹4,998 revenue; 35.7% share).
- **Repeat Purchase Rate:** 20% (1 repeat customer: *Aarav* with 2 purchases across multiple categories).
- **Top Geography:** Delhi leads in purchasing volume, accounting for **56.4%** of platform spend.
