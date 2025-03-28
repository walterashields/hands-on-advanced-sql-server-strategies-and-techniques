#!/bin/bash
# Wait for SQL Server to start up
echo "Waiting for SQL Server to start..."
sleep 15

# Run the MoviesDB SQL script
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'YourStrong@Passw0rd' -d master -i /workspace/init/MoviesDB.sql
