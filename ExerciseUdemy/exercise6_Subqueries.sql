select * from (
select
[PurchaseOrderID], [VendorID], [OrderDate], [TaxAmt], [Freight], [TotalDue]
, [priceRank] = ROW_NUMBER() OVER(PARTITION BY [VendorID] ORDER BY [TotalDue] DESC)
, [priceRank2] = dense_rank() OVER(PARTITION BY [VendorID] ORDER BY [TotalDue] DESC)
from [Purchasing].[PurchaseOrderHeader]) A
where [priceRank2] between 1 and 3