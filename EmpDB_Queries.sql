--QUERIES FOR EMPLOYEE DATABASE HOMEWORK

--#1--
Select employees.emp_no_id, employees.last_name, employees.first_name, employees.gender, salaries.salary

from employees inner join salaries
	on employees.emp_no_id = salaries.emp_no_id;
	

--#2--
Select emp_no_id, first_name, last_name, hire_date from employees
where hire_date between '1986-01-01' and '1986-12-31';


--#3--
select departments.dept_no_id, departments.dept_name, dept_managers.emp_no_id, 
employees.last_name, employees.first_name, dept_managers.from_date, dept_managers.to_date

from departments 
	inner join dept_managers
		on departments.dept_no_id = dept_managers.dept_no_id
	inner join employees
		on dept_managers.emp_no_id = employees.emp_no_id;
		

--#4--
select employees.emp_no_id, employees.last_name, employees.first_name, departments.dept_name

from departments 
	inner join dept_employees
		on departments.dept_no_id = dept_employees.dept_no_id
	inner join employees
		on dept_employees.emp_no_id = employees.emp_no_id;
		
--#5--
select * from employees
where first_name like 'Hercules' and last_name like 'B%';


--#6--

select employees.emp_no_id, employees.last_name, employees.first_name, departments.dept_name

from departments 
	inner join dept_employees
		on departments.dept_no_id = dept_employees.dept_no_id
	inner join employees
		on dept_employees.emp_no_id = employees.emp_no_id
		
where departments.dept_name like 'Sales';	



--#7--

select employees.emp_no_id, employees.last_name, employees.first_name, departments.dept_name

from departments 
	inner join dept_employees
		on departments.dept_no_id = dept_employees.dept_no_id
	inner join employees
		on dept_employees.emp_no_id = employees.emp_no_id
		
where departments.dept_name like 'Sales' or departments.dept_name like 'Development';	


--#8--
select last_name, count(last_name) as employees_with_name
from employees
group by last_name 
order by last_name desc;





		
		
		
		
		
		
		