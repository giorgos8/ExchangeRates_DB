

CREATE view [dbo].[VW_EXCHANGE_RATES_USD_MISSING_DATES]
AS
select
	cast(c.Date as varchar(10)) as DATE,
	cast(isnull(r.FROM_CURRENCY, '-') as varchar(10)) as FROM_CURRENCY,
	cast(isnull(r.TO_CURRENCY, '-') as varchar(10)) as TO_CURRENCY,
	isnull(cast(r.EXCHANGE_RATE as varchar(20)), '-') as EXCHANGE_RATE
from [dbo].[Calendar] c
left join [dbo].[VW_EXCHANGE_RATES_USD] r
	on c.Date = r.DATE
	AND R.FROM_CURRENCY = 'USD'
where
	c.date <= getdate()
--order by date desc
