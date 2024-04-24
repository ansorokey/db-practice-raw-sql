# General SQL Syntax

SELECT
    field
FROM
    table
ORDER BY
    field flag
LIMIT val

## Aliasing
SELECT
    firstname AS [First Name],
    lastname AS 'Last Name',
    email AS EMAIL

## Ordering
> Defaults to ASC (ascending)
> Can sort by multiple fields, in order given
ORDER BY
    firstname ASC,
    lastname DESC

## Limiting
LIMIT 10
