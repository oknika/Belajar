 create function Production.ufn_ProductsByColor(@Color nvarchar(15))
 returns table
 as
 return(
	select [Name], [ProductNumber], [Color]
	from [Production].[Product]
	where lower(Color) = lower(@Color)
 )

go

select * from Production.ufn_ProductsByColor('blue')
go

 create function Production.ufn_ProductsByPriceRange(@MinPrice money, @MaxPrice money)
 returns table
 as
 return(
	select [ProductID], [Name], [ListPrice]
	from [Production].[Product]
	where [ListPrice] between @MinPrice and @MaxPrice
 )
 go

select * from Production.ufn_ProductsByPriceRange(10, 200) order by ListPrice
go