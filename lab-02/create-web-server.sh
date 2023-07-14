#!/bin/bash
# This script creates a web server with docker nginx:alpine image
# and mounts the local directory to the container

docker pull mysql:latest

docker run -d --name database -v ./mysql-data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -e MYSQL_DATABASE=mydb mysql:latest

docker ps | grep database

if [ $? -ne 0 ]; then
    echo "Container database is not running"
    exit 1
fi

docker ps -a | grep website

if [ $? -eq 0 ]; then
    docker stop website
    docker rm website
fi

docker pull nginx:alpine

docker run -d --name website -v ./website:/usr/share/nginx/html -p 8080:80 --link database:mysql nginx:alpine

docker exec -it website ping -c 5 mysql

if [ $? -ne 0 ]; then
    echo "Connection between website and mysql containers failed"
    exit 1
fi
