select E.NationalIDNumber 'EmployeeId',
P.FirstName 'FirstName',
P.LastName 'LastName',
P.Title 'Title',
E.HireDate 'HireDate',
E.VacationHours 'VacationHours',
E.SickLeaveHours 'SickLeaveHours'  
 from
HumanResources.Employee E 
Inner join Person.Person P
on E.BusinessEntityID = P.BusinessEntityID