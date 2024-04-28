#!/bin/bash

# Function to deploy the specified Docker container
deploy_docker_container() {
    echo "Deploying Kali Linux Desktop Docker container..."
    docker run --rm -d -p 4000:4000 --privileged --name nomachine-mate -e PASSWORD=123456 -e USER=motoe --cap-add=SYS_PTRACE --shm-size=4g thuonghai2711/nomachine-kali-desktop:latest
    echo "Docker container deployed."
}

# Function to install and configure PlayIt
install_and_configure_playit() {
    echo "Installing PlayIt..."
    curl -SsL https://playit-cloud.github.io/ppa/key.gpg | gpg --dearmor > /etc/apt/trusted.gpg.d/playit.gpg
    echo "deb [signed-by=/etc/apt/trusted.gpg.d/playit.gpg] https://playit-cloud.github.io/ppa/data ./" > /etc/apt/sources.list.d/playit-cloud.list
    apt update
    apt install playit -y
    echo "PlayIt installed successfully."
}

# Function to start PlayIt
setup_playit() {
    echo "Running PlayIt..."
    playit
}

main() {
    deploy_docker_container
    install_and_configure_playit
    setup_playit
}

main
