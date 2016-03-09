FROM uport/ubuntu:latest
MAINTAINER David Schmitz

ENV DEBIAN_FRONTEND noninteractive

RUN wget -qO - https://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -
RUN add-apt-repository "deb http://packages.elasticsearch.org/elasticsearch/2.x/debian stable main"
RUN apt-get update && apt-get -q -y install elasticsearch

RUN mkdir /data
VOLUME ["/data"]

RUN mv /etc/elasticsearch/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml.orig
ADD config/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml

WORKDIR data

EXPOSE 9200 9300

CMD /usr/share/elasticsearch/bin/elasticsearch

ADD Dockerfile .
