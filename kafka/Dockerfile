# https://hub.docker.com/_/openjdk
FROM maven:3-jdk-8

# set environment
ENV JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk" \
    JAVA="/usr/lib/jvm/java-1.8.0-openjdk/bin/java" \
    TIME_ZONE="Asia/Shanghai" 

ADD kafka_2.12-2.3.0.tgz /opt
RUN echo "/opt/kafka_2.12-2.3.0/bin/kafka-server-start.sh /opt/kafka_2.12-2.3.0/config/server.properties">/opt/kafka_2.12-2.3.0/start.sh 
RUN chmod a+x /opt/kafka_2.12-2.3.0/start.sh
ENTRYPOINT  ["sh", "/opt/kafka_2.12-2.3.0/start.sh"]
EXPOSE 9092