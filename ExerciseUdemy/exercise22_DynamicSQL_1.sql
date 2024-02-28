create procedure dbo.DynamicTopN(@TopN int, @AggFunction nvarchar(50))
as
begin
	declare @DynamicSQL nvarchar(max)

	set @DynamicSQL = 'SELECT * FROM
							(
								SELECT 
									ProductName = B.[Name],
									LineTotalSum = ' + @AggFunction + '(A.LineTotal),
									LineTotalSumRank = DENSE_RANK() OVER(ORDER BY ' + @AggFunction + '(A.LineTotal) DESC)
								FROM [Sales].[SalesOrderDetail] A JOIN [Production].[Product] B ON A.ProductID = B.ProductID
								GROUP BY B.[Name]
							) X
						WHERE LineTotalSumRank <=' + cast(@TopN as nvarchar(max))
	exec(@DynamicSQL)
end
go

exec dbo.DynamicTopN 9, 'sum'
