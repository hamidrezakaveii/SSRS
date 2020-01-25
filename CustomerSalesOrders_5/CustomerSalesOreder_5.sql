USE AdventureWorks2017;
go

Select SOH.OrderDate as 'OrderDate',
		SOH.SalesOrderNumber as 'SalesOrder',
		PP.Name as 'Product',
		PPS.Name as 'SubCategory',
		sum(SOD.OrderQty) as 'Quantity',
		sum(SOD.LineTotal) as 'LineTotal'
from Sales.SalesOrderHeader as SOH
	Inner join Sales.SalesPerson as SP
		on SOH.SalesPersonID = SP.BusinessEntityID
	Inner join Sales.SalesOrderDetail as SOD
		on SOH.SalesOrderID = SOD.SalesOrderID
	Inner join Production.Product as PP
		on SOD.ProductID = PP.ProductID
	Inner join Production.ProductSubcategory as PPS
		on PP.ProductSubcategoryID = PPS.ProductSubcategoryID
	Inner join Production.ProductCategory as PPC
		on PPs.ProductCategoryID = PPC.ProductCategoryID
group by
		SOH.OrderDate,
		SOH.SalesOrderNumber,
		SOH.SalesOrderID,
		PP.Name,
		PPS.Name,
		PPC.Name
having PPC.Name = 'Clothing'
and (SOH.OrderDate between (@StartDate) and (@EndDate))


		Select *
		from Production.ProductCategory