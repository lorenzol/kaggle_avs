--Company information for each id, chain for the offer being given

-- =============================================
-- Create Table features_com_2m
-- =============================================
USE [avs]
GO


drop table features_com_2m;

select hist.id, hist.chain,
		'1' as com_ind_2m,                                                  --com indicator  
		count(*) as com_dis_items_p_2m, 									--distinct items purchased from company
		count(distinct date) AS com_n_trips_2m, 							--number of trips made to store for company
		sum(purchasequantity) as com_items_p_2m, 							--number of items purchased from company
		sum(purchaseamount) as com_a_spent_2m 							--total amount spent for the period on company
		
into features_com_2m

from histoffer hist inner join 
		transactions trans on
		hist.id = trans.id
		and hist.chain = trans.chain
		and hist.offercompany = trans.company
where trans.date <= DATEADD(MONTH,-1,hist.offerdate) and
	  trans.date > DATEADD(MONTH,-2,hist.offerdate)
group by hist.id, hist.chain


GO		

	
			