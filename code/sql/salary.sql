/*
Write a SQL query to return:
1. The number of people in the IT department who have a salary greater than 70000
2. The number of people in the Sales department who have a salary greater than 50000
*/


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

