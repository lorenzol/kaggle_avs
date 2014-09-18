--Company information for each id, chain for the offer being given

-- =============================================
-- Create Table features_com_30
-- =============================================
USE [avs]
GO


drop table features_com_30;

select hist.id, hist.chain,
		'1' as com_ind_30,                                                  --com indicator  
		count(*) as com_dis_items_p_30, 									--distinct items purchased from company
		count(distinct date) AS com_n_trips_30, 							--number of trips made to store for company
		sum(purchasequantity) as com_items_p_30, 							--number of items purchased from company
		sum(purchaseamount) as com_a_spent_30 							--total amount spent for the period on company
		
into features_com_30

from histoffer hist inner join 
		transactions trans on
		hist.id = trans.id
		and hist.chain = trans.chain
		and hist.offercompany = trans.company
where trans.date >= DATEADD(MONTH,-1,hist.offerdate)
group by hist.id, hist.chain


GO		

	
			