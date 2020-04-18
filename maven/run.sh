#!/bin/bash
chmod 777 -R ./mvn_home
docker-compose up -d  --force-recreate
sleep 1s
docker ps | grep my-maven |awk '{print $1}'
