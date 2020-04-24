#!/bin/bash
chmod 777 -R ./minio_home
docker-compose up -d  --force-recreate
sleep 1s
docker ps | grep my-minio_s2 |awk '{print $1}'
