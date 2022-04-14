# DevOPS

## run AREX

- Clone git repository https://github.com/arextest/dev-ops
- setup Docker service and Docker-Compose
  - Run the command:
  ```
  $ docker-compose up -d
  ```

### AREX Agent config

- Method: Set Env
  - service.name=yourAppName; Config your Application Name
  - storage.service.host=YIP:8093; YIP is IP address of you AREX HOST
  - config.service.host=YIP:8091;

```
export JAVA_TOOL_OPTIONS="-javaagent:./arex-devops/agent/arex-agent-0.0.1.jar=service.name=yourAppName;storage.service.host=YIP:8093;config.service.host=YIP:8091"
```

- Run with Docker
  - --name arex-new Config Docker images Name
  - arex.agent.conf Config you server name and port

```
docker run  -v "$PWD":/usr/src/arex --rm -p 8080:8080 --name arex-new   -w /usr/src/arex openjdk:11  java -javaagent:/usr/src/arex/arex-agent-0.0.1.jar -Darex.config.path=/usr/src/arex/arex.agent.conf -jar /usr/src/arex/spring-petclinic-2.6.0-SNAPSHOT.jar -m org.springframework.samples.petclinic.PetClinicApplication
```

## Executing your Regression Test by AREX

### Run be tested application

- Be testing Application: http://YourAppHostIP:8080/
- Visit AREX UI: http://ArexHostIP:8088/
  - Config application
  - Replay record
  - Analysis Result
