select c.[Name] as [Product Category], b.[Name] as [Product Subcategory], a.[Name], a.[ListPrice]
, [priceRank] = ROW_NUMBER() OVER(ORDER BY a.[ListPrice] DESC)
, [categoryPriceRank] = ROW_NUMBER() OVER(PARTITION BY c.[Name] ORDER BY a.[ListPrice] DESC)
, [top5PriceInCategory] = case when ROW_NUMBER() OVER(PARTITION BY c.[Name] ORDER BY a.[ListPrice] DESC) <=5 then 'Yes' else 'No' end
from [Production].[Product] a
inner join [Production].[ProductSubcategory] b on b.ProductSubcategoryID = a.ProductSubcategoryID
inner join [Production].[ProductCategory] c on b.ProductCategoryID = c.ProductCategoryID
ORDER BY 1,4 desc