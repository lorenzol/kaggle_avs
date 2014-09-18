SELECT
--from trainoffer
dbo.trainoffer.id,
dbo.trainoffer.chain,
--dbo.trainoffer.offer,
--dbo.trainoffer.market,
dbo.trainoffer.offervalue,
dbo.trainoffer.repeater,
--dbo.trainoffer.repeattrips,
--dbo.trainoffer.offerdate,

----------------------------------------------------
--Totals
----------------------------------------------------

--dbo.features_tot.tot_dis_items_p,
dbo.features_tot.tot_n_trips,
dbo.features_tot.tot_items_p,
dbo.features_tot.tot_a_spent,

dbo.features_tot_30.tot_ind_30,
dbo.features_tot_2m.tot_ind_2m,
dbo.features_tot_3m.tot_ind_3m,

--dbo.features_tot_30.tot_dis_items_p_30,
dbo.features_tot_30.tot_n_trips_30,
dbo.features_tot_2m.tot_n_trips_2m,
dbo.features_tot_3m.tot_n_trips_3m,

dbo.features_tot_30.tot_items_p_30,
dbo.features_tot_2m.tot_items_p_2m,
dbo.features_tot_3m.tot_items_p_3m,

dbo.features_tot_30.tot_a_spent_30,
dbo.features_tot_2m.tot_a_spent_2m,
dbo.features_tot_3m.tot_a_spent_3m,

dbo.features_tot_60.tot_ind_60,
--dbo.features_tot_60.tot_dis_items_p_60,
dbo.features_tot_60.tot_n_trips_60,
dbo.features_tot_60.tot_items_p_60,
dbo.features_tot_60.tot_a_spent_60,

dbo.features_tot_180.tot_ind_180,
--dbo.features_tot_180.tot_dis_items_p_180,
dbo.features_tot_180.tot_n_trips_180,
dbo.features_tot_180.tot_items_p_180,
dbo.features_tot_180.tot_a_spent_180,

--CCB
dbo.features_ccb.ccb_ind,
--dbo.features_ccb.ccb_dis_items_p,
dbo.features_ccb.ccb_n_trips,
dbo.features_ccb.ccb_items_p,
dbo.features_ccb.ccb_a_spent,

dbo.features_ccb_30.ccb_ind_30,
dbo.features_ccb_2m.ccb_ind_2m,
dbo.features_ccb_3m.ccb_ind_3m,

--dbo.features_ccb_30.ccb_dis_items_p_30,
dbo.features_ccb_30.ccb_n_trips_30,
dbo.features_ccb_2m.ccb_n_trips_2m,
dbo.features_ccb_3m.ccb_n_trips_3m,

dbo.features_ccb_30.ccb_items_p_30,
dbo.features_ccb_2m.ccb_items_p_2m,
dbo.features_ccb_3m.ccb_items_p_3m,

dbo.features_ccb_30.ccb_a_spent_30,
dbo.features_ccb_2m.ccb_a_spent_2m,
dbo.features_ccb_3m.ccb_a_spent_3m,

dbo.features_ccb_60.ccb_ind_60,
--dbo.features_ccb_60.ccb_dis_items_p_60,
dbo.features_ccb_60.ccb_n_trips_60,
dbo.features_ccb_60.ccb_items_p_60,
dbo.features_ccb_60.ccb_a_spent_60,

dbo.features_ccb_180.ccb_ind_180,
--dbo.features_ccb_180.ccb_dis_items_p_180,
dbo.features_ccb_180.ccb_n_trips_180,
dbo.features_ccb_180.ccb_items_p_180,
dbo.features_ccb_180.ccb_a_spent_180,
--end CCB

--CAT

dbo.features_cat.cat_ind,
--dbo.features_cat.cat_dis_items_p,
dbo.features_cat.cat_n_trips,
dbo.features_cat.cat_items_p,
dbo.features_cat.cat_a_spent,

dbo.features_cat_30.cat_ind_30,
dbo.features_cat_2m.cat_ind_2m,
dbo.features_cat_3m.cat_ind_3m,

--dbo.features_cat_30.cat_dis_items_p_30,
dbo.features_cat_30.cat_n_trips_30,
dbo.features_cat_2m.cat_n_trips_2m,
dbo.features_cat_3m.cat_n_trips_3m,

dbo.features_cat_30.cat_items_p_30,
dbo.features_cat_2m.cat_items_p_2m,
dbo.features_cat_3m.cat_items_p_3m,

dbo.features_cat_30.cat_a_spent_30,
dbo.features_cat_2m.cat_a_spent_2m,
dbo.features_cat_3m.cat_a_spent_3m,

dbo.features_cat_60.cat_ind_60,
--dbo.features_cat_60.cat_dis_items_p_60,
dbo.features_cat_60.cat_n_trips_60,
dbo.features_cat_60.cat_items_p_60,
dbo.features_cat_60.cat_a_spent_60,

dbo.features_cat_180.cat_ind_180,
--dbo.features_cat_180.cat_dis_items_p_180,
dbo.features_cat_180.cat_n_trips_180,
dbo.features_cat_180.cat_items_p_180,
dbo.features_cat_180.cat_a_spent_180,
--end CAT

--COM
dbo.features_com.com_ind,
--dbo.features_com.com_dis_items_p,
dbo.features_com.com_n_trips,
dbo.features_com.com_items_p,
dbo.features_com.com_a_spent,

dbo.features_com_30.com_ind_30,
dbo.features_com_2m.com_ind_2m,
dbo.features_com_3m.com_ind_3m,

--dbo.features_com_30.com_dis_items_p_30,
dbo.features_com_30.com_n_trips_30,
dbo.features_com_2m.com_n_trips_2m,
dbo.features_com_3m.com_n_trips_3m,

dbo.features_com_30.com_items_p_30,
dbo.features_com_2m.com_items_p_2m,
dbo.features_com_3m.com_items_p_3m,

dbo.features_com_30.com_a_spent_30,
dbo.features_com_2m.com_a_spent_2m,
dbo.features_com_3m.com_a_spent_3m,

dbo.features_com_60.com_ind_60,
--dbo.features_com_60.com_dis_items_p_60,
dbo.features_com_60.com_n_trips_60,
dbo.features_com_60.com_items_p_60,
dbo.features_com_60.com_a_spent_60,

dbo.features_com_180.com_ind_180,
--dbo.features_com_180.com_dis_items_p_180,
dbo.features_com_180.com_n_trips_180,
dbo.features_com_180.com_items_p_180,
dbo.features_com_180.com_a_spent_180,
--end COM

--BRA
dbo.features_bra.bra_ind,
--dbo.features_bra.bra_dis_items_p,
dbo.features_bra.bra_n_trips,
dbo.features_bra.bra_items_p,
dbo.features_bra.bra_a_spent,

dbo.features_bra_30.bra_ind_30,
dbo.features_bra_2m.bra_ind_2m,
dbo.features_bra_3m.bra_ind_3m,

--dbo.features_bra_30.bra_dis_items_p_30,
dbo.features_bra_30.bra_n_trips_30,
dbo.features_bra_2m.bra_n_trips_2m,
dbo.features_bra_3m.bra_n_trips_3m,

dbo.features_bra_30.bra_items_p_30,
dbo.features_bra_2m.bra_items_p_2m,
dbo.features_bra_3m.bra_items_p_3m,

dbo.features_bra_30.bra_a_spent_30,
dbo.features_bra_2m.bra_a_spent_2m,
dbo.features_bra_3m.bra_a_spent_3m,

dbo.features_bra_60.bra_ind_60,
--dbo.features_bra_60.bra_dis_items_p_60,
dbo.features_bra_60.bra_n_trips_60,
dbo.features_bra_60.bra_items_p_60,
dbo.features_bra_60.bra_a_spent_60,

dbo.features_bra_180.bra_ind_180,
--dbo.features_bra_180.bra_dis_items_p_180,
dbo.features_bra_180.bra_n_trips_180,
dbo.features_bra_180.bra_items_p_180,
dbo.features_bra_180.bra_a_spent_180
--end BRA

FROM
dbo.trainoffer
INNER JOIN dbo.features_tot ON dbo.trainoffer.id = dbo.features_tot.id AND dbo.trainoffer.chain = dbo.features_tot.chain
LEFT JOIN  dbo.features_tot_30 ON dbo.trainoffer.id = dbo.features_tot_30.id AND dbo.trainoffer.chain = dbo.features_tot_30.chain
LEFT JOIN  dbo.features_tot_60 ON dbo.trainoffer.id = dbo.features_tot_60.id AND dbo.trainoffer.chain = dbo.features_tot_60.chain
LEFT JOIN  dbo.features_tot_180 ON dbo.trainoffer.id = dbo.features_tot_180.id AND dbo.trainoffer.chain = dbo.features_tot_180.chain

LEFT JOIN  dbo.features_tot_2m ON dbo.trainoffer.id = dbo.features_tot_2m.id AND dbo.trainoffer.chain = dbo.features_tot_2m.chain
LEFT JOIN  dbo.features_tot_3m ON dbo.trainoffer.id = dbo.features_tot_3m.id AND dbo.trainoffer.chain = dbo.features_tot_3m.chain

LEFT JOIN  dbo.features_ccb ON dbo.trainoffer.id = dbo.features_ccb.id AND dbo.trainoffer.chain = dbo.features_ccb.chain
LEFT JOIN  dbo.features_ccb_30 ON dbo.trainoffer.id = dbo.features_ccb_30.id AND dbo.trainoffer.chain = dbo.features_ccb_30.chain
LEFT JOIN  dbo.features_ccb_60 ON dbo.trainoffer.id = dbo.features_ccb_60.id AND dbo.trainoffer.chain = dbo.features_ccb_60.chain
LEFT JOIN  dbo.features_ccb_180 ON dbo.trainoffer.id = dbo.features_ccb_180.id AND dbo.trainoffer.chain = dbo.features_ccb_180.chain
LEFT JOIN  dbo.features_ccb_2m ON dbo.trainoffer.id = dbo.features_ccb_2m.id AND dbo.trainoffer.chain = dbo.features_ccb_2m.chain
LEFT JOIN  dbo.features_ccb_3m ON dbo.trainoffer.id = dbo.features_ccb_3m.id AND dbo.trainoffer.chain = dbo.features_ccb_3m.chain

LEFT JOIN  dbo.features_cat ON dbo.trainoffer.id = dbo.features_cat.id AND dbo.trainoffer.chain = dbo.features_cat.chain
LEFT JOIN  dbo.features_cat_30 ON dbo.trainoffer.id = dbo.features_cat_30.id AND dbo.trainoffer.chain = dbo.features_cat_30.chain
LEFT JOIN  dbo.features_cat_60 ON dbo.trainoffer.id = dbo.features_cat_60.id AND dbo.trainoffer.chain = dbo.features_cat_60.chain
LEFT JOIN  dbo.features_cat_180 ON dbo.trainoffer.id = dbo.features_cat_180.id AND dbo.trainoffer.chain = dbo.features_cat_180.chain
LEFT JOIN  dbo.features_cat_2m ON dbo.trainoffer.id = dbo.features_cat_2m.id AND dbo.trainoffer.chain = dbo.features_cat_2m.chain
LEFT JOIN  dbo.features_cat_3m ON dbo.trainoffer.id = dbo.features_cat_3m.id AND dbo.trainoffer.chain = dbo.features_cat_3m.chain

LEFT JOIN  dbo.features_com ON dbo.trainoffer.id = dbo.features_com.id AND dbo.trainoffer.chain = dbo.features_com.chain
LEFT JOIN  dbo.features_com_30 ON dbo.trainoffer.id = dbo.features_com_30.id AND dbo.trainoffer.chain = dbo.features_com_30.chain
LEFT JOIN  dbo.features_com_60 ON dbo.trainoffer.id = dbo.features_com_60.id AND dbo.trainoffer.chain = dbo.features_com_60.chain
LEFT JOIN  dbo.features_com_180 ON dbo.trainoffer.id = dbo.features_com_180.id AND dbo.trainoffer.chain = dbo.features_com_180.chain
LEFT JOIN  dbo.features_com_2m ON dbo.trainoffer.id = dbo.features_com_2m.id AND dbo.trainoffer.chain = dbo.features_com_2m.chain
LEFT JOIN  dbo.features_com_3m ON dbo.trainoffer.id = dbo.features_com_3m.id AND dbo.trainoffer.chain = dbo.features_com_3m.chain

LEFT JOIN  dbo.features_bra ON dbo.trainoffer.id = dbo.features_bra.id AND dbo.trainoffer.chain = dbo.features_bra.chain
LEFT JOIN  dbo.features_bra_30 ON dbo.trainoffer.id = dbo.features_bra_30.id AND dbo.trainoffer.chain = dbo.features_bra_30.chain
LEFT JOIN  dbo.features_bra_60 ON dbo.trainoffer.id = dbo.features_bra_60.id AND dbo.trainoffer.chain = dbo.features_bra_60.chain
LEFT JOIN  dbo.features_bra_180 ON dbo.trainoffer.id = dbo.features_bra_180.id AND dbo.trainoffer.chain = dbo.features_bra_180.chain
LEFT JOIN  dbo.features_bra_2m ON dbo.trainoffer.id = dbo.features_bra_2m.id AND dbo.trainoffer.chain = dbo.features_bra_2m.chain
LEFT JOIN  dbo.features_bra_3m ON dbo.trainoffer.id = dbo.features_bra_3m.id AND dbo.trainoffer.chain = dbo.features_bra_3m.chain