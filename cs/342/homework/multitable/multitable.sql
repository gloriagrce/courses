--1 
use AP
GO

--2
select *
from Vendors JOIN Invoices
  on Vendors.VendorID = Invoices.VendorID
  where VendorState = 'NY'
  GO

--3 
select v.VendorName, i.InvoiceNumber, i.InvoiceDate,
       i.InvoiceTotal - i.PaymentTotal - i.CreditTotal AS Balance
from Vendors v JOIN Invoices i
  on v.VendorID = i.VendorID
WHERE i.InvoiceTotal - i.PaymentTotal - i.CreditTotal > 0
ORDER BY Balance desc
GO

--4

SELECT VendorName, VendorState
FROM Vendors
WHERE VendorState = 'CA' or 
	  VendorState = 'NY'
UNION
SELECT VendorName, 'Neither'
FROM Vendors
WHERE VendorState <> 'CA' and 
	  VendorState <> 'NY'
ORDER BY VendorName;
GO

--5 
use pubs
GO

--6
select *
from authors
where phone LIKE '[801]%'

--7 
select a.au_fname, 
       a.au_lname, 
	   t.title 
from authors a LEFT OUTER JOIN titleauthor ta
  on a.au_id = ta.au_id
 LEFT OUTER JOIN titles t
 on ta.title_id = t.title_id 

--8
select 'Publisher' as Type,
	   pub_name as Name, 
	   state
from pubs.dbo.publishers
union
select 'Vendor' as Type, 
       VendorName as Name,
	   VendorState as State
from AP.dbo.Vendors
order by state
GO
       
-- 9
select distinct a.au_lname + ', ' + a.au_fname as [Author],
       t.title as Title,
	   st.stor_name as [Store Name],
	   st.state as [Store State]
from authors a INNER JOIN titleauthor ta
  on a.au_id = ta.au_id
 INNER JOIN titles t
 on ta.title_id = t.title_id 
 INNER JOIN sales s
 on t.title_id = s.title_id
 INNER JOIN stores st
 on s.stor_id = st.stor_id
 GO

-- 10
use AdventureWorks2017
GO

-- 11  
select top 4 SUBSTRING(e.LoginID,17,10) as [Employee ID],
       e.LoginID as [Employee Login ID],
	   p.Rate, 
	   p.ModifiedDate as [Rate Change Date]
from HumanResources.Employee e JOIN HumanResources.EmployeePayHistory p
  on e.BusinessEntityID = p.BusinessEntityID
  order by Rate desc
GO

-- 12
select e.LoginID, 
       a.AddressLine1, 
	   a.AddressID
from HumanResources.Employee e LEFT OUTER JOIN Person.BusinessEntityAddress ea
  on e.BusinessEntityID = ea.BusinessEntityID
LEFT OUTER JOIN Person.Address a
  on ea.AddressID = a.AddressID
where a.AddressLine1 = ''

