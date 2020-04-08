# vt-e-scripts
# 开发目的:  
前后端分离的微服务架构下,项目越来越多，为了避免重复造轮子，这是一套可以快速帮助开发人员迅速构建出后台的整套框架，让后台开发迅速投入到业务编码中。

# 系统包括：   
    认证中心，认证中心客户端，任意多数据源连接组件，log4j2日志输出，http安全和线程池，redisson分布式锁等组件。
 
# 主要技术以及软件版本：  
    springboot2.0.2 ，centos7(内核3.10以上)，docker19,redis5,nginx1.17,mysql8,nexus3
    
# 前提条件:   
    linux机器有独立局域网ip并且能上网
    
# 安装步骤:   
## 1.下载vt-e-scripts，解压到 scripts/ 目录下

执行chmod 777 –R scripts/

cd scripts

./docker-install.sh

直到输出如下信息。安装成功   
![](https://github.com/snake4/vt-picture/blob/master/1.png)

## 2.导入镜像  
下载镜像https://pan.baidu.com/s/156IQIvDFviINBPjG6zIzKQ
提取码：d6iv   
例如:docker load -i mysql.tar   
![](https://github.com/snake4/vt-picture/blob/master/2.png)
