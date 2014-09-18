--Category information for each id, chain for the offer being given

-- =============================================
-- Create Table features_cat
-- =============================================
USE [avs]
GO


drop table features_cat;

select hist.id, hist.chain, 
		'1' as cat_ind,                                                 --cat indicator 
		count(*) as cat_dis_items_p, 									--distinct items purchased from category
		count(distinct date) AS cat_n_trips, 							--number of trips made to store for category
		sum(purchasequantity) as cat_items_p, 							--number of items purchased from category
		sum(purchaseamount) as cat_a_spent 							--total amount spent for the period on category
		
into features_cat

from histoffer hist inner join 
		transactions trans on
		hist.id = trans.id
		and hist.chain = trans.chain
		and hist.offercategory = trans.category
group by hist.id, hist.chain


GO			
