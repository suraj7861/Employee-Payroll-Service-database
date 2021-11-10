#UC1--- create database, show database, use database
show databases;
use employee_payroll_service123;
#UC2--- create table
create table employee_payroll_service123(
     id int unsigned not null auto_increment,
     name varchar(150) not null,
     salary double not null,
     start date not null,
     primary key (id));

#UC3--- insert values
insert into employee_payroll_service123(name, salary, start) values
    ('Bill',1000000.00,'2018-02-05'),
    ('Terisa',2000000.00,'2019-06-15'),
    ('Charlie',3000000.00,'2020-11-23');
    
#UC4--- Use select
select * from employee_payroll_service123;

#UC5--- retrieve salary data for particular emp
select salary from employee_payroll_service123
	   where name = 'Bill';

select * from employee_payroll_service123
         where start between cast('2020-01-01' as date) and date(now());

#UC6--- add gender column and update row 
alter table employee_payroll_service123 add gender char(1) after name;

update employee_payroll_service123 set gender = 'M' 
       where id = 1 or id = 3;
update employee_payroll_service123 set gender = 'F'
    where id = 2;
select * from employee_payroll_service123;

#UC7----find sum avg mim max 
select gender, sum(salary) from employee_payroll_service123
       where gender = 'M' group by gender;
       
select gender, avg(salary) from employee_payroll_service123
	   where gender = 'M' group by gender;
       
select name,min(salary) from employee_payroll_service123
       where gender = 'M' group by gender;
       
select name,max(salary) from employee_payroll_service123
       where gender = 'M' group by gender;
       
select count(*) from employee_payroll_service123;



