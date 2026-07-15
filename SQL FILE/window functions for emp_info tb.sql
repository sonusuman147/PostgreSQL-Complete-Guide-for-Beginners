select * from emp_info;
-- WINDOW FUNCTIONS

select fname,salary,
	sum(salary) over( order by salary)
	from emp_info;

select row_number() over(order by fname),
fname,salary
	from emp_info;


select row_number() over(partition by dept),
fname,dept,salary
	from emp_info;

select
	fname,dept,salary,
	rank() over(order by salary desc)
	from emp_info;

select
	fname,dept,salary,
	dense_rank() over(order by salary desc)
	from emp_info;

select
	fname,dept,salary,
	lag(salary) over()
	from emp_info;

select
	fname,dept,salary,
	lead(salary) over(order by salary)
	from emp_info;

select
	fname,dept,salary,
	(salary-lead(salary) over(order by salary desc)) as diff
	from emp_info;



