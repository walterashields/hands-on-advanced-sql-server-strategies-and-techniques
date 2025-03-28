#!/bin/bash

# Wait for SQL Server to be ready
echo "Waiting for SQL Server to start..."
for i in {1..50};
do
  if /opt/mssql-tools/bin/sqlcmd -S db -U sa -P "YourStrong!Passw0rd" -Q "SELECT 1" &> /dev/null
  then
    echo "SQL Server is ready"
    break
  else
    echo "Not ready yet..."
    sleep 1
  fi
done

# Run the setup script
echo "Running setup script..."
/opt/mssql-tools/bin/sqlcmd -S db -U sa -P "YourStrong!Passw0rd" -d master -i setup-moviesdb.sql
