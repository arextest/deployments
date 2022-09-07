#!/bin/bash
if (!isset($1))
then
  echo "Must input version"
  exit()
fi

echo "Push version:$1"
exit()

docker push arexadmin01/arex:$1
docker push arexadmin01/arex-report:$1
docker push arexadmin01/arex-storage-serive:$1
docker push arexadmin01/arex-config:$1
docker push arexadmin01/arex-replay-schedule:$1

echo "Tag version: $1"
docker tag arexadmin01/arex:$1 arexadmin01/arex:latest       
docker tag arexadmin01/arex-report:$1  arexadmin01/arex-report:latest
docker tag arexadmin01/arex-storage-serive:$1  arexadmin01/arex-storage-serive:latest
docker tag arexadmin01/arex-config:$1  arexadmin01/arex-config:latest
docker tag arexadmin01/arex-replay-schedule:$1 arexadmin01/arex-replay-schedule:latest

echo "Push latest"
docker push arexadmin01/arex:latest
docker push arexadmin01/arex-report:latest
docker push arexadmin01/arex-storage-serive:latest
docker push arexadmin01/arex-config:latest
docker push arexadmin01/arex-replay-schedule:latest
