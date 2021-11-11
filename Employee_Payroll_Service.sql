#UC1--- create database, show database, use database
show databases;
use employee_payroll_service123;
#-------------------------------------------------------------
#UC2--- create table
create table employee_payroll_service123(
     id int unsigned not null auto_increment,
     name varchar(150) not null,
     salary double not null,
     start date not null,
     primary key (id));
#-----------------------------------------------------------
#UC3--- insert values
insert into employee_payroll_service123(name, salary, start) values
    ('Bill',1000000.00,'2018-02-05'),
    ('Terisa',2000000.00,'2019-06-15'),
    ('Charlie',3000000.00,'2020-11-23');
#------------------------------------------------------------------
#UC4--- Use select
select * from employee_payroll_service123;
#-------------------------------------------------------------------
#UC5--- retrieve salary data for particular emp
select salary from employee_payroll_service123
	   where name = 'Bill';

select * from employee_payroll_service123
         where start between cast('2020-01-01' as date) and date(now());
#----------------------------------------------------------------------
#UC6--- add gender column and update row 
alter table employee_payroll_service123 add gender char(1) after name;

update employee_payroll_service123 set gender = 'M' 
       where id = 1 or id = 3;
update employee_payroll_service123 set gender = 'F'
    where id = 2;
select * from employee_payroll_service123;
#----------------------------------------------------------------------
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
#--------------------------------------------------------------------------
# UC8 --- Extend table, add emp phone, address, department
alter table employee_payroll_service123 add phone_no varchar(12) after start;
select * from employee_payroll_service123;

alter table employee_payroll_service123 add address varchar(150) default 'Pune' after phone_no;
select * from employee_payroll_service123;

alter table employee_payroll_service123 add department varchar(30) not null after address;
select * from employee_payroll_service123;

update employee_payroll_service123 set phone_no = '9877664455', department = 'design'
		where name = 'Bill';
select * from employee_payroll_service123;

update employee_payroll_service123 set phone_no = '88996677', department = 'HR'
		where name = 'Terisa';
select * from employee_payroll_service123;

update employee_payroll_service123 set phone_no = '99665577', department = 'production'
		where name = 'Charlie';
select * from employee_payroll_service123;
#----------------------------------------------------------------------------
#UC9-----Extend table, add Basic pay, Deductions, Taxable pay, Income Tax, Net Pay
alter table employee_payroll_service123 
	 add Basic_pay double after department,
     add Deductions double after Basic_pay,
     add Taxable_pay double after Deductions,
     add Income_tax double after Taxable_pay,
     add Net_Pay double after Income_tax;

select * from employee_payroll_service123;

update employee_payroll_service123 set Basic_pay = 30000, Deductions = 3000,
	   Taxable_pay = 1500, Income_tax = 300, Net_Pay = 27000
       where name = 'Bill';
select * from employee_payroll_service123;

update employee_payroll_service123 set Basic_pay = 20000, Deductions = 2000,
	   Taxable_pay = 1000, Income_tax = 200, Net_Pay = 18000
       where name = 'Terisa';
select * from employee_payroll_service123;

update employee_payroll_service123 set Basic_pay = 40000, Deductions = 4000,
	   Taxable_pay = 2000, Income_tax = 500, Net_Pay = 36000
       where name = 'Charlie';
select * from employee_payroll_service123;