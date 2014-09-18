--Brand information for each id, chain for the offer being given

-- =============================================
-- Create Table features_bra_3m
-- =============================================
USE [avs]
GO


drop table features_bra_3m;

select hist.id, hist.chain, 
		'1' as bra_ind_3m,                                                 --brand indicator 
		count(*) as bra_dis_items_p_3m, 									--distinct items purchased from brand
		count(distinct date) AS bra_n_trips_3m, 							--number of trips made to store for brand
		sum(purchasequantity) as bra_items_p_3m, 							--number of items purchased from brand
		sum(purchaseamount) as bra_a_spent_3m 							--total amount spent for the period on brand
		
into features_bra_3m

from histoffer hist inner join 
		transactions trans on
		hist.id = trans.id
		and hist.chain = trans.chain
		and hist.offerbrand = trans.brand
where trans.date <= DATEADD(MONTH,-2,hist.offerdate) and
	  trans.date > DATEADD(MONTH,-3,hist.offerdate)
group by hist.id, hist.chain


GO		
