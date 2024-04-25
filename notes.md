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
    field
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
