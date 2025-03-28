#!/bin/bash

# Wait for SQL Server to be ready
echo "⏳ Waiting for SQL Server to start..."
for i in {1..50}; do
  if /opt/mssql-tools/bin/sqlcmd -S db -U sa -P 'YourStrong!Passw0rd' -Q "SELECT 1" &> /dev/null; then
    echo "✅ SQL Server is ready!"
    break
  fi
  sleep 1
done

# Execute setup script
echo "🚀 Running setup script to create MoviesDB..."
/opt/mssql-tools/bin/sqlcmd -S db -U sa -P 'YourStrong!Passw0rd' -d master -i /container-config/setup-moviesdb.sql

# Check for errors
if [ $? -eq 0 ]; then
  echo "✅ Setup script completed successfully!"
else
  echo "❌ Error running setup script"
fi
