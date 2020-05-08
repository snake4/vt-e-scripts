#!/bin/bash
chmod 777 -R ./vsftpd_home
mkdir -p /home/ftp
docker-compose up -d 
sleep 1s
cid=$(docker ps | grep my-vsftpd |awk '{print $1}')
docker exec -i $cid /home/createUser.sh testuser testuser@test
docker exec -i $cid /home/createUser.sh myuser myuser@test
docker restart $cid

