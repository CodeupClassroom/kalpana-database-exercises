use employees;
# Using the example in the Associative Table Joins section as a guide, write a query that shows
# each department along with the name of the current manager for that department.

select dept_name, first_name, last_name from dept_manager as dm
join employees e using (emp_no)
join departments d using (dept_no)
where dm.to_date > curdate();


# Find the name of all departments currently managed by women
select d.dept_name, concat(e.first_name,' ', e.last_name) as deptartment_manager
from dept_manager as dm
join employees e using (emp_no)
join departments d using (dept_no)
where dm.to_date > curdate() and e.gender = 'F';

# 4. Find the current titles of employees currently working in the Customer Service department.

select title, count(title) from titles t
join dept_emp de using (emp_no)
join departments d using (dept_no)
where t.to_date > curdate()
and de.to_date > curdate()
and d.dept_name = 'Customer Service'
group by title;

#5. Find salary of all current managers
select dept_name, first_name, last_name, salary from dept_manager dm
left join employees using (emp_no)
left join salaries s using(emp_no)
left join departments d using(dept_no)
where dm.to_date > now()
and s.to_date > now()
order by dept_name;

# 6.Find the number of current employees in each department.
select dept_name, dept_no, count(*) from dept_emp de
join departments d using (dept_no)
where de.to_date > now()
group by dept_name
order by dept_no;

# 7. Which department has the highest average salary? Hint: Use current not historic information


select dept_name, avg(salary) as avg_salary from salaries s
join dept_emp de using (emp_no)
join departments d using (dept_no)
where s.to_date > now()
and de.to_date > now()
group by dept_name
order by avg(salary);

#8. Who is the highest paid employee in the Marketing department?
select first_name, last_name, salary from salaries
join dept_emp de using (emp_no)
join departments using (dept_no)
join employees e using (emp_no)
where de.to_date > now()
and dept_name = 'Marketing'
order by salary DESC;

# 9. Which current department manager has the highest salary?
select first_name, last_name, salary, dept_no from dept_manager dm 
join employees e using (emp_no)
join salaries s using (emp_no)
where dm.to_date > now()
and s.to_date > now()
order by salary DESC
limit 1;

#10. Determine the average salary for each department. Use all salary information and round your results.
select dept_name, avg(s.salary) from salaries s
join dept_emp de using (emp_no)
join departments d using (dept_no)
group by dept_name
order by avg(s.salary) desc;

