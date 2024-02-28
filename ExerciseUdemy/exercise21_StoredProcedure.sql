create procedure dbo.OrdersAboveThreshold(@Threshold money, @StartYear int, @EndYear int, @OrderType)
as
begin
	select * from [Sales].[SalesOrderHeader]
	where [TotalDue] > @Threshold
	and year([OrderDate]) between @StartYear and @EndYear
end

exec dbo.OrdersAboveThreshold 10000, 2011, 2011