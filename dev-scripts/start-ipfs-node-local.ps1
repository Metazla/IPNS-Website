# Run the Kubo container with multiple port mappings
# Kubo Web UI port 8080
# Kubo API port 4001
# Kubo Gateway port 5001
docker run -d -p 8080:8080 -p 4001:4001 -p 5001:5001 --name kubo ipfs/kubo:latest

# Output the container status
docker ps -f "name=kubo"
