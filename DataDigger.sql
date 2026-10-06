CREATE DATABASE DataDigger;
Query OK, 1 row affected (0.211 sec)

USE DataDigger;
Database changed

CREATE TABLE Customers
(
CustomerID INT PRIMARY KEY,
Name VARCHAR(100),
Email VARCHAR(100),
Address VARCHAR(255)
);
OUTPUT:
Query OK, 0 rows affected (0.811 sec)


INSERT INTO Customers VALUES
(1, 'Alice', 'alice@gmail.com', '123 Park Street'),
(2, 'Bob', 'bob@yahoo.com', '456 Lake Road'),
(3, 'Alice', 'alice.smith@gmail.com', '789 Hill Crest'),
(4, 'David', 'david@outlook.com', '321 Maple Drive'),
(5, 'Emma', 'emma@gmail.com', '654 Pine Lane');
OUTPUT:
Query OK, 5 rows affected (0.040 sec)
Records: 5  Duplicates: 0  Warnings: 0


SELECT * FROM Customers;
OUTPUT:
+------------+-------+-----------------------+-----------------+
| CustomerID | Name  | Email                 | Address         |
+------------+-------+-----------------------+-----------------+
|          1 | Alice | alice@gmail.com       | 123 Park Street |
|          2 | Bob   | bob@yahoo.com         | 456 Lake Road   |
|          3 | Alice | alice.smith@gmail.com | 789 Hill Crest  |
|          4 | David | david@outlook.com     | 321 Maple Drive |
|          5 | Emma  | emma@gmail.com        | 654 Pine Lane   |
+------------+-------+-----------------------+-----------------+
5 rows in set (0.018 sec)


UPDATE Customers
SET Address = '999 New Street'
WHERE CustomerID = 2;
OUTPUT:
Query OK, 1 row affected (0.585 sec)
Rows matched: 1  Changed: 1  Warnings: 0


DELETE FROM Customers
WHERE CustomerID = 5;
OUTPUT:
Query OK, 1 row affected (0.567 sec)


SELECT * FROM Customers
WHERE Name = 'Alice';
OUTPUT:
+------------+-------+-----------------------+-----------------+
| CustomerID | Name  | Email                 | Address         |
+------------+-------+-----------------------+-----------------+
|          1 | Alice | alice@gmail.com       | 123 Park Street |
|          3 | Alice | alice.smith@gmail.com | 789 Hill Crest  |
+------------+-------+-----------------------+-----------------+
2 rows in set (0.336 sec)


CREATE TABLE Products (
ProductID INT PRIMARY KEY,
ProductName VARCHAR(100),
Price DECIMAL(10,2),
Stock INT
);
OUTPUT:
Query OK, 0 rows affected (0.241 sec)


INSERT INTO Products VALUES
(101, 'Wireless Mouse', 450.00, 25),
(102, 'Mechanical Keyboard', 1800.00, 10),
(103, 'Gaming Headset', 1200.00, 0),
(104, 'USB-C Hub', 850.00, 15),
(105, 'Mouse Pad', 300.00, 50);
OUTPUT:
Query OK, 5 rows affected (0.062 sec)
Records: 5  Duplicates: 0  Warnings: 0


SELECT * FROM Products
ORDER BY Price DESC;
OUTPUT:
+-----------+---------------------+---------+-------+
| ProductID | ProductName         | Price   | Stock |
+-----------+---------------------+---------+-------+
|       102 | Mechanical Keyboard | 1800.00 |    10 |
|       103 | Gaming Headset      | 1200.00 |     0 |
|       104 | USB-C Hub           |  850.00 |    15 |
|       101 | Wireless Mouse      |  450.00 |    25 |
|       105 | Mouse Pad           |  300.00 |    50 |
+-----------+---------------------+---------+-------+
5 rows in set (0.025 sec)


UPDATE Products
SET Price = 500.00
WHERE ProductID = 101;
OUTPUT:
Query OK, 1 row affected (0.041 sec)
Rows matched: 1  Changed: 1  Warnings: 0


DELETE FROM Products
WHERE Stock = 0;
OUTPUT:
Query OK, 1 row affected (0.596 sec)


SELECT * FROM Products
WHERE Price BETWEEN 500 AND 2000;
OUTPUT: 
+-----------+---------------------+---------+-------+
| ProductID | ProductName         | Price   | Stock |
+-----------+---------------------+---------+-------+
|       101 | Wireless Mouse      |  500.00 |    25 |
|       102 | Mechanical Keyboard | 1800.00 |    10 |
|       104 | USB-C Hub           |  850.00 |    15 |
+-----------+---------------------+---------+-------+
3 rows in set (0.565 sec)


SELECT MAX(Price) AS HighestPrice,
MIN(Price) AS LowestPrice
FROM Products;
OUTPUT:
+--------------+-------------+
| HighestPrice | LowestPrice |
+--------------+-------------+
|      1800.00 |      300.00 |
+--------------+-------------+
1 row in set (0.570 sec)


CREATE TABLE Orders (
OrderID INT PRIMARY KEY,
CustomerID INT,
OrderDate DATE,
TotalAmount DECIMAL(10,2),
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
OUTPUT:
Query OK, 0 rows affected (0.834 sec)


INSERT INTO Orders VALUES
(1001, 1, '2026-05-10', 900.00),
(1002, 2, '2026-06-15', 1800.00),
(1003, 3, '2026-06-28', 850.00),
(1004, 1, '2026-06-30', 300.00),
(1005, 4, '2026-06-01', 1200.00);
OUTPUT:
Query OK, 5 rows affected (0.592 sec)
Records: 5  Duplicates: 0  Warnings: 0


SELECT * FROM Orders
WHERE CustomerID = 1;
OUTPUT:
+---------+------------+------------+-------------+
| OrderID | CustomerID | OrderDate  | TotalAmount |
+---------+------------+------------+-------------+
|    1001 |          1 | 2026-05-10 |      900.00 |
|    1004 |          1 | 2026-06-30 |      300.00 |
+---------+------------+------------+-------------+
2 rows in set (0.031 sec)


UPDATE Orders
SET TotalAmount = 950.00
WHERE OrderID = 1001;
OUTPUT:
Query OK, 1 row affected (0.088 sec)
Rows matched: 1  Changed: 1  Warnings: 0


DELETE FROM Orders
WHERE OrderID = 1005;
OUTPUT:
Query OK, 1 row affected (0.029 sec)


SELECT * FROM Orders
WHERE OrderDate >= DATE_SUB('2026-07-01', INTERVAL 30 DAY);
OUTPUT:
+---------+------------+------------+-------------+
| OrderID | CustomerID | OrderDate  | TotalAmount |
+---------+------------+------------+-------------+
|    1002 |          2 | 2026-06-15 |     1800.00 |
|    1003 |          3 | 2026-06-28 |      850.00 |
|    1004 |          1 | 2026-06-30 |      300.00 |
+---------+------------+------------+-------------+
3 rows in set (0.541 sec)


SELECT MAX(TotalAmount) AS HighestOrder,
MIN(TotalAmount) AS LowestOrder,
AVG(TotalAmount) AS AverageOrder
FROM Orders;
OUTPUT:
+--------------+-------------+--------------+
| HighestOrder | LowestOrder | AverageOrder |
+--------------+-------------+--------------+
|      1800.00 |      300.00 |   975.000000 |
+--------------+-------------+--------------+
1 row in set (0.535 sec)


CREATE TABLE OrderDetails (
OrderDetailID INT PRIMARY KEY,
OrderID INT,
ProductID INT,
Quantity INT,
SubTotal DECIMAL(10,2),
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
OUTPUT:
Query OK, 0 rows affected (0.897 sec)


INSERT INTO OrderDetails VALUES
(1, 1001, 101, 2, 900.00),
(2, 1002, 102, 1, 1800.00),
(3, 1003, 104, 1, 850.00),
(4, 1004, 105, 1, 300.00),
(5, 1001, 105, 1, 300.00);
OUTPUT:
Query OK, 5 rows affected (0.634 sec)
Records: 5  Duplicates: 0  Warnings: 0


SELECT * FROM OrderDetails
WHERE OrderID = 1001;
OUTPUT:
+---------------+---------+-----------+----------+----------+
| OrderDetailID | OrderID | ProductID | Quantity | SubTotal |
+---------------+---------+-----------+----------+----------+
|             1 |    1001 |       101 |        2 |   900.00 |
|             5 |    1001 |       105 |        1 |   300.00 |
+---------------+---------+-----------+----------+----------+
2 rows in set (0.018 sec)


SELECT SUM(SubTotal) AS TotalRevenue
 FROM OrderDetails;
OUTPUT:
+--------------+
| TotalRevenue |
+--------------+
|      4150.00 |
+--------------+
1 row in set (0.541 sec)


 SELECT ProductID, SUM(Quantity) AS TotalQuantity
 FROM OrderDetails
 GROUP BY ProductID
 ORDER BY TotalQuantity DESC
 LIMIT 3;
OUTPUT: 
+-----------+---------------+
| ProductID | TotalQuantity |
+-----------+---------------+
|       101 |             2 |
|       105 |             2 |
|       102 |             1 |
+-----------+---------------+
3 rows in set (0.559 sec)


 SELECT COUNT(*) AS TimesSold
    -> FROM OrderDetails
    -> WHERE ProductID = 105;
OUTPUT:
+-----------+
| TimesSold |
+-----------+
|         2 |
+-----------+
1 row in set (0.530 sec)