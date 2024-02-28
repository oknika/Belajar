WITH
sales AS (
	select [OrderDate]
		, [OrderMonth] = DATEFROMPARTS(year([OrderDate]), month([OrderDate]), 1)
		, [TotalDue]
		, [OrderRank] = ROW_NUMBER() OVER(PARTITION BY DATEFROMPARTS(year([OrderDate]), month([OrderDate]), 1) ORDER BY [TotalDue] DESC)
	from [Sales].[SalesOrderHeader])
, salesExc10 AS (
	select [OrderMonth], [TotalSales] = sum([TotalDue])
	from sales
	where [OrderRank] > 10
	group by [OrderMonth])
,purchase AS (
	select [OrderDate]
		, [OrderMonth] = DATEFROMPARTS(year([OrderDate]), month([OrderDate]), 1)
		, [TotalDue]
		, [OrderRank] = ROW_NUMBER() OVER(PARTITION BY DATEFROMPARTS(year([OrderDate]), month([OrderDate]), 1) ORDER BY [TotalDue] DESC)
	from [Purchasing].[PurchaseOrderHeader])
, purchaseExc10 AS (
	select [OrderMonth], [TotalPurchase] = sum([TotalDue])
	from purchase
	where [OrderRank] > 10
	group by [OrderMonth])

select A.[OrderMonth], A.[TotalSales], B.[TotalPurchase] from salesExc10 A JOIN purchaseExc10 B
on A.OrderMonth = B.OrderMonth
order by 1
