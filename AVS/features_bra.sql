--Brand information for each id, chain for the offer being given

-- =============================================
-- Create Table features_bra
-- =============================================
USE [avs]
GO


drop table features_bra;

select hist.id, hist.chain, 
		'1' as bra_ind,                                                  --brand indicator 
		count(*) as bra_dis_items_p, 									--distinct items purchased from brand
		count(distinct date) AS bra_n_trips, 							--number of trips made to store for brand
		sum(purchasequantity) as bra_items_p, 							--number of items purchased from brand
		sum(purchaseamount) as bra_a_spent 							--total amount spent for the period on brand

into features_bra

from histoffer hist inner join 
		transactions trans on
		hist.id = trans.id
		and hist.chain = trans.chain
		and hist.offerbrand = trans.brand
group by hist.id, hist.chain


GO		


	
