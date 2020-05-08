#!/bin/bash
echo $1 >> /etc/vsftpd/virtual_users.txt 
echo $2 >> /etc/vsftpd/virtual_users.txt
mkdir -p /home/vsftpd/$1
chmod 777 -R /home/vsftpd/$1
db_load -T -t hash -f /etc/vsftpd/virtual_users.txt /etc/vsftpd/virtual_users.db 
