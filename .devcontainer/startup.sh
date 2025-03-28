#!/bin/bash

echo "Waiting for SQL Server to start..."
sleep 15

echo "Running setup-moviesdb.sql script..."
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'YourStrong@Passw0rd' -d master -i /workspace/.devcontainer/setup-moviesdb.sql
