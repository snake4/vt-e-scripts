#!/bin/bash
chmod 777 -R ./mysql_home
chmod 644 -R ./mysql_home/config
docker-compose up -d 
sleep 3s
docker ps | grep my-mysql |awk '{print $1}'
#|xargs docker logs -f 
