-- STORED Procedure


CREATE OR REPLACE PROCEDURE update_emp_salary(
    p_employee_id INT,
    p_new_salary NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE emp_info
    SET salary = p_new_salary
    WHERE emp_id = p_employee_id;
END;
$$;

call update_emp_salary(3,90000);

select * from emp_info;


-- inserting a data

create or replace procedure add_employee(
	p_fname varchar,
	p_lname varchar,
	p_email varchar,
	p_dept varchar,
	p_salary numeric
)
language plpgsql
as $$
begin
	insert into emp_info(fname,lname,email,dept,salary)
	values(	p_fname,p_lname ,p_email,p_dept,p_salary);
end;
$$;

call add_employee('sunil','behera','sunil.behera@gmail.com','IT',30000)
select * from emp_info;



-- User defined Functions


select 
	e.emp_id,
	e.fname,
	e.salary
from
	emp_info e
where e.dept='HR'
	and e.salary = (
		select max(salary) 
		from emp_info emp
		where emp.dept='HR'
	);


CREATE OR REPLACE FUNCTION dept_max_sal_emp(dept_name VARCHAR)
RETURNS TABLE(emp_id INT, fname VARCHAR, salary NUMERIC) 
AS $$
BEGIN
    RETURN QUERY
    SELECT 
        e.emp_id,  e.fname, e.salary
    FROM 
        emp_info e
    WHERE 
        e.dept = dept_name
        AND e.salary = (
            SELECT MAX(emp.salary)
            FROM emp_info emp
            WHERE emp.dept = dept_name
        );
END;
$$ LANGUAGE plpgsql;

select * from dept_max_sal_emp('IT');


RETURN QUERY

SELECT *

FROM emp_info;



