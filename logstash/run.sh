#!/bin/bash
chmod 777 -R ./log_home
#newip=$(ifconfig -a|grep -A5 ens33 |grep inet |grep -v inet6|awk '{print $2}'|tr -d "addr:")
#echo "my ip is $newip" 
#sed -r -i 's/(\b[0-9]{1,3}\.){3}[0-9]{1,3}\b'/$newip/ docker-compose.yml
docker-compose up -d  --force-recreate
sleep 1s
docker ps | grep my-logstash |awk '{print $1}'
