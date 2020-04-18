#!/bin/bash
chmod 777 -R ./slave_home
chmod 644 -R ./slave_home/config
docker-compose up -d 
sleep 3s
docker ps | grep my-mysql-slave1 |awk '{print $1}'
#|xargs docker logs -f 
