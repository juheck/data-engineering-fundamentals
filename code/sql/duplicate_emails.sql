/*
Write a SQL query to find all duplicate emails in a table named Person.
*/

CREATE TABLE first_project_bq_dataset.Person (
    Id int64,
    Email string
);

INSERT INTO first_project_bq_dataset.Person 
VALUES (1, 'a@b.com'),
(2, 'c@d.com'),
(3, 'a@b.com')
;

-- Solution:

select distinct email from (
select email, row_number() OVER (PARTITION BY email) as row_nb
from `first_project_bq_dataset.Person`
)
where row_nb >= 2
;

-- better version:

select email
from `first_project_bq_dataset.Person`
group by email
having count(email) > 1

