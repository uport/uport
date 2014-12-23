FROM uport/ubuntu:latest
MAINTAINER David Schmitz

ENV DEBIAN_FRONTEND noninteractive

# Install logstash
RUN wget -O- http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -
RUN echo "deb http://packages.elasticsearch.org/logstash/1.4/debian stable main" > /etc/apt/sources.list.d/logstash.list
RUN apt-get update && apt-get -y install logstash

EXPOSE 514 5043 9292
CMD /usr/bin/logstash

ADD Dockerfile .
