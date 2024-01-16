#!/bin/bash

# Install Docker on your VPS
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Establish a host mapping path
cd /var/lib
mkdir node_bevm_test_storage
path="/var/lib/node_bevm_test_storage"

# Fetch the Docker image
sudo docker pull btclayer2/bevm:v0.1.1

# Ask user for the node name
read -p "Enter your desired node name: " node_name

# Run a Docker container with the provided node name
telemetry_url="wss://telemetry.bevm.io/submit 0"
sudo docker run -d -v $path:/root/.local/share/bevm btclayer2/bevm:v0.1.1 bevm "--chain=testnet" "--name=$node_name" "--pruning=archive" --telemetry-url "$telemetry_url"

echo "Docker setup completed. Your node name is: $node_name"