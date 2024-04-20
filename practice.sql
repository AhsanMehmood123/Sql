create database pract;

use pract;

create table payment (
customer_id int primary key,
customer varchar(50),
mode varchar(50),
city varchar(50)
);

insert into payment
(customer_id, customer, mode, city)
values
(101, "olivia", "Netbanking", "portland"),
(102, "ethan", "CreditCard", "miami"),
(103, "maya", "CreditCard", "seattle"),
(104, "liam", "Netbanking", "Denver"),
(105, "sophia", "CreditCard", "NewOrlean"),
(106, "Caleb", "DebitCard", "minneapolis"),
(107, "Ava", "DebitCard", "phoenix"),
(108, "lucas", "Netbanking", "boston"),
(109, "isabella", "Netbanking", "nashville"),
(110, "jackson", "CreditCard", "boston");

select * from payment;
select mode, count(mode) from payment group by mode;
select mode, count(customer) from payment group by mode;