#!/bin/bash
chmod 777 -R ./mycat_home
docker-compose up -d  --force-recreate
sleep 1s
docker ps | grep my-mycat |awk '{print $1}'
