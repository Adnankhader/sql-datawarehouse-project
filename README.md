# SQL Data Warehouse & Analytics Project 

### Overview of the Project

An **end-to-end SQL data warehousing and analytics solution** that includes data ingestion, transformation, modeling, and business reporting is demonstrated in this project.

The objective was to use **Medallion Architecture (Bronze → Silver → Gold)** to create a **scalable, analytics-ready data warehouse** and use SQL views to produce **business-focused reports**.

This repository demonstrates my practical abilities in the following areas and is a part of my **data analytics / business analytics portfolio**:
* SQL development
* Modeling data
* Design of ETL
* Reports that are analytical

---

##  Business Goals
* Create a central warehouse by combining raw ERP and CRM sales data.
* Clean and standardize data for use in analytics
* Create reporting tables and views that are ready for business use.
* Provide information about:

  * Consumer conduct
  * Performance of the product* Trends in sales

---

##  Medallion Model Data Architecture

A **3-layer Medallion Architecture** is used in the project:

###  Raw Bronze Layer
* Stores unprocessed CSV data that has been imported into SQL Server
* No changes were made.
* Serves as an audit and historical layer ### 🥈 Silver Layer (Cleaned)

* Standardization and data cleansing
* Deduplication, null handling, and type casting
* Gets information ready for analytical modeling

### Gold Layer (Analytics)
* Analytical models based on star schemas
* Tables of dimensions and facts* Business users' reporting views

---

## Data Modeling
* The Fact Table

  * `fact_sales`* Dimension Tables

  * `dim_customers`* `dim_products`

The gold layer is best suited for:
* Combinations
* KPI computations
* Use cases for BI and reporting



##  Analytical Reports

###  Customer Analytics
* Segmenting customers into VIP, regular, and new categories
* Grouping by age
* Lifespan, spending patterns, and recentness
* KPIs

  * Total number of orders* Total revenue
* The mean order value
* Monthly average expenditure

###  Product Data

* Classification of product performance:

  * Excellent Performance
* Mid-Range
* Poor Performance
* KPIs

  * Total revenue
  * Total amount sold
* Total number of clients
* Product longevity
* The typical selling price
* Monthly average revenue ## Tech Stack

SQL Server is the database.
* SQL (T-SQL) is the language.
* Modeling: Star Schema
* Architecture: Bronze, silver, and gold medallion
* Documentation: Markdown, Draw.io

# About Me

As a future **Data/Business Analyst**, I'm laying a solid foundation in:

* Analytics and SQL
* Modeling data
* Business-oriented perspectives
