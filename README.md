Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

# preptop_dbt

A dbt project for transforming raw e-commerce data into clean, reliable datasets for analytics and reporting.

## 📦 Project Structure

This project uses simulated Olist e-commerce data to explore customer behavior, order patterns, and payment trends.

This project follows the standard dbt layout with clearly organized models:


## 🔢 Data Sources

Seeded datasets include:
- orders_dataset.csv
- customers_dataset.csv
- order_payments_dataset.csv
- order_items_dataset.csv
- order_reviews_dataset.csv
- products_dataset.csv
- product_category_name_translation.csv
- sellers_dataset.csv
- geolocation_dataset.csv

These simulate raw e-commerce data loaded into a warehouse.

## 🏗️ Models Overview

### Staging Models (models/staging)
Cleans and standardizes raw seed data:
- Casts data types
- Renames fields
- Handles missing values

### Intermediate Models (models/intermediate)
Implements logic like:
- Joining related datasets
- Aggregating values (e.g., total payments per order)

### Mart Models (models/mart)
Final outputs include:
- dim_customers — clean customer dimension table
- dim_products — product details with category info
- fct_payments — payments aggregated by order and type
- orders — order-level fact table with customer and payment info

## 🚀 How to Run

Make sure dbt is installed and your virtual environment is active:

bash
# Install dbt (if not already)
pip install dbt-postgres

# Activate your environment
conda activate dbt_env

# Seed the database
dbt seed

# Run models
dbt run

# Test models
dbt test

# View docs locally
dbt docs serve


## 📦 Project Structure

- `models/staging/` – initial cleaning and typing
- `models/intermediate/` – joins and logic
- `models/mart/` – final data marts for analysis
- `seeds/` – raw CSVs seeded into the warehouse
- `macros/`, `analyses/`, `snapshots/` – boilerplate directories

```
