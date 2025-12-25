--The following code contains experperiments which relates to multi - table queries.
--Here the queries may not make sense logically because this was to experiment with multiple tables at once
--Furthermore this uses the same database as previous code so we use tables defined in previous files


--create student table and add content
create table student(id int Primary key, name varchar(10), RN int, batch int)
Insert into student 
values
(1, 'Alu' , 01, 2080),
(2,'talu', 02, 2080),
(3,'lalu', 03, 2088),
(4,'kalu', 04, 2087);
select *
From student; --displaying contents of student table



--creating teacher table and adding content
create table teacher(ID int, name varchar(10), Faculty varchar(20))
Insert into  teacher
values
(1, 'Sailesh' ,'Computer-engineering'),
(2,'Isha', 'Computer-engineering'),
(3,'PCR','Electronics'),
(4,'Ukesh', 'AI');
select *
From teacher;


--displaying bookid and booklist
--degined in previous file
select *
From bookid;
select *
From booklist;

--this shows table which consists of bname and suthor column from bookid table and publication from booklist table
select b.bname, bl.publication, b.author
from bookid as b, booklist as bl
where bid = isbn  AND publication ='Abhijan' --as the realation aren't properly defined we use the the condition (bid = isbn) else the cartession product gives a lot more output


-- displaying employee and teacher
-- defined previously
select *
From Employee
select *
From teacher

select E.name, T.faculty
From employee as E, teacher as T
where E.dateofemploy = '2010-01-01' AND T.ID = E.eid;
--displays name from employee and faculty from teacher table 


select E.ename , T.faculty
From employee as E, teacher as T
where E.Salary<40000 and T.faculty = 'AI'
--displays name from emplyee table and faculty from teacher table whose salary is greater than 40000 and faculty is AI
  

sEleCt T.name, B.bname
from teacher as T, bookid as B
where T.name like 'S%' 
--Displays name from teacher table and bookname from bookid table and where name of teacher starts with S


select ename, Salary, 1.1*Salary as update_Salary
from Employee 
--displays salary with 10% bonues and also updates the salary in the database


select e.ename
from employee as e
where salary = 
( -- this interior part is called a subquery
  --because its inside another query 
select max(salary)
from employee
);
-- this displays the maximum amount of salary from employee table


select *
From Employee
select *
From teacher
select *
From bookid;
select *
From booklist; --displaying all teh tables


Insert into bookid (bid, bname, author, price)
values
(109, 'nice-book', 'Sailesh', 499); --adding an author with the same name as a teacher
select T.name, B.bname
from teacher as T and bookid as B
where T.name = B.name  --displays the teacher who wrote the book "nice-book"
