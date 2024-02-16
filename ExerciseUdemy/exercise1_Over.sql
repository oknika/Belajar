select a.[FirstName], a.[LastName], b.[JobTitle], c.[Rate]
	, [Average rate] = avg(c.[Rate]) over()
	, [Maximum rate] = max(c.[Rate]) over()
	, [DiffFromAvgRate] = c.[Rate] - (avg(c.[Rate]) over())
	, [PercentOfMaxRate] = format((c.[Rate]/max(c.[Rate]) over()),'p')
from [Person].[Person] a inner join [HumanResources].[Employee] b on a.BusinessEntityID = b.BusinessEntityID
inner join [HumanResources].[EmployeePayHistory] c on c.BusinessEntityID = a.BusinessEntityID