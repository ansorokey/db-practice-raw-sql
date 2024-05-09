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

## Attribute Data Types
Since a field should only store the same types of values, they should all be of the same type.
This is better for storage efficiency and helps predict future psce needs.
Data is also kept consistent.

Different RDBMS are capable of different data types, but the most common are:
TEXT
- char(x) - text always x charavters in length
- varchar(x) - text up to x characters in length
- nchar(x) - text of a fixed length og x characters an additional unicode encoding
NUMERIC
- tinyint - ints under 255
- int - under 2 billion
- decimal
- float
.
Others can include dates, currency, etc. All depends on your RDBMS. Choose based on needs.

TIP: phone numbers seem like numbers, but we dont perform math on a phone number. So those are usually stored as text data. Same as stuff like zips.

## Use Primary Keys to Identify Records
A relational database only works if a record can uniquely be referenced by the database. Library card number, bank account, email address, social security, isbn, mac address, etc.

Data must have SOME value that is always be exclusively unique to that record.
It doesn't always have to be a single value. A combination of a records multiple columns can be unique. This is a concatenation key.
If the data already has something that will be unique to it, that is a natural key, like an email.
If we make up a unique value soley for database purposes, that is a surrogate key, like id number.

The PK on  atable are suually designated with a PK

## Object Naming Considerations
Its almost never recommended to use a space ina name. They require much more work to manage and make work. Typically, naming tables and columns and databases use underscores or capitalization.
Be careful not to use reserved words that can confuse the system. Check your RDBMS for these.
Singular vs Plural: is the table named Person or People? Either one works, just stay consistant.
Do not use acronyms. Use a full, descriptive name.

## Data Constraints
Setting specific ruiles on the data table prevents invalid or incorrectly formatted data from being saved into the database.
Some constraintd include:
- Unique Values - Prevents duplicate values from appearing in the table. Like a primary key, but does not have to be a primary key.

## Required Attributes and null values
A null value is an absent value. It is the value for any field that was not given a value, or is not known. NULL does not mean zero, an empty string, or a blank space.

A null value is perfectly acceptable for optional data. If it is not needed, it does not need to be entered. If something is required, it cannot be null, and we can enforce this with the NOT NULL constraint. When making a ER diagram, we can use NULL after data types and constraints to show it as optional with a question mark (?).

## Define a default value
Default values can speed up data entry by automatically filling in a field when we dont specify something.
After the data type in the schema, we can say DEFAULT=value.
Default and NOT NULL can work together to ensure that a field is always given a value, and choose the value to be set.

## Establish table indexes
