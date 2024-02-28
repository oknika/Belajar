create view [Sales].vw_Top10MonthOverMonth AS
with Sales as
(select
	[OrderDate]
	,[OrderMonth] = DATEFROMPARTS(year([OrderDate]), MONTH([OrderDate]),1)
	,[TotalDue]
	,[OrderRank] = ROW_NUMBER() OVER(PARTITION BY DATEFROMPARTS(year([OrderDate]), MONTH([OrderDate]),1) order by [TotalDue] desc)
from [Sales].[SalesOrderHeader])
, Top10Sales as
(Select [OrderMonth], [Top10Total] = sum([TotalDue])
from Sales where OrderRank <=10 Group by [OrderMonth])

select A.[OrderMonth], A.[Top10Total],
[PrevTop10Total] = B.[Top10Total]
from Top10Sales A left join Top10Sales B on A.OrderMonth = dateadd(month,1,B.OrderMonth)
go

drop view [Sales].vw_Top10MonthOverMonth
select * from [Sales].vw_Top10MonthOverMonth order by [OrderMonth]