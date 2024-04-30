############################
### Microsoft SQL Server ###

# Log into sqlserver2019 docker container
docker exec -it sqlserver2019 bash

# View OS information
cat /etc/os-release

# Log into SQL Server using SQLCMD command line tool
/opt/mssql-tools/bin/sqlcmd -U sa -P Adam123456

# View version information
SELECT @@Version;
GO

# List databases currently on the server
SELECT name FROM sys.databases;
GO

# Create a new database
CREATE DATABASE mytestdb;

# Quit SQLCMD CLI tool
exit

# Exit out of the docker container
exit




##################
### PostgreSQL ###

# Log into postgresql docker container
docker exec -it postgresql bash

# View OS information
cat /etc/os-release

# Log into PosgreSQL server using PSQL command line tool
psql -U postgres

# View help documentation
help

# List databases currently on the server
\l

# Create a new database
CREATE DATABASE mytestdb;

# Quit PSQL CLI tool
\q

# Exit out of the docker container
exit

