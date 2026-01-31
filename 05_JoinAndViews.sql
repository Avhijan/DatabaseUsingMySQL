SELECT*
from teacher;
SELECT*
from Employee; -- showing contents for teacher and employee tables
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Using Join to combine various tables 
select E.ename, T.Faculty, E.Salary 
from Employee as E
Join teacher as T on eid=ID; --inner join between Employess and Teacher

SELECT*
from bookid;
SELECT*
from booklist; -- to see contents for booklist and bookid

select *
from bookid
left join booklist on bid =isbn; --Left join between booklist and Bookid


select *
from booklist
right join bookid on bid =isbn; --right join between bookid and booklist


select*
from student;
select *
from issues; --to see contents for students and issues

select * 
from student 
full outer join issues on id = IID;-- Full Outer Join betwenn issues and student


select ename 
from Employee --this was for revision and preparation for views
where ename like 'S%' and ename like '%ya%'; --using substrings and first letter to find a name of emplyee


--inserting name of Employee that matches the name of a teacher
Insert into Employee(eid, ename, Salary)
values
(5, 'Sailesh', 10000000);

select ename
from Employee,teacher
where ename = name --to see the emplyees who are also teachers 

select E.ename
from Employee as E
join teacher as T on ID=eid
where not (E.ename = T.name); --showing names of emplouee who are not teachers

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Views
Create view employee_view as 
Select eid, ename, salary 
from Employee; --creating a view called emplyee_view

select * from employee_view; --shows the contents for emplyee view

Insert into employee_view(eid, ename, salary)
values
(6,'Aayam',1000000)
select * from employee_view; --adding a record inside a view


delete from employee_view 
where Salary<29000; --deleting a record in a view

select* from employee_view; --showing output after inserting and deleting the emplyee view
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
