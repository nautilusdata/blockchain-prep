# PRERREQUISITOS LABORATORIO HYPERLEDGER FABRIC LIBRO AMAZON -- script 2021-12-27-a

sudo apt update && sudo apt upgrade -y
#1.common application building and code maitenance tools
echo "        ####################################################### "
echo "        #               INSTALLING PREREQUISITES              # "
echo "        ####################################################### "
echo "----> build-essential"
sudo apt install build-essential -y
echo "----> git"
sudo apt install git -y
echo "----> make"
sudo apt install make -y
echo "----> curl"
sudo apt install curl -y
echo "----> unzip"
sudo apt install unzip -y
echo "----> g++"
sudo apt install g++ -y
echo "----> libtool"
sudo apt install libtool -y
echo "----> jq"
sudo apt install jq -y


echo "        ####################################################### "
echo "        #                 INSTALLING DOCKER                   # "
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
echo "---> DOCKER version ..."
docker --version


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


#DOCKER_COMPOSE
echo "        ####################################################### "
echo "        #             INSTALLING DOCKER COMPOSE               # "
echo "        ####################################################### "
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#Apply executable permissions to the binary
sudo chmod +x /usr/local/bin/docker-compose
echo "--->DOCKER version ..."
docker --version
echo "---> DOCKER COMPOSE version ..."
docker-compose --version


#Install Node.js para usar Java, ya que se desarrollaran apps en Javascript y Java
echo "        ####################################################### "
echo "        #              INSTALLING NODE.JS / NPM               # "
echo "        ####################################################### "
sudo apt install nodejs -y
echo "---> node version..."
node --version
sudo apt install npm -y
echo "---> npm version..."
npm --version


#JAVA
echo "        ####################################################### "
echo "        #           INSTALLING JAVA check version!            # "
echo "        ####################################################### "
sudo apt install openjdk-8-jre-headless -y
echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64' >> ~/.bashrc
echo 'export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"' >> ~/.profile
echo "---> Java version ..."
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
echo "---> MAVEN version ..."
mvn --version


#GRADLE
echo "        ####################################################### "
echo "        #           INSTALLING JDK11, MAVEN, GRADLE           # "
echo "        ####################################################### "

# Instala JDK 11 y Maven
sudo apt install -y openjdk-11-jdk maven


# Instala Gradle 6.3
wget https://services.gradle.org/distributions/gradle-6.3-bin.zip -P /tmp
sudo unzip -q /tmp/gradle-6.3-bin.zip -d /opt && rm /tmp/gradle-6.3-bin.zip
sudo ln -s /opt/gradle-6.3/bin/gradle /usr/bin

#PYTHON 2.x
echo "        ####################################################### "
echo "        #                   INSTALLING PYTHON 2               # "
echo "        ####################################################### "
sudo apt install python2 -y
echo "---> python2 version ..."
python2 --version


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

echo "        ####################################################### "
echo "        #          fin.... UPDATE && UPGRADE                  # "
echo "        ####################################################### "
sudo apt update && sudo apt upgrade -y

echo "        ####################################################### "
echo "        #       VERSIONES DE INSTALACION EN ESTE SCRIPT       # "
echo "        ####################################################### "


docker --version
docker-compose --version
node --version
npm --version
java --version
mvn --version
gradle --version
python2 --version
python3 --version
code --version
