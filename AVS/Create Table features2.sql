-- =============================================
-- Create View template
-- =============================================
USE [avs]
GO

drop table features2;

select id, chain,												--All fields are from transactions on previous offers
				count(*) as po_dis_items_p,  					--distinct items purchased
				count(distinct t.dept) AS po_n_depts, 			--number of depts purchased from
				count(distinct t.category) AS po_n_categories, 	--number of categories purchased from
				count(distinct t.company) AS po_n_companies, 	--number of companies purchased from
				count(distinct t.brand) AS po_n_brands, 		--number of brands purchased from
				count(distinct t.date) AS po_n_trips, 			--number of trips made to store
				sum(t.purchasequantity) as po_items_p, 			--number of items purchased
				sum(t.purchaseamount) as po_a_spent, 			--total amount spent for the period
				count(distinct o.offer) as po_n_offers         --number of offers redeemed
				--med(o.quantity) as po_med_quantity,          --median purchase quantity for offer
				--med(o.offervalue) as po_med_value            --median dollar value of offer
into features2
FROM
	transactions AS t
JOIN 
	offers AS o ON 
			t.category = o.category 
			AND t.company = o.company 
			AND t.brand = o.brand
group by id, chain