-- create a database
CREATE DATABASE Company;

-- use database
USE Company;

DROP DATABASE Company;

-- Table 1:- Employees
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employees (EmpID, Name, Department, Salary)
VALUES
(101, 'Amit Sharma', 'Finance', 75000),
(102, 'Priya Deshmukh', 'IT', 60000),
(103, 'Rahul Singh', 'HR', 50000),
(104, 'Anjali Mehta', 'Finance', 85000),
(105, 'Rohit Patil', 'IT', 72000),
(106, 'Akash Joshi', 'Finance', 55000),
(107, 'Meera Khan', 'HR', 48000),
(108, 'Arjun Kumar', 'Operations', 65000),
(109, 'Neha Verma', 'Finance', 80000),
(110, 'Aditya Rao', 'IT', 58000);

-- update the salary of employee with EmpID = 105.
UPDATE Employees SET Salary = 75000 WHERE EmpID = 105;

-- delete employees from the Employees table where Department = 'HR'.
DELETE FROM Employees WHERE Department = 'HR';

-- display all employees working in the "Finance" department.
SELECT * FROM Employees WHERE Department = 'Finance';

-- display the top 3 highest-paid employees using the ORDER BY and LIMIT clauses.
SELECT * FROM Employees ORDER BY Salary DESC LIMIT 3;

--  total salary paid by each department using the GROUP BY clause.
SELECT Department,SUM(Salary) AS TotalSalary FROM Employees GROUP BY Department;

-- retrieve all employees who earn more than 50,000 but less than 80,000 using the WHERE clause.
SELECT * FROM Employees WHERE Salary > 50000 AND Salary < 80000;

-- show employees whose names start with "A" using the LIKE clause.
SELECT * FROM Employees WHERE Name Like 'A%';

-- add a NOT NULL constraint on the Email column in the Employees table.
ALTER TABLE Employees ADD Email VARCHAR(100) NOT NULL;



-- Table 2:- Students (When creating the Students table, ensure that RollNo is unique and Marks cannot be negative. Write the SQL statement)
 CREATE TABLE Students (
    RollNo INT UNIQUE,
    Name VARCHAR(100),
    Marks INT CHECK (Marks >= 0)
);

INSERT INTO Students (RollNo, Name, Marks)
VALUES
(1, 'Sejal Shelke' , 20),
(2, 'Sonal Shelke' , 30),
(3, 'Sakshi Shimpi' , 35),
(4, 'Shravani Sarang' , 15),
(5, 'Trupthi Shetty' , 40),
(6, 'Vaishnavi Salunkhe' , 25),
(7, 'Vrishab Shenvi' , 36),
(8, 'Ninad Walke' , 45),
(9, 'Shweta More' , 32),
(10, 'Janhavi Toraskar' , 38);

-- Table 3:- Orders ( Create a table Orders where OrderID is the Primary Key and CustomerID is a Foreign Key referencing the Customers table)
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Email VARCHAR(100)
);

INSERT INTO Customers (CustomerID, CustomerName, Email)
VALUES
(321, 'Nisha Sharma', 'nisha@email.com'),
(657, 'Bhumika Vaity', 'bhumika@email.com'),
(368, 'Vanshita Parab', 'vanshita@email.com'),
(387, 'Aishwarya Acharya', 'aishwarya@email.com'),
(468, 'Ditto Roche', 'ditto@email.com');

drop table Customers;

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (OrderID, TotalAmount)
VALUES
(1001, 250.00),
(1002, 125.50),
(1003, 75.25),
(1004, 300.00),
(1005, 50.00);

drop table Orders;

--  Find the second highest salary from the Employees table using a subquery.

-- Retrieve names of employees whose salary is greater than the average salary using a subquery.

-- Display employees who work in the same department as the employee named "Rohit".
SELECT * FROM Employees WHERE Name = 'Rohit';



-- Use a built-in function to display the current date and time.
SELECT NOW() AS CurrentDateTime;
 
-- Write a query to show the length of each employee’s name using the LENGTH() function.
SELECT Name, LENGTH(Name) AS Length_OF_Name FROM Employees;
 
-- Retrieve the total number of employees in the company using a built-in function.
SELECT COUNT(*) AS TotalEmployees FROM Employees;
 
-- Create a user-defined function GetBonus(salary) that returns 10% of the salary as a bonus.
-- Use your GetBonus function to display EmpID, Name, and Bonus for all employees.
DELIMITER //
CREATE FUNCTION GetBonus(salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN salary * 0.10;
END //
DELIMITER ;

SELECT EmpID, Name, GetBonus(Salary) AS Bonus
FROM Employees;
