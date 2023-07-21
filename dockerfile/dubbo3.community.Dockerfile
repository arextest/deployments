FROM tomcat:9.0-jdk8-openjdk

ARG WAR_FILE=./dubbo3-provider/target/dubbo3-provider-1.0-SNAPSHOT.war
ADD $WAR_FILE /usr/local/tomcat/webapps/

WORKDIR /usr/local/tomcat/conf
RUN sed -i 'N;152a\\t<Context path="" docBase="dubbo3-provider-1.0-SNAPSHOT" reloadable="true" />' server.xml

ADD ./arex-agent-0.3.7.jar /usr/local/tomcat/
ADD ./arex-agent-bootstrap-0.3.7.jar /usr/local/tomcat/

WORKDIR /usr/local/tomcat
EXPOSE 20880
CMD ["catalina.sh","run"]
