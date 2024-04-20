create database join_par;

use join_par;

create table student (
id int ,
name varchar(50)
);
alter table student modify id int primary key;
insert into student 
(id, name)
values
(101,"adam"),
(102, "bob"),
(103, "casey");
select * from student;
create table course
(id int primary key,
course varchar(50)
);

insert into course 
(id, course)
values
(102,"english"),
(105, "math"),
(103, "science"),
(107, "computer science");

select * from course;

select * from student inner join course on student.id = course.id;

select *
from student as s
left join course as c
on s.id = c.id;

select *
from student as s
right join course as c
on s.id = c.id;

select *
from student as s
left join course as c
on s.id = c.id
union
select *
from student as s
right join course as c
on s.id = c.id;

select * from student as a
left join course as b
on a.id = b.id
where b.id is null;

select * from student as a
left join course as b
on a.id = b.id
where b.id is not null;

select * from student as a
right join course as b
on a.id = b.id
where a.id is null;

select *
from student as a
left join course as b
on a.id = b.id
where b.id is null
union
select *
from student as a
right join course as b
on a.id = b.id
where a.id is null;

create table emp(
id int primary key,
name varchar(50),
manager_id int
);

insert into emp (id, name, manager_id)
values
(101, "adam", 103),
(102, "bob", 104),
(103, "casey", null),
(104, "donald", 103);

select * from emp;

select *
from emp as a
join emp as b
on a.id = b.manager_id;

select a.name as manager_name, b.name
from emp as a
join emp as b
on a.id = b.manager_id;

select name from emp
union
select name from emp;

select name from emp
union all
select name from emp;