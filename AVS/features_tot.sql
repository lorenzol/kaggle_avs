
--Scripts for features 
--****************************

--ALL TRANSACTIONS
--################
--transactions by ID and CHAIN
--get initial features from all transactions
--******************************************
USE [avs]
GO



drop table features_tot;

select id, chain, 
		count(*) as tot_dis_items_p,  								--distinct items purchased
		count(distinct dept) AS tot_n_depts, 						--number of depts purchased from
		count(distinct category) AS tot_n_categories, 				--number of categories purchased from
		count(distinct company) AS tot_n_companies, 				--number of companies purchased from
		count(distinct brand) AS tot_n_brands, 						--number of brands purchased from
		count(distinct date) AS tot_n_trips, 						--number of trips made to store
		sum(purchasequantity) as tot_items_p, 						--number of items purchased
		(sum(purchasequantity)/count(distinct date)) as avg_items_p, --number of items purchased
		sum(purchaseamount) as tot_a_spent, 						--total amount spent for the period
		(sum(purchaseamount)/count(distinct date)) as avg_a_spent 	--total amount spent for the period
into features_tot
from transactions
group by id, chain


GO		

