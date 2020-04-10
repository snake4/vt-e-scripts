#!/bin/bash
chmod 777 -R ./nacos_home
docker-compose up -d  --force-recreate
sleep 1s
docker ps | grep my-nacos |awk '{print $1}'
