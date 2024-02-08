select datediff(day,getdate(),dateadd(day,-1,dateadd(month,1,datefromparts(year(getdate()),month(getdate()),1))))


select getdate()