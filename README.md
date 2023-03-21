# AREX: Real automated API testing with real data.

AREX is an open-source automation testing tool which allows you to capture the online real data and replay it for testing. It provides rich testing features like API Testing, API Comparison Testing, Traffic Recording and Replay, etc.

##### AREX Introduction

- Homepage: www.arextest.com
- demo: demo.arextest.com
- Test restful API by record, replay and stub request/response.
- Differential testing known as differential fuzzing, is a popular software testing technique that attempts to detect bugs, by providing the same input to a series of similar applications and observing differences in their execution.

## AREX Docker-Compose Install

```
git clone https://github.com/arextest/deployments.git
cd deployments
docker compose up -d
```

## AREX Docker-Compose Uninstall

```
cd deployments
docker compose down -v
<!-- Delete Mongodb and Redis Data. If you want to save the data, You should ignore the command.  -->
rm -rf ./arex-data
<!-- Delete arex logs. If you want to save the data, You should ignore the command. -->
rm -rf ./arex-logs
```

## License

    Copyright (C) 2023 ArexTest

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
