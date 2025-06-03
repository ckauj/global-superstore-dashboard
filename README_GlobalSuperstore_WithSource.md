
# 📊 Global Superstore Analytics Dashboard

**Role:** Data Analyst  
**Tools:** SQL · Power BI · DAX

---

## 🧩 Project Overview

This project showcases the full data analytics lifecycle — from raw data ingestion and cleaning in SQL to dynamic, insight-driven reporting in Power BI.

Using the *Global Superstore* dataset, I designed a database, applied cleaning techniques, and built a dashboard focused on sales performance, profitability, and customer behavior.

---

## 🔧 Key Steps

### 1. Data Engineering (SQL)
- Designed a relational schema with foreign keys to normalize raw data into fact and dimension tables.
- Loaded data into MySQL using CSV.
- Cleaned and transformed the raw CSV using SQL scripts:
  - Checked for duplicates using `ROW_NUMBER()`
  - Cleaned inconsistent encodings and formatted dates
  - Converted postal code from float to string

### 2. Data Modeling (Power BI)
- Created measures and calculated columns for:
  - Profit Margin
  - Repeat Customer Percentage

### 3. Data Visualization
- Designed a responsive Power BI dashboard including:
  - KPI cards (Sales, Profit, Orders, Profit Margin)
  - Conditional formatting for Profit Margin
  - Trend analysis with slicers for Market and Year
  - Interactive customer-level detail

---

## 📈 KPIs Tracked

- **Total Sales and Profit**
- **Profit Margin by Market**
- **Repeat Customer Rate** (~99.4%)
- **Top Markets by Revenue**
- **Sales and Profit Trend Over Time**

---

## 🎯 Outcome

This project demonstrates my ability to:
- Manage end-to-end analytics workflows
- Use SQL for data cleaning and transformation
- Build interactive, insightful dashboards in Power BI
- Apply business logic to uncover actionable insights

---

## 🗂 Files Included

- `step1_createDBndTbls.sql` – Database schema and table creation
- `step2_cleaning.sql` – Data cleaning logic
- `step3_moveData.sql` – Data insertion into final model
- `cleaned_store_data.csv` – Cleaned dataset
- `gs_dashboard.pbix` – Power BI dashboard

---

## 🚀 Screenshots

![Dashboard Overview](images/dashboard_overview.png)

---

## 📎 Notes

- All personal names and data are from the Global Superstore demo dataset.
- This project is designed for educational and portfolio purposes.

---


---

## 📂 Dataset Source

This project uses the [Global Superstore Dataset](https://www.kaggle.com/datasets/apoorvaappz/global-super-store-dataset) available on Kaggle.

> Note: Minor data cleaning and standardization steps were applied before use.
> The original dataset was normalized and transformed using SQL prior to Power BI analysis.

---
