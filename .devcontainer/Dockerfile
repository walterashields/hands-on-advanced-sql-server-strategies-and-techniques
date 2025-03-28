FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu

# Install prerequisites and SQL Server tools
RUN apt-get update && \
    apt-get install -y curl gnupg2 software-properties-common apt-transport-https ca-certificates && \
    curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl https://packages.microsoft.com/config/ubuntu/22.04/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
    apt-get update && \
    ACCEPT_EULA=Y apt-get install -y msodbcsql18 mssql-tools18 unixodbc-dev && \
    echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> /etc/bash.bashrc && \
    echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bashrc

# Install Python and dependencies
RUN apt-get install -y python3 python3-pip && rm -rf /var/lib/apt/lists/*

# Install Python requirements
COPY ./requirements.txt .
RUN pip3 install -r requirements.txt

# Copy and make startup script executable
COPY .devcontainer/startup.sh /tmp/startup.sh
RUN mkdir -p /workspace/.devcontainer && chmod +x /tmp/startup.sh && mv /tmp/startup.sh /workspace/.devcontainer/
