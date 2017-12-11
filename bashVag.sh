#! /bin/bash
echo "!!!!!!!!!Install jre"
sudo apt-get -y install openjdk-8-jre
echo "!!!!!!!!!Install jdk"
sudo apt-get -y install openjdk-8-jdk
echo "!!!!!!!!!Install git"
sudo apt-get -y install git

echo "!!!!!!!!Install jenkins"
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get -y install jenkins

echo "!!!!!!!Install maven"
sudo apt-get -y install maven

./install.sh













