#! /bin/bash

sudo echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu vivid main" | tee -a /etc/apt/sources.list && \
sudo echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu vivid main" | tee -a /etc/apt/sources.list && \
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && \
sudo apt-get update

sudo echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

sudo apt-get install -y oracle-java8-installer
sudo apt-get install -y oracle-java8-set-default
sudo apt-get clean && apt-get update
