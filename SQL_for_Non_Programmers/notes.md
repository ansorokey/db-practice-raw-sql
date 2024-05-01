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

## Ordering queries

DID YOU KNOW?
Queries can be ordered by the posiion of the field. So if we have 4 fields in a query, we can say 
ORDER BY 4 DESC (the 4th column)
This is terrible practice. Don't do it.

## Where clause
Sometimes it's more efficient to filter results by chosing whats excluded.
If we had 7 catagories, instead of looking for the 5 matching catgries, find all hat ARENT in the TWO categories.
where cat NOT IN (cat1, cat2)

Using the BETWEEN clause, we can return records within a numerical range.
Both sides of the between is inclusive. so BETWEEN 2 AND 4 returns 2, 3, and 4

Wrap parentheses around logical conditions we want toeep seperate.

## CHALLENGE:
Top 20 orders from georgia and north carolina
SELECT 
	order_num,
	order_type,
	cust_type,
	order_total
FROM sales
WHERE 
	cust_state in ('Georgia', 'North Carolina')
ORDER BY cust_type, order_total DESC
LIMIT 20;

## Aggregate functions
Functions that allow us to summarize data in columns withot having to retreive all that data.
Like COUNT, SUM, AVG, MIN, MAX

COUNT literally COUNTS the number of rows in a query result. It is often counted with the wildcard * to count every row. 
If we wanted to filter the count of rows, we can do so with a where clause. We could also pass in a distinct clause and then a column to count unique occurances.

select count(DISTINCT cust_type)
from sales;

select COUNT(*)
from sales
where total > 10.00;

SUM adds numeric values in a column.

SELECT
	SUM(order_total),
	AVG(order_total)
FROM sales;

## GROUP BY and AGGREGATE
Group by comes after where and before order.
When we use GROUP BY with aggregate data, we are asking the result to aggregate each individual group of the query. 
This is similar to treating each group of data as its own small table.
so a SUM will be the sum of the columns in that group.

SELECT
	cust_state,
	count(*) as num_orders,
	sum(order_total)
FROM sales
group by cust_state;

## HAVING
Having is similar to the where clause, but for aggregate data.
Comes after the group by clause

When we query data, we first retreieve data.
Then the data is filtered by any whee clauses.
Then aggregate data is performed on that result.
Finally, a having clause can filter out data that has already been fitered and aggregated.
It filters groups at the end.

SELECT
	cust_state,
	count(*) as num_orders,
	sum(order_total) as sum_total,
	AVG(order_total) as avg_sales
FROM sales
group by cust_state
having count(*) > 100
order by sum_total DESC;

The having clause itself can be an aggregate function with a comparison, or the aggregate function can be the aggregated field name

## Challenge
list of states
with more than 6 employess
with more than 40k in sales

select
	cust_state,
	count(distinct emp_id) as employee_count,
	sum(order_total) as sum_of_orders
from sales 
where cust_type = 'Business'
group by cust_state
having employee_count >= 6
AND
sum_of_orders > 40000
order by sum_of_orders DESC;