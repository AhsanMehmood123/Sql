create database College1;

use College1;

create table student (
rollno int primary key,
name varchar(50),
marks int not null,
grade varchar(1),
city varchar(20)
);

insert into student
(rollno, name, marks, grade, city)
values
(101, "anil", 78, "C", "Pune"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "dhruv", 96, "A", "Delhi"),
(105, "emanuel", 85, "B", "Delhi"),
(106, "farah", 97, "A", "Delhi");

drop table student;

select * from student;

select name, marks from student;

select city from student;

select distinct city from student;

select marks from student where marks > 70;

select * from student where city = "Mumbai";

select * from student where marks + 10 > 100;

select * from student where marks > 90 and city = "Mumbai";

select grade from student group by grade order by grade;

select * from student where marks > 90 or city = "Mumbai";

select * from student where marks between 80 and 94;

select * from student where city in ("Delhi", "Mumbai");

select * from student where city not in ("Delhi", "Mumbai");

select * from student;

select * from student limit 3;

select * from student where marks > 80 limit 3;

select * from student order by city asc;

select * from student order by marks asc;

select * from student order by marks desc;

select * from student order by marks desc limit 3;

select max(marks) from student;

select min(marks) from student;

select avg(marks) from student;

select count(marks) from student;

select * from student;

select city, count(rollno) from student group by city;

select city, avg(marks) from student group by city;

select city,name, count(rollno) from student group by city, name;


select city, avg(marks) from student group by city order by city asc;

select city, avg(marks) from student group by city order by avg(marks) asc;

select grade, count(name) from student group by grade order by grade;

select * from student;


select city, count(name) from student group by city having max(marks) > 90;

select city from student where grade = "A" group by city having max(marks) > 93 order by city asc;

set sql_safe_updates = 0;

update student set grade = "O" where grade = "A";

update student set marks = 82 where rollno = 105;

update student set grade = "B" where marks between 80 and 90;

update student set marks = marks + 1;

update student set marks = 12 where rollno = 105;

delete from student where marks < 33;

select * from student;

create table department (
id int primary key,
name varchar(50)
);

insert into department
(id, name)
values
(101, "Science"),
(102, "English"),
(103, "Hindi");

update department set id = 104 where id = 103;

delete from department where id = 102;

create table teacher (
id int primary key,
name varchar(50),
dept_id int,
foreign key (dept_id) references department (id) on update cascade on delete cascade
);

drop table teacher;

insert into teacher
(id, name, dept_id)
values
(101, "ahsan",101),
(102, "mehmood",101),
(103, "laraib",103),
(104, "haris",102);

select * from department;

select * from teacher;

alter table student add column age int;
select * from student;

alter table student drop column age;
select * from student;

alter table student rename to student1;
select * from student1;

alter table student1 rename to student;
select * from student;

alter table student add column age int not null default 19;

alter table student modify age varchar(2);

alter table student change age stu_age int;

insert into student 
(rollno,name, marks, stu_age)
values
(108, "gargi", 58, 100);

alter table student drop column stu_age;

select * from student;

truncate table student;

alter table student change name full_name varchar(50);

delete from student where marks < 80;

alter table student drop column grade;

select * from student;

select avg(marks) from student;

select name, marks from student where  marks > 89.0000;

select name, marks from student where marks > (select avg(marks) from student);

select rollno from student where rollno % 2 = 0; 

select name, rollno from student where rollno % 2 = 0;

select name, rollno from student where rollno in (select rollno from student where rollno % 2 = 0);

select * from student where city = "Delhi";

select max(marks) from (select * from student where city = "Delhi") as temp;

select (select max(marks) from student), name from student;

create view view1 as select rollno, name , marks from student;

select * from view1;
