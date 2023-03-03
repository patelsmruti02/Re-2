#sql assignment 2

CREATE DATABASE sql_assinment2;

Use sql_assinment2;

CREATE TABLE employee(
ID char(9) primary key not null,
FIRST_NAME varchar(30) not null,
LAST_NAME varchar(30) not null,
DEPARTMENT int not null);

INSERT INTO employee 
values 
(123234877,'Michael','Rogers',14),
(152934485,'Anand','Manikutty',14),
(222364883,'Carol','Smith',37),
(326587417,'Joe','Stevens',37),
(332154719,'Mary-Anne','Foster',14),
(332569843,'George','ODonnell',77),
(546523478,'John','Doe',59),
(631231482,'David','Smith',77),
(654873219,'Zacary','Efron',59),
(745685214,'Eric','Goldsmith',59),
(845657245,'Elizabeth','Doe',14),
(845657246,'Kumar','Swamy',14);

SELECT * FROM employee;

CREATE TABLE department(
CODE char(2) primary key not null,
NAME varchar(25) not null,
BUDGET int not null);

INSERT INTO department
values
('14','IT',6500),
('37','Accounting',15000),
('59','Human Resources',240000),
('77','Research',55000);

SELECT * FROM department;

#Questions


#1. Select the last name of all employees, without duplicates.

SELECT distinct(LAST_NAME) from employee;

#2. Select all the data of employees whose last name is "Smith".

SELECT * FROM employee where LAST_NAME = "Smith";

#3. Select all the data of employees whose last name is "Smith" or "Doe".

SELECT * FROM employee where LAST_NAME = "Smith" or  LAST_NAME = "Doe";

#4. Select all the data of employees that work in department 14.

SELECT * FROM employee WHERE DEPARTMENT = 14;

#5. Select all the data of employees that work in department 37 or department 77.

SELECT * FROM employee WHERE DEPARTMENT = 37  OR DEPARTMENT = 77;

#6. Select all the data of employees whose last name begins with an "S".

SELECT * FROM employee WHERE LAST_NAME LIKE 'S%';

#7. Select the sum of all the departments' budgets.

SELECT SUM(BUDGET) FROM department;

#8. Select the number of employees in each department (you only need to show the department code and the number of employees).

SELECT ID,count(DEPARTMENT) FROM employee GROUP BY DEPARTMENT;

#9. Select all the data of employees, including each employee's department's data.

SELECT * FROM employee e
JOIN department d
ON e.DEPARTMENT = d.CODE;

#10.Select the name and last name of each employee, along with the name and budget of the employee's department.

SELECT e.FIRST_NAME,e.LAST_NAME,d.NAME,d.BUDGET FROM employee e
JOIN department d 
ON e.DEPARTMENT = d.CODE;

#11.Select the name and last name of employees working for departments with a budget greater than $60,000.

SELECT e.FIRST_NAME,e.LAST_NAME,d.BUDGET FROM employee e
JOIN department d 
ON e.DEPARTMENT = d.CODE WHERE BUDGET > 60000;

#12.Select the departments with a budget larger than the average budget of all the departments.

SELECT DEPARTMENT,BUDGET FROM employee e
JOIN department d
ON e.DEPARTMENT = d.CODE
WHERE BUDGET > (SELECT AVG(BUDGET) FROM department)
GROUP BY BUDGET;

#13.Select the names of departments with more than two employees.

SELECT NAME FROM department d
JOIN employee e 
ON d.CODE = e.DEPARTMENT
GROUP BY e.DEPARTMENT
HAVING COUNT(e.DEPARTMENT) > 2;

#14.Very Important - Select the name and last name of employees working for departments with second lowest budget

SELECT e.FIRST_NAME,e.LAST_NAME,d.NAME FROM employee e
JOIN department d
ON e.DEPARTMENT = d.CODE
WHERE d.NAME = (SELECT NAME FROM department WHERE BUDGET > (SELECT MIN(BUDGET) FROM department) limit 1);

#15.Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11. 

INSERT INTO department
values (11,'Quality Assurance',40000);

SELECT * FROM department;

#16.And Add an employee called "Mary Moore" in that department, with SSN 847-21-9811.

INSERT INTO employee
values (847219811,'Mary','Moore',11);

SELECT * FROM employee;

#17.Reduce the budget of all departments by 10%.

ALTER TABLE department
ADD COLUMN NEW_BUDGET INT AFTER BUDGET;

UPDATE department SET NEW_BUDGET = (BUDGET*0.9);
-- OR
UPDATE department SET NEW_BUDGET = BUDGET-(BUDGET*10/100);

SELECT * FROM department;

#18.Reassign all employees from the Research department (code 77) to the IT department (code 14).

UPDATE employee SET DEPARTMENT=14 WHERE DEPARTMENT = 77; 

#19.Delete from the table all employees in the IT department (code 14).

DELETE FROM employee WHERE DEPARTMENT= 14;

#20.Delete from the table all employees who work in departments with a budget greater than or equal to $60,000.

DELETE FROM employee 
WHERE DEPARTMENT = (SELECT CODE FROM department WHERE budget >= 60000);

select * from employee;

#21.Delete from the table all employees 

DELETE FROM employee;
