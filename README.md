# Walmart_SQL_Python_Power-BI
# 🛒 Walmart Sales Analysis & Forecasting Report

## 📊 Project Overview

This project aims to analyze Walmart’s sales data (10,000 records) to extract valuable business insights, identify patterns, forecast future trends, and provide data-driven recommendations to improve sales performance in a post-pandemic retail environment.

---

## 🛠 Tools & Technologies Used

| Tool/Technology | Purpose |
|----------------|---------|
| **Python (Pandas)** | Data cleaning, preprocessing |
| **PostgreSQL (SQLAlchemy, psycopg2)** | Data storage, querying, analysis |
| **Power BI** | Interactive dashboards and sales forecasting |

---

## 🧹 Data Cleaning (Python - Pandas)

- Handled missing values by removing null records
- Removed duplicate rows
- Standardized column names for consistency
- Created a new `Total` column using `unit_price * quantity`

---

## 🧾 SQL Query Highlights (PostgreSQL)

Here are some key queries used for insights:

1. **Transaction Summary by Payment Method**  
   - Count of transactions and total quantity sold

2. **Top-Rated Categories per Branch**  
   - Branch-wise highest average product rating per category

3. **Busiest Day per Branch**  
   - Identified peak sales day per branch

4. **Total Quantity Sold by Payment Method**

5. **Product Ratings Analysis by City**  
   - Average, minimum, and maximum rating per city

6. **Category-wise Total Profit**  
   - Profit calculated as `(unit_price * quantity * profit_margin)`

7. **Most Common Payment Method per Branch**

8. **Sales Shift Categorization**  
   - Morning, Afternoon, and Evening sales distribution

9. **Top 5 Branches with Revenue Decline**  
   - Comparison between 2023 and 2022

---

## 📈 Power BI Dashboards

1. **Yearly Sales Trend & Forecasting** (Line Chart with Predictive Insights)
2. **Top 5 Best-Selling Cities**
3. **Revenue Share by Category** (Pie Chart / Donut Chart)
4. **Payment Methods Distribution**
5. **Branch-wise and Shift-wise Sales Insights**

---

## 📌 Recommendations (Based on Forecasting)

- 📉 **Launch seasonal discounts** during low-performing months
- 📦 **Stock up on best-selling items** before peak seasons
- 📢 **Run targeted campaigns** for customer retention
- 🛍 **Expand digital & e-commerce channels**
- 🏷 **Optimize pricing & promotional strategies**
- 💳 **Enhance customer loyalty programs**
