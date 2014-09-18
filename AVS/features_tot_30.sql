--Scripts for features 
--****************************

--ALL TRANSACTIONS
--################
--transactions by ID and CHAIN
--get initial features from all transactions
--******************************************
USE [avs]
GO

drop table features_tot_30;

select hist.id, hist.chain, 
		'1' as tot_ind_30,                                              --tot last 30 days indicator 
		count(*) as tot_dis_items_p_30,  								--distinct items purchased
		count(distinct dept) AS tot_n_depts_30, 						--number of depts purchased from
		count(distinct category) AS tot_n_categories_30, 				--number of categories purchased from
		count(distinct company) AS tot_n_companies_30, 				--number of companies purchased from
		count(distinct brand) AS tot_n_brands_30, 						--number of brands purchased from
		count(distinct date) AS tot_n_trips_30, 						--number of trips made to store
		sum(purchasequantity) as tot_items_p_30, 						--number of items purchased
		(sum(purchasequantity)/count(distinct date)) as avg_items_p_30, --number of items purchased
		sum(purchaseamount) as tot_a_spent_30, 						--total amount spent for the period
		(sum(purchaseamount)/count(distinct date)) as avg_a_spent_30 	--total amount spent for the period
into features_tot_30
from histoffer hist inner join transactions trans on
		hist.id = trans.id and 
		hist.chain = trans.chain
where trans.date >= DATEADD(MONTH,-1,hist.offerdate)
group by hist.id, hist.chain

