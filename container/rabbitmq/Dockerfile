FROM uport/ubuntu:latest
MAINTAINER David Schmitz

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y -q install logrotate

RUN apt-get -q -y install rabbitmq-server

# Workaround 
RUN mkdir -p /etc/rabbitmq
# Workaround

RUN /usr/sbin/rabbitmq-plugins enable rabbitmq_management
RUN echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config

EXPOSE 5672 15672 4369

ADD Dockerfile .

CMD /usr/sbin/rabbitmq-server
