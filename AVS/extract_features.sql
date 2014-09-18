
--Scripts for features 
--****************************

--ALL TRANSACTIONS
--################
--transactions by ID and CHAIN
--get initial features from all transactions
--******************************************
drop table features1;

create table features1
as
select id, chain, 
				count(*) as dis_items_p,  					--distinct items purchased
				count(distinct dept) AS n_depts, 			--number of depts purchased from
				count(distinct category) AS n_categories, 	--number of categories purchased from
				count(distinct company) AS n_companies, 	--number of companies purchased from
				count(distinct brand) AS n_brands, 			--number of brands purchased from
				count(distinct date) AS n_trips, 			--number of trips made to store
				sum(purchasequantity) as items_p, 			--number of items purchased
				sum(purchaseamount) as a_spent 				--total amount spent for the period
from transactions
where id = '86246'
group by id, chain
limit 100


--PREVIOUS OFFERS
--###############
--Looking at past offers and deriving features from them
--In field names 'po' refers to previous offers
--******************************************************
drop table features2;

create table features2
as
select id, chain,												--All fields are from transactions on previous offers
				count(*) as po_dis_items_p,  					--distinct items purchased
				count(distinct t.dept) AS po_n_depts, 			--number of depts purchased from
				count(distinct t.category) AS po_n_categories, 	--number of categories purchased from
				count(distinct t.company) AS po_n_companies, 	--number of companies purchased from
				count(distinct t.brand) AS po_n_brands, 		--number of brands purchased from
				count(distinct t.date) AS po_n_trips, 			--number of trips made to store
				sum(t.purchasequantity) as po_items_p, 			--number of items purchased
				sum(t.purchaseamount) as po_a_spent, 			--total amount spent for the period
				count(distinct o.offer) as po_n_offers,         --number of offers redeemed
				median(o.quantity) as po_med_quantity,          --median purchase quantity for offer
				median(o.offervalue) as po_med_value            --median dollar value of offer
FROM
	transactions AS t
JOIN 
	offers AS o ON 
			t.category = o.category 
			AND o.company = t.company 
			AND o.brand = t.brand
where id = '86246'
group by id, chain
limit 100