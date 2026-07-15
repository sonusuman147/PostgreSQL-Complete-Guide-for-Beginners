CREATE TABLE customers (  
          cust_id SERIAL PRIMARY KEY, 
          cust_name VARCHAR(100) NOT NULL 
);


CREATE TABLE orders ( 
            ord_id SERIAL PRIMARY KEY, 
            ord_date DATE NOT NULL, 
            price NUMERIC NOT NULL,
            cust_id INTEGER NOT NULL, 
            FOREIGN KEY (cust_id) REFERENCES 
            customers (cust_id) 
);


INSERT INTO customers (cust_name)
VALUES 
    ('Raju'), ('Sham'), ('Paul'), ('Alex');

select * from customers;


INSERT INTO orders (ord_date, cust_id, price)
VALUES 
    ('2024-01-01', 1, 250.00),  
    ('2024-01-15', 1, 300.00),  
    ('2024-02-01', 2, 150.00),
    ('2024-03-01', 3, 450.00),
    ('2024-04-04', 2, 550.00);  

select * from orders;

 select * from customers cross join orders;

 select * from customers as c inner join orders as o
 on
 c.cust_id=o.cust_id;

  select * from customers as c right join orders as o
 on
 c.cust_id=o.cust_id;
 
  select * from customers as c left join orders as o
 on
 c.cust_id=o.cust_id;

 select * from customers as c FULL OUTER join orders as o
 on
 c.cust_id=o.cust_id;


 select c.cust_id,o.ord_date from customers as c FULL OUTER join orders as o
 on
 c.cust_id=o.cust_id;

  select c.cust_name,count(o.ord_date) from customers as c FULL OUTER join orders as o
 on
 c.cust_id=o.cust_id
 group by cust_name;

