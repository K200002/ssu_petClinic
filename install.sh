#! /bin/bash
echo "Install all"
HOME_JENKINS=/var/lib/jenkins
PYTH_VBOX=`pwd`

sudo service jenkins stop

sudo cp -rf $PYTH_VBOX/ssu_petClinic/jenkins /etc/default
sudo chown -R jenkins:jenkins /etc/default/jenkins

sudo cp -rf $PYTH_VBOX/ssu_petClinic/users/* $HOME_JENKINS/users/admin
sudo chown -R jenkins:jenkins $HOME_JENKINS/users/*
sudo chown -R jenkins:jenkins $HOME_JENKINS/users

sudo cp -rf $PYTH_VBOX/ssu_petClinic/config/* $HOME_JENKINS
sudo chown -R jenkins:jenkins $HOME_JENKINS/*

sudo cp -rp $PYTH_VBOX/ssu_petClinic/jobs/* $HOME_JENKINS/jobs
sudo chown -R jenkins:jenkins $HOME_JENKINS/jobs/*
sudo chown -R jenkins:jenkins $HOME_JENKINS/jobs

wget -N -P $HOME_JENKINS/plugins http://updates.jenkins-ci.org/latest/git-client.hpi
wget -N -P $HOME_JENKINS/plugins http://updates.jenkins-ci.org/latest/git.hpi
wget -N -P $HOME_JENKINS/plugins http://updates.jenkins-ci.org/latest/JDK_Parameter_Plugin.hpi
sudo chown -R jenkins:jenkins $HOME_JENKINS/plugins/*

sudo iptables -I INPUT 1 -p tcp --dport 8080 -j ACCEPT
sudo iptables -I INPUT 1 -p tcp --dport 8090 -j ACCEPT

sudo service jenkins start





