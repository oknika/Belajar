select [BusinessEntityID], [JobTitle], [VacationHours]
, [MaxVacationHours] = (select max([VacationHours]) from [HumanResources].[Employee])
, [MaxVacationHours%] = (([VacationHours]*1.0)/(select max([VacationHours]) from [HumanResources].[Employee]))*100
from [HumanResources].[Employee]
where (([VacationHours]*1.0)/(select max([VacationHours]) from [HumanResources].[Employee]))*100 >=  80