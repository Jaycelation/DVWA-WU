#!/bin/bash
echo "Build Docker"

sudo apt update
sudo apt upgrade

sudo apt install apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt update
sudo apt install docker-ce

sudo systemctl start docker

sudo systemctl status docker

#Tuy chon
#sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#sudo chmod +x /usr/local/bin/docker-compose

sudo usermod -aG docker $USER

echo "Build DVWA"

docker pull vulnerables/web-dvwa

docker run -d -p 80:80 vulnerables/web-dvwa