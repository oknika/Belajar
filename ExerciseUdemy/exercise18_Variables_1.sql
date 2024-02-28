declare @MaxVacationHours as int

select @MaxVacationHours = (select max([VacationHours]) from [HumanResources].[Employee])

select
[BusinessEntityID], [JobTitle], [VacationHours]
,[MaxVacationHours] = @MaxVacationHours
,[PercentOfMaxVacHours] = ([VacationHours]*1.0)/@MaxVacationHours
from [HumanResources].[Employee]
where ([VacationHours]*1.0)/@MaxVacationHours >= 0.8