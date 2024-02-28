ALTER procedure [dbo].[OrdersAboveThreshold](@Threshold money, @StartYear int, @EndYear int, @OrderType int)
as
begin
	declare @strSQL nvarchar(max)
	declare @StrOrderType nvarchar(20)
	declare @StrTableName nvarchar(50)

	if @OrderType = 1
		begin
			set @StrOrderType = 'Sales'
			set @StrTableName = '[Sales].[SalesOrderHeader]'
		end
	else if @OrderType = 2
		begin
			set @StrOrderType = 'Purchase'
			set @StrTableName = '[Purchasing].[PurchaseOrderHeader]'
		end

	set @strSQL = 'select [OrderId] = ' + @StrOrderType + 'OrderID, [OrderDate], [TotalDue], [OrderType] = '''+ @StrOrderType +''' from ' 
				+ @StrTableName + ' where [TotalDue] > ' + cast(@Threshold as nvarchar(max)) + ' and year([OrderDate]) between ' 
				+ cast(@StartYear as nvarchar(4)) + ' and ' + cast(@EndYear as nvarchar(4))
	exec sp_executesql @strSQL
end
GO

exec dbo.OrdersAboveThreshold 10000, 2011, 2011, 2