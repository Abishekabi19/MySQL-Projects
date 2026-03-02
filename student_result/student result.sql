create database student_result;
use student_result;
create table students(student_id int primary key,Name varchar(200),Department varchar(200),Year int);

create table Subjects(Subject_id int primary key,Subject_Name varchar (200), Credits int);

create table Marks(Mark_id int, Student_id int,Subject_id int,Marks int,foreign key(Student_id) references students(Student_id),foreign key(Subject_id) references subjects(Subject_id));

insert into students(student_id,Name,Department,Year)
values (1, "Aisha", "Computer Science",1),
(2, "Rahul", "Mechanical Engineering", 2),
(3, "Sneha", 'Electrical Engineering', 3),
(4, "Ali", "Information Technology",4),
(5, "Neha", "Civil Engineering", 5);
insert into Subjects(Subject_id,Subject_Name,Credits)
values(1,"Maths",100),
(2,"English",100),
(3,"Malayalam",100);

insert into Marks(Mark_id,Student_id,Subject_id,Marks)
values (1, 1, 1, 85),
(2, 1, 2, 78),
(3, 1, 3, 88),

(4, 2, 1, 90),
(5, 2, 2, 78),
(6, 2, 3, 91),

(7,3,1,88),
(8,3,2,93),
(9,3,3,67),

(10,4,1,45),
(11,4,2,32),
(12,4,3,88),

(13,5,1,62),
(14,5,2,76),
(15,5,3,66);

-- get top 3 students in each subject

select s.student_id,s.Name,sb.Subject_id,sb.Subject_Name,m.Marks
from Marks as m  inner join students as s on s.student_id = m.student_id 
inner join Subjects as sb on sb.Subject_id = m.Subject_id 
where sb.Subject_id = 1 
order by Marks desc limit 3 ;

select s.student_id,s.Name,sb.Subject_id,sb.Subject_Name,m.Marks
from Marks as m  inner join students as s on s.student_id = m.student_id 
inner join Subjects as sb on sb.Subject_id = m.Subject_id 
where sb.Subject_id = 2 
order by Marks desc limit 3 ;

select s.student_id,s.Name,sb.Subject_id,sb.Subject_Name,m.Marks
from Marks as m  inner join students as s on s.student_id = m.student_id 
inner join Subjects as sb on sb.Subject_id = m.Subject_id 
where sb.Subject_id = 3
order by Marks desc limit 3 ;

-- calculate average marks per department
select avg (Marks),Department
from students inner join Marks
on students.student_id = Marks.student_id
group by Department;

-- find students who failed in more than 1 subjects
select s.student_id,s.Name,count(Subject_id)
from students as s inner join Marks as m on s.student_id = m.student_id  where Marks < 50 group by s.student_id,s.Name  having count(m.Subject_id) >1 ;



