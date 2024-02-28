create table AdventureWorks2019.dbo.Calendar
(
	DateValue date,
	DayOfWeekNumber int,
	DayOfWeekName varchar(32),
	DayOfMonthNumber int,
	MonthNumber int,
	YearNumber int,
	WeekenfFlag tinyint,
	HolidayFlag tinyint
)

insert into AdventureWorks2019.dbo.Calendar
(
	DateValue,
	DayOfWeekNumber,
	DayOfWeekName,
	DayOfMonthNumber,
	MonthNumber,
	YearNumber,
	WeekenfFlag,
	HolidayFlag
)

values()


select * from AdventureWorks2019.dbo.Calendar
truncate table AdventureWorks2019.dbo.Calendar

with DateSeries as
(
	select cast('01-01-2011' as date) as myDate

	union all
	
	select DATEADD(day,1,myDate)
	from DateSeries
	where myDate < cast('12-31-2030' as date)
)

insert into AdventureWorks2019.dbo.Calendar
(
	DateValue)
select myDate from DateSeries
option(maxrecursion 10000)


update AdventureWorks2019.dbo.Calendar
set	DayOfWeekNumber = DATEPART(weekday,DateValue),
	DayOfWeekName = FORMAT(DateValue,'dddd'),
	DayOfMonthNumber=day(DateValue),
	MonthNumber=MONTH(DateValue),
	YearNumber=YEAR(DateValue)

update AdventureWorks2019.dbo.Calendar
set WeekenfFlag = case when DayOfWeekName in ('Saturday','Sunday') then 1 else 0 end

update AdventureWorks2019.dbo.Calendar
set HolidayFlag = case when (DayOfMonthNumber = 1 and MonthNumber = 1) or (DayOfMonthNumber = 25 and MonthNumber = 12) then 1 else 0 end


select * from [Purchasing].[PurchaseOrderHeader] A
	join Calendar B
	on A.OrderDate = B.DateValue
where B.HolidayFlag = 1 or B.WeekenfFlag = 1
order by A.OrderDate