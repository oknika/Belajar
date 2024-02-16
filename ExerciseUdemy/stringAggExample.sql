select a.[SalesOrderID], sum(a.[LineTotal]) as [Total]
, [productList] = string_agg(b.[name], ', ')

from [Sales].[SalesOrderDetail] a
inner join [Production].[Product] b on b.ProductID = a.ProductID

group by a.[SalesOrderID]
having sum(a.[LineTotal]) > 5000
order by 1