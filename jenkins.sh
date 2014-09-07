#!/bin/bash

java -Djava.awt.headless=true -DJENKINS_HOME=/var/lib/jenkins -jar /usr/lib/jenkins/jenkins.war --prefix=$JENKINS_PREFIX --logfile=/var/log/jenkins/jenkins.log --webroot=/var/cache/jenkins/war --httpPort=8080 --ajp13Port=8009 --debug=5 --handlerCountMax=100 --handlerCountMaxIdle=20
