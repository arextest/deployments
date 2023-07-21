FROM tomcat:9.0-jdk8-openjdk

ARG WAR_FILE=./dubbox-provider-custom-protocol/target/dubbox-provider-custom-protocol-1.0-SNAPSHOT.war
ADD $WAR_FILE /usr/local/tomcat/webapps/

WORKDIR /usr/local/tomcat/conf
RUN sed -i 'N;152a\\t<Context path="" docBase="dubbox-provider-custom-protocol-1.0-SNAPSHOT" reloadable="true" />' server.xml

ADD ./arex-agent-0.3.4.jar /usr/local/tomcat/
ADD ./arex-agent-bootstrap-0.3.4.jar /usr/local/tomcat/

WORKDIR /usr/local/tomcat
CMD ["catalina.sh","run"]
