#!/bin/bash
#if you are not in china, ./run en 


read -p "are you in china?(y/n): " inchina
if [[ -n "$inchina" ]] && [ "$inchina" = "yes" -o "$inchina" = "y" -o "$inchina" = "YES" -o "$inchina" = "Y" ]; then
	#the user/password is root/321@linux
    unzip -n jenkins_home_china.zip  -d ./
	
fi
chmod 777 -R ./jenkins_home
docker-compose up -d 
sleep 3s
docker ps | grep my-jenkins |awk '{print $1}'
#|xargs docker logs -f 