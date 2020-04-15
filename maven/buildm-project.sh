#!/bin/bash


#container id
cid=$(docker ps | grep my-maven |awk '{print $1}')

cloneAndDeploy(){
 docker exec -w /home/myuser/projects -i $2 rm -rf $1
 docker exec -w /home/myuser/projects -i $2 git clone  https://github.com/snake4/$1
 docker exec -w /home/myuser/projects/$1 -i $2 mvn clean deploy -Dmaven.test.skip=true 
}

cloneAndPackageAndStart(){
 docker exec -w /home/myuser/projects -i $2 rm -rf $1
 docker exec -w /home/myuser/projects -i $2 git clone  https://github.com/snake4/$1
 docker exec -w /home/myuser/projects/$1 -i $2 mvn clean package -U -Dmaven.test.skip=true 
 docker exec -w /home/myuser/projects/$1/target -i $2 nohup java -jar  $1-spring-boot-starter-1.0.jar >/dev/null 2>&1 &
}
if [ -n "$1" ]; then
 project=$1
 cloneAndDeploy $project $cid
 exit 0
fi


project=vt-c-projectUtils
cloneAndDeploy $project $cid


project=vt-c-redisson
cloneAndDeploy $project $cid


project=vt-c-shiroJpa
cloneAndDeploy $project $cid

project=vt-c-logAndSecurityAndThreadPool
cloneAndDeploy $project $cid

project=vt-c-shiroClient
cloneAndDeploy $project $cid

project=vt-c-jxlss
cloneAndDeploy $project $cid

project=vt-c-dataSourceMulti
cloneAndDeploy $project $cid

project=vt-s-authenCenter
cloneAndPackageAndStart $project $cid

project=vt-test-project
cloneAndPackageAndStart $project $cid
