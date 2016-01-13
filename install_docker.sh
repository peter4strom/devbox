#!/bin/bash

apt-get purge lxc-docker*
apt-get purge docker.io*

apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 \
	--recv-keys 58118E89F3A912897C070ADBF76221572C52609D

echo "deb https://apt.dockerproject.org/repo debian-jessie main" >/etc/apt/sources.list.d/docker.list

apt-get update --yes
apt-get install --yes docker-engine

service docker stop
wget -NO /usr/bin/docker \
	"https://get.docker.com/builds/Linux/x86_64/docker-latest"
chmod +x /usr/bin/docker
service docker start

wget -NO "/etc/bash_completion.d/docker" \
	"https://raw.githubusercontent.com/docker/docker/master/contrib/completion/bash/docker"

curl -L https://github.com/docker/compose/releases/download/1.5.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose --version | awk 'NR==1{print $NF}')/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose
