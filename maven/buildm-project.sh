#!/bin/bash
#container id
cid=$(docker ps | grep my-maven |awk '{print $1}')

build(){

 docker exec -w /home/myuser/projects -i $2 git clone https://github.com/snake4/$1
 docker exec -w /home/myuser/projects/$1 -i $2 mvn deploy -Dmaven.test.skip=true 
}

project=vt-c-projectUtils
build $project $cid

project=vt-c-shiroJpa
build $project $cid

project=vt-c-logAndSecurityAndThreadPool
build $project $cid

project=vt-c-shiroClient
build $project $cid

project=vt-c-jxlss
build $project $cid

project=vt-c-dataSourceMulti
build $project $cid

