# AREX: It is a “Differential Testing” and “Record and Replay Testing” Tool.

## AREX install

```
git clone https://github.com/arextest/deployments.git
cd deployments
docker compose up -d
```

## AREX uninstall

```
cd deployments
docker compose down -v
<!-- Delete Mongodb and Redis Data. If you want to save the data, You should ignore the command.  -->
rm -rf ./arex-data
<!-- Delete arex logs. If you want to save the data, You should ignore the command. -->
rm -rf ./arex-logs
```

## AREX Compile and build(Docker)

- clone arex code to local. then build Docker.

```
git clone https://github.com/arextest/arex-agent-java.git
git clone https://github.com/arextest/arex.git arex-front-end
git clone https://github.com/arextest/arex-node-service.git
git clone https://github.com/arextest/arex-report.git
git clone https://github.com/arextest/arex-storage.git
git clone https://github.com/arextest/arex-replay-schedule.git
git clone https://github.com/arextest/arex-commuty-test.git
git clone https://github.com/arextest/deployments.git
cd deployments
git checkout dev
```

- 编译 AREX 前端 ./front.build.sh
- 编译 node 服务 ./node.build.sh
- 编译 report 服务 ./report.build.sh
- 编译 storage 服务 ./storage.build.sh
- 编译 schedule 服务 ./schedule.build.sh
- 编译 arex agent

```
cd arex-agent-java
mvn clean package
```

- 编译 community-test 工具 ./community.build.sh
- 运行 AREX: Docker-Compose

```
cd deployments
docker compose up -d
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
