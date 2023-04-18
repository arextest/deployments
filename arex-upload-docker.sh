#!/bin/bash
if [ $# -lt 1 ]
then
  echo "input areX tag version please! e.g. 0.2.8............."
  exit
fi

echo "Tag version: $1. Push Docker to docker.io and aliyuncs"
docker push arexadmin01/arex:$1
docker push arexadmin01/arex-report:$1
docker push arexadmin01/arex-storage-serive:$1
docker push arexadmin01/arex-replay-schedule:$1
docker push arexadmin01/arex-community-test:0.0.1

# echo "upload to aliyun:$1"
# docker tag arexadmin01/arex:$1  registry.cn-hangzhou.aliyuncs.com/arexadmin01/arex:$1 
# docker tag arexadmin01/arex-report:$1  registry.cn-hangzhou.aliyuncs.com/arexadmin01/arex-report:$1 
# docker tag arexadmin01/arex-storage-serive:$1 registry.cn-hangzhou.aliyuncs.com/arexadmin01/arex-storage-serive:$1   
# docker tag arexadmin01/arex-replay-schedule:$1 registry.cn-hangzhou.aliyuncs.com/arexadmin01/arex-replay-schedule:$1 
# docker tag arexadmin01/arex-community-test:0.0.1 registry.cn-hangzhou.aliyuncs.com/arexadmin01/arex-community-test:0.0.1

# docker push registry.cn-hangzhou.aliyuncs.com/arexadmin01/arex:$1
# docker push registry.cn-hangzhou.aliyuncs.com/arexadmin01/arex-report:$1
# docker push registry.cn-hangzhou.aliyuncs.com/arexadmin01/arex-storage-serive:$1
# docker push registry.cn-hangzhou.aliyuncs.com/arexadmin01/arex-replay-schedule:$1
# docker push registry.cn-hangzhou.aliyuncs.com/arexadmin01/arex-community-test:0.0.1


