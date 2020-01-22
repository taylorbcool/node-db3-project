-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
select ProductName, CategoryName from 'Product'
join Category
on Product.CategoryId = Category.Id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
select O.id, S.companyName, O.shippedDate
from 'Order' as O
join Shipper as S
  on O.ShipVia = S.Id
where ShippedDate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
select O.Id, ProductName, Quantity from 'Order' as O
join 'OrderDetail' as D
on D.Id = O.Id
join 'Product' as P
on P.Id = D.ProductId
where O.Id = 10251

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
select O.Id, CompanyName, LastName from 'Order' as O
join 'Customer' as C
on O.CustomerId = C.Id
join 'Employee' as E
on O.EmployeeId = E.Id