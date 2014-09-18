--Category information for each id, chain for the offer being given

-- =============================================
-- Create Table features_cat_2m
-- =============================================
USE [avs]
GO


drop table features_cat_2m;

select hist.id, hist.chain,
		'1' as cat_ind_2m,                                                  --cat indicator  
		count(*) as cat_dis_items_p_2m, 									--distinct items purchased from category
		count(distinct date) AS cat_n_trips_2m, 							--number of trips made to store for category
		sum(purchasequantity) as cat_items_p_2m, 							--number of items purchased from category
		sum(purchaseamount) as cat_a_spent_2m 							--total amount spent for the period on category
		
into features_cat_2m

from histoffer hist inner join 
		transactions trans on
		hist.id = trans.id
		and hist.chain = trans.chain
		and hist.offercategory = trans.category
where trans.date <= DATEADD(MONTH,-1,hist.offerdate) and
	  trans.date > DATEADD(MONTH,-2,hist.offerdate)
group by hist.id, hist.chain


GO			
