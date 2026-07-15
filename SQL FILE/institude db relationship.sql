create table students(
	stu_id serial primary key,
	stu_name varchar(20) not null
);

create table courses(
	cour_id serial primary key,
	cour_name varchar(100) not null,
	fee numeric not null
);
create table enrollment(
	enroll_id serial primary key,
	stu_id INT not null,
	cour_id INT not null,
	enroll_date date not null,
	foreign key (stu_id) references students (stu_id),
	foreign key (cour_id) references courses (cour_id)
);

drop table students;
drop table courses;
drop table enrollment;

insert into students (stu_name) values 
('sonu'),
('sunil'),
('antara');

insert into courses (cour_name,fee)
values
('mathematics',500.00),
('physics',600.00),
('chemistry',700.00);

insert into enrollment (stu_id,cour_id,enroll_date)
values
(1,1,'2024-01-01'),
(1,2,'2024-01-15'),
(2,1,'2024-02-01'),
(2,3,'2024-02-15'),
(3,3,'2024-03-25');



select * from enrollment;
select * from courses;
select * from students;

select * from enrollment as e
join students as s
on e.stu_id=s.stu_id
join courses as c
on c.cour_id=e.cour_id;


select 
	s.stu_name as student_name,
	c.cour_name as course_name,
	c.fee as fees,
	e.enroll_date as enrollment_date  
	from 
enrollment as e
join students as s on e.stu_id=s.stu_id
join courses as c on c.cour_id=e.cour_id
order by s.stu_name;

select s.stu_name,sum(c.fee) from enrollment as e
join students as s
on e.stu_id=s.stu_id
join courses as c
on c.cour_id=e.cour_id
group by s.stu_name;