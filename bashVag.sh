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

ABSOLUTE_FILENAME=`readlink -e "$0"`
echo $ABSOLUTE_FILENAME

DIRECTORY=`dirname "$ABSOLUTE_FILENAME"` 
echo $DIRECTORY

sudo mkdir $HOME_JENKINS/jobs
sudo cp -rf $DIRECTORY/ssu_petClinic/jenkins /etc/default
sudo chown -R jenkins:jenkins /etc/default/jenkins

sudo cp -rp $DIRECTORY/ssu_petClinic/jobs/* $HOME_JENKINS/jobs
sudo chown -R jenkins:jenkins $HOME_JENKINS/jobs/*
sudo chown -R jenkins:jenkins $HOME_JENKINS/jobs

wget -N -P $HOME_JENKINS/plugins http://updates.jenkins-ci.org/latest/JDK_Parameter_Plugin.hpi
wget -N -P $HOME_JENKINS/plugins http://updates.jenkins-ci.org/latest/git.hpi
sudo chown -R jenkins:jenkins $HOME_JENKINS/plugins/*


sudo service jenkins start


















