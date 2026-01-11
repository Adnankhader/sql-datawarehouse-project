/*
===============================================================================
Database Exploration
===============================================================================
*/

Select
*
from INFORMATION_SCHEMA.TABLES
where table_name='dim_customers'
or table_name='dim_products'
or table_name='fact_sales'

select
*
from INFORMATION_SCHEMA.columns
where table_name='dim_customers'
or table_name='dim_products'
or table_name='fact_sales'
