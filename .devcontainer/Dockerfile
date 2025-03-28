FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu

# Install SQL Server command-line tools
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list \
    && apt-get update \
    && ACCEPT_EULA=Y apt-get install -y msodbcsql17 mssql-tools \
    && echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc \
    && apt-get install -y unixodbc-dev

# Install other dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Install Python requirements
COPY ./requirements.txt .
RUN pip3 install -r requirements.txt

# Copy and make startup script executable
COPY .devcontainer/startup.sh /tmp/startup.sh

RUN mkdir -p /workspace/.devcontainer && chmod +x /tmp/startup.sh && mv /tmp/startup.sh /workspace/.devcontainer/

