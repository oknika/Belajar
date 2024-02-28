select [PurchaseOrderID], [VendorID], [OrderDate], [TotalDue]
,[NonRejectedItems] = (select count(*) from [Purchasing].[PurchaseOrderDetail] B where B.PurchaseOrderID = A.PurchaseOrderID and [RejectedQty] = 0 )
,[MostExpensiveItem] = (select max([UnitPrice]) from [Purchasing].[PurchaseOrderDetail] B where B.PurchaseOrderID = A.PurchaseOrderID)
from [Purchasing].[PurchaseOrderHeader] A