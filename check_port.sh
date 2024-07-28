#!/bin/bash

# Function to generate a random port number between 1024 and 65535
generate_random_port() {
  echo $((1024 + RANDOM % 64512))
}

# Function to check if the port is available
is_port_available() {
  local port=$1
  (echo >/dev/tcp/localhost/$port) &>/dev/null && return 1 || return 0
}

# Keep generating a random port number until an available one is found
while true; do
  port=$(generate_random_port)
  if is_port_available $port; then
    echo "Available port: $port"
    echo "::set-output name=available_port::$port"
    break
  fi
done

docker pull public.ecr.aws/c4n0o7y9/mssql-repo:latest
docker run -d --name test-con -p $port:1433 public.ecr.aws/c4n0o7y9/mssql-repo:latest
docker exec test-con /opt/mssql-tools18/bin/sqlcmd -S localhost -U SA -P 'P@ssword1234' -C -Q 'SELECT TOP 10 StockItemID, StockItemName FROM WideWorldImporters.Warehouse.StockItems ORDER BY StockItemID'