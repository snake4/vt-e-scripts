#!/bin/bash
HOSTNAME="127.0.0.1"
PORT="3306"
USERNAME="root"
PASSWORD="123456"
DBNAME=test
read -p "master-log-bin-filename: " filename
read -p "position: " position
sq_sql="CHANGE MASTER TO MASTER_HOST='my-mysql-master1',MASTER_USER='repl',MASTER_PASSWORD='123456',MASTER_LOG_FILE='${filename}',MASTER_LOG_POS=${position};start slave;"
#mysql -h${HOSTNAME}  -P${PORT}  -u${USERNAME} -p${PASSWORD} -e "${create_db_sql}"
cid=$(docker ps | grep my-mysql-slave1 |awk '{print $1}')
docker exec -i $cid mysql -h${HOSTNAME}  -P${PORT}  -u${USERNAME} -p${PASSWORD} -e "${sq_sql}"