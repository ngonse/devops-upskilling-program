#!/bin/bash
# This script creates a web server with docker nginx:alpine image using docker-compose

docker-compose up -d

docker ps | grep website

if [ $? -ne 0 ]; then
    echo "Container website is not running"
    exit 1
fi
