#!/bin/bash
apt-get -y update #update package repository
apt-get install -y python-minimal && apt install -y python-pip && pip install docker-py && pip install --upgrade pip
hostname codetest # Sets hostname to codetest
#echo 127.0.0.1 codetest >> /etc/hosts
sed -i 's/127.0.0.1 localhost/127.0.0.1 codetest/g' /etc/hosts
timedatectl set-timezone America/New_York #Sets default timezone to America/New_York
apt install -y docker.io #installs docker
curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose #Apply executable permissions to the binary
docker-compose --version > ~/docker.txt #Redirect output to make sure docker compose is installed
gpasswd -a ubuntu docker #Add user to docker group
