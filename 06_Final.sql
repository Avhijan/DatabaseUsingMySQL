select *
from student; --displaying Student table

--displaying total students in each batch
SELECT count(batch) as Total, batch
From student
Group BY batch; --grouping by badge


SELECT *
from bookid;-- displaying bookidtable

--displaying total books issued 
SELECT count(bname) as Total_Books_Issued
from bookid; 


-- displaying all the batches with number of students greater than 30
SELECT batch, COUNT(batch) AS Total
FROM student
GROUP BY batch
HAVING COUNT(batch) > 30;

--using subquery
SELECT Total, batch 
From ( SELECT batch, count(batch) as Total
		From student
		group by batch) as alias
where Total > 30


select *
from teacher;
select *
from bookid; --displaying teacher and bookid table

--displaying teacher who have written more than 1 book
SELECT B.author, count(B.author) as total
from bookid as B
join teacher as T on  B.author=T.name
group by B.author
having count(B.author)>1;


-- Inserting new values into Emplyees and teacher tables such that the tables have matching values, I
Insert into Employee(eid, ename, Salary)
values
(7,'Isha', 42589),
(8, 'PCR', 78568);--exits in teacher table but not in emplyee so adding it here too
Insert into teacher(ID, name, Faculty)
values
(5,'Aayam','Computer');--exits in Employee table but not in teacher so adding it here too

select *
from teacher
select *
from Employee --dispalying teacher and Employee table 


-- displaying employees who make more than the maximum teacher salary.
select E.ename, E.salary 
from Employee as E
left join teacher as T
on T.name= E.ename
where E.salary>(select max(a.salary) as max_sal
									from (select *
											from Employee
											where ename not in (select name from teacher))as a) --subquery finds the max salary of employees who are teachers 

