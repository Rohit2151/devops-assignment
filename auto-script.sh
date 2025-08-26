#!/bin/bash
set -e
# Install Docker, Docker Compose, and Nginx in one line
sudo apt-get update && \
sudo apt-get install -y curl && \
curl -fsSL https://get.docker.com/ | sh && \
sudo usermod -aG docker $USER && \
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" \
    -o /usr/local/bin/docker-compose && \
sudo chmod +x /usr/local/bin/docker-compose && \
sudo apt install -y nginx && \
