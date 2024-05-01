## What is a database?
A database is a computer system used to organize and store data for retreival and manipulation.

## What is a relation database?
A database that has rules governing how dara is structured, stored, and retrieved.
Organized into a number of different related tables of columns (fields) and rows (records).

## Storing data efficiently
While data could be stored in one single massive spreadsheet with a million different fields, it is usually better to split up data into tables with different focuses.
These different tables can then be related, or refer to other tables.
Pokemon, for example, have 6 stats and can learn a number of moves.
But the stats and moves of a pokemon arent always what are needed at first glance.
So they can be split.
POKEMON table can have the name and id of that pokemon.
STATS table can have 6 stats, and a final field that refers to which pokemon's unique id it relates to.
These relations are what make a relational database.
This structure can result in less cells overall by limiting redundancy.

## Relational Database Management System
An RDBMS are the tools needed to manage a database. The key tools are STRUCTURE, STOERAGE, and SECURITY.
STRUCTURE: Creating tables, defining columns, establish relationships, give tables rules.
STORAGE: Organize data, create indexes for look up, manage backups.
SECURITY: Controls access permissions, user logins, logs for auditing

Picking an RDBMS to use depends on one's needs. They all do similar things, but meet different requirements.
(this course will use SQl server and PostgreSQL)

## Client Server Model
All RDBMS operate on the Client Server model.
A client requests information from the server.
The server does all the structure, storage, and security.
The client connects to and interacts with the server.
The server responds to the client with data.
Both are needed to work together to make an RDBMS functional.
Many clients can connect to a single server, with access to the same up to date information.
A single client can also access many different servers, to manage and analyze lots of data.

## Containerizing
What are the risks involved in creating a local RDBMS?
- Database servers are designed to run on their own dedicated hardware.
- Installation makes significant changes to your operating system that are difficult to reverse.

In this course, we will be creating our RDBMS inside of a container.
Containers can be quickly created, copied, and dicarded.
They provide a safe, consequence-free space to explore technologies without risk to your system.
Most importtantly.they are consistent and predictable across operating systems. A container runs the same on Mac, PC, or Linux.
For this course, we will use Docker Desktop.

## BASIC Docker commands (in a windows terminal)
`docker version`
- Give system information about what various docker components.

`cls` or `clear`
- terminal commmand, clears terminal

`docker`
- displays commands and actions available

`docker COMMAND --help`
- more info about a specific command

## Database Server Containers
A docker image is the blueprint/model of software and required compoments needed to run.
A container is built from an image. A container acts as a fully encapsulated, isolated networked computer running the software from the image.
Multiple containers can run from a single image. Several containers can run at once to cerate a vitual network.
Images can be found on [dockerhub](https://hub.docker.com/)

## RDBMS Command Line Interface
We can use the windows powershell OR docker GUI to manage our containers and images.
If we want to use the cli, here are some basic commands.

`docker ps`
- Lists running images

`docker exec -it sqlserver2019 bash`
- log into the sqlserver image
- `docker exec` runs the container
- `-it` tells docker to open an interactive text terminal
- `bash` is the terminal/shell we want to use
When the terminal line changes, that means we aew now inside of the container

`cat /etc/os-release`
- command to give information on current linux version
- use within the container to see what we're running on

`/opt/mssql-tools/bin/sqlcmd -U sa -P Anton123456`
- log in to the sql server running inside the container
- `/opt/mssql-tools/bin/sqlcmd` where the sql cli is located
- `-U sa` which user, the System Administrator account
- `-P` the password
When the command line changers again, we are logged into the SQL server instance

`SELECT @@version`
`GO`
- Display information about the sql server version

`SELECT name FROM sys.databases;`
`GO`
- Display all the databases in this container
A server can have multiple databses

`CREATE DATABASE database_name;`
- create a new database

`exit`
- leave the sql server cli (back to container cli)
- leave the container cli (back to powershell)

`psql -U postgres`
- log in to postgres server cli

`help`
- list psql commands

`\l`
- view server databases

`\q`
- exit psql cli

## CHALLENGE: Run a new container.
First, make sure Docker desktop is running.
We'll make a postgresql container.
`docker run` to run a new container
`--name container-name` to give it a unique name
`-e 'ACCEPT EULA=Y'` to accept the end user license agreement
`-e SA_PASSWORD=example-password` to set the system administrator password
`-p 1420:1433` to set outer and inner ports
`-d` to run detahced (open in background)
`mcr.microsoft.com/mssql/server:2019-latest ` The image to load (this is a path)
A container needs a unique name, and a unique outer port to listen to.

to stop a running container, run
`docker stop CONTAINER-NAME`

to restart a container, run
`docker start CONTAINER-NAME`
(these commands could also use the unique identifier ids)

to remove/delete a container, first STOP the container, and then run
`docker rm CONTAINER-NAME`

## Connect to a database
In order to conect to a container instance, we need the server ip address and ports.
WHen we rin `docker ps`, we can see the IP address by the ports.
It should be 0.0.0.0. This is the localhost ip address, so localhost:PORT is what we'll use.
We could also have used `docker port NAME`

Next, we'll need the user account that has administrator access over the server.
It may be SA (sql server) or POSTGRES.

With both of these, we can create a new connection in azure studio.
When we click new connection, the [server] field is for the IP address. localhost for our local servers.
In the advanced section, we can declare the specific outer port.

## Create a database
A sql server doesnt do anything on its own. It needs input to do stuff. We use SQL to tell a datasbe server what to do.
To reach a SQL execution window, right click the server instance and select new query.

`select * from sys.databases` (ss)
`select * from pg_database` (ps)
- browse the databases in the server

`create database db_name`

## CHALLENGE: Create a Database

## Structured Query Language
DDL - Data Definition Language is the language used to DESIGN and BUILD components of the database.
`CREATE`, `ALTER`, `DROP`

DML - Data Manipulation Language - is the language used to work with data storage
`INSERT`, `UPDATE`, `DELETE`

## Database Organization
Tables are the most basic structure needed to provide organization in a DB.
Seperate tables for different focuses helps to optimize storage and reduce redundancy.
A SCHEMA is a blueprint of how tables relate to one another within a database.
Schemas can also group related tables together. When we name the schema, the tables will be named off od that schema.
TABLES: Books, Authors, Publishers
SCHEMA: Books
So the tables in the databse would be named:
Books.Books, Books.Authors, Books.Publishers.
This is called a TWO PART NAMING CONVENTION

`CREATE SCHEMA schema_name;`
`DROP SCHEMA schema_name'`
`use db_name` (ss) connect to database
`\c db_name` (pg) connect to database

## Constructing Tables
A table is made of rows and columns
The columns are the fields of information about a piece of data.
Fields names should not have spaces. Use descriptive names and avoid acronyms.
CamelCase or snake_case based on which RDBMS you're using.
Identify what sort of data you're storing in this field.
Different RDBMS support different specific field data types.
Common types that should work across rdbms are
- `CHAR(50)` store a series of characters (a string) up to the specified length
- `INT` whole numbers
- `DATE` date values, no time

## Create tables
CREATE TABLE products.products (
    sku CHAR(7) NOT NULL PRIMARY KEY,
    product_name CHAR(50) NOT NULL,
    category_id INT,
    size_oz INT,
    price DECIMAL(5,2) NOT NULL
);

Anything without a NOT NULL is an optional value that doesn't need to be provided.

Every record in any table needs a uniqe identifier.
This identifier is called the Primary Key. No two records in a table can share the same primary key.

## Alter tables
Altering a table allows for the modification of tables that have already been made.
We can add new columns or additional rules (constraints)
<!-- We originally added a field in our products that referenced -->

CREATE TABLE products.categories (
    category_id int PRIMARY KEY,
    category_description char(50)
);

INSERT INTO products.categories (category_id, category_description)
VALUES
(1, 'Olive Oils'),
(2, 'Flavor Infused Oils'),
(3, 'Bath and Beauty Oils');

ALTER TABLE products.categories
ADD product_line char(25);

UPDATE products.categories
set product_line = 'Gourmet Chef'
where category_id in (1, 2);

UPDATE products.categories
set product_line = 'Cosmetics'
where category_id = 3;

## Reserved Keywords
Some commands and keyword have a special meaning that give the server instructions.
Avoid using them in fields and tables.
Words like CREATE, DROP, etc

If we absolutely had to use keywords, they should be wrapped in their own set of quotes.
So schema.table would have to be "schema"."table"
If the keyword is a valid descriptor, extend the name a little.
Instead of Date as a field, use something like purchase_date
Each RDBMS should have their own lists of reserved words and keywords.

## CHALLENGE: Create a table
create schema HumanResources;

create table HumanResources.Employees (
    employe_id INT NOT NULL PRIMARY KEY,
    first_name CHAR(50),
    last_name CHAR(50),
    department CHAR(50),
    hire_date DATE
);

ALTER TABLE HUMANRESOURCES.EMPLOYEES
RENAME COLUMN employe_id to employee_id;

ALTER TABLE HUMANRESOURCES.EMPLOYEES
ALTER COLUMN first_name set NOT NULL;

ALTER TABLE HUMANRESOURCES.EMPLOYEES
ALTER COLUMN last_name set NOT NULL;

ALTER TABLE HUMANRESOURCES.EMPLOYEES
ALTER COLUMN department set NOT NULL;

ALTER TABLE HUMANRESOURCES.EMPLOYEES
ALTER COLUMN hire_date set NOT NULL;
