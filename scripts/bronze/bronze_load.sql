create or alter procedure bronze.load_bronze as
begin
	declare @start_time datetime
	,@end_time datetime
	,@batch_start_time datetime
	,@batch_end_time datetime
	begin try
		set @batch_start_time = getdate()
		print '===================================================================================='
		print 'loading Bronze layer'
		print '===================================================================================='


		print '------------------------------------------------------------------------------------'
		print 'loading CRM tables'
		print '------------------------------------------------------------------------------------'

		set @start_time=getdate()
		print '>>Truncating Table: crm_cust_info'
		truncate table bronze.crm_cust_info
		print 'Inserting data into: crm_cust_info'
		bulk insert bronze.crm_cust_info 
		from 'C:\Users\Adnan Khader\OneDrive\Desktop\dw\cust_info (1).csv'
		with (
			firstrow=2,
			fieldterminator=',',
			tablock
		);
		set @end_time=getdate()
	    print '>> load duration: '+cast(datediff(second,@start_time,@end_time) as nvarchar) + ' seconds'
		print '>> --------------'

		set @start_time=getdate()
		print '>>Truncating Table: crm_prd_info'
		truncate table bronze.crm_prd_info
		print 'Inserting data into: crm_prd_info'
		bulk insert bronze.crm_prd_info 
		from 'C:\Users\Adnan Khader\OneDrive\Desktop\dw\prd_info.csv'
		with (
			firstrow=2,
			fieldterminator=',',
			tablock
		);
		set @end_time=getdate()
	    print '>> load duration: '+cast(datediff(second,@start_time,@end_time) as nvarchar) + ' seconds'
		print '>> --------------'

		set @start_time=getdate()
		print '>>Truncating Table: crm_sales_details'
		truncate table bronze.crm_sales_details
		print 'Inserting data into: crm_sales_details'
		bulk insert bronze.crm_sales_details 
		from 'C:\Users\Adnan Khader\OneDrive\Desktop\dw\sales_details.csv'
		with (
			firstrow=2,
			fieldterminator=',',
			tablock
		);
		set @end_time=getdate()
	    print '>> load duration: '+cast(datediff(second,@start_time,@end_time) as nvarchar) + ' seconds'
		print '>> --------------'


		print '------------------------------------------------------------------------------------'
		print 'loading ERP tables'
		print '------------------------------------------------------------------------------------'

		set @start_time=getdate()
		print '>>Truncating Table: erp_loc_a101'
		truncate table bronze.erp_loc_a101
		print 'Inserting data into: erp_loc_a101'
		bulk insert bronze.erp_loc_a101
		from 'C:\Users\Adnan Khader\OneDrive\Desktop\dw\LOC_A101.csv'
		with (
			firstrow=2,
			fieldterminator=',',
			tablock
		);
		set @end_time=getdate()
	    print '>> load duration: '+cast(datediff(second,@start_time,@end_time) as nvarchar) + ' seconds'
		print '>> --------------'



		set @start_time=getdate()
		print '>>Truncating Table: erp_cust_az12'
		truncate table bronze.erp_cust_az12
		print 'Inserting data into: erp_cust_az12'
		bulk insert bronze.erp_cust_az12
		from 'C:\Users\Adnan Khader\OneDrive\Desktop\dw\CUST_AZ12.csv'
		with (
			firstrow=2,
			fieldterminator=',',
			tablock
		);
		set @end_time=getdate()
	    print '>> load duration: '+cast(datediff(second,@start_time,@end_time) as nvarchar) + ' seconds'
		print '>> --------------'



		set @start_time=getdate()
		print '>>Truncating Table: erp_px_cat_g1v2'
		truncate table bronze.erp_px_cat_g1v2
		print 'Inserting data into: erp_px_cat_g1v2'
		bulk insert bronze.erp_px_cat_g1v2
		from 'C:\Users\Adnan Khader\OneDrive\Desktop\dw\PX_CAT_G1V2.csv'
		with (
			firstrow=2,
			fieldterminator=',',
			tablock
		);
		set @end_time=getdate()
	    print '>> load duration: '+cast(datediff(second,@start_time,@end_time) as nvarchar) + ' seconds'
		print '>> --------------'


		set @batch_end_time = getdate()
		print '===================================================================================='
		print'>>Loading Bronze Layer is completed'
		print '>> load duration: '+cast(datediff(second,@batch_start_time,@batch_end_time) as nvarchar) + ' seconds'
		print '===================================================================================='

	end try
	begin catch
		print '===================================================================================='
		print 'Error Occured druing loading bronze layer'
		print 'Error Message: '+ error_message()
		print 'Error Number: '+ cast(error_number() as nvarchar)
		print 'Error State: '+ cast(error_state() as nvarchar)
		print '===================================================================================='

	end catch
end

exec bronze.load_bronze
