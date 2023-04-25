FROM tomcat:9.0-jdk8-openjdk

ARG WAR_FILE=./target/arex-agent-test-0.0.1-SNAPSHOT.war
ADD $WAR_FILE /usr/local/tomcat/webapps/

WORKDIR /usr/local/tomcat/conf
RUN sed -i 'N;152a\\t<Context path="" docBase="arex-agent-test-0.0.1-SNAPSHOT" reloadable="true" />' server.xml

ADD ./arex-agent-0.2.0.jar /usr/local/tomcat/
ADD ./arex-agent-bootstrap-0.2.0.jar /usr/local/tomcat/

WORKDIR /usr/local/tomcat
EXPOSE 8080
CMD ["catalina.sh","run"]
