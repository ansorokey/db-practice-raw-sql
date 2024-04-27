# General SQL Syntax
-- single line comment
/*
Multi-line comment
*/

SELECT
    field
FROM
    table
WHERE
    conditions
GROUP BY
    field (the non aggregated field)
HAVING
    aggregate conditions
ORDER BY
    field
LIMIT val



## Aliasing
SELECT
    firstname AS [First Name],
    lastname AS 'Last Name',
    email AS EMAIL

## Ordering
> Defaults to ASC (ascending/smallest/earliest/alphabetical)
> Can sort by multiple fields, in order given
ORDER BY
    firstname ASC,
    lastname DESC

## Limiting
LIMIT 10

## Operators
Add +
Subtract -
Multiply *
Divide /
Modulo %

Comparison
Equal to =
Not equal to <>
Greater than >
Less than <
Greater than or equal to >=
Less than or equal to <=

Logical
AND
OR

IN (val, val, val)
LIKE
% is the wildcard character with LIKE, any number of characters before and after
Case insensitive
BETWEEN val AND val

WHERE
    conditions

Numeric data does not need to be redeclared
WHERE
    total = .99 OR 1.98

Text data needs to be surrounded in single quotes.
Redeclare the field when adding additional fields fields yayyy!

Dates can be stores in different formats. Becareful when querying a format.
Like text, dates are queried in single quotes, but can use arithmatic operators.

IF THEN CASE


## Joins
A join is a command that joins two or more tables.

FROM
    Table
JOIN
    Table
ON
    Table.ForeignKey = Table.PrimaryKey

Sometimes tables will have references to records that do not show up in another table.
Say we have atable of users and transactions.
Some users have not made a transaction yet.
some transactions may have been made by users that deleted their account.
An INNER JOIN only returns overlapping matching records, meaning data that shows up in BOTH tables. Missing data is omitted. Think of inner like the inside of a venn diagram.
A LEFT OUTER JOIN shows all data on the left side table, while omitting missing data from the right table. It will fill in the blank for that mising data as NULL data.
A RIGHT OUTER JOIN shows all data on the right side table, while omitting missing data from the left table. It will fill in the blank for that mising data as NULL data. Some RDBMS do not support right outer joins, such as SQLITE.
(LEFT AND RIGHT are based on table order, so to make a right outer join, just swap the order of the tables)

## Relationships
One-To-Many
One customer is referenced by many invoices
The one is the primary key of another table.

## Functions
- AGGREGATE
MIN()
MAX()
AUG()
COUNT()
SUM()

- STRING
UPPER()
SUBSTR()
INSTR()
LENGTH()
LTRIM()
REPLACE()
TRIM()

- DATE/TIME
NOW
DATETIME()
DATE()
JULIANDAY()
STRFTIME()
TIME()

To filter on aggregated values, we use HAVING.
Use the aggregated field the same way we'd use a condition in a where clause, but placed under this HAVING keyword
WHERE is for non aggregated data filtering, HAVING is for aggregated filtering
Where first filters data,
data is aggregated,
then having filters further


## Subquery
A subquery is a nested query. One wrapped in another by parentheses.
We can use a single query to find the average of an entire column.
If we want to compare records in the table to the result of that query, we can just use that query as the value.

## DISTINCT
A primary key is guaranteed to be unique to that record. Other fields can have duplicate values.
Distinct removes duplicate values from a query. Doesnt ignore records that have multiples, just ignores anything it's already seen and only shows on. Long story short, turns a query into a set.

## Views / Virtual Table
A view is a query that can be repeadetly used or referenced by other queries. Like a function to save us from re-writing the same query over and over.

Views are created by placing
CREATE VIEW V_view_name AS
above the selectof the query we want to save.
Best practice is to begin a view with a `V_`

Not all RDBMS allow you to modify a view directly.
In order to modify a view, some RDBMS will DROP (delete) an existing view and then recreate it with your modificiations.
DROP VIEW V_viewname

## Data Manipulation Language (DML)
Are the SQL statements used to alter the data stored in tables.
INSERT - add new data
UPDATE - modify existing data
DELETE - remove existing data

## INSERT
We used select and from to GET data from the db.
To insert, we use
INSERT INTO tablename (field, field, field)
and then we specift what we're adding
VALUES
    (value, value, value),
    (value, value, value)

## UPDATE
Almost always used with the where clause, so we can choose specific data to update.
WITHOUT THE WHERE CLAUSE, EVERY RECORD IN A TABLE WILL BE UPDATED

UPDATE
    table
SET field = newValue
where
    condition

## DELETE
almost ALWAYS used with the where clause.
WITHOUT THE WHERE CLAUSE, DELETES EVERY SINGLE RECORD IN THE TABLE
Since we are deleting an entire record, the field names aren't needed here. We jump straight into the table. (if we wanted to delete a record's field, then we would just update that data to null.)

DELETE FROM
table
WHERE
condition
