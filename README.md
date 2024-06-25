# AREX: Real automated API testing with real data.
**AREX Components Version: 0.6.3.2**

## AREX Docker-Compose Install

```
git clone https://github.com/arextest/deployments.git
cd deployments
docker compose up -d
```

### .env config   
1. There are many configurations of Docker versions in the configuration file, which are hard-coded, such as 0.2.9. Now they have been extracted and set as variables, stored in .env file.
2. Users can directly modify the content of the .env file to change the version.
3. Users can also modify the old version number to roll back to a previous version.
```
cat .env
AREX_VERSION=0.6.3.2
```
### Helm Chart Install
```
helm install aretest --namespace=aretest --create-namespace ./arex-chart 
or update
helm upgrade aretest -n aretest ./arex-chart  
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
