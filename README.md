# 开发目的(purpose):  
    移动互联前后端分离的微服务架构下,项目越来越多，为了避免重复造轮子，这是一套可以快速帮助开发人员迅速构建出后台的整套框架，让后台开发迅速投入到业务编码中。  
    with the time of micro-service development,the projects are more and more,for avoiding doing the same thing,this framework is born.with this framework, the developer can build the mircor-service endfront very fast and dedicate themself into business logic development.

# 系统包括(including)：   
    认证中心，认证中心客户端，任意多数据源连接组件，log4j2日志输出，http安全和线程池，redisson分布式锁等组件。|  
    authentication center, authentication client,  arbitrary multi-datasource, log4j2 ,security of http,thread pool, redisson distribute lock and so on
 
# 主要技术以及软件版本(main technology and version of software)：
   
  名称(name)  | 版本(version) | 描述(description) | 其他(other)
  ------------- | ------------- | ------------- | -------------
  centos  | 7 kernel 3.10 | 操作系统 |
  docker-ce  | 19 | 容器 
  springboot/springcloud   | 2.0.2 | 开发框架 |
  redis  | 5 | 缓存,从4以后提供RDB AOF混合持久化策略 (可集群) |
  nginx  | 1.17 | 动静分离,反向代理,负债均衡,限流,web安全 |
  mysql  | 8 | 数据库(可分库后采用双主一丛,保证高可用高性能) | 
  nexus  | 3 | maven私服 | http://my-nexus:8081/
  nacos  | 1.1.4 | 服务注册,配置中心  | http://my-nacos:8848/nacos
  sentinel  | 1.6.3 | 服务限流,降级  | http://my-sentinel:7180/
  mycat  | 1.6.7.4 | 分库分表  
  xxl-job  | 2.2.0 | 分布式定时任务 |  控制台:http://xxxx:8184/
  minio  | 2020-04 | 分布式存储  | http://my-minio:9000/
  seata  | 1.1.0 | 分布式事务  |  用了mysql8来做globaltransaction中间存储,feign+nacos+seata实现分布式事务
  skywalking | TODO| 服务链追踪 |
  kafka  | TODO | 消息中间件  |
  logstash  | TODO | 日志收集  |
  elasticsearch  | TODO | 文档搜索 |    
  spark  | TODO | 并行运算  |
  hbase  | TODO | 大表  |
  activiti+bpmn  | TODO | 流程引擎  |
  
# 前提条件(pre-condition):   
    linux机器有独立局域网ip并且能上网  |
    a linux server which has a IP of LAN and could connect internet.
    
# 安装步骤(install steps):   
## 1.下载vt-e-scripts，解压到 scripts/ 目录下(download vt-e-scripts.zip, unzip it to folder "scripts/")
执行(execute)  
chmod 777 –R scripts/  
cd scripts  
./docker-install.sh  
直到输出如下信息。安装成功(util the following message is output)   
![](https://github.com/snake4/vt-picture/blob/master/1.png)

## 2.导入镜像(load images):  
下载镜像(download url):https://pan.baidu.com/s/156IQIvDFviINBPjG6zIzKQ
提取码(pin code)：d6iv   
例如(e.g.):  
docker load -i mysql.tar   
![](https://github.com/snake4/vt-picture/blob/master/2.png)

## 3.安装启动镜像(install image and start container):
mysql,nacos,nexus,redis，nginx，maven,按这个顺序，在各自目录下执行./run.sh  
如果没有导入镜像这一步也可以安装镜像  
最后 cd ../mysql
执行 ./init_db.sh  
mysql,nacos,nexus,redis，nginx,maven,according to this sequence,make sure be their own folder,then ./run.sh  
if you didn't load image before this step,it will take some time to install image  
at last, cd ../mysql  
execute ./init_db.sh

## 4.安装完成确认(installation confirmation):
执行(execute)  
docker ps | grep my   
![](https://github.com/snake4/vt-picture/blob/master/3.png)

# 配置(configuration)
## 开发人员PC配置(configuration of developer's PC)
C:\Windows\System32\drivers\etc\hosts里面添加linux的ip,我这里ip是192.168.1.195   
insert the following content into C:\Windows\System32\drivers\etc\hosts,my linux server IP is 192.168.1.195  
192.168.1.195  my-mysql  
192.168.1.195  my-nginx  
192.168.1.195  my-redis  
192.168.1.195  my-nexus  

## nexus配置(nexus configuration)
### 1.更改nexus登陆密码(change the password of nexus)
打开浏览器输入http://my-nexus:8081/  更改admin 用户的密码为admin123  
open url http://my-nexus:8081/  with browser, change the admin's password to admin123

### 2.更改maven-releases 可以allow redeploy(allow redeploy for maven-releases repository)
![](https://github.com/snake4/vt-picture/blob/master/4.png)
### 3.执行脚本(execute shell script)
linux机器的scripts/maven目录下  
执行./buildm-project.sh 直到完成  
再执行./start-project.sh  
in linux server ,cd scripts/maven/  
execute ./buildm-project.sh until done,  
then ./start-project.sh


# 测试(testing)
用postman或者其他工具模拟请求  
testing with postman or some other http request mocking tool 
## 初始化用户(initate user)
http://my-nginx/demo-service/init_user  
![](https://github.com/snake4/vt-picture/blob/master/5.png)

## 用户登陆(user login)
http://my-nginx/authen-center/shiro/appLogin?appid=admin&password=admin123  
![](https://github.com/snake4/vt-picture/blob/master/6.png)

## 需要token访问(need token to visit)
http://my-nginx/demo-service/getNeedToken  
请求头里面设置Authorization  
with http header setting of Authorization 
![](https://github.com/snake4/vt-picture/blob/master/7.png)

## 不需要token访问(no need token to visit)
http://my-nginx/demo-service/getNoNeedToken  
![](https://github.com/snake4/vt-picture/blob/master/8.png)

## 退出用户登陆(user logout)
http://my-nginx/authen-center/shiro/lgout
![](https://github.com/snake4/vt-picture/blob/master/9.png)

## 无token访问失败(fail to visit,without token)
http://my-nginx/demo-service/getNeedToken 
请求头里面没有设置Authorization  
without http header setting of Authorization 
![](https://github.com/snake4/vt-picture/blob/master/10.png)

# 技术支持(tech support)
邮箱(email):yindongliang0531@163.com  
微信(wechat):dlyinha  

# 招募合作伙伴(recurit partner)
## 前端(front-end)
要求:对前端开源技术热爱,精通vue2,node.js,elementui,uni-app开发，以及各种组件的使用，并且具有自己开发组件的能力  
现在目前阶段主要完成vt-pc-admin 的前端开发，伙伴们可发送简历至邮箱


# 感谢(thanks)
主要参考源码以及文档   
[spring cloud alibaba gitee](https://gitee.com/johnlilijun/spring-cloud-alibaba)  
[spring cloud alibaba github](https://github.com/alibaba/spring-cloud-alibaba)  
[minio](https://docs.min.io/)  
[docker](https://hub.docker.com/)  
[daoCloud](https://hub.daocloud.io/)  
[docker-compose](https://docs.docker.com/compose/)  
[mycat](http://www.mycat.org.cn/)  
[spring cloud](https://spring.io/projects/spring-cloud)  
觉得不错就帮忙点个星吧   
if you think what we did is not bad, give us a star please  

# 尚未公开部分(not opened yet)  
![组件部分](https://github.com/snake4/vt-picture/blob/master/unopen_compounent.png)
![服务部分](https://github.com/snake4/vt-picture/blob/master/unopen1.png)
