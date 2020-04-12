#!/bin/bash
chmod 777 -R ./senti_home
docker-compose up -d  --force-recreate
sleep 1s
docker ps | grep my-sentinel |awk '{print $1}'
