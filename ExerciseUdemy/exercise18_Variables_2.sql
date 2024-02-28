declare @Today date, @BOM date, @PrevBOM date, @PrevEOM date
set @Today = cast(getdate() as date)
set @BOM = DATEFROMPARTS(year(@Today),month(@Today),1)
set @PrevBOM = DATEADD(month, -1, @BOM)
set @PrevEOM = DATEADD(day, -1, @BOM)

select * from dbo.Calendar where DateValue between @PrevBOM and @PrevEOM
go

declare @Today date = cast(getdate() as date)
declare @Current14 date = DATEFROMPARTS(year(@Today),month(@Today),14)
declare @PayPeriodEnd date = case when day(@Today) < 15 then DATEADD(month, -1, @Current14) else @Current14 end
declare @DatePriodStart date = DATEADD(day, 1, dateadd(month,-1,@PayPeriodEnd))

select @PayPeriodEnd
select @DatePriodStart
