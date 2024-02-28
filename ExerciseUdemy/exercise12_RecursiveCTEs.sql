-- number
with NumberSeries as
(
	select 1 as myNumber

	union all
	
	select myNumber + 2
	from NumberSeries
	where myNumber < 99
)

select myNumber from NumberSeries
go

 -- date
with DateSeries as
(
	select cast('01-01-2020' as date) as myDate

	union all
	
	select DATEADD(month,1,myDate)
	from DateSeries
	where myDate < cast('12-01-2029' as date)
)

select myDate from DateSeries
option(maxrecursion 500)
go