#!/bin/bash
chmod 777 -R ./redis_home
docker-compose up -d  --force-recreate
sleep 1s
docker ps | grep my-redis |awk '{print $1}'
