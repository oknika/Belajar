select [Gender] AS [Employee Gender], [Sales Representative],[Buyer],[Janitor]
from
(select [JobTitle], [VacationHours], [Gender]
from [HumanResources].[Employee]) A
pivot(avg([VacationHours]) for [JobTitle] in ([Sales Representative],[Buyer],[Janitor])) B