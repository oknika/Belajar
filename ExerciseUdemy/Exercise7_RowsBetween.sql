select *
,Rolling3MonthTotal = sum([SubTotal]) over(order by OrderYear desc, OrderMonth desc rows between 2 preceding and current row)
,MovingAvg6Month = avg([SubTotal]) over(order by OrderYear desc, OrderMonth desc rows between 6 preceding and 1 preceding)
,MovingAvgNext2Month = avg([SubTotal]) over(order by OrderYear desc, OrderMonth desc rows between current row and 2 following)
from(
select
OrderMonth = month([OrderDate]),
OrderYear = year([OrderDate]),
[SubTotal] = sum([SubTotal])

from [Purchasing].[PurchaseOrderHeader]
group by month([OrderDate]), year([OrderDate])

) A

order by OrderYear desc, OrderMonth desc
