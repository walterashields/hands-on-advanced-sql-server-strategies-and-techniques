#!/bin/bash

# Wait for SQL Server
for i in {1..50};
do
  if /opt/mssql-tools/bin/sqlcmd -S db -U sa -P "YourStrong!Passw0rd" -Q "SELECT 1" &> /dev/null
  then
    break
  fi
  sleep 1
done

# Execute setup script from mounted .devcontainer folder
/opt/mssql-tools/bin/sqlcmd -S db -U sa -P "YourStrong!Passw0rd" -d master -i /container-config/setup-moviesdb.sql
