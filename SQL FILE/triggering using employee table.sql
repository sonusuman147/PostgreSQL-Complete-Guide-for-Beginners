select * from employee;


CREaTE OR REPLACE FUNCTION check_salary()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.salary < 0 THEN
        NEW.salary := 0;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;



CREATE TRIGGER beforee_insert_update_salary
BEFORE INSERT OR UPDATE
ON employee
FOR EACH ROW
EXECUTE FUNCTION check_salary();



INSERT INTO employee
(emp_id,fname,lname,desig,dept,salary)
VALUES
(110,'Rahul','Patel','Manager','IT',-5000);

