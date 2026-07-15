CREATE TABLE employee (

    emp_id INT PRIMARY KEY,
    fname VARCHAR(20) NOT NULL,
    lname VARCHAR(20) NOT NULL,
    desig VARCHAR(30) NOT NULL,
    dept VARCHAR(20) NOT NULL,
    salary NUMERIC(10,2) NOT NULL

);

INSERT INTO employee
(emp_id, fname, lname, desig, dept, salary)
VALUES
(101, 'Raju',    'Rastogi', 'Manager',    'Loan',    37000),
(102, 'Sham',    'Mohan',   'Cashier',   'Cash',    32000),
(103, 'Baburao', 'Apte',    'Associate', 'Loan',    25000),
(104, 'Paul',    'Philip',  'Accountant','Account', 45000),
(105, 'Alex',    'Watt',    'Associate', 'Deposit', 35000),
(106, 'Rick',    'Watt',    'Manager',   'Account', 65000),
(107, 'Leena',   'Jhonson', 'Lead',      'Cash',    25000),
(108, 'John',    'Paul',    'Manager',   'IT',      75000),
(109, 'Alex',    'Watt',    'Probation', 'Loan',    40000);



SELECT * FROM employee;

-- We want to calculate the average salary per department and then find all employees whose salary is above the average salary of their department.

WITH avg_sal AS (
    SELECT
        dept,
        ROUND(AVG(salary)) AS avg_salary
    FROM employee
    GROUP BY dept
)

SELECT
    e.emp_id,
    e.fname,
    e.salary,
    a.avg_salary
FROM employee e
JOIN avg_sal a
ON e.dept = a.dept
WHERE 
	e.salary>a.avg_salary;


-- We want to find the highest-paid employee in each department.

WITH high_salary AS (
    SELECT
        dept,
        MAX(salary) AS max_salary
    FROM employee
    GROUP BY dept
)

SELECT
    e.emp_id,
    e.fname,
    e.lname,
    e.desig,
    e.dept,
    e.salary
FROM employee e
JOIN high_salary h
ON e.dept = h.dept
AND e.salary = h.max_salary;