#!/bin/bash
read -p "input nginx cmd(e.g. nginx -t): " inputv
docker ps | grep my-nginx |awk '{print $1}'| xargs -i docker exec -i {} $inputv
