--CREATING DEPARTMENTS TABLE
create table departments (
	dept_no_id varchar(20) not null primary key,
	dept_name varchar(50) not null
);

--drop table departments;
select * from departments;

--CREATING EMPLOYEES TABLE
create table employees (
	emp_no_id int not null primary key,
	birth_date date not null,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	gender varchar(2),
	hire_date date not null DEFAULT CURRENT_DATE
);
	
--drop table employees;
select * from employees;

--CREATING DEPT-EMPLOYEES TABLE
create table dept_employees (
	emp_no_id int not null references employees(emp_no_id),
	dept_no_id varchar(20) not null references departments(dept_no_id),
	from_date date,
	to_date date
);

--creating serial primary key for table
alter table dept_employees
	add column dept_emp_id serial primary key;
	
--drop table dept_employees;
select * from dept_employees;

--CREATING DEPT-MANAGERS TABLE
create table dept_managers (
	dept_no_id varchar(20) not null references departments(dept_no_id),
	emp_no_id int not null references employees(emp_no_id),
	from_date date,
	to_date date
);

--creating serial primary key for table
alter table dept_managers
	add column dept_mang_id serial primary key;
	
--drop table dept_managers;
select * from dept_managers;

--CREATING SALARIES TABLE
create table salaries (
	emp_no_id int not null references employees(emp_no_id),
	salary int not null,
	from_date date,
	to_date date
);

--creating serial primary key for table
alter table salaries
	add column salaries_id serial primary key;
	
--drop table salaries;
select * from salaries;

--CREATING TITLES TABLE
create table titles (
	emp_no_id int not null references employees(emp_no_id),
	title varchar(50) not null,
	from_date date,
	to_date date
);

--creating serial primary key for table
alter table titles
	add column titles_id serial primary key;
	
--drop table titles;
select * from titles;

--IMPORTING TABLE INFO TO LUCIDCHARTS FOR ERD
SELECT 'postgresql' AS dbms,t.table_catalog,t.table_schema,t.table_name,c.column_name,c.ordinal_position,c.data_type,c.character_maximum_length,n.constraint_type,k2.table_schema,k2.table_name,k2.column_name FROM information_schema.tables t NATURAL LEFT JOIN information_schema.columns c LEFT JOIN(information_schema.key_column_usage k NATURAL JOIN information_schema.table_constraints n NATURAL LEFT JOIN information_schema.referential_constraints r)ON c.table_catalog=k.table_catalog AND c.table_schema=k.table_schema AND c.table_name=k.table_name AND c.column_name=k.column_name LEFT JOIN information_schema.key_column_usage k2 ON k.position_in_unique_constraint=k2.ordinal_position AND r.unique_constraint_catalog=k2.constraint_catalog AND r.unique_constraint_schema=k2.constraint_schema AND r.unique_constraint_name=k2.constraint_name WHERE t.TABLE_TYPE='BASE TABLE' AND t.table_schema NOT IN('information_schema','pg_catalog');


