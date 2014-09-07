FROM centos:centos6

ENV ANT_HOME /opt/apache/ant
ENV MAVEN_HOME /opt/apache/maven
ENV JAVA_HOME /usr/lib/jvm/java-1.7.0-openjdk.x86_64

# Add a jenkins repository.
RUN curl -LO http://pkg.jenkins-ci.org/redhat/jenkins.repo && mv jenkins.repo /etc/yum.repos.d/ && rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key

RUN yum install -y curl wget tar zip git subversion java-1.7.0-openjdk-devel jenkins && yum clean all

# Install apache ant.
RUN mkdir /opt/apache && curl -LO http://www.us.apache.org/dist//ant/binaries/apache-ant-1.9.4-bin.tar.gz && tar xvzf apache-ant-1.9.4-bin.tar.gz && rm apache-ant-1.9.4-bin.tar.gz && mv apache-ant-1.9.4 /opt/apache/ant

# Install apache maven.
RUN curl -LO http://www.us.apache.org/dist/maven/maven-3/3.2.3/binaries/apache-maven-3.2.3-bin.tar.gz && tar xvzf apache-maven-3.2.3-bin.tar.gz && rm apache-maven-3.2.3-bin.tar.gz && mv apache-maven-3.2.3 /opt/apache/maven

ADD jenkins.sh /usr/local/bin/jenkins.sh
RUN chmod +x /usr/local/bin/jenkins.sh

ENV JENKINS_HOME /var/lib/jenkins

ENV JENKINS_PREFIX /

EXPOSE 8080 50000

CMD /usr/local/bin/jenkins.sh
