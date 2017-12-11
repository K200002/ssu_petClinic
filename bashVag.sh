#! /bin/bash
sudo apt-get -y install wget
sudo apt-get -y install openjdk-8-jre
sudo apt-get -y install git
sudo apt-get -y install maven
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get -y install jenkins

sudo service jenkins stop
git clone https://github.com/krismal95/ssu_petClinic.git

HOME_JENKINS=/var/lib/jenkins
PYTH_VBOX=`pwd`

sudo mkdir $HOME_JENKINS/jobs
sudo cp -rf $PYTH_VBOX/ssu_petClinic/jenkins /etc/default
sudo chown -R jenkins:jenkins /etc/default/jenkins

sudo mkdir $HOME_JENKINS/users
sudo cp -rf $PYTH_VBOX/ssu_petClinic/users/* $HOME_JENKINS/users
sudo chown -R jenkins:jenkins $HOME_JENKINS/users/*
sudo chown -R jenkins:jenkins $HOME_JENKINS/users

sudo cp -rp $PYTH_VBOX/ssu_petClinic/jobs/* $HOME_JENKINS/jobs
sudo chown -R jenkins:jenkins $HOME_JENKINS/jobs/*
sudo chown -R jenkins:jenkins $HOME_JENKINS/jobs

wget -N -P $HOME_JENKINS/plugins http://updates.jenkins-ci.org/latest/JDK_Parameter_Plugin.hpi
wget -N -P $HOME_JENKINS/plugins http://updates.jenkins-ci.org/latest/git.hpi
sudo chown -R jenkins:jenkins $HOME_JENKINS/plugins/*

sudo iptables -I INPUT 1 -p tcp --dport 8080 -j ACCEPT
sudo iptables -I INPUT 1 -p tcp --dport 8090 -j ACCEPT

sudo service jenkins start


















