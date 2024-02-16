select [FirstName], count(*) as [Jumlah]
from [Person].[Person]
group by [FirstName]
having count(*) > 50
order by [Jumlah]

select a.[Name], count(*) as [CountOfSales]
, [TotalSales] = sum([LineTotal])
from [Production].[Product] a
inner join [Purchasing].[PurchaseOrderDetail] b on b.[ProductID] = a.[ProductID]
where a.[Name] like '%[0123456789]%'
group by a.[Name]
having sum([LineTotal]) > 10000
order by [TotalSales]
