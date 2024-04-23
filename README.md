# db-practice-raw-sql
Using SQLite to practice raw SQL queries and database management.

To run SQL from the terminal, enter the command
`sqlite3 DATABASE.DB`

To create a database, we can start with the command
`create database mhw;`

A `.db` file is a persistant database. Without a persistant database, any tables or information created would be lost when exiting a database.

## SQL COMMANDS
Remember to end commands in a semicolon.
The most important and common keywords in any SQL program are the following:
SELECT - extracts data from a database
UPDATE - updates data in a database
DELETE - deletes data from a database
INSERT INTO - inserts new data into a database
CREATE DATABASE - creates a new database
ALTER DATABASE - modifies a database
CREATE TABLE - creates a new table
ALTER TABLE - modifies a table
DROP TABLE - deletes a table
CREATE INDEX - creates an index (search key)
DROP INDEX - deletes an index

Creating a table:
`create table TABLE_NAME (column_name property);`

Adding a new record to a table:
`insert into TABLE_NAME values (VALUE DATATYPE, VALUE DATATYPE);`

Querying from a table:
`select * from TABLE_NAME;`
