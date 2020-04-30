#!/bin/bash
chmod 777 -R ./seata_home
docker-compose up -d  --force-recreate
sleep 1s
docker ps | grep my-seata |awk '{print $1}'
