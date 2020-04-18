#!/bin/bash
chmod 777 -R ./nginx_home
docker-compose up -d  --force-recreate
sleep 1s
docker ps | grep my-nginx |awk '{print $1}'
