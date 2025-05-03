CREATE INDEX idx_cccr
on sales.salesorderheader(CreditCardId, CurrencyRateId)

CREATE INDEX idx_cccti
on sales.salesorderheader(territoryid)

CREATE INDEX idx_cmt
on sales.salesorderheader(comment)

CREATE INDEX idx_cm2
on sales.salesorderheader(comment)