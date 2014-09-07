Jenkins Docker image
====================
The Jenkins Docker image based on centos:centos6.

Jenkins is a continuous integration server.  
For more information, see http://jenkins-ci.org/

## Build image
`sudo docker build imaeg --tag="[image name]" .`

## Run container
`sudo docker run -d -p 8080:8080 --name jenkins [image name]`

## Environment
If you want to use Java, Ant or Maven built into this image,  
configure jenkins system setting on Web GUI.

[Manage Jenkins] > [Configure System] >  
* JDK installations > [Add JDK]
* Ant installations > [Add Ant]
* Maven installations > [Add Maven]

Off the "Install automatically" and set the following value to XXX_HOME.

| Name   | HOME Path                               |
| ------ | --------------------------------------- |
| JDK    | /usr/lib/jvm/java-1.7.0-openjdk.x86_64  |
| Ant    | /opt/apache/ant                         |
| Maven  | /opt/apache/maven                       |
