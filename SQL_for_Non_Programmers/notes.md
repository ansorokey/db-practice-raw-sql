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

## JOINS
Joining tables is the biggest strength of RDBMS/SQL. They allow for smaller tables that reference one another on common, unique ids.

An equijoin joins two tables completely and filters rows that match a where condition.

select 
	job_title,
	count(distinct emp_id),
	sum(order_total) as all_sales
from employees, sales
where employees.id = sales.emp_id
group by job_title
order by all_sales DESC;

Inner and even outer joins are usually better to use, as they take the matching condition and clearly put it into the ON clause. 

Remember to specify the specific tables if columns share the same name with table.field
If field names are unique, then its not necessary

Inner joins returns ONLY matching conditions
LEFT Outer Join returns the left table and matching rows on the right table
Right outer join return the right table and matching rows n the left table
A cross join combines both tables completely (1 table per record) 

## CHALLENGE: Joining tables
select 
	r.region,
	sum(s.order_total) as total_sales
from sales s
join regions r
on s.cust_state = r.state
where s.prod_category = 'Olive Oil'
-- 	AND s.cust_type = 'Business'
group by r.region
order by total_sales;

## Categorize data with CASE
A case statement represents a single column that can have different values in its field depending on the record.
The keywords to make a case are CASE, WHEN, THEN and END AS. ELSE and is optional.
Case is good for grouping data into brackets or labeling individual data.
select 
	CASE
		WHEN emp_name in ('Clement Carry', 'Cynthia Cash', 'Georgia Eddowes')
		THEN 'team1'
		ELSE 'team2'
		END AS team_name,
	sum(order_total) as total_sales
from sales
where cust_state = 'Florida'
group by team_name
order by total_sales DESC;

Case satements let us create new columns based on existing ones.
SELECT CASE
	WHEN quantity <= 6 THEN 'small'
	WHEN quantity > 6 THEN 'large'
	END AS order_size,
	sum(order_total) as total_sales
FROM sales
WHERE cust_state = 'California'
group by order_size
ORDER BY total_sales DESC;

## Calculated Fields
We can create computed columns that are calculations of exisiting data.

SELECT
	cust_state,
	SUM(order_total * 0.94) as net_sales
FROM sales
GROUP BY cust_state
ORDER BY net_sales DESC;

Concatenation allows us to combine text. The double pipe operator concatenates text.
SELECT
	order_type || '-' || cust_type
FROM sales;

## Wildcards
When we dont need to match text exactly, we can use the wildcards to stand in for charcters. Good for finding values.

The wildcards characters are:
% (percent) - any number of characters before and after. Must be usd with the like keyword.
SELECT
	prod_name,
	sum(order_total) as total_sales
FROM sales
WHERE prod_name like '%basil%'
group by prod_name
order by total_sales DESC;

_ (underscore) - matches any SINGLE character. More specific.

## Union
Joins allow tables to be joined together horizontally, extending the number of columns in a result.
A union joins tables on top of each other, sharing the same number of columns and increasing the rows.
The keyword union is plced between two complete queries.
To make a union work, columns must be the same type of data in the same order as well. 

SELECT
	order_num,
	cust_type,
	prod_category,
	order_total
FROM sales
WHERE cust_type = 'Business'
UNION
SELECT
	order_num,
	cust_type,
	prod_category,
	order_total
FROM sales
WHERE prod_category = 'Olive Oil';

This query could have also been done with a sigle query and a where OR clause.

By default, a union removes duplicate rows so we dont ee the same record twice.
If we specficically want to see duplicates, we can use the ALL keyword after the UNION, which will show duplicate records that show up in the top and bottom queries. The tables that get unioned can be different, as long as they follow the rules of a union.

## CHALLENGE: Top Selling Product Lines
- total sales for top selling lines (lemon, rosemary, chili)
- highest to lowest
- product line, total sales, average price per item

SELECT 
	CASE
		WHEN prod_name like 'Lemon%' then 'Lemon'
		WHEN prod_name like 'Rosemary%' then 'Rosemary'
		WHEN prod_name like 'Chili%' then 'Chili'
		END AS prod_line,
	order_total,
	sum(order_total) as total_sales,
	round(SUM(order_total)/SUM(quantity)) as avg_item_price
FROM sales
where prod_line in ('Lemon', 'Rosemary', 'Chili')
GROUP BY prod_line
ORDER BY total_sales DESC;

- list of orders made in tp selling states (Texas, Cali, FLorida)
- show ALL gift basket orders
- order num, state, type, category, order total

SELECT 
	order_num,
	cust_state,
	cust_type,
	prod_category,
	order_total
FROM sales
WHERE (cust_state in ('Texas', 'California', 'Florida') AND cust_type = 'Business')
	OR prod_category = 'Gift Basket';