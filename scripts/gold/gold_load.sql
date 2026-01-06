-- =============================================================================
-- Create Dimension: gold.dim_customers
-- =============================================================================

IF OBJECT_ID('gold.dim_customers', 'V') IS NOT NULL
    DROP VIEW gold.dim_customers;
GO

create view gold.dim_customers as
select
	row_number() over(order by ci.cst_id) customer_key,
	ci.cst_id customer_id,
	ci.cst_key customer_number,
	ci.cst_firstname first_name,
	ci.cst_lastname last_name,
	la.cntry country,
	case when ci.cst_gndr!='Unknown' then ci.cst_gndr
		else coalesce(ca.gen,'Unknown')
	end gender,
	ci.cst_material_status marital_staus,
	ca.bdate birthdate,
    ci.dwh_createe_date create_date
from silver.crm_cust_info as ci
left join silver.erp_cust_az12 ca
on ci.cst_key=ca.cid
left join silver.erp_loc_a101 la
on ci.cst_key=la.cid

go

-- =============================================================================
-- Create Dimension: gold.dim_products
-- =============================================================================

IF OBJECT_ID('gold.dim_products', 'V') IS NOT NULL
    DROP VIEW gold.dim_products;
GO

create view gold.dim_products as
select
	row_number() over(order by pi.prd_start_dt,pi.prd_key) as product_key,
	pi.prd_id product_id,
	pi.prd_key product_number,
	pi.prd_nm product_name,
	pi.cat_id category_id,
	pc.cat category,
	pc.subcat subcategory,
	pc.maintenance,
	pi.prd_cost product_cost,
	pi.prd_line product_line,
	pi.prd_start_dt start_date

from silver.crm_prd_info as pi
left join silver.erp_px_cat_g1v2 pc
on pi.cat_id=pc.id
where prd_end_dt is null

go

-- =============================================================================
-- Create Dimension: gold.fact_sales
-- =============================================================================

IF OBJECT_ID('gold.fact_sales', 'V') IS NOT NULL
    DROP VIEW gold.fact_sales;
GO

create view gold.fact_sales as
select
	sd.sls_ord_num order_number,
	pr.product_key,
	cu.customer_number,
	sd.sls_order_dt order_date,
	sd.sls_ship_dt ship_date,
	sd.sls_due_dt due_date,
	sd.sls_sales sales,
	sd.sls_quantity quantity,
	sd.sls_price price
from silver.crm_sales_details sd
left join gold.dim_products pr
on sd.sls_prd_key=pr.product_number
left join gold.dim_customers cu
on sd.sls_cust_id=cu.customer_id

go
