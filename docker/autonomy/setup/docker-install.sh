#!/bin/bash

sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-compose
sudo groupadd docker
sudo usermod -aG docker vagrant
sudo yum install epel-release
sudo yum install -y python-pip
sudo pip install -y docker-compose
sudo yum -y upgrade python*