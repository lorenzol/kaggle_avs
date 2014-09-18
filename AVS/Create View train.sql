USE avs;
GO
IF OBJECT_ID ('dbo.train', 'V') IS NOT NULL
DROP VIEW dbo.train ;
GO

create view train
as
SELECT
--from trainHistory
dbo.trainHistory.id,
dbo.trainHistory.chain,
dbo.trainHistory.offer,
dbo.trainHistory.market,
dbo.trainHistory.repeattrips,
dbo.trainHistory.repeater,
dbo.trainHistory.offerdate,

--all transaction items
dbo.features_tot.tot_dis_items_p,
dbo.features_tot.tot_n_depts,
dbo.features_tot.tot_n_categories,
dbo.features_tot.tot_n_companies,
dbo.features_tot.tot_n_brands,
dbo.features_tot.tot_n_trips,
dbo.features_tot.tot_items_p,
dbo.features_tot.tot_a_spent,


dbo.features_ccb.ccb_dis_items_p,
dbo.features_ccb.ccb_n_trips,
dbo.features_ccb.ccb_items_p,
dbo.features_ccb.ccb_a_spent,

dbo.features_cat.cat_n_companies,
dbo.features_cat.cat_dis_items_p,
dbo.features_cat.cat_n_brands,
dbo.features_cat.cat_n_trips,
dbo.features_cat.cat_items_p,
dbo.features_cat.cat_a_spent,

dbo.features_com.com_dis_items_p,
dbo.features_com.com_n_depts,
dbo.features_com.com_n_categories,
dbo.features_com.com_n_brands,
dbo.features_com.com_n_trips,
dbo.features_com.com_items_p,
dbo.features_com.com_a_spent,

dbo.features_bra.bra_dis_items_p,
dbo.features_bra.bra_n_depts,
dbo.features_bra.bra_n_companies,
dbo.features_bra.bra_n_categories,
dbo.features_bra.bra_n_trips,
dbo.features_bra.bra_items_p,
dbo.features_bra.bra_a_spent

FROM
dbo.trainHistory
INNER JOIN dbo.features_tot ON dbo.trainHistory.id = dbo.features_tot.id AND dbo.trainHistory.chain = dbo.features_tot.chain
LEFT JOIN dbo.features_ccb ON dbo.trainHistory.id = dbo.features_tot.chain AND dbo.trainHistory.chain = dbo.features_ccb.chain
LEFT JOIN dbo.features_cat ON dbo.trainHistory.id = dbo.features_cat.id AND dbo.trainHistory.chain = dbo.features_cat.chain
LEFT JOIN dbo.features_com ON dbo.trainHistory.id = dbo.features_com.id AND dbo.trainHistory.chain = dbo.features_com.chain
LEFT JOIN dbo.features_bra ON dbo.features_bra.id = dbo.trainHistory.id AND dbo.features_bra.chain = dbo.trainHistory.chain
