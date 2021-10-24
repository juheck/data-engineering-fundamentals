-- High earners

/*
A company's executives are interested in seeing who earns the most money in each of the company's departments. 
A high earner in a department is an employee who has a salary in the top three unique salaries for that department.
Write an SQL query to find the employees who are high earners in each of the departments.
Return the result table in any order.
*/

CREATE TABLE Employee (
    Id int64,
    Name string,
    Salary int64,
    DepartmentId int64
);


CREATE TABLE Department (
    Id int64,
    Name string
);


INSERT INTO Employee 
VALUES (1, 'Joe', 85000, 1),
(2, 'Henry', 80000, 2),
(3, 'Sam', 60000, 2),
(4, 'Max', 90000, 1),
(5, 'Janet', 69000, 1),
(6, 'Randy', 85000, 1),
(7, 'Will', 70000, 1)
;


INSERT INTO Department
VALUES (1, 'IT'),
(2, 'Sales')
;

/* Create tables in BQ

CREATE TABLE first_project_bq_dataset.Employee (
    Id int64,
    Name string,
    Salary int64,
    DepartmentId int64
);


CREATE TABLE first_project_bq_dataset.Department (
    Id int64,
    Name string
);


INSERT INTO first_project_bq_dataset.Employee 
VALUES (1, 'Joe', 85000, 1),
(2, 'Henry', 80000, 2),
(3, 'Sam', 60000, 2),
(4, 'Max', 90000, 1),
(5, 'Janet', 69000, 1),
(6, 'Randy', 85000, 1),
(7, 'Will', 70000, 1)
;


INSERT INTO first_project_bq_dataset.Department
VALUES (1, 'IT'),
(2, 'Sales')
;

*/


-- Solution:

select Department, Employee, Salary from(
select b.Name as Department, a.Name as Employee, a.Salary
,dense_rank() OVER (PARTITION BY  DepartmentId ORDER BY Salary desc) as salary_rank
from `first_project_bq_dataset.Employee` a
join `first_project_bq_dataset.Department` b
ON b.Id = a.DepartmentId
)
where salary_rank <= 3
order by Department, Salary