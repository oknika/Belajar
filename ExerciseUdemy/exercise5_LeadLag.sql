select a.[PurchaseOrderID], a.[EmployeeID], a.[OrderDate], a.[TotalDue], b.[Name] as VendorName
,[prevOrderFro,VendorAmt] = lag(a.[TotalDue],1) over(partition by a.[VendorID] order by a.[OrderDate])
,[nextOrderByEmployeeVendor] = lead(b.[Name], 1) over(partition by a.[EmployeeID] order by a.[OrderDate])
from [Purchasing].[PurchaseOrderHeader] a inner join [Purchasing].[Vendor] b on b.BusinessEntityID = a.VendorID
where year(a.[OrderDate]) >= 2013 and a.[TotalDue] > 500
order by  a.[EmployeeID], a.[OrderDate]