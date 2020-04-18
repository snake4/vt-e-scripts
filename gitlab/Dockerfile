#ubuntu
FROM gitlab/gitlab-ce:12.8.6-ce.0
COPY ubuntu_sources.list /etc/apt/sources.list
RUN apt-get -o Acquire::Check-Valid-Until=false update && apt-get -o Acquire::Check-Valid-Until=false update -y
RUN apt-get install -y net-tools
RUN apt-get install -y inetutils-ping





