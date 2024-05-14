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
An index is how a database keeps tracks of what data has already been added to a table, and how data is retrieved.
The most commonly searched fields are usually given an index to make lookup even faster.

Think of a phonebook. People indexed by last name, can immediately jump to the section that begin with the same first letter of last name.
Inversely, one would have no idea how to find a matching person given only their phone number. Only way to fid it would be from front to back top to bottom.
It would be eaier to find if the telephone umbers were also indexed.

Any column can be given an index, but should really be given to the columns that get searched or joined often.
A primary key is a clustered index. This just means the PK is also the index, meaning the primary key also determines the order of data.
Any additional indexes are non-clustered indexes, meaning they have no bearing on data order.

An index takes time and slows down the database. When we add a new record or edit data, all indexes on that table need to be rebuilt. Placing an index on every single column would be a massive slowdown.

Non-indexed columns do not prevent lookup. It's just less efficient, and lookup could possibly be unaffected anyway.

## Check Constraint
Data is validated before being saved to the table.
- Can check the range of numerical data
- can limit text to a list of predefined, acceptable strings
Check constraints give control over the values entered into a field.
(ms sql server example)
[State] char(2) NOT NULL
CONSTRAINT CHK_State CHECK (State='CA' OR State='TX'),

## Relate Tables with Foreign Keys
Relations allow information in one table to be used to look up information in another table.
A one to many or many to one relationship means that one record in a table can have many records that reference ONE record.
The many belongs to the table that references that record many times. The one is the record that is referenced.
The oen is typically a primary key (PK). The data that references another record is usually the foreign key (FK)
A relationship between tables generally starts on the foreign key.
A foreign key and primary key need to be the same data types.
The names don't need to match, but the values do.

## RElationship optionality and cardinality
Optionality is the minumum number of records that can be associated, usually 0 or 1.
If a customer MUST have an order, the optionality is 1.
If a customer might have an order, the optionality is 0.

Cardinality is the maximum number of associated records.
If a product can only have 1 supplier, cardinality is 1.
If a product can have many suppliers, cardinality is N.

In a diagram, the range of O to C is represented as O..C
Where the O is optionality (0, 1) and the C is cardinality (1, N)
1..N
This can go on both sides of the relationship.
Any colum with a unique contraint has a cardinality of ..1.
If it's not unique, it can be ..N

The range of optionality + cardinality is the multiplicity.

## One to many/many to one relationships
One library card checks out many books
One bank account has many transactions

This does not mean one record MUST have muiltiple related records, only that the table can support multiple.

Cardinality controls how two tables can join.

## One to one relationships
Less common, but still used. 1..1.
Usually used to shorten a single table into two smaller, one with more common data. Also good for adding security settings to portions of data so only specific roles can access sensitive information.

## Many to many relationships
Created between two non unique columns. 0..N
A student can be enrolled in many classes
A class can have many students.

This relationship is bridged between a third table that points to both table, with optional additional information.

## Self Joins
A column in a table can relate to itself in the same table.
AKA self-referencing or recursive relationship.
Follows the same rules as any other relationship.
In a diagram, the one table would have both a PK and a FK
Its a good idea to add check contraints to ensure that the PK and FK are never equal on one record.

## Cascade Changes
Since data references other data in a relationship, changing a record in one place can cause issues if it isnt changed elsewhere.
Cascading update is when the database makes a change in all related records when we change one piece of data.
Cascade delete removed all records that refer to the data.
When defining the foreign key and relationship, we can add ON DELETE CASCADE and ON UPDATE CASCADE

## Relational Database normal forms
Data tables that follow a certain set of rules are called normal forms.
Normalization is the series of rules that a table has to pass to be a proper database design. They must pass one after the other, so passing until the 3rd form (3NF) makes a good database.
1NF - columns only hold one single piece of data. If a piece of data, like a street address, is comma separated, then it should be split into its own fields.

2NF - All non-key values must not be dependant on the primary key fields.
A table using a single primary key already passes this.
A table using a compositie key runs into an issue where we do not want redundant non-key and primary key values.
(Basically, one part of the composite key always shows up with another non-primary key in a table)
It should instead be split off into its own referrential table.
3NF - all non-key field is independant from other non-keys.
(dont have fields that are always the same in the same record(redundant)).

## Denormalization
Normalization is only a guideline, not a requirement.
It is okay for a table to break the 3NF rule in order to maintian efficient tables.
This - denormalization - deliberately introduces redundancy to increase performance.
The most common denormalization example is to extend the number of columns in a table instead of using a seperate table to later join.
Here, we are increasing the amount of space required AND losing data protection in exchange for faster data retrieval (dont need to wait to join tables). This also means we now have to update EVERY corresponding field that might have been in a different table.

## Data Definition Language
The commands that create objects and modify properties
Making tables, c=adding columns, setting constraints, etc.

## Data Manipulation Language
Commands to modify data stored in tables.
Inserting, updating, and deleting.
Makre sure to use where clause with specific, unique values to identify correct data.

## Select Queries
The results of a select query is the dataset, and is like its own table.

## Create a database view
A view is a saved query that we can re-use.
Instead of writing a long, complex querty (like joining multiple tables) we can save a normal query as a view, and then query against that view like a table
(a view doesnt save any data, it just runs the query we saved to it and gives that info back)

## Graph Databases
Relational databases are only type of database, among others. Another type of database is  aGraph Database, where data is stored as nodes and edges. Each node can have relationships with any other node. Nodes can represent different kinds of information. Similar to a social network layout. These may be a better option when the type of relationship and tracking how data relates is more essential than the data itself. An example of a NoSQL database.

## Document Database
Another type of database. This one stores documents that represents a single object. XML data, JSON, PDFS, etc. Documents are group, categorized, and tagged. Information about each object is stored within the document. Organization depends on the content of the document. An example of a NoSQL database.
