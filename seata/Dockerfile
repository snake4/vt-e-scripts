# https://hub.docker.com/_/openjdk
FROM maven:3-jdk-8

# set environment
ENV SEATA_USER="seata" \
    JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk" \
    JAVA="/usr/lib/jvm/java-1.8.0-openjdk/bin/java" \
    TIME_ZONE="Asia/Shanghai" 

ARG SEATA_VERSION=1.1.0

WORKDIR /$BASE_DIR

RUN yum install -y unzip
ADD seata-server-1.1.0.zip /opt
RUN set -x \
    && ln -snf /usr/share/zoneinfo/$TIME_ZONE /etc/localtime && echo '$TIME_ZONE' > /etc/timezone \
    && unzip /opt/seata-server-1.1.0.zip -d /opt/ \
    && rm -f /opt/seata-server-1.1.0.zip

# 设置额外参数
ENV EXTRA_JVM_ARGUMENTS="-XX:MaxDirectMemorySize=1024M"

ENTRYPOINT ["sh","/opt/seata/bin/seata-server.sh"]
EXPOSE 8091