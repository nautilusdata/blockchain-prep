#!/bin/bash
# 2021-12-27-a
rm -fr  ~/.local/share/Trash/files/*
sudo apt update && sudo apt upgrade -y

tmppwd=$PWD
#Utils
echo "####################################################### "
echo "#                 INSTALANDO UTILS                    # "
echo "####################################################### "
#unzip
sudo apt install unzip -y
#wget
sudo apt install wget  -y
#wget
sudo apt install git -y
#tree
sudo apt install tree -y
#telnet
sudo apt-get install telnetd -y
#httping
sudo apt-get update -y
sudo apt-get install -y httping
#tcpping
sudo apt-get install tcptraceroute -y
cd /usr/bin/
wget http://pingpros.com/pub/tcpping
chmod 755 tcpping
sudo apt-get install hping3 -y
sudo apt install net-tools -y

#curl (short for "Client URL") is a command line tool that enables data transfer over various network protocols.
sudo snap install curl

#NodeSource repository maintains Node.js 16 binary distributions. So add this repository in your system by using the following command:
curl -sSL https://deb.nodesource.com/setup_16.x | sudo bash -

#Install Node.js:
echo "####################################################### "
echo "#                   INSTALLING NODE.JS                # "
echo "####################################################### "
sudo apt install -y nodejs
node --version
npm --version

#JAVA
echo "####################################################### "
echo "#                   INSTALLING JAVA                  # "
echo "####################################################### "
sudo apt install openjdk-8-jre-headless -y
echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64' >> ~/.bashrc
echo 'export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"' >> ~/.profile
echo "Java version ..."
java --version


#MAVEN
echo "        ####################################################### "
echo "        #                   INSTALLING MAVEN                  # "
echo "        ####################################################### "
sudo mkdir -p /opt/apache-maven/
cd /tmp
wget https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.zip
unzip apache-maven-3.6.3-bin.zip
sudo mv apache-maven-3.6.3/* /opt/apache-maven/
echo 'export M2_HOME=/opt/apache-maven' >> ~/.bashrc
echo 'export PATH=${M2_HOME}/bin:${PATH}' >> ~/.bashrc

echo 'export M2_HOME=/opt/apache-maven' >> ~/.profile
echo 'export PATH=${M2_HOME}/bin:${PATH}' >> ~/.profile
echo "MAVEN version ..."
mvn --version


#DOCKER
echo "        ####################################################### "
echo "        #                   INSTALLING DOCKER                  # "
echo "        ####################################################### "
sudo apt-get update -y
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io -y
sudo docker run hello-world

#fix docker deamon
echo "        ####################################################### "
echo "        #                   FIXING DOCKER                     # "
echo "        ####################################################### "
cd /home
mkdir $USER/.docker
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R
sudo chmod 666 /var/run/docker.sock
test the fix
docker run hello-world
docker --version


#DOCKER_COMPOSE
echo "        ####################################################### "
echo "        #                   INSTALLING DOCKER COMPOSE         # "
echo "        ####################################################### "
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#Apply executable permissions to the binary
sudo chmod +x /usr/local/bin/docker-compose
echo "DOCKER version ..."
docker --version
echo "DOCKER COMPOSE version ..."
docker-compose --version

# GOLANG
echo "        ####################################################### "
echo "        #                   INSTALLING GOLANG                 # "
echo "        ####################################################### "
sudo snap install go --classic -y
go --version 

# POSTMAN
echo "        ####################################################### "
echo "        #                   INSTALLING POSTMAN                # "
echo "        ####################################################### "
sudo snap install postman
postman --version

#FABRIC
# Ejecuta el setup inicial de las maquinas , creacion de directorios y descarga de imagenes de Hyperledger Fabric
echo "        ####################################################### "
echo "        #                   INSTALLING HYPERLEDGER FABRIC     # "
echo "        ####################################################### "
cd $tmppwd
FABRICSamplesDir="$HOME/hyperledger/fabric"
mkdir -p $FABRICSamplesDir

sudo chmod -R 777 $FABRICSamplesDir
cd $FABRICSamplesDir
sudo curl -sSL http://bit.ly/2ysbOFE | bash -s 2.2.0

echo 'export PATH=$PATH:$HOME/hyperledger/fabric/fabric-samples/bin' >> ~/.profile
source ~/.profile

#PYTHON 2.x
echo "        ####################################################### "
echo "        #                 INSTALLING PYTHON 2                 # "
echo "        ####################################################### "
sudo apt install python2 -y
python2 --version
python3 --version

#VSCode
echo "        ####################################################### "
echo "        #                   INSTALLING VSCODE                 # "
echo "        ####################################################### "
sudo apt install software-properties-common apt-transport-https wget -y
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" -y
sudo apt install code -y
echo "---> VSCode ..."
code --version
echo ""
echo "        ####################################################### "
echo "        #                   VERSIONES INSTALADAS              # "
echo "        ####################################################### "

docker -v
node -v
go version
python2 --version
python3 --version
code -v

