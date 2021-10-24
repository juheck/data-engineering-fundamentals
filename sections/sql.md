
## SQL 


### Joins

There are four different types of JOIN, but in most cases, we only use INNER, LEFT and FULL JOIN, because the RIGHT JOIN is not very intuitive and can be easily rewritten using LEFT JOIN.

Note: CROSS JOIN results in a Cartesian product. This means it will return all the combinations of rows from one table with all the combinations of rows from the other table. It is usually avoided.

(picture of 4 joins)

(join example)

### Aggregate Functions

The aggregate functions perform a calculation on a data set and return a single value as a result. Example of the aggregate functions are:

- COUNT()
- SUM()
- MIN()
- MAX()
- AVG()
- STDEV()
- VAR()


### GROUP BY

GROUP BY is the most essential function in SQL since it is widely used for data aggregation. If you see keywords such as sum, average, minimum, or maximum in a SQL question, it is a big hint that you should probably use GROUP BY in your query. A common pitfall is mixing WHERE and HAVING when filtering data along with GROUP BY.

### HAVING

The HAVING clause also filters data according to the specified criteria. The difference compared to the WHERE clause is that the HAVING clause works with the aggregate functions. Therefore, if used, it always follows the GROUP BY clause and precedes the ORDER BY clause.

### UNION

- UNION: This is an SQL command that will combine the result of one query with the result of another query. Therefore, it will show only unique records.

- UNION ALL: This one also combines the results from two or more queries. The difference between UNION and UNION ALL is it will also include duplicates.

### SQL Execution Order

- FROM, JOIN
- WHERE
- GROUP BY
- HAVING
- SELECT
- DISTINCT
- ORDER BY
- LIMIT, OFFSET


### DELETE vs TRUNCATE

DELETE is a DML statement. TRUNCATE is a DDL statement. The DELETE statement can be used to delete all rows or only some rows. To delete some rows, you’ll have to use the WHERE clause. While doing this, every row removed will be logged as an activity by the database. On the other hand, TRUNCATE is used only for deleting the whole table, which will be logged as only one action. That’s why TRUNCATE is faster than DELETE, which shows when deleting a table with a huge amount of data. Also, you can’t use TRUNCATE if there’s a foreign key in the table.


### Window Functions

The window functions are SQL functions performing calculations over the defined set of rows (a window). Compared to the aggregate functions, which return a single value as a result, the window functions allow you to add the aggregated value to each row in a separate column. This means the rows are not grouped and all the rows are kept as a query result.

- **RANK /DENSE_RANK /ROW_NUMBER**: These assign a rank to each row by ordering specific columns. If any partition columns are given, rows are ranked within a partition group that it belongs to.

NOTE: When using **ROW_NUMBER**, each row will have a unique rank number and ranks for tied records are assigned randomly. With **RANK/DENSE_RANK**, tied records will have the same rank.

- **LAG /LEAD**: It retrieves column values from a preceding or following row based on a specified order and partition group.

(window function examples)


### LAG/LEAD

**LAG()** and **LEAD()** are positional functions. A positional function is a type of window function.

The **LAG()** function allows access to a value stored in a different row above the current row. The row above may be adjacent or some number of rows above, as sorted by a specified column or set of columns.

```
LAG(expression [,offset[,default_value]]) OVER(ORDER BY columns)
```

Only the first argument (column or expression) is required.


**LEAD()** is similar to **LAG()**. Whereas **LAG()** accesses a value stored in a row above, **LEAD()** accesses a value stored in a row below.


### Subqueries & Common Table Expressions (CTEs) 

- Subquery: is a query found within the query. It can occur in a SELECT clause, FROM clause, or WHERE clause.

- CTE: or a Common Table Expression is a temporary result set returned by a query and used by another query. In that way, it’s similar to subquery. But **_the main difference is CTE can be named and can reference itself_**.


### NULL

In SQL, any predicates can result in one of the three values: true, false, and NULL, a reserved keyword for unknown or missing data values.

NULL is different from ‘’ (empty string) and ‘NULL’, which are both known values and are treated differently, they can be compared to other empty string or blank spaces. NULL cannot be compared to another NULL.

Utilize functions such as:

- A **IS (NOT) NULL**: returns true/false depending on whether A is NULL or not.
- **NVL**(A,B): returns B if A is null, otherwise returns A.
- **COALESCE**(C1, C2,...): returns the first C that is not NULL. If all C’s are null, it returns NULL.
- **NULLIF**(A,B): returns NULL if A = B, otherwise returns A.


#### NULL - AND

A AND B is true if only if both A and B are true, and is false if either A or B is false. But what if A and B columns contain NULL?

1. When A is NULL and B is true, A AND B is evaluated to NULL. Since B is true and A is unknown, A AND B completely depends on the value of A. Thus, A AND B is also unknown.
2. When A is NULL and B is false, A AND B is evaluated to false. Since we already know B is false, A AND B must be false regardless of the value of A.
3. When A and B are both NULL, A AND B is evaluated to NULL as we have no information on neither A or B.


#### NULL - OR

A OR B is true when either A or B is true. It is false when both A and B are false.

1. A is NULL and B is True -> A OR B is True
2. A is NULL and B is False -> A OR B is NULL
3. A is NULL and B is NULL -> A OR B is NULL


#### NULL - NOT

NOT A is evaluated to true when A is false, and to false when A is true. When A is NULL (again, meaning the value of A is unknown), we of course don’t know the logical opposite of A, so NOT A is still NULL.