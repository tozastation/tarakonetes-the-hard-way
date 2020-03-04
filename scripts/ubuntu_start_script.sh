#!/bin/sh
USER_NAME=tarakonetes
VIRTUAL_BOX_URL=https://download.virtualbox.org/virtualbox/6.1.4/virtualbox-6.1_6.1.4-136177~Ubuntu~bionic_amd64.deb
VIRTUAL_BOX_FINE_NAME=virtualbox-6.1_6.1.4-136177~Ubuntu~bionic_amd64.deb
VAGRANT_URL=https://releases.hashicorp.com/vagrant/2.2.7/vagrant_2.2.7_x86_64.deb
VAGRANT_FILE_NAME=vagrant_2.2.7_x86_64.deb
TMP_DIR=$(mktemp -d)

sudo adduser $USER_NAME
sudo gpasswd -a $USER_NAME sudo

cd $TMP_DIR
wget $VIRTUAL_BOX_URL
sudo apt install -y $VIRTUAL_BOX_FINE_NAME
wget $VAGRANT_URL
sudo apt install -y $VAGRANT_FILE_NAME

# Docker
sudo apt-get update -y
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io

# Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
