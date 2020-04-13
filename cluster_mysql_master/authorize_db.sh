#!/bin/bash
HOSTNAME="127.0.0.1"
PORT="3306"
USERNAME="root"
PASSWORD="123456"
DBNAME=test
sq_sql="CREATE USER 'repl'@'%' IDENTIFIED WITH mysql_native_password BY '123456';GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';flush privileges;"
#mysql -h${HOSTNAME}  -P${PORT}  -u${USERNAME} -p${PASSWORD} -e "${create_db_sql}"
cid=$(docker ps | grep my-mysql-master1 |awk '{print $1}')
docker exec -i $cid mysql -h${HOSTNAME}  -P${PORT}  -u${USERNAME} -p${PASSWORD} -e "${sq_sql}"