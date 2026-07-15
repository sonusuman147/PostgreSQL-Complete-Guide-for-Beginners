CREATE TABLE EMP_INFO(
	EMP_ID SERIAL PRIMARY KEY,
	FNAME VARCHAR(20) NOT NULL,
	LNAME VARCHAR(15) NOT NULL,
	EMAIL VARCHAR(35) UNIQUE,
	DEPT VARCHAR(15),
	SALARY DECIMAL(10,2) DEFAULT 300000.00,
	HIRE_DATE DATE NOT NULL DEFAULT CURRENT_DATE
);

INSERT INTO emp_info (emp_id, fname, lname, email, dept, salary, hire_date) 
      VALUES
(1, 'Raj', 'Sharma', 'raj.sharma@example.com', 'IT', 50000.00, '2020-01-15'),
(2, 'Priya', 'Singh', 'priya.singh@example.com', 'HR', 45000.00, '2019-03-22'),
(3, 'Arjun', 'Verma', 'arjun.verma@example.com', 'IT', 55000.00, '2021-06-01'),
(4, 'Suman', 'Patel', 'suman.patel@example.com', 'Finance', 60000.00, '2018-07-30'),
(5, 'Kavita', 'Rao', 'kavita.rao@example.com', 'HR', 47000.00, '2020-11-10'),
(6, 'Amit', 'Gupta', 'amit.gupta@example.com', 'Marketing', 52000.00, '2020-09-25'),
(7, 'Neha', 'Desai', 'neha.desai@example.com', 'IT', 48000.00, '2019-05-18'),
(8, 'Rahul', 'Kumar', 'rahul.kumar@example.com', 'IT', 53000.00, '2021-02-14'),
(9, 'Anjali', 'Mehta', 'anjali.mehta@example.com', 'Finance', 61000.00, '2018-12-03'),
(10, 'Vijay', 'Nair', 'vijay.nair@example.com', 'Marketing', 50000.00, '2020-04-19');

select * from emp_info;

INSERT INTO emp_info(fname, lname, email, dept) 
      VALUES
('sonu', 'Suman', 'sonu.suman@example.com', 'IT');

select currval('emp_info_emp_id_seq');
select setval('emp_info_emp_id_seq',10);

select * from emp_info
where emp_id=3;

select * from emp_info
where dept='HR' ;

select * from emp_info
where salary>=65000;

select * from emp_info
where dept='HR' or dept ='IT';

select * from emp_info
where dept in ('HR','IT');

select * from emp_info
where SALARY BETWEEN 40000 AND 50000;

SELECT distinct DEPt FRoM emp_info;

SELECt * FRoM emp_info order by fName;

SELECt * FRoM emp_info order by fName desc;

SELECt * FRoM emp_info limit 3;

SELECt * FRoM emp_info where fname like 's%';

SELECt * FRoM emp_info where fname like '%u';

SELECt * FRoM emp_info where dept like '__';

SELECT COUNT(*) FROM emp_info;

SELECT SUM(salary)
FROM emp_info;

SELECT AVG(salary)
FROM emp_info;

SELECT MAX(salary)
FROM emp_info;

SELECT MIN(salary)
FROM emp_info;


SELECT emp_id, fname, salary FROM emp_info
  WHERE 
salary = (SELECT MAX(salary) FROM emp_info);


SELECT
MAX(salary) AS Highest_Salary,
MIN(salary) AS Lowest_Salary,
AVG(salary) AS Average_Salary
FROM emp_info;

SELECT dept,COUNT(*) FROM emp_info group by dept;

SELECT CONCAT(fname,' ',lname)
FROM emp_info;

select concat('sonu',' ','suman') as name;

SELECT CONCAT_WS('_','nxt','sonu');

SELECT SUBSTR('PostgreSQL',1,4);

SELECT LEFT('PostgreSQL',4);

SELECT RIGHT('PostgreSQL',3);

SELECT LENGTH('PostgreSQL');

SELECT UPPER(fname)
FROM emp_info;

SELECT LOWER(fname)
FROM emp_info;

SELECT TRIM('   PostgreSQL   ');

SELECT LTRIM('   PostgreSQL');

SELECT RTRIM('PostgreSQL   ');

SELECT REPLACE('PostgreSQL','SQL','Database');

SELECT POSITION('SQL' IN 'PostgreSQL');

SELECT UPPER(CONCAT(fname,' ',lname))
FROM emp_info;

SELECT REPLACE(email,'@example.com','@gmail.com')
FROM emp_info;

-- task
-- Task 1:
-- 1:Raj:Sharma:IT

-- Task2:
-- 1:Raju Sharma:IT:50000

-- Task3
-- 4:Suman:FINANCE

-- Task4
--    I1 Raju
--    H2 Priya


SELECT CONCAT_WS(':',emp_id,fname,lname,dept) from emp_info where emp_id=1;
SELECT CONCAT_WS(':',emp_id,concat(fname,' ',lname),dept,salary) from emp_info where    emp_id=1;
SELECT CONCAT_WS(':',emp_id,fname,upper(dept)) from emp_info where emp_id=4;
SELECT CONCAT(LEFT(dept,1),emp_id,' ',fname) from emp_info where emp_id in (1,2);

-- task about group,order,like,distinct,limit

-- 1:  Find Different type of departments in database?

-- 2: Display records with High-low salary

-- 3: How to see only top 3 records from a table?

-- 4: Show records where first name start with letter 'A'

-- 5: Show records where length of the lname is 4 characters

select distinct dept from emp_info group by dept;

select fname,salary from emp_info order by salary desc;

select fname,salary from emp_info order by salary desc limit 3;

select fname,salary from emp_info where fname like 'A%';

select fname,lname,salary from emp_info where length(lname)=4;

-- COUNT, GROUP BY, MIN, MAX and SUM and AVG

-- 1:  Find Total no. of employees in database?

-- 2: Find no. of employees in each department.

-- 3: Find lowest salary paying

-- 4: Find highest salary paying

-- 5: Find total salary paying in Loan department?

-- 6: Average salary paying in each department

select count(emp_id) from emp_info;

select dept,count(emp_id) from emp_info group by dept;

select min(salary) as low_sal from emp_info;

select max(salary) as high_sal from emp_info;

select * from emp_info where salary=(select max(salary) from emp_info);

select dept,sum(salary) as total_salary from emp_info group by dept;

select dept,avg(salary) as avg_sal from emp_info group by dept;


create table student(
	Id int,
	Name varchar(19),
	Age int,
	city varchar(10)
);

insert into student values (1,'sonu',18,'jajapur');
insert into student values (2,'sunil',19,'gulu');
insert into student values (3,'antara',21,'sukinda');
insert into student values (4,'kulu',19,'kara');

select * from student;

-- Alter query

Alter table student 
add column marks int default 30;

Alter table stu_info 
drop column mob;


Alter table student 
rename column marks to ulooo;

Alter table student 
rename to stu_info;

RENAME table stu_info to stu;

ALTER TABLE stu_info
alter column id
set data type varchar(20);

ALTER TABLE stu_info
alter column id
set default 'unknown';

ALTER TABLE stu_info
alter column mobb
drop default;


Alter table stu_info
add column mob varchar(15)
check (length(mob)>=10);

insert into stu_info(mob) values ('5673355689');

alter table stu_info
drop constraint stu_info_mob_check;

Alter table stu_info
add constraint mob_less_than_10
check (length(mob)>=10);

insert into stu_info(mob) values ('5673333589');



-- CASE --

SELECT FNAME,SALARY,
CASE
	WHEN SALARY >=50000 THEN 'HIGH SALARY'
	WHEN SALARY >=40000 THEN 'MID SALARY'
	ELSE 'LOW SALARY'
END AS SAL_CAT
FROM
	EMP_INFO
ORDER BY FNAME;


SELECT FNAME,SALARY,
CASE
	WHEN SALARY >=55000 THEN 'HIGH SALARY'
	WHEN SALARY BETWEEN 50000 AND 55000
		THEN 'MID'
	ELSE 'LOW SALARY'
END AS SAL_CAT
FROM
	EMP_INFO
ORDER BY FNAME;

SELECT COUNT(EMP_ID)

SELECT FNAME,SALARY,
CASE
	WHEN SALARY >0 THEN ROUND(SALARY*.10)
END BONUS
FROM
	EMP_INFO;


SELECT
CASE
	WHEN SALARY >55000 THEN 'HIGH'
	WHEN SALARY BETWEEN 50000 AND 55000 
	THEN 'MID'
	ELSE 'LOW'
END AS SAL_CAT,
COUNT(EMP_ID)
FROM EMP_INFO
GROUP BY SAL_CAT;






























