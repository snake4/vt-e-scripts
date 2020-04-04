#!/bin/bash

#this script will install docker and docker-compose

echo "###############start docker installing###############"
#yum -y update
yum install -y unzip
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
#yum-config-manager --add-repo  https://download.docker.com/linux/centos/docker-ce.repo
yum install -y  docker-ce-19.03.8-3.el7
docker -v
sudo systemctl start docker
sudo systemctl enable docker
echo "###############end docker installing###############"
echo "##############################"
echo "##############################"
echo "#############set docker compose#################"
cp docker-compose /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
echo "net.ipv4.ip_forward=1" >>/etc/sysctl.conf
systemctl restart network

docker network create --subnet=172.24.0.0/24 my-network
#在这里添加路由
#newip=$(ifconfig -a|grep -A5 ens33 |grep inet |grep -v inet6|awk '{print $2}'|tr -d "addr:")
#echo "my ip is $newip" 
#sed -r -i 's/(\b[0-9]{1,3}\.){3}[0-9]{1,3}\b'/$newip/ docker-compose.yml
#安装pptp
yum install -y pptp
yum install -y pptp-setup
firewall-cmd --direct --add-rule ipv4 filter INPUT 0 -i ens33 -p gre -j ACCEPT
#添pptp网关路由
route add -net 172.27.0.0/24 gw 172.27.0.7
docker-compose -v
echo "#############set docker compose done#################"