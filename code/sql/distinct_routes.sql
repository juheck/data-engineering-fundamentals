/*
Write a SQL query to find all distinct routes in the Routes table. 
A route from B to A is considered a duplicate of a route from A to B. 
You should return the instance that comes first alphabetically based on the Pickup.
*/


CREATE TABLE first_project_bq_dataset.Routes (
    Pickup string,
    Dropoff string
);

INSERT INTO first_project_bq_dataset.Routes 
VALUES (A, B),
(C, D),
(B, A),
(C, D)
;