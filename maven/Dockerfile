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
RUN yum install passwd -y
RUN sh -c '/bin/echo -e "123456\n123456\n" |  passwd'
RUN yum install openssh-server -y
RUN sh -c '/bin/echo -e "\n\n" | ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key'
RUN sh -c '/bin/echo -e "\n\n" | ssh-keygen -t rsa -f /etc/ssh/ssh_host_ecdsa_key'
RUN sh -c '/bin/echo -e "\n\n" | ssh-keygen -t rsa -f /etc/ssh/ssh_host_ed25519_key'

