create view testoffer
as
SELECT        testHistory.id, testHistory.chain, testHistory.market, offers.offer, offers.category AS offercategory, offers.company AS offercompany, offers.brand AS offerbrand, 
                         offers.quantity AS offerquantity, offers.offervalue, testHistory.offerdate
FROM            testHistory INNER JOIN
                         offers ON testHistory.offer = offers.offer


	