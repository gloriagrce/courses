-- SOLUTION FOR HW multitable

--1
use AP
GO

--2
--3
--4
--5
use pubs
GO

--6
--7
--8
--9
select distinct a.au_lname + ', ' + a.au_fname as Author
, t.title as Title
, s.stor_name as "Store Name"
, s.state as "Store State"
FROM authors a INNER JOIN titleauthor ta
  on a.au_id = ta.au_id 
  INNER JOIN titles t 
  on t.title_id = ta.title_id
  INNER JOIN sales sa
  on sa.title_id = t.title_id
  INNER JOIN stores s
  on s.stor_id = sa.stor_id

--10
use AdventureWorks2017
GO

--11
select top 4 HumanResources.Employee.BusinessEntityID
      , HumanResources.Employee.LoginID
	  , HumanResources.EmployeePayHistory.RateChangeDate
	  , HumanResources.EmployeePayHistory.Rate
FROM HumanResources.Employee JOIN
      HumanResources.EmployeePayHistory
	on HumanResources.Employee.BusinessEntityID = HumanResources.EmployeePayHistory.BusinessEntityID
order by HumanResources.EmployeePayHistory.Rate desc

--12