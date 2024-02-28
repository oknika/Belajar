select 
[SubcategoryName] = A.[Name]
, [Products] = 
	(select stuff(
	(select ' -- ' + B.[Name]
	from [Production].[Product] B
	where B.ProductSubcategoryID = A.ProductSubcategoryID
	and B.[ListPrice] > 50
	for xml path(''))
	,1,4,''))
from [Production].[ProductSubcategory] A



