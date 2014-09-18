--Category information for each id, chain for the offer being given

-- =============================================
-- Create Table features_cat_30
-- =============================================
USE [avs]
GO


drop table features_cat_30;

select hist.id, hist.chain,
		'1' as cat_ind_30,                                                  --cat indicator  
		count(*) as cat_dis_items_p_30, 									--distinct items purchased from category
		count(distinct date) AS cat_n_trips_30, 							--number of trips made to store for category
		sum(purchasequantity) as cat_items_p_30, 							--number of items purchased from category
		sum(purchaseamount) as cat_a_spent_30 							--total amount spent for the period on category
		
into features_cat_30

from histoffer hist inner join 
		transactions trans on
		hist.id = trans.id
		and hist.chain = trans.chain
		and hist.offercategory = trans.category
where trans.date >= DATEADD(MONTH,-1,hist.offerdate)
group by hist.id, hist.chain


GO			
