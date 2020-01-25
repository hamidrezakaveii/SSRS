USE AdventureWorks2017;
go

Select SOH.OrderDate 'OrderDate',
		DATENAME(weekday, SOH.OrderDate) 'Weekday',
		SOH.SalesOrderNumber 'SalesOrder',
		PP.Name 'Product',
		PPS.Name 'SubCategory',
		sum(SOD.OrderQty) 'Quantity',
		sum(SOD.LineTotal) 'LineTotal'
from Sales.SalesOrderHeader SOH
	Inner join Sales.SalesPerson SP
		on SOH.SalesPersonID = SP.BusinessEntityID
	Inner join Sales.SalesOrderDetail SOD
		on SOH.SalesOrderID = SOD.SalesOrderID
	Inner join Production.Product PP
		on SOD.ProductID = PP.ProductID
	Inner join Production.ProductSubcategory PPS
		on PP.ProductSubcategoryID = PPS.ProductSubcategoryID
	Inner join Production.ProductCategory PPC
		on PPs.ProductCategoryID = PPC.ProductCategoryID
group by
		SOH.OrderDate,
		SOH.SalesOrderNumber,
		SOH.SalesOrderID,
		PP.Name,
		PPS.Name,
		PPC.Name
Having PPC.Name = 'Clothing' 
and (SOH.OrderDate between (@StartDate) and (@EndDate))


		Select *
		from Production.ProductCategory
		
		Select *
		from Sales.SalesOrderHeader SOH

		Select  Distinct DATEPART(weekday, OrderDate) as 'WeekDayNumber',
				DATENAME(weekday, OrderDate) as 'WeekDayName'
				from Sales.SalesOrderHeader SOH
				order by 'WeekDayNumber'


		select SSP.BusinessEntityID, PP.FirstName, PP.LastName 
		from Sales.SalesPerson SSP
		inner join HumanResources.Employee HRE
		on SSP.BusinessEntityID = HRE.BusinessEntityID
		inner join Person.Person PP
		on PP.BusinessEntityID = HRE.BusinessEntityID


		select PPC.Name 'Category',
		PPs.Name 'SubCategory',
		PP.Name 'Product',
		SOH.OrderDate 'OrderDate',
		SOH.SalesOrderNumber 'OrderNumber',
		SOD.orderQty 'Quantity',
		SOD.LineTotal 'LineTotal'
		from Sales.SalesPerson SSP
		Inner join Sales.SalesOrderHeader SOH
		on SSP.BusinessEntityID = SOH.SalesPersonID
		Inner join Sales.SalesOrderDetail SOD
		on SOD.SalesOrderID = SOH.SalesOrderID
		Inner Join Production.Product PP
		on SOD.ProductID = PP.ProductID
		Inner join Production.ProductSubcategory PPS
		on PP.ProductSubcategoryID = PPs.ProductSubcategoryID
		Inner join Production.ProductCategory PPC
		on PPs.ProductCategoryID = PPC.ProductCategoryID
		where (PPC.Name = (@Category) and PPS.Name = (@Subcategory) and PP.Name = (@Product))

		Select distinct Name 'Category' from Production.ProductCategory

		Select distinct PPS.Name 'Subcategory' from Production.ProductSubcategory PPS
		Inner join Production.ProductCategory PPC
		on PPS.ProductCategoryID = PPC.ProductCategoryID
		where PPC.Name = @Category --bikes

		Select distinct PP.Name 'Product' from Production.Product PP Inner join Production.ProductSubcategory PPS
		on PP.ProductSubcategoryID = PPS.ProductSubcategoryID
		Inner join Production.ProductCategory PPC
		on PPS.ProductCategoryID = PPC.ProductCategoryID
		where PPC.Name = @Category --bikes
		and PPS.Name = @Subcategory --mountain bikes


		select PP.Name 'Product',
		SOD.OrderQty 'Quantity',
		SOD.LineTotal  'LineTotal'
		from Sales.SalesOrderDetail SOD
		inner join Production.Product PP
		on SOD.ProductID = PP.ProductID
		inner join Sales.SalesOrderHeader SOH
		on SOD.SalesOrderID = SOH.SalesOrderID
		where SOH.SalesOrderNumber = @SalesOrder --'SO51144'
