create function dbo.ufnCurrentDate()
returns date
as begin
	return cast(getdate() as date)
end
go
select dbo.ufnCurrentDate()

create function dbo.ufnElapsedBussinessDays(@StarDate date, @EndDate date)
returns int
as begin
	return (
	select count(*) from dbo.Calendar
	where DateValue between @StarDate and @EndDate
	and WeekenfFlag = 0 and HolidayFlag = 0) - 1
end
go


select 
[SalesOrderID], [OrderDate], [DueDate], [ShipDate], [ElapsedBussinesDays] = dbo.ufnElapsedBussinessDays([OrderDate], [ShipDate])
from [Sales].[SalesOrderHeader]
where year([OrderDate]) = 2011

drop function dbo.ufnElapsedBussinessDays
go

create function dbo.ufnReturnPercentNumber(@FirstNumber int, @SecondNumber int)
returns nvarchar(100)
as begin
	return cast(format((@FirstNumber*1.0)/@SecondNumber,'p') as nvarchar(100))
end
go

select dbo.ufnReturnPercentNumber(782,500)
go

declare @MaxVacHours int = (select max([VacationHours]) from [HumanResources].[Employee])
select [BusinessEntityID], [JobTitle], [VacationHours]
, [% MaxVacationHours] = dbo.ufnReturnPercentNumber([VacationHours], @MaxVacHours)
from [HumanResources].[Employee]