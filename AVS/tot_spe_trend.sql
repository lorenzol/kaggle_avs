--Category information for each id, chain for the offer being given

-- =============================================
-- Create Table tot_spe_trend
-- =============================================
USE [avs]
GO


drop table tot_spe_trend_2;

select hist.id, hist.chain,
		sum(purchaseamount) as tot_spe_trend_2
		
into tot_spe_trend_2

from histoffer hist inner join 
		transactions trans on
		hist.id = trans.id
		and hist.chain = trans.chain
where trans.date between
		DATEADD(MONTH,-1,hist.offerdate) and 
		DATEADD(MONTH,-2,hist.offerdate)
group by hist.id, hist.chain


GO			
