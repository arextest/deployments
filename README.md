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

- clone arex code to local

```
git clone https://github.com/arextest/deployments.git
cd deployments
docker compose up -d
```

- build Docker

```

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
