#!/bin/bash
chmod 777 -R ./nexus_home
docker-compose up -d  --force-recreate
sleep 1s
docker ps | grep my-nexus |awk '{print $1}'
