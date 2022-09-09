cp ../agent/arex-agent-*.jar ./
docker build .  -t arexadmin01/arex-agent-sidecar:0.0.1
docker push arexadmin01/arex-agent-sidecar:0.0.1
rm -f ./arex-agent-*.jar
