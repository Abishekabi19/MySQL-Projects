create database Employeespayroll;
use Employeespayroll;

create table employee_details(id int primary key auto_increment,name varchar(225),department varchar(100),
position varchar(100),hire_date date,base_salary decimal(10,2));

create table attandance_table(attan_id int primary key auto_increment,employee_id int, foreign key(employee_id) references employee_details(id),attan_date date,status enum('present','absent','leave'));

create table salary_table(salary_id int auto_increment primary key,employee_id int, foreign key(employee_id) references employee_details(id),base_salary decimal(10,2),bonus decimal(10,2),month varchar(20),years int);

create table payrol_details(payroll_id int auto_increment primary key,employee_id int,foreign key(employee_id) references employee_details(id),total_salary decimal(10,2),payment_date date);

insert into employee_details(id,name,department,position,hire_date,base_salary) 
values(081,'abi','it','trainee','2020-05-24','20000'),
(082,'sanu','marketing','sale','2020-01-02','21200'),
(083,'amal','it','executive','2018-02-04','35200'),
(084,'rahul','analytic','coding','2021-09-08','19500');

insert into attandance_table(attan_id,employee_id,attan_date,status) 
values(1,081,'2025-02-21','present'),
(2,082,'2022-02-14','present'),
(3,083,'2023-02-12','absent'),
(4,084,'2021-11-25','leave');

insert into salary_table(salary_id,employee_id,base_salary,bonus,month,years) 
values(71,081,'20000','10000','may',2020),
(72,082,'21200','11000','jan',2020),
(73,083,'35200','25200','feb',2018),
(74,084,'19500','9500','sept',2021);

insert into payrol_details(payroll_id,employee_id,total_salary,payment_date) 
values(1,081,'30000','2020-06-30'),
(2,082,'31200','2020-02-02'),
(3,083,'60400','2018-03-05'),
(4,084,'29000','2021-10-05');

update employee_details set department='operation',position='mechanic',base_salary='25000' where id=084;

select employee_details.id,employee_details.name,attandance_table.status
from employee_details join attandance_table on employee_details.id=attandance_table.employee_id;

select employee_details.name,(salary_table.base_salary + salary_table.bonus) as totalsal 
from employee_details join salary_table on employee_details.id=salary_table.employee_id;

select employee_details.id,employee_details.name,salary_table.base_salary,salary_table.bonus
from employee_details join salary_table on employee_details.id=salary_table.employee_id;

select employee_details.id,employee_details.name,payrol_details.payroll_id,payrol_details.total_salary,payrol_details.payment_date
from employee_details join payrol_details on employee_details.id=payrol_details.employee_id;

select employee_details.id,employee_details.name,employee_details.base_salary,salary_table.bonus,payrol_details.total_salary,payrol_details.payment_date
from employee_details join salary_table on employee_details.id=salary_table.employee_id
join payrol_details on employee_details.id=payrol_details.employee_id;

select * from employee_details
join attandance_table on employee_details.id=attandance_table.employee_id
join salary_table on employee_details.id=salary_table.employee_id
join payrol_details on employee_details.id =payrol_details.employee_id;

delete from attandance_table where employee_id=82;
delete from salary_table where employee_id=82;
delete from payrol_details where employee_id=82;
