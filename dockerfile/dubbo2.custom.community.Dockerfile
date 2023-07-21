FROM tomcat:9.0-jdk8-openjdk

ARG WAR_FILE=./dubbo2-provider-custom-protocol/target/dubbo2-provider-custom-protocol-1.0-SNAPSHOT.war
ADD $WAR_FILE /usr/local/tomcat/webapps/

WORKDIR /usr/local/tomcat/conf
RUN sed -i 'N;152a\\t<Context path="" docBase="dubbo2-provider-custom-protocol-1.0-SNAPSHOT" reloadable="true" />' server.xml

ADD ./arex-agent-0.3.0.jar /usr/local/tomcat/
ADD ./arex-agent-bootstrap-0.3.0.jar /usr/local/tomcat/

WORKDIR /usr/local/tomcat
EXPOSE 20888
CMD ["catalina.sh","run"]
