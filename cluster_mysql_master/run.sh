#!/bin/bash
chmod 777 -R ./master_home
chmod 644 -R ./master_home/config
docker-compose up -d 
sleep 3s
docker ps | grep my-mysql-master1 |awk '{print $1}'
#|xargs docker logs -f 
