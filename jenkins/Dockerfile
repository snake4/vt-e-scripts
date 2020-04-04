#debian
FROM jenkins/jenkins:lts
COPY sources.list /etc/apt/sources.list
USER root
RUN apt-get -o Acquire::Check-Valid-Until=false update && apt-get -o Acquire::Check-Valid-Until=false update -y
RUN apt-get install -y net-tools
RUN apt-get install -y inetutils-ping
#USER jenkins




