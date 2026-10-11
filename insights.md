# 📊 E-Commerce SQL Analytics: Executive Insights & Recommendations

This document synthesizes key business insights extracted from transactional e-commerce data using SQL analytics. It frames quantitative findings into strategic, actionable business recommendations.

---

## Executive Summary

Across the evaluated period, the store generated **₹13,990.00** across **6 transactions** encompassing **12 units sold**, yielding an **Average Order Value (AOV) of ₹2,331.67**.

Key operational observations:
1. **Product & Category Concentration:** Over **75% of platform revenue** is driven exclusively by the **Electronics** category, led predominantly by *Headphones* (₹4,998) and *Wireless Mouse* (₹1,598).
2. **Top Customer Pareto Rule:** Spenders are concentrated in Delhi, with top customer **Vihaan** generating **35.7%** of entire store revenues from a single high-ticket order.
3. **Repeat Purchase Opportunity:** Only **1 out of 5 customers (20%)** has made a repeat purchase, indicating strong early retention potential that requires systematic nurturing.

---

## Detailed Analytical Findings

### 1. Revenue & Sales Architecture

| Category | Units Sold | Total Revenue (₹) | Revenue Contribution (%) |
| :--- | :---: | :---: | :---: |
| **Electronics** | 6 | ₹10,594.00 | **75.73%** |
| **Accessories** | 1 | ₹1,299.00 | **9.28%** |
| **Stationery** | 5 | ₹995.00 | **7.11%** |
| *Direct Total* | *12* | *₹13,990.00* | *100.00%* |

* **Hero SKU:** *Headphones* generated **₹4,998.00** (35.7% of platform revenue), serving as the core top-line gross margin engine.
* **Volume Driver:** *Notebook* led unit volume (5 units sold), but contributed only 7.11% to revenue due to low unit pricing (₹199).

---

### 2. Customer Cohort & Retention Analysis

| Rank | Customer Name | City | Total Spent (₹) | Order Count | Segment |
| :---: | :--- | :--- | :---: | :---: | :--- |
| **1** | Vihaan | Delhi | ₹4,998.00 | 1 | High-Value VIP |
| **2** | Aarav | Delhi | ₹2,897.00 | 2 | Repeat Multi-Buyer |
| **3** | Riya | Mumbai | ₹2,499.00 | 1 | Premium Mid-Tier |
| **4** | Kabir | Bangalore | ₹1,499.00 | 1 | Mid-Tier Spender |
| **5** | Ananya | Pune | ₹995.00 | 1 | Volume / Entry Spender |

* **Repeat Purchase Behavior:** **Aarav** is currently the single repeat buyer (Order 1001 for Wireless Mouse + Order 1004 for Backpack), showing cross-category affinity between Electronics and Accessories.
* **City Clustering:** **Delhi** represents **₹7,895.00 (56.4%)** of gross GMV, demonstrating significant regional market traction.

---

## Strategic Business Recommendations

### 1. Cross-Selling & Bundle Strategies (Raise AOV)
* **Bundle High-Velocity SKUs:** Bundle low-cost, high-volume items (*Notebook*) or high-frequency peripherals (*Wireless Mouse*) with premium hardware (*Headphones* / *Keyboards*) at a 10% discount to elevate median cart sizes.

### 2. Automated Post-Purchase Retention Campaigns
* 80% of buyers have only transacted once. 
* Implement triggered email/SMS workflows at **Day 7** and **Day 21** post-delivery featuring warranty activations, accessory recommendations, or a limited-time credit for a second purchase.

### 3. Inventory Stocking & Working Capital Allocation
* Ensure strict safety-stock thresholds on *Headphones* and *Wireless Mouse* to protect against stockouts on 75%+ of revenue drivers.
* Re-evaluate Stationery margin structure to assess whether multi-pack bundles (e.g. packs of 3/5 notebooks) can increase average transaction margins.

### 4. Regional Marketing Scaling
* Concentrate initial performance marketing and paid ad spend in Delhi-NCR where brand resonance and purchasing power index highest, before scaling broader pan-India campaigns.
