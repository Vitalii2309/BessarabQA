--1. ¬ыбрать все ордера(Orders) покупател€(Customers) Ernst Handel (одним запросом по имени покупател€)

SELECT * FROM [Orders]
LEFT JOIN [Customers]
ON Customers.CustomerID = Orders.CustomerID
WHERE Customers.CustomerName = 'Ernst Handel'

--2. ¬ыбрать все ордера, которые были сформированы в период с 1996-08-01 по 1996-08-08

SELECT * FROM [Orders]
WHERE OrderDate BETWEEN '1996-08-01' AND '1996-08-08'
ORDER BY OrderDate 

--3. ¬ыбрать покупателей, у которых нет ордеров

SELECT * FROM [Customers]
JOIN Orders ON Orders.CustomerID = Customers.CustomerID
WHERE Orders.OrderDate IS NULL

--4. ¬ таблице Customers вывести 2 столбца (страна и город) и отсортировать страны в алфавитном пор€дке (A-Z), а города в обратном (Z-A)

SELECT Country,City FROM [Customers]
ORDER BY Country ASC, City DESC;

--5.¬ таблице ордеров (Orders) вывести список всех ордеров, которые содержат в себе продукт 'Mozzarella di Giovanni'

SELECT Orders.OrderID,Orders.OrderDate,Products.ProductName FROM [Orders]
JOIN OrderDetails ON OrderDetails.OrderID = Orders.OrderID
JOIN Products ON Products.ProductID = OrderDetails.ProductID
WHERE Products.ProductName =  'Mozzarella di Giovanni'

--6.¬ывести список не повтор€ющихс€ стран в таблице Customers

SELECT DISTINCT (Country) FROM [Customers]

--7.Ќайти всех покупателей, в имени которых встречаетс€ буквосочетание 'co' (латинские символы)

SELECT CustomerName FROM [Customers]
WHERE Customers.CustomerName LIKE '%co%'

--8.¬ таблице Products посчитать стоимость первых трех товаров в списке

SELECT SUM (Price) AS SUM  FROM [Products]
WHERE Products.ProductID <3