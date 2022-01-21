--1. ������� ��� ������(Orders) ����������(Customers) Ernst Handel (����� �������� �� ����� ����������)

SELECT * FROM [Orders]
LEFT JOIN [Customers]
ON Customers.CustomerID = Orders.CustomerID
WHERE Customers.CustomerName = 'Ernst Handel'

--2. ������� ��� ������, ������� ���� ������������ � ������ � 1996-08-01 �� 1996-08-08

SELECT * FROM [Orders]
WHERE OrderDate BETWEEN '1996-08-01' AND '1996-08-08'
ORDER BY OrderDate 

--3. ������� �����������, � ������� ��� �������

SELECT * FROM [Customers]
JOIN Orders ON Orders.CustomerID = Customers.CustomerID
WHERE Orders.OrderDate IS NULL

--4. � ������� Customers ������� 2 ������� (������ � �����) � ������������� ������ � ���������� ������� (A-Z), � ������ � �������� (Z-A)

SELECT Country,City FROM [Customers]
ORDER BY Country ASC, City DESC;

--5.� ������� ������� (Orders) ������� ������ ���� �������, ������� �������� � ���� ������� 'Mozzarella di Giovanni'

SELECT Orders.OrderID,Orders.OrderDate,Products.ProductName FROM [Orders]
JOIN OrderDetails ON OrderDetails.OrderID = Orders.OrderID
JOIN Products ON Products.ProductID = OrderDetails.ProductID
WHERE Products.ProductName =  'Mozzarella di Giovanni'

--6.������� ������ �� ������������� ����� � ������� Customers

SELECT DISTINCT (Country) FROM [Customers]

--7.����� ���� �����������, � ����� ������� ����������� �������������� 'co' (��������� �������)

SELECT CustomerName FROM [Customers]
WHERE Customers.CustomerName LIKE '%co%'

--8.� ������� Products ��������� ��������� ������ ���� ������� � ������

SELECT SUM (Price) AS SUM  FROM [Products]
WHERE Products.ProductID <3