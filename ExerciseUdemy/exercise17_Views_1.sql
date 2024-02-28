create view [Sales].vw_salesRolling3Days AS
select 
	OrderDate,
	TotalDue,
	SalesLast3Days= sum(TotalDue) over(order by OrderDate rows between 2 preceding and current row)
from (
	select OrderDate, TotalDue = sum(TotalDue)
	from [Sales].[SalesOrderHeader]
	where year(OrderDate) = 2014
	group by OrderDate) X
go

select *, [% Rolling 3 days sales] = format(TotalDue/SalesLast3Days, 'p')
from [Sales].vw_salesRolling3Days