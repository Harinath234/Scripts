#!/bin/bash
sudo yum install java -y
cd /opt

sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.115/bin/apache-tomcat-9.0.115.tar.gz
sudo tar -xvf /opt/apache-tomcat-9.0.115.tar.gz

cd /opt/apache-tomcat-9.0.115/webapps/manager/META-INF
sudo sed -i '/CookieProcessor/,/HashMap"\/>/d' context.xml

cd /opt/apache-tomcat-9.0.115/conf
sudo mv tomcat-users.xml tomcat-users_bkup.xml
sudo touch tomcat-users.xml
sudo echo '<?xml version="1.0" encoding="utf-8"?>
        <tomcat-users>
        <role rolename="manager-gui"/>
        <user username="tomcat" password="tomcat" roles="manager-gui, manager-script, manager-status"/>
        </tomcat-users>' > tomcat-users.xml

sudo /opt/apache-tomcat-9.0.115/bin/startup.sh

