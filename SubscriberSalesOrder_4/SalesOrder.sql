select SOH.OrderDate 'Date',
		SOH.SalesOrderNumber 'order',
		PP.Name 'Product',
		PPS.Name 'SubCategory',
		sum(SOD.OrderQty) 'Quantity',
		sum(SOD.LineTotal) 'LineTotal'
from Sales.SalesPerson SSP Inner join Sales.SalesOrderHeader SOH 
	on SSP.BusinessEntityID = SOH.SalesPersonID
Inner join Sales.SalesOrderDetail SOD
	on SOd.SalesOrderID = soh.SalesOrderID
Inner join Production.Product PP
	on SOD.ProductID = PP.ProductID
inner join Production.ProductSubcategory PPS
	on PP.ProductSubcategoryID = PPS.ProductSubcategoryID
Inner join Production.ProductCategory PPC
	on PPS.ProductCategoryID = PPC.ProductCategoryID
	group by 
	SOH.OrderDate,
		SOH.SalesOrderNumber,
		PP.Name,
		PPS.Name,
		PPC.Name
having PPC.Name = 'Clothing'