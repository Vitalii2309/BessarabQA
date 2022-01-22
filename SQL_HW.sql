--1. Выбрать все ордера(Orders) покупателя(Customers) Ernst Handel (одним запросом по имени покупателя

SELECT * FROM [Orders]
LEFT JOIN [Customers]
ON Customers.CustomerID = Orders.CustomerID
WHERE Customers.CustomerName = 'Ernst Handel'

--2. Выбрать все ордера, которые были сформированы в период с 1996-08-01 по 1996-08-08

SELECT * FROM [Orders]
WHERE OrderDate BETWEEN '1996-08-01' AND '1996-08-08'
ORDER BY OrderDate 

--3. Выбрать покупателей, у которых нет ордеров

SELECT * FROM [Customers]
JOIN Orders ON Orders.CustomerID = Customers.CustomerID
WHERE Orders.OrderDate IS NULL

--4. В таблице Customers вывести 2 столбца (страна и город) и отсортировать страны в алфавитном порядке (A-Z), а города в обратном (Z-A)

SELECT Country,City FROM [Customers]
ORDER BY Country ASC, City DESC;

--5. В таблице ордеров (Orders) вывести список всех ордеров, которые содержат в себе продукт 'Mozzarella di Giovanni'

SELECT Orders.OrderID,Orders.OrderDate,Products.ProductName FROM [Orders]
JOIN OrderDetails ON OrderDetails.OrderID = Orders.OrderID
JOIN Products ON Products.ProductID = OrderDetails.ProductID
WHERE Products.ProductName =  'Mozzarella di Giovanni'

--6. Вывести список не повторяющихся стран в таблице Customers

SELECT DISTINCT (Country) FROM [Customers]

--7. Найти всех покупателей, в имени которых встречается буквосочетание 'co' (латинские символы)

SELECT CustomerName FROM [Customers]
WHERE Customers.CustomerName LIKE '%co%'

--8. В таблице Products посчитать стоимость первых трех товаров в списке

SELECT SUM (Price) AS SUM  FROM [Products]
WHERE Products.ProductID <3

--9. Получить числовую разницу между общим кол-вом всех стран (включая повторяющиеся) в колонке “Countries”, таблицы “Customers”, и кол-вом уникальных стран.

SELECT COUNT (COUNTRY) AS 'ALL COUNTRIES',
COUNT (DISTINCT COUNTRY) AS 'UNIQUE COUNTRIES',
(COUNT (COUNTRY) - COUNT (DISTINCT COUNTRY)) AS RESULT
FROM CUSTOMERS;
