# 📊 Data Analytics Portfolio: Exploratory & Advanced SQL Analytics

Welcome to the **Data Analytics Project** repository! 🚀 
This repository demonstrates a comprehensive data analytics workflow, starting from initial data discovery and profiling to generating complex, actionable business insights. Designed as a portfolio project, it highlights industry best practices in SQL development and data analysis.

---

## 📖 Project Overview

This consolidated project involves two main analytical phases:

1. **Exploratory Data Analysis (EDA):** Profiling the dataset, understanding distributions, identifying data gaps, and establishing baseline metrics.
2. **Advanced SQL Analytics:** Applying complex logic, window functions, and statistical techniques to uncover trends, segment data, and measure performance.
3. **Data Storytelling & Reporting:** Creating consolidated SQL views designed to feed BI tools and dashboards for actionable insights.

🎯 This repository is an excellent resource for professionals and students looking to showcase expertise in:

* SQL Development & Optimization
* Exploratory Data Analysis (EDA)
* Advanced Analytical Functions (Window Functions, CTEs)
* Data Segmentation & Cohort Analysis
* Business Intelligence (BI) & Reporting


## 🚀 Project Requirements

### Conducting End-to-End Analytics

**Objective**

Develop a robust analytical framework using SQL to transform raw transactional data into structured, business-ready reports, enabling informed decision-making.

**Specifications**

* **Data Sources:** Import and query data from provided raw datasets (e.g., Sales, Customers, Products).
* **Data Quality & Profiling:** Identify missing values, outliers, and define the magnitude of the data prior to deep analysis.
* **Complex Metrics:** Calculate Period-over-Period (MoM/YoY) growth, running totals, and proportional contributions (Part-to-Whole).
* **Scope:** Focus on actionable insights through segmentation (e.g., RFM analysis) and performance ranking (Top N / Bottom N).
* **Documentation:** Provide clear documentation of the SQL scripts to support both technical teams and business stakeholders.

---

## 🗺️ Analytics Workflow

Instead of a traditional pipeline, this project follows a structured **Analytical Roadmap**:

1. **Phase 1: Discovery (The "What"):** Using exploratory scripts to map database schemas, dimensions, dates, and measure baseline magnitudes.
2. **Phase 2: Deep Dive (The "Why & How"):** Using advanced scripts to apply temporal trends, cumulative tracking, and behavioral segmentation.
3. **Phase 3: Consumption:** Outputting final reports (`Customer_report.sql`, `Product_report.sql`) ready to be ingested by tools like Power BI or Tableau.

---

## 🛡️ License

This project is licensed under the [MIT License](LICENSE).
You are free to use, modify, and share this project with proper attribution.

---


## 🌟 About Me

Hi there! I'm **Vinícius Barros**. I'm a data professional and passionate Analytics Engineer on a mission to share knowledge and make working with data enjoyable and engaging! 

Connect with me on [LinkedIn](https://www.linkedin.com/in/vinícius-barros-da-silva-5418b8286) or check out my other projects.

---

## 📁 Repository Structure

```text
sql-data-analytics-project/
│
├── 📂 datasets/                     # Raw datasets used for the project
│   ├── datasets
│   ├── dim_customers.csv
│   ├── dim_products.csv
│   └── fact_sales.csv
│
├── 📂 docs/                         # Project documentation and architecture
│   ├── Exploratory and Advanced analysis roadmap
│   ├── Project Roadmap.pdf
│   └── Project Roadmap_Baara.png
│
├── 📂 scripts/                      # Unified folder for all SQL analysis scripts
│   ├── Change over time.sql
│   ├── Cumulative Analysis.sql
│   ├── Customer_report.sql
│   ├── Data Segmentation.sql
│   ├── Data_Base_Exploration.sql
│   ├── Date Exploration.sql
│   ├── Dimension Exploration.sql
│   ├── Magnitude Analysis.sql
│   ├── Measure Exploration.sql
│   ├── Part to whole analysis.sql
│   ├── Performance Analysis.sql
│   ├── Product_report.sql
│   ├── Ranking Analysis.sql
│   └── Scripts
│
├── 📄 LICENSE                       # License information for the repository
└── 📄 README.md                     # Project overview and instructions
