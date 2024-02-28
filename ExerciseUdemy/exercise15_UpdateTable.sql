create table #ProductSold2012
(
	[SalesOrderID] int,
	[OrderDate] date,
	[LineTotal] money,
	[ProductID] int
)

insert into #ProductSold2012
(
	[SalesOrderID], [OrderDate]
)
select [SalesOrderID], [OrderDate]
from [Sales].[SalesOrderHeader]
where year([OrderDate]) = 2012

select * from #ProductSold2012

update A
set [LineTotal] = B.[LineTotal]
	, [ProductID] = B.[ProductID]
from #ProductSold2012 A
	join [Sales].[SalesOrderDetail] B
	on A.SalesOrderID = B.SalesOrderID

drop table #ProductSold2012
 --===============================-------------------------------------------------------

 create table #Sales
(
	[SalesOrderID] int,
	[OrderDate] date,
	[TotalDue] money,
	[LineTotal] money
)

insert into #Sales
(
	[SalesOrderID],
	[OrderDate],
	[TotalDue]
)
select [SalesOrderID],
	[OrderDate],
	[TotalDue]
from [Sales].[SalesOrderHeader]

select * from #Sales

update A
	set LineTotal = B.LineTotal

from #Sales A
	join [Sales].[SalesOrderDetail] B
	on A.SalesOrderID = B.SalesOrderID
where B.LineTotal > 10000