FROM ubuntu
MAINTAINER madan
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y  software-properties-common && \
    add-apt-repository ppa:webupd8team/java -y && \
    apt-get update && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y oracle-java8-installer && \
    apt-get clean
RUN apt-get install wget -y
RUN wget http://redrockdigimark.com/apachemirror/tomcat/tomcat-8/v8.0.53/bin/apache-tomcat-8.0.53.tar.gz -O /opt/apache-tomcat-8.0.53.tar.gz
RUN cd /opt && tar -zxvf apache-tomcat-8.0.53.tar.gz
#COPY ./SampleAntProject.war /opt/apache-tomcat-8.0.53/webapps/SampleAntProject.war
#RUN text='<user username="tomcat" password="tomcat" roles="admin-gui,manager-gui,manager-script"/>' && echo "$text" >> /opt/apache-tomcat-7.0.53/conf/tomcat-users.xml
EXPOSE 8080
CMD /opt/apache-tomcat-8.0.53/bin/catalina.sh run
