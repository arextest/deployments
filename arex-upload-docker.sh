#!/bin/bash
if [ $# -lt 1 ]
then
  echo "Input version please! e.g. 0.2.6............."
  exit
fi

echo "Tag version: $1"
docker tag arexadmin01/arex:$1  arexadmin01/arex:latest 
docker tag arexadmin01/arex-report:$1  arexadmin01/arex-report:latest 
docker tag arexadmin01/arex-storage-serive:$1 arexadmin01/arex-storage-serive:latest   
docker tag arexadmin01/arex-replay-schedule:$1 arexadmin01/arex-replay-schedule:latest 

echo "Push version:$1"
docker push arexadmin01/arex:$1
docker push arexadmin01/arex-report:$1
docker push arexadmin01/arex-storage-serive:$1
docker push arexadmin01/arex-replay-schedule:$1

echo "Push latest"
docker push arexadmin01/arex:latest
docker push arexadmin01/arex-report:latest
docker push arexadmin01/arex-storage-serive:latest
docker push arexadmin01/arex-replay-schedule:latest

echo "upload to aliyun:$1"
docker tag arexadmin01/arex:$1  registry.cn-hangzhou.aliyuncs.com/arexadmin01/arex:$1 
docker tag arexadmin01/arex-node:$1  registry.cn-hangzhou.aliyuncs.com/arexadmin01/arex-node:$1 
docker tag arexadmin01/arex-report:$1  registry.cn-hangzhou.aliyuncs.com/arexadmin01/arex-report:$1 
docker tag arexadmin01/arex-storage-serive:$1 registry.cn-hangzhou.aliyuncs.com/arexadmin01/arex-storage-serive:$1   
docker tag arexadmin01/arex-replay-schedule:$1 registry.cn-hangzhou.aliyuncs.com/arexadmin01/arex-replay-schedule:$1 

docker push registry.cn-hangzhou.aliyuncs.com/arexadmin01/arex:$1
docker push registry.cn-hangzhou.aliyuncs.com/arexadmin01/arex-report:$1
docker push registry.cn-hangzhou.aliyuncs.com/arexadmin01/arex-storage-serive:$1
docker push registry.cn-hangzhou.aliyuncs.com/arexadmin01/arex-replay-schedule:$1


