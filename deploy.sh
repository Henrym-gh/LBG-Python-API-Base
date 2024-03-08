#!/bin/bash

# Exit script if any command fails
set -e

printout() {
    echo "this is to test a function"
}

cleanup() {
    docker rm -f $(docker ps -aq) || true
    docker rmi -f $(docker images) || true
}

# Function to build the Docker image
build_docker() {
    docker build -t $DOCKER_IMAGE:$VERSION .
}

# Function to modify the application
modify_app() {
   export PORT=5001
}

# Function to run the Docker container
run_docker() {
    docker run -d -p 5001:$PORT -e PORT=$PORT --name coffee-app $DOCKER_IMAGE:$VERSION
}