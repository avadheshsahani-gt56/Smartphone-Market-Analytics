# Smartphone Market Analysis

**Author:** Avadhesh Sahani

**Tools:** Excel  . PostgreSQL  · Microsoft Power BI 

## Project Overview

This repository contains a data analytics project analyzing **915 smartphone and tablet records** across **18 companies** and **5 regional pricing markets** (Pakistan, India, China, USA, and Dubai). Using PostgreSQL for structured SQL querying and Microsoft Power BI for interactive visualization, the project evaluates brand representation, RAM and battery specifications, screen sizes, and India pricing trends by launch year.

📄 **Full Report:** [Smartphone Market Analysis Project Report.pdf](https://www.google.com/search?q=Smartphone%2520Market%2520Analysis%2520Project%2520Report.pdf)

🗄️ **SQL Script:** [Smartphone.Analysis.sql](https://www.google.com/search?q=Smartphone.Analysis.sql)

📊 **Power BI File:** [smartphone_Analysis.pbix](https://www.google.com/search?q=smartphone_Analysis.pbix)

## Repository Structure

```
├── mobile_dataset.csv                            # Source dataset (915 rows × 15 columns)
├── Smartphone.Analysis.sql                       # PostgreSQL table schema & 7 analytical queries
├── smartphone_Analysis.pbix                      # 2-page interactive Power BI dashboard
├── Smartphone_Analysis-1.jpg                     # Dashboard Page 1: Mobile Market Analysis
├── Smartphone_Analysis-2.jpg                     # Dashboard Page 2: Smartphone Market Analytics
├── Smartphone Market Analysis Project Report.pdf # 9-page analytical report
└── README.md                                     # Project documentation

```

## Dataset Summary (`mobile_dataset.csv`)

* **Dimensions:** `915` records × `15` columns (`0` duplicate rows)

* **Brands & Models:** `18` companies · `908` distinct `model_name` values (includes tablets as well as smartphones)

* **Data Quality:** `1` missing cell in `price_pakistan_PKR`; all other `14` columns (including `price_india_INR`) are 100% complete.

| Field Group | Columns Included | 
| ----- | ----- | 
| **Identifiers** | `company_name`, `model_name`, `launched_year` | 
| **Hardware Specs** | `weight_g` (135–732 g), `ram_gb` (1–16 GB), `processor`, `battery_mah` (2,000–11,200 mAh), `screen_inches` (5.00–14.60") | 
| **Cameras** | `front_camera_mp`, `back_camera` | 
| **Regional Pricing** | `price_pakistan_PKR`, `price_india_INR`, `price_china_CNY`, `price_usa_USD`, `price_dubai_AED` | 

## SQL Analysis (`Smartphone.Analysis.sql`)

The PostgreSQL script creates the `mobile_dataset` table and answers seven business questions using `GROUP BY`, `HAVING`, subqueries, a CTE (`WITH`), and a window function (`AVG(...) OVER ()`):

1. **Top Brands by Record Count:** Oppo (`115`), Apple (`97`), Honor (`91`), Samsung (`88`), and Vivo (`86`).

2. **Average India Price by Launch Year:** Overall average listed price is **₹51,070** (2014–2025).

3. **Highest RAM Capacity:** Maximum capacity is **16 GB**, offered by 9 brands (Google, Honor, Huawei, Lenovo, OnePlus, Oppo, Realme, Vivo, Xiaomi).

4. **Largest Average Screen Size:** Led by iQOO (`11.87"` across 3 tablet records), Honor (`8.06"`), Realme (`7.43"`), Samsung (`7.33"`), and Huawei (`7.17"`).

5. **Brands with >10 Records & Avg RAM >6 GB:** 13 qualifying brands, led in average RAM by Xiaomi (`10.52 GB`), Huawei (`9.71 GB`), and OnePlus (`9.43 GB`).

6. **Top 5 Models Above Average India Price (₹51,070):** Huawei Mate XT 512GB (`₹274,999`), Mate XT 256GB (`₹259,999`), Mate X2 (`₹249,999`), Mate X3 (`₹249,999`), and Mate X6 (`₹249,999`).

7. **Top 10 Models by Battery Capacity vs. Market Average (`5,030 mAh`):** Led by Samsung Galaxy Tab S9 Ultra / S8 Ultra (`11,200 mAh`) and OnePlus Pad Pro (`11,000 mAh`).

### SQL Notes Before Execution

* **Column Naming:** `CREATE TABLE` defines `price_india`, while queries 2 and 6 reference `price_india_inr` (matching CSV header `price_india_INR`). Align the schema and query column names before running.

* **Battery Sort Order:** Query 7 uses `ORDER BY battery_mah` (ascending by default); update to `ORDER BY battery_mah DESC` to return the top 10 highest-capacity devices.

## Power BI Dashboard (`smartphone_Analysis.pbix`)

### Page 1 — Mobile Market Analysis

* **KPI Cards:** Max RAM (`16 GB`), Min RAM (`1 GB`), and `max_Weight(G)` (`135` — note: `135 g` is the dataset minimum; verify the DAX measure/label).

* **Visuals & Slicers:** Model count by company, average India price trend by launch year, highest RAM by company, and `launched_year` / `company_name` slicers.

### Page 2 — Smartphone Market Analytics & Business Intelligence

* **KPI Cards:** Total Models (`908` distinct model names), Total Companies (`18`), and Average RAM (`7.79 GB`).

* **Visuals & Slicers:** Company-wise average RAM and model count table, max battery capacity by company, total models column chart, and `company_name` / `ram_gb` slicers.

## Key Findings & Limitations

* **Key Findings:** Overall average RAM is **7.79 GB**, average battery capacity is **5,030 mAh**, and average India listed price is **₹51,070**. Huawei models occupy all top 5 India price slots, while tablets drive the highest screen-size and battery-capacity averages.
