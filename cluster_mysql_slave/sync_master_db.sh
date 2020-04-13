#!/bin/bash
HOSTNAME="127.0.0.1"
PORT="3306"
USERNAME="root"
PASSWORD="123456"
DBNAME=test
sq_sql="CHANGE MASTER TO MASTER_HOST='my-mysql-master1',MASTER_USER='repl',MASTER_PASSWORD='123456',MASTER_LOG_FILE='binlog.000006',MASTER_LOG_POS=856;start slave;"
#mysql -h${HOSTNAME}  -P${PORT}  -u${USERNAME} -p${PASSWORD} -e "${create_db_sql}"
cid=$(docker ps | grep my-mysql-slave1 |awk '{print $1}')
docker exec -i $cid mysql -h${HOSTNAME}  -P${PORT}  -u${USERNAME} -p${PASSWORD} -e "${sq_sql}"