[README (1).md](https://github.com/user-attachments/files/33104157/README.1.md)
# 🗄️ Data Digger – E-Commerce Store SQL Management Project

A simple MySQL project that manages the data of an online store, including customers, products, orders, and order details.

---

## 📌 About the Project

**Data Digger** is a database management project built using **MySQL**. It shows how an e-commerce store can keep its data organized in different tables and connect them with each other.

The database is named **DataDiggerNew**. It stores customer details, product information, orders placed, and the items inside each order. Using SQL queries, we can find useful information like total sales, most expensive products, and orders placed in a certain period.

This project was made to practice and understand the basics of SQL in a simple, hands-on way.

---

## 🎯 Project Objectives

- ✅ Create a database for an e-commerce store
- ✅ Design tables with proper primary keys and foreign keys
- ✅ Insert sample data into all tables
- ✅ Retrieve data using different SELECT queries
- ✅ Update and delete records when needed
- ✅ Use aggregate functions to analyze data
- ✅ Practice date functions and sorting
- ✅ Understand how tables are connected to each other

---

## 🧱 Database Tables

The database **DataDiggerNew** contains 4 tables:

### 👤 1. Customers
Stores the details of people who buy from the store.

| Column Name | Description |
|-------------|-------------|
| CustomerID | Unique ID for each customer (Primary Key) |
| CustomerName | Name of the customer |
| Email | Email address of the customer |
| Phone | Contact number |
| City | City where the customer lives |

### 📦 2. Products
Stores the items available in the store.

| Column Name | Description |
|-------------|-------------|
| ProductID | Unique ID for each product (Primary Key) |
| ProductName | Name of the product |
| Category | Type of product |
| Price | Price of the product |
| Stock | Number of items available |

### 🛒 3. Orders
Stores the main details of every order placed.

| Column Name | Description |
|-------------|-------------|
| OrderID | Unique ID for each order (Primary Key) |
| CustomerID | Customer who placed the order (Foreign Key) |
| OrderDate | Date when the order was placed |
| TotalAmount | Total amount of the order |

### 🧾 4. OrderDetails
Stores the products included in each order.

| Column Name | Description |
|-------------|-------------|
| OrderDetailID | Unique ID for each record (Primary Key) |
| OrderID | Order that the item belongs to (Foreign Key) |
| ProductID | Product that was ordered (Foreign Key) |
| Quantity | Number of items ordered |
| Price | Price of the product at the time of order |

> 📝 **Note:** Column names may differ slightly depending on the SQL file. These tables show the general structure of the project.

---

## 🔑 SQL Concepts Used

| Concept | Purpose |
|---------|---------|
| `CREATE DATABASE` | Create the project database |
| `CREATE TABLE` | Create tables to store data |
| `INSERT` | Add records into tables |
| `SELECT` | Retrieve data from tables |
| `WHERE` | Filter records based on a condition |
| `UPDATE` | Change existing records |
| `DELETE` | Remove records from a table |
| `ORDER BY` | Sort the results |
| `BETWEEN` | Find values within a range |
| `MAX` | Find the highest value |
| `MIN` | Find the lowest value |
| `AVG` | Find the average value |
| `SUM` | Find the total value |
| `COUNT` | Count the number of records |
| `GROUP BY` | Group data for summary results |
| `LIMIT` | Limit the number of rows shown |
| `Primary Key` | Uniquely identify each record |
| `Foreign Key` | Connect one table with another |
| Date Functions | Work with order dates |

---

## 🔗 Table Relationships

The four tables are connected using primary keys and foreign keys:

```text
Customers (CustomerID)
     │
     │  One customer can place many orders
     ▼
Orders (OrderID, CustomerID)
     │
     │  One order can have many items
     ▼
OrderDetails (OrderID, ProductID)
     ▲
     │  One product can appear in many orders
     │
Products (ProductID)
```

| Relationship | Type | Connected By |
|--------------|------|--------------|
| Customers → Orders | One to Many | `CustomerID` |
| Orders → OrderDetails | One to Many | `OrderID` |
| Products → OrderDetails | One to Many | `ProductID` |

---

## 📊 Operations Performed

### 🏗️ Creating the Database and Tables
```sql
CREATE DATABASE DataDiggerNew;
USE DataDiggerNew;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Email VARCHAR(50),
    Phone VARCHAR(15),
    City VARCHAR(30)
);
```

### ➕ Inserting Data
```sql
INSERT INTO Customers VALUES
(1, 'Riya Shah', 'riya@email.com', '9876543210', 'Surat');
```

### 🔍 Retrieving Data
```sql
SELECT * FROM Products;

SELECT * FROM Customers
WHERE City = 'Surat';
```

### ✏️ Updating and Deleting Data
```sql
UPDATE Products
SET Price = 1200
WHERE ProductID = 3;

DELETE FROM Orders
WHERE OrderID = 10;
```

### 📅 Sorting and Filtering
```sql
SELECT * FROM Products
ORDER BY Price DESC;

SELECT * FROM Orders
WHERE OrderDate BETWEEN '2025-01-01' AND '2025-03-31';
```

### 📈 Aggregate Functions
```sql
SELECT MAX(Price) FROM Products;
SELECT MIN(Price) FROM Products;
SELECT AVG(Price) FROM Products;
SELECT SUM(TotalAmount) FROM Orders;
SELECT COUNT(*) FROM Customers;
```

### 📦 Grouping and Limiting
```sql
SELECT CustomerID, COUNT(*) AS TotalOrders
FROM Orders
GROUP BY CustomerID;

SELECT * FROM Products
ORDER BY Price DESC
LIMIT 5;
```

### 🗓️ Date Functions
```sql
SELECT OrderID, YEAR(OrderDate) AS OrderYear, MONTH(OrderDate) AS OrderMonth
FROM Orders;
```

---

## 💻 Software/Tools Used

| Tool | Use |
|------|-----|
| 🐬 MySQL | Database management system |
| ⌨️ MySQL Command Line Client | Running SQL queries |
| 📝 Notepad | Writing and saving SQL code |
| 🪟 Windows 11 | Operating system |

---

## 📁 Project Structure

```text
Data-Digger/
│
├── DataDiggerNew.sql     # Complete SQL code for the project
└── README.md             # Project description
```

---

## 🚀 How to Run the Project

**Step 1:** Install MySQL on your computer.

**Step 2:** Open **MySQL Command Line Client** and enter your password.

**Step 3:** Create the database:
```sql
CREATE DATABASE DataDiggerNew;
```

**Step 4:** Select the database:
```sql
USE DataDiggerNew;
```

**Step 5:** Run the SQL file:
```sql
SOURCE C:/path/to/DataDiggerNew.sql;
```
> 💡 Replace `C:/path/to/` with the actual location of your SQL file.

**Step 6:** Check that the tables were created:
```sql
SHOW TABLES;
```

**Step 7:** Try some queries:
```sql
SELECT * FROM Customers;
```

---

## 📈 Project Result

After completing this project:

- ✅ The **DataDiggerNew** database was created successfully
- ✅ All 4 tables were created and connected using keys
- ✅ Sample data was added to every table
- ✅ Queries returned correct results for searching, sorting, and filtering
- ✅ Totals, averages, and counts were calculated using aggregate functions
- ✅ Records were updated and deleted without breaking table relationships

---

## 🎓 Learning Outcome

Through this project, I learned:

- 📘 How to design a database from scratch
- 📘 How primary keys and foreign keys connect tables
- 📘 How to write basic and intermediate SQL queries
- 📘 How to use aggregate functions to understand data
- 📘 How to group, sort, and limit results
- 📘 How to work with date values in SQL
- 📘 How to use the MySQL Command Line Client confidently

---

## 🌟 Conclusion

**Data Digger** helped me understand how a real online store keeps its data organized. Working with customers, products, orders, and order details showed me how important it is to connect tables properly.

This project gave me a strong base in MySQL, and I would like to improve it further in the future by adding more tables, joins, and advanced queries.

---

## 👨‍💻 Author

**Pankti Patel**

---

## 👨‍💻 Created By
**Pankti Patel**

💻 **Data Digger – E-Commerce Store SQL Management Project**

⭐ **Thank you for checking out my project!**
