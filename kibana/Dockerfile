#debian
FROM kibana:5.6.9
COPY sources.list /etc/apt/sources.list
RUN apt-get -o Acquire::Check-Valid-Until=false update && apt-get -o Acquire::Check-Valid-Until=false update -y
RUN apt-get install -y net-tools
RUN apt-get install -y inetutils-ping




