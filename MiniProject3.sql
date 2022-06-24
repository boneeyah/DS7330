##Question 1 MiniProject 3
##Customers who never bought a bike or tire##
select CustomerID, CustFirstName, CustLastName
from Customers
where CustomerID not in (select CustomerID
from(select CustomerID, CustFirstName, CustLastName, OrderNumber, ProductName
from Customers join Orders using(CustomerID) join Order_Details using(OrderNumber) join Products using(ProductNumber)
where ProductName like "%tire%" or ProductName like "%bike") as S);

##question 2 customers who HAVE bought a bike but not a helmet
select Distinct(CustomerID), CustFirstName, CustLastName
from Customers join Orders using(CustomerID) join Order_Details using(OrderNumber) join Products using(ProductNumber)
where ProductName like "%bike" and CustomerID not in(select CustomerID
from(select CustomerID, CustFirstName, CustLastName, OrderNumber, ProductName
from Customers join Orders using(CustomerID) join Order_Details using(OrderNumber) join Products using(ProductNumber)
where ProductName like "%Helmet") as S);

#question 3 customer orders that have a bike but do not have a helmet. Hint: This might seem 
# to be the same as problem 2 above, but it is not. Solve it using EXISTS and NOT EXISTS.
select OrderNumber, ProductNumber, ProductName, CustomerID
from order_details join products using(ProductNumber) join Orders as S using(OrderNumber)
where exists (select OrderNumber, ProductNumber, ProductName, CustomerID
from order_details join products using(ProductNumber) join Orders as T using(OrderNumber)
where ProductName like "%bike" and S.OrderNumber = T.OrderNumber 
and not exists(select * from order_details join products using(ProductNumber) join Orders as U using(OrderNumber)
where ProductName like "%Helmet" and S.OrderNumber = U.OrderNumber)) order by OrderNumber;

#4.	Display the customers and their orders that have a bike and a helmet in the same order. 
# Hint: Solve this problem using EXISTS
select OrderNumber, ProductNumber, ProductName, CustomerID
from order_details join products using(ProductNumber) join Orders as S using(OrderNumber)
where exists (select OrderNumber, ProductNumber, ProductName, CustomerID
from order_details join products using(ProductNumber) join Orders as T using(OrderNumber)
where ProductName like "%bike" and S.OrderNumber = T.OrderNumber 
and exists(select * from order_details join products using(ProductNumber) join Orders as U using(OrderNumber)
where ProductName like "%Helmet" and S.OrderNumber = U.OrderNumber)) order by OrderNumber;

#5. Show the vendors who sell accessories, car racks, and clothing. 
#Hint: Solve this problem using IN.
select distinct(VendName)
from(select VendorID, VendName, ProductNumber, ProductName, CategoryID
from vendors join product_vendors using(VendorID) join products using(ProductNumber)
where CategoryID in (1, 3)) as S;
