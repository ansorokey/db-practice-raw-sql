# Nomalization
Normalization is the organization of data so that each indvidual piece of data is stored in one location.
Normalization aims to reduce redunancy, or repeated piece of information within data.

If we had a class of students, we could create a spreadsheet called CLASS where we track student first name, student last name, teacher first name, teacher last name.
If we had 25 students, then we would have 25 rows of data, where the same 1 teacher's first and last name is repeated 25 times. Whatever extra information we may store about that teacher would further increase the number of rows and columns and times we repeat the same bits of information.
If we instead split this spreadsheet into students and teachers, we could list the teacher ONCE, and have the student referece the teacher by their id.
The teacher's data is normalized in this process.
The optimization and simplification normalization offers increases as the volue of data grows.

## DQL - Data Query Language
SQL Commnds are splt into 4 main families:
DDL - Data Definition Language
DCL - Date Control Language
DML - Data Manipulation Language
DQL - Data Query Language

DQL commands are the standard commands to retrieve data from a database and answer questions. This is the most common and often used.

## Getting started with SQL
Dont forget DISTINCT allows us to see unique values.

## Formatting your queries
Its important to say consistent and try to follow best practices to a keep code readable and undertandable.
Kyewords should be uppercased, and arguments should be lower case.
Field and table names should be snake_cased.
Whitespace canbe used liberally.
Use line breaks to seperate clauses. Short clauses can stay on one line.
Use comments to explain parts of queries.
-- single line
/* multi-line*/