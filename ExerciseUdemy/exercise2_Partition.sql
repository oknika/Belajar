select c.[Name] as [Product Category], b.[Name] as [Product Subcategory], a.[Name], a.[ListPrice]
, [avgPriceByCategory] = avg(a.[ListPrice]) over(partition by c.[Name])
, [avgPriceByCategoryAndSubcategory] = avg(a.[ListPrice]) over(partition by c.[Name], b.[Name])
, [productVSCategoryDelta] = a.[ListPrice] - (avg(a.[ListPrice]) over(partition by c.[Name]))
from [Production].[Product] a
inner join [Production].[ProductSubcategory] b on b.ProductSubcategoryID = a.ProductSubcategoryID
inner join [Production].[ProductCategory] c on b.ProductCategoryID = c.ProductCategoryID
order by c.[Name], b.[Name], a.[Name]