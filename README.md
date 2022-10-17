# AREX: It is a “Differential Testing” and “Record and Replay Testing” Tool.

- Test restful API by record, replay and stub request/response.
- Differential testing known as differential fuzzing, is a popular software testing technique that attempts to detect bugs, by providing the same input to a series of similar applications and observing differences in their execution.

## Status

AREX is under development now.

## Why AREX?

- AREX finds potential bugs in your service using running instances of your new code and your old code side by side.
  - AREX behaves as a proxy and multicasts whatever requests it receives to each of the running instances.
  - It then compares the responses, and reports any regressions that may surface from those comparisons.
  - The premise for AREX is that if two implementations of the service return “similar” responses for a sufficiently large and diverse set of requests, then the two implementations can be treated as equivalent and the newer implementation is regression-free.
- Regression testing is an important stage of testing and an important means to ensure quality.
  - Automated regression testing has high use case maintenance costs.
  - The data of automated testing is difficult and the time cost is high.
  - Fully automatic construction of use cases, automatic recording of interface data in production requests and processing, and automatic construction of test requests and stub data.
  - During regression testing, interface requests are automatically played back, and response packets are parsed.
  - Automatically compare the results, analyze the differences intelligently, and display the differences one by one.
  - Continuous accumulation of regression test cases.

### Features

- Fully automatic recording of requests, internal requests and responses without human intervention.
- Fully automatic difference comparison, automatically generate report.
- Accumulate test cases to make regression test coverage close to 100%.

#### Record

- The minimum range for recording is one RESTFul interface URL.
- The TraceID is key field of APM-based that recording and playback, data storage in Mongodb.
- All use cases belonging to this interface include all TraceID requests + responses + Stub data under this interface URL.

#### Replay

- The traceid is the smallest unit when Regression Testing execute.
- In line with the playback target, all matching records can be played back, or some test cases can be filtered out by adding a time range.

#### Stub

- stub inner request/response.

## Run be tested application

- Be testing Application: http://YourAppHostIP:8080/
- Visit AREX UI: http://ArexHostIP:8088/
  - Replay record
  - Analysis Result

### AREX install

```
git clone https://github.com/arextest/deployments.git
cd deployments
docker compose up -d
```

#### AREX Agent config

- Method: Set Env
  - service.name=yourAppName; Config your Application Name
  - storage.service.host=YIP:8093; YIP is IP address of you AREX HOST

```
export JAVA_TOOL_OPTIONS="-javaagent:/root/arex/spring-petclinic/arex-java-0.0.1.jar=service.name=myown-spring-petclinc"

```

If you use to [Spring-Petclinic](https://github.com/spring-projects/spring-petclinic) try

```
export JAVA_TOOL_OPTIONS="-javaagent:./arex-devops/agent/arex-agent-0.0.1.jar=service.name=yourAppName;storage.service.host=YIP:8093"
```

- Run with Docker
  - --name arex-new Config Docker images Name
  - arex.agent.conf Config you server name and port

```
docker run  -v "$PWD":/usr/src/arex --rm -p 8080:8080 --name arex-new   -w /usr/src/arex openjdk:11  java -javaagent:/usr/src/arex/arex-agent-0.0.1.jar -Darex.config.path=/usr/src/arex/arex.agent.conf -jar /usr/src/arex/spring-petclinic-2.6.0-SNAPSHOT.jar -m org.springframework.samples.petclinic.PetClinicApplication
```

## License

    Copyright (C) 2022 ArexTest

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as
    published by the Free Software Foundation, either version 3 of the
    License, or (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program. If not, see https://www.gnu.org/licenses/.
