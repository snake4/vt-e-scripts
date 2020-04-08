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

## 3.安装启动镜像
nexus,redis，nginx，mysql，maven,按这个顺序，在各自目录下执行./run.sh  
如果没有导入镜像这一步也可以安装镜像

## 4.安装完成确认
执行docker ps | grep my   
![](https://github.com/snake4/vt-picture/blob/master/3.png)

# 配置
## 开发人员PC配置
C:\Windows\System32\drivers\etc\hosts里面添加linux的ip,我这里ip是192.168.1.195   
192.168.1.195  my-mysql  
192.168.1.195  my-nginx  
192.168.1.195  my-redis  
192.168.1.195  my-nexus  
## nexus配置
### 1.打开浏览器输入http://my-nexus:8081/  更改admin 用户的密码为admin123
### 2.更改maven-releases 可以allow redeploy
![](https://github.com/snake4/vt-picture/blob/master/4.png)
### 3.linux机器的scripts/maven目录下
执行./buildm-project.sh 直到完成  
再执行./start-project.sh  

# 测试
用postman或者其他工具模拟请求
## 初始化用户
http://my-nginx/demo-service/init_user  
![](https://github.com/snake4/vt-picture/blob/master/5.png)

## 用户登陆
http://my-nginx/authen-center/shiro/appLogin?appid=admin&password=admin123  
![](https://github.com/snake4/vt-picture/blob/master/6.png)

## 需要token访问
http://my-nginx/demo-service/getNeedToken  
请求头里面设置Authorization  
![](https://github.com/snake4/vt-picture/blob/master/7.png)

## 不需要token访问
http://my-nginx/demo-service/getNoNeedToken  
![](https://github.com/snake4/vt-picture/blob/master/8.png)

## 退出用户登陆
http://my-nginx/authen-center/shiro/lgout
![](https://github.com/snake4/vt-picture/blob/master/9.png)

## 无token访问失败
http://my-nginx/demo-service/getNeedToken 
请求头里面没有设置Authorization  
![](https://github.com/snake4/vt-picture/blob/master/10.png)

# 技术支持
邮箱:yindongliang0531@163.com  
微信:dlyinha  

# 招募合作伙伴
## 前端
要求:对前端开源技术热爱,精通vue2,node.js,elementui,uni-app开发，以及各种组件的使用，并且具有自己开发组件的能力  
现在目前阶段主要完成vt-pc-admin 的前端开发，伙伴们可发送简历至邮箱

# 赞赏
开源不易,点个星哈   
条件好多伙伴们赞赏一下吧   
![](https://github.com/snake4/vt-picture/blob/master/skm.png)


