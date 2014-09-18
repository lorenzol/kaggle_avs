--Company information for each id, chain for the offer being given

-- =============================================
-- Create Table features_com
-- =============================================
USE [avs]
GO


drop table features_com;

select hist.id, hist.chain,
		'1' as com_ind,                                                 --com indicator  
		count(*) as com_dis_items_p, 									--distinct items purchased from company
		count(distinct date) AS com_n_trips, 							--number of trips made to store for company
		sum(purchasequantity) as com_items_p, 							--number of items purchased from company
		sum(purchaseamount) as com_a_spent 							--total amount spent for the period on company
		
into features_com

from histoffer hist inner join 
		transactions trans on
		hist.id = trans.id
		and hist.chain = trans.chain
		and hist.offercompany = trans.company
group by hist.id, hist.chain


GO		

	
			