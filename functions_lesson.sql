use employees;

-- STRING FUNCTIONS:
-- https://dev.mysql.com/doc/refman/5.7/en/string-functions.html

-- CASE CONVERSION

select lower(first_name) as first_name, lower(last_name) as last_name from employees;

select upper(first_name) as first_name, lower(last_name) as last_name from employees;


-- CONCAT
-- e.g. concat first_name and last_name to create a username:

select lower(concat(first_name, ' ', last_name))  as full_name from employees;


-- we can also concatenate columns with other pieces of string
select lower(concat(first_name, '_', last_name, '@company.com'))  as email_address from employees;


-- SUBSTRING
-- Substring function allows us to obtain part of a string
select substr('some_string', 5, 7);

select substr(first_name, 2, 10) from employees;


-- create a username for employees using firstletter of first_name, an underscore and lastname
select lower(concat(substr(first_name, 1,1), '_', last_name)) as username  from employees;
select concat(substr(lower(first_name), 1,1), '_', lower(last_name)) as username  from employees;

-- Replace

select replace('ABC123_def', 'abc', 123);

-- DATETIME FUNCTIONS
-- https://dev.mysql.com/doc/refman/5.7/en/date-and-time-functions.html

-- we can get the day or month name of the week from a date (or string that matches the date format)
select month('2022-05-19');
select monthname('2022-05-19');
select dayname('2022-05-19');


select *, dayname(hire_date) as day_hired, dayname(birth_date) as day_of_birth from employees;


select year(hire_date) as h_year, month(hire_date) as h_month from employees;

-- Current date, time or timestamp
select curdate();
select current_time();
select current_timestamp();


-- how many years has it been since each employee's original hire date and today?
select round(datediff(curdate(), hire_date)/365, 1) as tenure  from employees;

-- unix time is the number of seconds since 1970-01-01
select unix_timestamp('1971-01-01');


select unix_timestamp();

-- We can add our function outputs as new columns onto existing output e.g days someone was born


-- NUMERIC/AGGREGATE FUNCTIONS e.g min, max, average, stddev, count, sum etc

select min(salary), max(salary), std(salary), count(salary), sum(salary) from salaries;