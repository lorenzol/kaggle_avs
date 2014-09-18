--Scripts for features 
--****************************

--ALL TRANSACTIONS
--################
--transactions by ID and CHAIN
--get initial features from all transactions
--******************************************
USE [avs]
GO

drop table features_tot_2m;

select hist.id, hist.chain, 
		'1' as tot_ind_2m,                                              --tot last 30 days indicator 
		count(*) as tot_dis_items_p_2m,  								--distinct items purchased
		count(distinct dept) AS tot_n_depts_2m, 						--number of depts purchased from
		count(distinct category) AS tot_n_categories_2m, 				--number of categories purchased from
		count(distinct company) AS tot_n_companies_2m, 				--number of companies purchased from
		count(distinct brand) AS tot_n_brands_2m, 						--number of brands purchased from
		count(distinct date) AS tot_n_trips_2m, 						--number of trips made to store
		sum(purchasequantity) as tot_items_p_2m, 						--number of items purchased
		(sum(purchasequantity)/count(distinct date)) as avg_items_p_2m, --number of items purchased
		sum(purchaseamount) as tot_a_spent_2m, 						--total amount spent for the period
		(sum(purchaseamount)/count(distinct date)) as avg_a_spent_2m 	--total amount spent for the period
into features_tot_2m
from histoffer hist inner join transactions trans on
		hist.id = trans.id and 
		hist.chain = trans.chain
where trans.date <= DATEADD(MONTH,-1,hist.offerdate) and
	  trans.date > DATEADD(MONTH,-2,hist.offerdate)
group by hist.id, hist.chain

