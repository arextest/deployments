FROM tomcat:9.0-jdk8-openjdk

ARG WAR_FILE=./target/arex-agent-test-0.0.1-SNAPSHOT.war
ADD $WAR_FILE /usr/local/tomcat/webapps/

WORKDIR /usr/local/tomcat/conf
RUN sed -i 'N;152a\\t<Context path="" docBase="arex-agent-test-0.0.1-SNAPSHOT" reloadable="true" />' server.xml

RUN set -eux && mkdir -p /usr/arex/agent
ADD ./arex-agent-*.jar /usr/arex/agent/

WORKDIR /usr/local/tomcat
EXPOSE 8080
CMD ["catalina.sh","run"]
