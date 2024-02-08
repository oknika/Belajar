select a.[PurchaseOrderID] AS [OrderID], b.[OrderDate]
	, a.[PurchaseOrderDetailID] AS [OrderDetailID], c.[Name] as [ProductName]
	, isnull(d.[Name],'None') as [Subcategory]
	, isnull(e.[Name], 'None') as [Category]
	, a.[OrderQty],a.[UnitPrice], a.[LineTotal]
	, [Order size category] = case
			when a.[OrderQty] > 500 then 'Large'
			when a.[OrderQty] > 50  and a.[OrderQty] <= 500 then 'Medium'
			else 'Small'
			end
	, [OrderType] = 'Purchase'
from [Purchasing].[PurchaseOrderDetail] a
inner join [Purchasing].[PurchaseOrderHeader] b on b.PurchaseOrderID = a.PurchaseOrderID
inner join [Production].[Product] c on a.ProductID = c.ProductID
left join [Production].[ProductSubcategory] d on c.ProductSubcategoryID = d.ProductSubcategoryID
left join [Production].[ProductCategory] e on e.ProductCategoryID = d.ProductCategoryID
where  month(b.[OrderDate]) = 12
UNION

select a.[SalesOrderID], b.[OrderDate]
	, a.[SalesOrderDetailID], c.[Name] as [ProductName]
	, isnull(d.[Name],'None') as [Subcategory]
	, isnull(e.[Name], 'None') as [Category]
	, a.[OrderQty],a.[UnitPrice], a.[LineTotal]
	, [Order size category] = case
			when a.[OrderQty] > 500 then 'Large'
			when a.[OrderQty] > 50  and a.[OrderQty] <= 500 then 'Medium'
			else 'Small'
			end
	, [OrderType] = 'Sale'
from [Sales].[SalesOrderDetail] a
inner join [Sales].[SalesOrderHeader] b on b.[SalesOrderID] = a.[SalesOrderID]
inner join [Production].[Product] c on a.ProductID = c.ProductID
left join [Production].[ProductSubcategory] d on c.ProductSubcategoryID = d.ProductSubcategoryID
left join [Production].[ProductCategory] e on e.ProductCategoryID = d.ProductCategoryID
where  month(b.[OrderDate]) = 12
order by [OrderDate] desc