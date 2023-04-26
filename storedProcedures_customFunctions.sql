/*2*/
CREATE DATABASE MyFunkDB;

USE MyFunkDB;
/*3*/
CREATE TABLE Employees (
  EmployeeID INT PRIMARY KEY,
  FName VARCHAR(50) NOT NULL,
  LName VARCHAR(50) NOT NULL,
  Phone VARCHAR(12) NOT NULL
);

CREATE TABLE Salary (
  EmployeeID INT PRIMARY KEY,
  Position VARCHAR(50) NOT NULL,
  Salary DECIMAL(10, 2) NOT NULL
);

CREATE TABLE PersonalInfo (
  EmployeeID INT PRIMARY KEY,
  DateOfBirth DATE NOT NULL,
  MaritalStatus VARCHAR(20) NOT NULL,
  Address VARCHAR(100) NOT NULL
);
/*4*/
DELIMITER //
CREATE PROCEDURE get_employee_contacts()
BEGIN
  SELECT name, phone_number, address
  FROM employees;
END//

CREATE PROCEDURE get_unmarried_employee_info()
BEGIN
  SELECT name, date_of_birth, phone_number
  FROM employees
  WHERE marital_status = 'single';
END//

CREATE PROCEDURE get_manager_info()
BEGIN
  SELECT name, date_of_birth, phone_number
  FROM employees
  INNER JOIN job_info ON employees.employee_id = job_info.employee_id
  WHERE job_title = 'manager';
END//

/*5*/
CREATE FUNCTION get_min_client_age() RETURNS INT
BEGIN
    DECLARE min_age INT;
    SELECT MIN(age) INTO min_age FROM clients;
    RETURN min_age;
END//

SELECT c.name, ca.model
FROM clients c
JOIN orders o ON o.client_id = c.id
JOIN cars ca ON ca.id = o.car_id
WHERE c.age = get_min_client_age()


