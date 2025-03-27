#!/bin/bash

# Wait for SQL Server to be fully up
echo "Waiting for SQL Server to start..."
sleep 20

# Run the MoviesDB setup script if it exists
if [ -f .devcontainer/setup-moviesdb.sql ]; then
  echo "Running MoviesDB setup..."
  /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 'YourStrong!Passw0rd' -d master -i .devcontainer/setup-moviesdb.sql
else
  echo "No setup-moviesdb.sql file found. Skipping setup."
fi
