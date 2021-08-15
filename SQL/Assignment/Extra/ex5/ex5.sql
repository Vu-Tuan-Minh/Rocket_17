use adventureworks;


-- Question 1: Viết 1 query lấy thông tin "Name" từ bảng Production.Product có name của ProductSubcategory là 'Saddles'.
with a as(
			select ProductSubcategoryID 
			from ProductSubcategory
			where `Name` = "Saddles")
select * 
from Product
where ProductSubcategoryID = (select * from a);

-- Question 2:

with b as(				SELECT ProductSubcategoryID
								FROM productsubcategory
                                WHERE `name` LIKE "Bo%")
select * 
from Product
where ProductSubcategoryID in (select * from b);

-- Question 3:Viết câu query trả về tất cả các sản phẩm có giá rẻ nhất (lowest ListPrice) và Touring Bike (nghĩa là ProductSubcategoryID = 3)
with a as (
select Min(ListPrice) 
from Product
where ProductSubcategoryID = 3)
select * 
from Product
where ListPrice = (select * from a);

-- Exercise 2: JOIN nhiều bảng 
-- Question 1: Viết query lấy danh sách tên country và province được lưu trong AdventureWorks2008sample database
	
    select * 
    from countryregion c
    join stateprovince s 
    on c.CountryRegionCode = s.CountryRegionCode ;
    
    -- Question 2: Tiếp tục với câu query trước và thêm điều kiện là chỉ lấy country Germany và Canada
    select * 
    from countryregion c
    join stateprovince s 
    on c.CountryRegionCode = s.CountryRegionCode 
    where c.`Name` in ("Germany" , "Canada")
    order by c.`Name`,s.`Name`;
    
--     Question 3:	Từ bảng SalesPerson, chúng ta lấy cột BusinessEntityID (là định danh của người 
-- 				sales), Bonus and the SalesYTD (là đã sale được bao nhiêu người trong năm nay)
-- 				Từ bảng SalesOrderHeader, chúng ta lấy cột SalesOrderID OrderDate

SELECT s.SalesOrderID, DATE(s.OrderDate), s.SalesPersonID, sp.SalesPersonID, sp.Bonus, sp.SalesYTD
FROM salesorderheader s
JOIN salesperson sp ON s.SalesPersonID = sp.SalesPersonID
WHERE s.OnlineOrderFlag != 1 AND s.SalesOrderID IS NOT NULL;

/* Question 4:
	Sử dụng câu query ở question 3, thêm cột JobTitle and xóa cột SalesPersonID và 
	BusinessEntityID*/ 
SELECT soh.SalesOrderID, DATE(soh.OrderDate) AS OrderDate, e.title AS JobTitle, sp.Bonus, sp.SalesYTD
FROM salesorderheader soh
JOIN salesperson sp ON soh.SalesPersonID = sp.SalesPersonID
JOIN employee e ON soh.SalesPersonID = e.employeeID
WHERE soh.OnlineOrderFlag != 1 AND soh.SalesOrderID IS NOT NULL;
--  baif nayf hoiw khoai
    
    