--Brand information for each id, chain for the offer being given

-- =============================================
-- Create Table features_bra_2m
-- =============================================
USE [avs]
GO


drop table features_bra_2m;

select hist.id, hist.chain, 
		'1' as bra_ind_2m,                                                 --brand indicator 
		count(*) as bra_dis_items_p_2m, 									--distinct items purchased from brand
		count(distinct date) AS bra_n_trips_2m, 							--number of trips made to store for brand
		sum(purchasequantity) as bra_items_p_2m, 							--number of items purchased from brand
		sum(purchaseamount) as bra_a_spent_2m 							--total amount spent for the period on brand
		
into features_bra_2m

from histoffer hist inner join 
		transactions trans on
		hist.id = trans.id
		and hist.chain = trans.chain
		and hist.offerbrand = trans.brand
where trans.date <= DATEADD(MONTH,-1,hist.offerdate) and
	  trans.date > DATEADD(MONTH,-2,hist.offerdate)
group by hist.id, hist.chain


GO		
