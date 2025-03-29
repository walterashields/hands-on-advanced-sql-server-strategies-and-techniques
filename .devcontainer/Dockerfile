# Use the official SQL Server image as base (to match your runtime)
FROM mcr.microsoft.com/mssql/server:2022-latest

# Set environment variables
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=YourStrong!Passw0rd
ENV DEBIAN_FRONTEND=noninteractive

# Install prerequisites and mssql-tools18
RUN apt-get update && \
  apt-get install -y curl gnupg apt-transport-https software-properties-common wget && \
  curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
  add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/22.04/prod.list)" && \
  apt-get update && \
  ACCEPT_EULA=Y apt-get install -y mssql-tools18 unixodbc-dev && \
  echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> /etc/bash.bashrc

# Expose SQL Server port
EXPOSE 1433

# Start SQL Server on container run
CMD /opt/mssql/bin/sqlservr