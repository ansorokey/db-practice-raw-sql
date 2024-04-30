############################
### Microsoft SQL Server ###

https://hub.docker.com/_/microsoft-mssql-server

Windows PC:
docker run --name sqlserver2019 -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=Anton123456" -p 1401:1433 -d mcr.microsoft.com/mssql/server:2019-latest

1433 - inner port
1401 - outer port

MacOS & Linux:
docker run --name sqlserver2019 -e 'ACCEPT_EULA=Y' -e 'MSSQL_SA_PASSWORD=Adam123456' -p 1401:1433 -d mcr.microsoft.com/mssql/server:2019-latest


# Note that MSSQL_SA_PASSWORD and SA_PASSWORD are functionally identical. Microsoft has depreciated SA_PASSWORD but it continues to work. MSSQL_SA_PASSWORD should be used moving forward.


##################
### PostgreSQL ###

https://hub.docker.com/_/postgres/

docker run --name postgresql -p 5401:5432 -e POSTGRES_PASSWORD=Anton123456 -d postgres:14.8

5432 - inner port
5401 - outer port




#######################
### Docker Commands ###

# view all running containers
docker ps

# view all containers regardless of status
docker ps -a

# stop a container
docker stop sqlserver2019

# start a container
docker start sqlserver2019

# remove a container
docker rm sqlserver2019
