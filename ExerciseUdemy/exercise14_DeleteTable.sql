create table #Sales
(
	OrderDate date,
	OrderMonth date,
	TotalDue money,
	OrderRank int
)

insert into #Sales
(
	OrderDate,
	OrderMonth,
	TotalDue,
	OrderRank
)
select OrderDate
	, OrderMonth = DATEFROMPARTS(year(OrderDate),month(OrderDate),1)
	, TotalDue
	, OrderRank = ROW_NUMBER() over(partition by DATEFROMPARTS(year(OrderDate),month(OrderDate),1) order by TotalDue Desc)
from [Sales].[SalesOrderHeader]

delete from #Sales where OrderRank > 10

select * from #Sales

drop table #Sales