#!/bin/bash
chmod 777 -R ./kafka_home
docker-compose up -d  --force-recreate
sleep 1s
docker ps | grep my-kafka |awk '{print $1}'
