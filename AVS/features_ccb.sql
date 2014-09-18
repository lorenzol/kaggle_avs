--Category/Compnay/Brand information for each id, chain for the offer being given

-- =============================================
-- Create Table features_ccb
-- C/C/B -> Category/Compnay/Brand
-- =============================================
USE [avs]
GO


drop table features_ccb;

select hist.id, hist.chain,
		'1' as ccb_ind,                                                 --ccb indicator  
		count(*) as ccb_dis_items_p, 									--distinct items purchased from C/C/B
		count(distinct date) AS ccb_n_trips, 							--number of trips made to store for C/C/B
		sum(purchasequantity) as ccb_items_p, 							--number of items purchased from C/C/B
		sum(purchaseamount) as ccb_a_spent 							--total amount spent for the period on C/C/B
		
into features_ccb

from histoffer hist inner join 
		transactions trans on
		hist.id = trans.id
		and hist.chain = trans.chain
		and hist.offercategory = trans.category
		and hist.offercompany = trans.company
		and hist.offerbrand = trans.brand

group by hist.id, hist.chain


GO		

	
	
				
				
				
				
