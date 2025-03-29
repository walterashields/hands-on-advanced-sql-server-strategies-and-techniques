# Start from a base Ubuntu image with root access
FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

# Install prerequisites and MSSQL tools
RUN apt-get update && \
    apt-get install -y curl gnupg apt-transport-https software-properties-common wget && \
    curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/22.04/prod.list)" && \
    apt-get update && \
    ACCEPT_EULA=Y apt-get install -y mssql-tools18 unixodbc-dev && \
    echo 'export PATH="$PATH:/opt/mssql-tools18/bin:$PATH"' >> /etc/bash.bashrc