## Data Storage
Why exactly are databases a 2d matrix?
Imagine a folder on your computer.
In that folder, we organized a bunch of pictures of landmarks. Each folder is a country, and within each folder is the pictures taken in those countries.
Right now, the data is stored in a heiracry based on location and location alone.

There is no simple way to change this, If - for example - we wanted to re-organize the folders by the photographer, or by the date. There isnt a single button to press that will make new folders and redistribute the photos into the correct locations.

The reason databases are 2d matrix spreadsheet style is because we can readily see all the info about data at a glance, and the parameters that define it as columns.
The columns allow us to sort and sift through data without having to restructue anything, since they're just detailed lists; lists we can remove or add data on to when looking though them.

## What is CRUD?
Why do we use a relational database?
1. They're efficient. By using seperate tables for single values, we can avoid having to re-write something every time it needs to be in a record.
2. Since individual data is written once and referenced multiple times, a single fix on one table can fix eveything that references it
3. Higly scalable. If we want to add more data, we only need to add another row, or an extra field.

An RDBMS is the application used to manage a database. PostgreSQL, MS SQL Server, etc.

All RDBMS have the same core functionality.
- Creating and modifying structure of the data
- Defining tables and column names
- Create key-value columns and create relationships
- manipulate data records and perform CRUD tasks
CREATE, READ, UPDATE, and DELETE data.

Most RDBMS also feature special features, such as
- scheduled backups
- Backup copies of DB
- Control and monitor user access and permissions
- Create visual reports and graphs

RDBMS can be operated with a gui and cli. SQL is the language we use in the CLI to interact with the database.

## Relations, tuples, tables, and records
A table is the mainstorage device of data in a database. A table has fields (columns) that can be filled with a single value for that data.

A record is the row in a table. Each record fills in a spot in a table's column in their spot. The order of a record has no bearing on the database.

## Choosing an ER design Tool
An ER - Entity Relationship - is a diagram that visually represents the values of tables within a database, as well as how they connect and relate to one another.
Some free online tools to assist in creating these diagrams are:
[LucidChart](https://lucid.app/documents#/documents?folder_id=home)
[SQL Database Modeler](https://sqldbm.com/Home/)
[DBdiagrams.io](https://dbdiagram.io/home)
[Quick Database Diagrams](https://www.quickdatabasediagrams.com/)

## Design a table
In a ER diagram, a table is usually represented by a box. At the top of the box is the table name: either alone or with a two part name (schema.table)
Beneath the name are names of the fields/columns in that table. THese can also optionally be followed by additional information like data type, and constraints
