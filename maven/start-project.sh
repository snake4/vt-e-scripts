#!/bin/bash
#container id
cid=$(docker ps | grep my-maven |awk '{print $1}')

start(){
  killcmd="ps -ef | grep $1 | grep -v grep | awk '{print \$2}' | xargs kill -9 || echo 'no process killed'"
  docker exec -w /home/myuser/projects/$1/target -i $2 bash -c "$killcmd"
  docker exec -w /home/myuser/projects/$1/target -i $2 nohup java -jar  $1-spring-boot-starter-1.0.jar >/dev/null 2>&1 &
}

if [ -n "$1" ]; then
 project=$1
 start $project $cid
 exit 0
fi

project=vt-s-authenCenter
start $project $cid

project=vt-test-project
start $project $cid
