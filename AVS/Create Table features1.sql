-- =============================================
-- Create Table Features1
-- =============================================
USE [avs]
GO


drop table features1;

select id, chain, 
				count(*) as dis_items_p,  					--distinct items purchased
				count(distinct dept) AS n_depts, 			--number of depts purchased from
				count(distinct category) AS n_categories, 	--number of categories purchased from
				count(distinct company) AS n_companies, 	--number of companies purchased from
				count(distinct brand) AS n_brands, 			--number of brands purchased from
				count(distinct date) AS n_trips, 			--number of trips made to store
				sum(purchasequantity) as items_p, 			--number of items purchased
				sum(purchaseamount) as a_spent 				--total amount spent for the period
into features1
from transactions
group by id, chain


GO
