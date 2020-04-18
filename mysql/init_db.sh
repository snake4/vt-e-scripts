#!/bin/bash
HOSTNAME="127.0.0.1"
PORT="3306"
USERNAME="root"
PASSWORD="123456"
DBNAME=test
create_db_sql="create database IF NOT EXISTS ${DBNAME}"
#mysql -h${HOSTNAME}  -P${PORT}  -u${USERNAME} -p${PASSWORD} -e "${create_db_sql}"
cid=$(docker ps | grep my-mysql |awk '{print $1}')
docker exec -i $cid mysql -h${HOSTNAME}  -P${PORT}  -u${USERNAME} -p${PASSWORD} -e "${create_db_sql}"