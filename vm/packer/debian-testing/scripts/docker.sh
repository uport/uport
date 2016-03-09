#! /bin/bash
sudo apt-get -y install docker.io docker-compose docker-registry
sudo sed -i '/#DOCKER_OPTS=/c\DOCKER_OPTS="-s btrfs -H tcp://0.0.0.0:4243 -H unix:///var/run/docker.sock"' /etc/default/docker
sudo sed -i '/GRUB_CMDLINE_LINUX=/c\GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1"' /etc/default/grub
sudo adduser vagrant docker
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo update-grub
