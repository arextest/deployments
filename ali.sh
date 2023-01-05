echo "Tag version: $1"
docker tag arexadmin01/arex:$1  registry.cn-hangzhou.aliyuncs.com/arexadmin01/arex:$1 
docker tag arexadmin01/arex-report:$1  registry.cn-hangzhou.aliyuncs.com/arexadmin01/arex-report:$1 
docker tag arexadmin01/arex-storage-serive:$1 registry.cn-hangzhou.aliyuncs.com/arexadmin01/arex-storage-serive:$1   
docker tag arexadmin01/arex-replay-schedule:$1 registry.cn-hangzhou.aliyuncs.com/arexadmin01/arex-replay-schedule:$1 

echo "Push version:$1"
docker push registry.cn-hangzhou.aliyuncs.com/arexadmin01/arex:$1
docker push registry.cn-hangzhou.aliyuncs.com/arexadmin01/arex-report:$1
docker push registry.cn-hangzhou.aliyuncs.com/arexadmin01/arex-storage-serive:$1
docker push registry.cn-hangzhou.aliyuncs.com/arexadmin01/arex-replay-schedule:$1
