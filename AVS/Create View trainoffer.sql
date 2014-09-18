
create view trainoffer
as
SELECT        trainHistory.id, trainHistory.chain, trainHistory.market, offers.offer, offers.category AS offercategory, offers.company AS offercompany, offers.brand AS offerbrand, 
                         offers.quantity AS offerquantity, offers.offervalue, trainHistory.offerdate, trainHistory.repeattrips, trainHistory.repeater
FROM            trainHistory INNER JOIN
                         offers ON trainHistory.offer = offers.offer


	