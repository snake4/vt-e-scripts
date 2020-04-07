#centos
FROM daocloud.io/library/centos:centos7.3.1611
#RUN yum install -y wget
#RUN wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
ADD Centos-7.repo /etc/yum.repos.d/CentOS-Base.repo
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
RUN yum install -y java-1.8.0-openjdk-1.8.0.232.b09-0.el7_7.x86_64
RUN yum install -y maven
RUN yum install -y git
RUN yum install -y net-tools 
RUN yum install -y iputils
#RUN yum install -y kde-l10n-Chinese




