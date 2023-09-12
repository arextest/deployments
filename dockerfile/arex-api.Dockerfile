FROM tomcat:9.0-jdk8-openjdk

ARG WAR_FILE=./arex-web-api/target/arex-platform-web-service.war
ADD $WAR_FILE /usr/local/tomcat/webapps/

WORKDIR /usr/local/tomcat/conf
RUN sed -i 'N;152a\\t<Context path="" docBase="arex-platform-web-service" reloadable="true" />' server.xml

WORKDIR /usr/local/tomcat
EXPOSE 8080
CMD ["catalina.sh","run"]
