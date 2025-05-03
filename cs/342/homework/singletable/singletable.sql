--Gloria Grace

--1
use ap
GO

--2 
SELECT VendorContactFName as [FirstName]
		,VendorContactLName as [LastName]
		,VendorName as [Name]
		,VendorState as [State]
		,VendorCity as [City]
from Vendors 
order by State, City, LastName, FirstName desc
GO

--3 
select VendorContactLName + ', ' + VendorContactFName as [Full Name]
from Vendors
where VendorState = 'OH'
order by VendorContactLName, VendorContactFName desc
GO

--4
select InvoiceTotal
		,InvoiceTotal * 0.25 as [25%]
		,InvoiceTotal * 1.25 as [Plus 25%]
from Invoices
where InvoiceTotal > 1000
order by InvoiceTotal desc
GO

--5a not sure whether to keep the OH limiations or the original problem.                      
select VendorContactLName + ', ' + VendorContactFName as [Full Name]
from Vendors
where VendorContactLName LIKE 'A%'
	  OR VendorContactLName LIKE 'D%'
	  OR VendorContactLName LIKE 'E%'
	  OR VendorContactLName LIKE 'L%'
order by VendorContactLName, VendorContactFName desc
GO

--5b
select VendorContactLName + ', ' + VendorContactFName as [Full Name]
from Vendors
where VendorContactLName LIKE 'A%'
	  OR VendorContactLName LIKE '[D-E]%'
	  OR VendorContactLName LIKE 'L%'
order by VendorContactLName, VendorContactFName desc
GO

--6
select *
from Invoices
where PaymentDate IS NULL and PaymentTotal != 0
GO

--7
select * 
from Vendors
where DefaultTermsID = 3
GO

--8 
select * 
from Vendors
where DefaultTermsID = 3 and DefaultAccountNo >=540
GO

--9 
select *
from Vendors
where VendorName LIKE '%Company%'
GO

--10
select VendorState
	   ,substring(VendorPhone,1,5) as [Prefix]
from Vendors
group by VendorState, substring(VendorPhone,1,5)
GO

--10 alternative
select distinct VendorState
        , LEFT(VendorPhone,5) Prefix 
from Vendors

--11 
select VendorState
	   ,substring(VendorPhone,1,5) as [Prefix]
from Vendors
where VendorPhone IS NOT NULL
group by VendorState, substring(VendorPhone,1,5)
GO


--12
use pubs
GO

--13
select top 5 title
		, ytd_sales
from titles
order by ytd_sales desc
GO

--14
select title
	   , ytd_sales/price as [Sold]
from titles
GO

--14 no brackets could work. 
select title
	   , (ytd_sales/price) Sold
from titles
GO

--15
select top 3 title
	   , ytd_sales/price as [Sold]
from titles
order by Sold desc
GO

--16 The following query might encounter a problem because it is divide that zero is not possible.

