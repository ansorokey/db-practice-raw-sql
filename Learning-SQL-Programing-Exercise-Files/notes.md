What is a database?
A collection of organized information.
They allow for rules and relationships between tables..

What is a table?
A collection of fields and records.
Tables make up a database.

What is a record?
A single piece of data with fields in a database.

What is a field?
A column in a record.

What is a schema?
How tables in a database are set up and related to one another.

What is SQL?
A language for manipulating databases. Specifically for asking a database questions in specific way databases can understand.

What is a SQL statement?
Something we write in SQL to retrieve or modify data from a database is a statement.

What is a clause?
The pieces and keywords that make up a clause.
The actions we want the database to take, which tables, what fields, etc. A full statement should end in a semicolon, but not all RDBMS need it.

What is a query?
A query is a statement specifically for retrieving records.

What is CRUD?
Create, Read, Update, Delete: the most common actions associated with databases.

What are the two roles of SQL as a language?
To modify data and databases.

What is DML?
Data Manipulation Languages are statements for modifying database records.

What is DDL?
Data Definition Language are statements for modyfing database SCHEMAS. Changing the structure fields and tables.

When using a select statement, what we feed it i what we will be given back.
If we ask a database to
SELECT 'Hello World';
We will be given exactly that: a single row with the column 'Hello World' and a record with 'Hello World'.
If we feed it this query AND specift a table, we will get back a 'Hello World' for every record in the table.

Using where allows us to filter out results that match a condition. When filtering by text conditions, whether or not it needs to be case sensitive depends on the software and how the column is defined.

When creating coparisons, there are several ways to ask for equal to.
x = y, x IS y.
To negate this, we can use
x != y, x IS NOT y, x <> y.

When using predicates like OR/AND, these will be read in order.
So a where clause like
x and y or z
would check x and y first, then z would be a seperate clause.
To specify what is meant to be checked first, use parentheses.
x and (y or z).

the LIKE operator along with a '%' allows loose matches that align with the given pattern. The wildcard can go anywhere.

The limit keywords tell the query how many results to stop at. LIMIT 10 would stop after the first 10 results.
If we wanted to skip a number of results, like  page of results, we can use the OffSET keyword. If we offset 10, we would begin at the 11th record.

order by can be used to sort records by the selected fields in ascendig order ASC. Or descending if we use DESC. Givenmultiple fields, it will sort by the first to last field. If a field is renamed, we can sort by that field's name.

DISTINCT is a keyword we can put in front of a field to tell sql to ignore repeated values. Only show the first unique values of each.

LENGTH is a function that takes a field and returns the length of that given field. Works on strings and numbers.

COUNT is a function that counts the rows in a given field. Usualy used with the field wildcard (*) to count every record. When using COUNT, be careful what field you chose to count. If you specify a field that has some null values, those will not be counted.

The JOIN keyword is used to out tables together (horizontally) that connect in some way. That's usually done with a foriegn an primary key betwen tables.

FUN FACT: If a joining ON clause is not used with tables, the query will still work. But since the software doesnt know how to match data, EVERY left record will be given EVERY right record, EACH.
So thats a table for every record.

An inner join combines tables and show only all records that pair with another on each table. table.field_name can be used to distinguish similar field names across different tables, especially if a field is caled 'id'.

In the ON clause, we specify which table.field should match the other table.field.

Technically, we can also jon tables without using the on clause, which is called an implicit join, but this is not recommended both for human readability and unintended consequences.

A cross join is when we dont use an on clause. Tats the left table times the right table.

An inner join is the overlap between tables.

A left (outer) join is the entire left table, with the right table fills in where it has matches. No matches on the right side will be blank/null fields.

A right (outer) join is the same thing the other way around, but is rarely used. Its the same thing as a left join with the tables fliped around.

A full outer join is a combination between tables that allows for unmatched data. Like an inner join, but without removing gaps in data.

Not all languages support all joins.

select distinct p.state_code, s.state_abbrev
from states as s
left join people as p
on p.state_code = s.state_abbrev
order by p.state_code;

this query shows that 3 states do not have any people that reference them wen left joined.

GROUP BY groups together records based on the given field. This is used when we aggregate data (use functions) and should be used with the data we DIDNT aggregate.

Data Types are the specific kinds of data we store in a field.
Could be text, numeric, binary, etc.
Different data types are stored differently, and allow for different actions to be performed on them.

Data types can get very specific in their size, but the general types are BINARY, DATE/TIME, NUMERIC, VARCHAR, BOOLEAN.

The specific type of data determines its optimization and size. Check your RDBMS to see what types it supports.

NULL is the special value that represents NOTHING in a field. No value. This is different than no, 0, or false.

SQL can also perform calculations.
The most basic math sql can perform is feeding an expression into a simple select statement.
SELECT 4 + 2;
Unexprected results can arise from mismatched data types (1/3) integer division will return 0 instead of a float.
Sometimes its best to let your programming language handle math for better precision.

functions in SQL like MIN(), MAX(), AVG(), SUM() can calulate data from tables.

A subquery, or a sub-select, is a query based on another query.
A subquery is good for using a query result (like aggregate data) as the argument for a condition.

select first_name, last_name
from people
where quiz_points = (SELECT max(quiz_points) from people)

Since the max score could have been anything, its good to go off of the max in the table. Its best ot to assume the max score was 100. Maybe everyoe got one question wrong. Maybe the score was out of 150. USe the table's data rather than your own.

We can transform the retrieved data using some functions like UPPER(), LOWER(), SUBSTR(), REPLACE(), CAST()
Cast is good for type casting data types.
CAST(quiz_points AS char)

Using an alias allows us to rename a table or column with the AS keyword.
The new name can be written as is, or in quotes if using spaces. Try not to use spaces when possible.

To a data to a table, we use the INSERT INTO keywords.
Similar to a select query, we follow it with the table we want to add a record to, and then we describe what fields we will be providing data to. It also tells sql what order we are giving data.
INSERT INTO people
    (name, state_code)
VALUES
    ('Anton', 'OH'),
    ('Ethan', 'NY'),
    ('Anon', NULL)

If we provide a field with a table, that field needs to be filled. If we dont have a value to provide, we can set it to NULL

Constraints are rules the table follow that determine how data is allowed to be entered. If values need to exist, if they need to be unique, etc.

Data can be modified and edited using the UPDATE clause.
UPDATE people
SET state_code = 'MA'
WHERE name = 'Anon'

Make sure to always use a where clause to find the specific records we are looking to update, and avoid updating unintended records. It never hurts to add more information in a clause. The unique id of a record is always the best thing to query by.

DELETE is the keywords we use to wipe out records.
Since the entire record is getting deleted, we only need to specify the table we are deleting from. No fields.
DELETE FROM table;
That statement by itself is entirely valid, and will wipe out the entire table.
Since that isn't what we want to do, we also want to make very good use of the where clause to pinpoint the specific data we want to delete.

One of the most common issues in SQL is typos. If you get repeated errors, try to look carefully at your syntax and break down each statement into pieces.

Text values should always be enclosed in single quotes.

If you use spaces as characters in your field/table names (which is not recommended), use BACKTICKS to reference those names in a statement.

Always use plain text in your sql queries. Copying and pasting can cause formatting errors, and switch quotation marks.
Sharing yout statements through plain txt files is better than copying and pasting.

use IS NULL or IS NOT NULL to look for null values. Don't compare a field to 0.

If updating or deleting, make it a select query first, and then modify to UPDATE or DELETE.
