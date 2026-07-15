create table customers(
	cust_id serial primary key,
	cust_name varchar not null
);

create table orders(
	ord_id serial primary key,
	ord_date date not null,
	cust_id int not null,
	foreign key (cust_id) references customers(cust_id)
);


create table products(
	p_id serial primary key,
	p_name varchar(50) not null,
	price numeric not null
);

create table ord_items(
	items_id serial primary key,
	ord_id int not null,
	p_id int not null,
	quantity int not null,
	foreign key (ord_id) references orders(ord_id),
	foreign key (p_id) references products(p_id)
);

drop table ord_items;

insert into customers(cust_name)
values
('sonu'),('sunil'),('antara'),('alex');

insert into orders(ord_date,cust_id)
values
('2024-01-01',1),
('2024-02-02',2),
('2024-03-03',3),
('2024-04-01',2);

insert into products(p_name,price)
values
('laptop',55000.00),
('mouse',400),
('keyboard',700),
('cable',250);


insert into ord_items(ord_id,p_id,quantity)
values
(1,1,1),
(1,4,2),
(2,1,1),
(3,2,1),
(3,4,5),
(4,3,2);

select * from ord_items;


create view billing_info as
select 
	o.ord_id,c.cust_name,o.ord_date,p.p_name,oi.quantity,p.price,oi.quantity*p.price as total_price
from ord_items as oi
	join 
		products p on oi.p_id=p.p_id
	join
		orders o on oi.ord_id=o.ord_id
	join 
		customers c on c.cust_id=o.cust_id
;

-- viewpart-- 

select * from billing_info;

create view customer_buy as
select 
	c.cust_name,sum(oi.quantity*p.price) as total_buy
from ord_items as oi
	join 
		products p on oi.p_id=p.p_id
	join
		orders o on oi.ord_id=o.ord_id
	join 
		customers c on c.cust_id=o.cust_id
		group by c.cust_name
;


select * from customer_buy;


drop view customer_buy;	


-- having

select p_name,sum(total_price) 
from billing_info
group by p_name 
having sum(total_price) >1500;

-- group by rollup

select 
	coalesce(p_name,'Total'),
	sum(total_price) as amount
from billing_info
	group by
	rollup (p_name) order by amount;



