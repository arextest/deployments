#!/bin/bash
if [ $# -lt 1 ]
then
  echo "Input version please! e.g. 0.2.2............."
  exit
fi

echo "Tag version: $1"
docker tag arexadmin01/arex:latest arexadmin01/arex:$1 
docker tag arexadmin01/arex-report:latest arexadmin01/arex-report:$1  
docker tag arexadmin01/arex-storage-serive:latest arexadmin01/arex-storage-serive:$1  
docker tag arexadmin01/arex-config:latest arexadmin01/arex-config:$1  
docker tag arexadmin01/arex-replay-schedule:latest arexadmin01/arex-replay-schedule:$1 

echo "Push version:$1"
docker push arexadmin01/arex:$1
docker push arexadmin01/arex-report:$1
docker push arexadmin01/arex-storage-serive:$1
docker push arexadmin01/arex-config:$1
docker push arexadmin01/arex-replay-schedule:$1

echo "Push latest"
docker push arexadmin01/arex:latest
docker push arexadmin01/arex-report:latest
docker push arexadmin01/arex-storage-serive:latest
docker push arexadmin01/arex-config:latest
docker push arexadmin01/arex-replay-schedule:latest



