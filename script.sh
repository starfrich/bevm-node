#!/bin/bash

# Check if Docker is already installed
if command -v docker &> /dev/null; then
    echo "Docker is already installed. Skipping installation."
else
    # Download and run the Docker installation script
    wget https://raw.githubusercontent.com/docker/docker-install/master/docker-install.sh -O - | sudo sh
fi

# Load environment variables from .env file
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
fi

# Establish a host mapping path
mkdir -p /var/lib/node_bevm_test_storage
path="/var/lib/node_bevm_test_storage"

# Fetch the Docker image if not already present
if sudo docker images | grep -q "btclayer2/bevm:v0.1.1"; then
    echo "Docker image btclayer2/bevm:v0.1.1 is already present. Skipping image download."
else
    sudo docker pull btclayer2/bevm:v0.1.1
fi

# Run the Docker container
read -p "Enter your desired node name (or press Enter to use the default from .env): " user_node_name
node_name=${user_node_name:-$NODE_NAME}
telemetry_url=${TELEMETRY_URL:-"wss://telemetry.bevm.io/submit 0"}

echo "Running Docker container with the following parameters:"
echo "Host mapping path: $path"
echo "Node name: $node_name"
echo "Telemetry URL: $telemetry_url"

sudo docker run -d -v $path:/root/.local/share/bevm btclayer2/bevm:v0.1.1 bevm "--chain=testnet" "--name=$node_name" "--pruning=archive" --telemetry-url "$telemetry_url"

echo "Docker setup completed. Your node name is: $node_name"
