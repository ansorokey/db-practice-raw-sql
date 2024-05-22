## Installing the tools
PyCharm is a python ide. Just gonna use VSCode, but we can installthis later if its necessary.
Lookms good for configuring pythoin environments, virtual or system environemnts.

Lol forgot all about pip install, its the npm install equivilent. Installs packages.

Looks like we got it up and running.
Running the hello-version file (chapter1) gives us
This is python version 3.10.6
SQLite version 3.31.1
MySQL connector version 8.4.0

I dunno how the heck to update sqlite3 to the latest versions. Just winging it with what we got for now.

## Creating a connection

## Prepared statements
A statement parsed once by the db engine and then a used over and over
We should always set the prepared=True argument within the .connect
A ? is a bind variable within a query
These are used to sanitize inputs before making a query
