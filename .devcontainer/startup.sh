#!/bin/bash

# Wait for SQL Server to be ready
echo "Waiting for SQL Server to start..."
for i in {1..50}; do
  if /opt/mssql-tools/bin/sqlcmd -S db -U sa -P "YourStrong!Passw0rd" -Q "SELECT 1" &> /dev/null; then
    echo "SQL Server is up."
    break
  fi
  sleep 1
done

# Final safety sleep to allow full readiness
sleep 5

# Execute setup script to create MoviesDB
echo "Running MoviesDB setup script..."
/opt/mssql-tools/bin/sqlcmd -S db -U sa -P "YourStrong!Passw0rd" -d master -i /workspace/setup-moviesdb.sql

# Check if the command succeeded
if [ $? -eq 0 ]; then
  echo "MoviesDB setup completed successfully."
else
  echo "MoviesDB setup failed!" >&2
  exit 1
fi


