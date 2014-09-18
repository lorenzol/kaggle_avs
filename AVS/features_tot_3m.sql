--Scripts for features 
--****************************

--ALL TRANSACTIONS
--################
--transactions by ID and CHAIN
--get initial features from all transactions
--******************************************
USE [avs]
GO

--drop table features_tot_6m;

select hist.id, hist.chain, 
		'1' as tot_ind_6m,                                              --tot last 30 days indicator 
		count(*) as tot_dis_items_p_6m,  								--distinct items purchased
		count(distinct dept) AS tot_n_depts_6m, 						--number of depts purchased from
		count(distinct category) AS tot_n_categories_6m, 				--number of categories purchased from
		count(distinct company) AS tot_n_companies_6m, 				--number of companies purchased from
		count(distinct brand) AS tot_n_brands_6m, 						--number of brands purchased from
		count(distinct date) AS tot_n_trips_6m, 						--number of trips made to store
		sum(purchasequantity) as tot_items_p_6m, 						--number of items purchased
		(sum(purchasequantity)/count(distinct date)) as avg_items_p_6m, --number of items purchased
		sum(purchaseamount) as tot_a_spent_6m, 						--total amount spent for the period
		(sum(purchaseamount)/count(distinct date)) as avg_a_spent_6m 	--total amount spent for the period
into features_tot_6m
from histoffer hist inner join transactions trans on
		hist.id = trans.id and 
		hist.chain = trans.chain
where trans.date <= DATEADD(MONTH,-5,hist.offerdate) and
	  trans.date > DATEADD(MONTH,-6,hist.offerdate)
group by hist.id, hist.chain
