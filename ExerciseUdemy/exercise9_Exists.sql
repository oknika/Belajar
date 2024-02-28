select A.* --[PurchaseOrderID], [OrderDate], [SubTotal], [TaxAmt]
from [Purchasing].[PurchaseOrderHeader] A
where exists (
	select 1 from [Purchasing].[PurchaseOrderDetail] B
	where B.[PurchaseOrderID] = A.[PurchaseOrderID] and [OrderQty] > 500
	and [UnitPrice] > 50
)
order by [PurchaseOrderID]



select A.* --[PurchaseOrderID], [OrderDate], [SubTotal], [TaxAmt]
from [Purchasing].[PurchaseOrderHeader] A
where not exists (
	select 1 from [Purchasing].[PurchaseOrderDetail] B
	where B.[PurchaseOrderID] = A.[PurchaseOrderID] and [RejectedQty] > 0
)
order by [PurchaseOrderID]